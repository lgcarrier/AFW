SET DEFINE OFF;
create or replace package body afw_12_ldap_pkg
as
  function obten_servr_ldap (pnu_domn in number default afw_12_domn_pkg.obten_domn_sesn)
    return vd_afw_12_servr_ldap%rowtype
  is
    cursor cur_servr_ldap (pnu_domn in number default afw_12_domn_pkg.obten_domn_sesn)
    is
      select ssl.*
        from vd_i_afw_12_servr_ldap      ssl
            ,vd_i_afw_12_domn_servr_ldap sdsl
       where     ssl.seqnc = sdsl.ref_servr_ldap
             and sdsl.ref_domn = pnu_domn
             and rownum = 1;

    vre_servr_ldap   vd_i_afw_12_servr_ldap%rowtype;
  begin
    open cur_servr_ldap (pnu_domn);

    fetch cur_servr_ldap
      into vre_servr_ldap;

    close cur_servr_ldap;

    return vre_servr_ldap;
  end obten_servr_ldap;

  function authe_apex (pva_code_utils   in varchar2
                      ,pva_mot_passe    in varchar2)
    return boolean
  as
    vre_servr_ldap   vd_i_afw_12_servr_ldap%rowtype;
    vbo_authe        boolean default false;
  begin
    vre_servr_ldap   := obten_servr_ldap ();

    -- Authentification LDAP
    vbo_authe        :=
      apex_ldap.authenticate (pva_code_utils
                             ,pva_mot_passe
                             ,afw_12_utils_pkg.obten_parmt_authe_exter_afw (afw_12_utils_pkg.obten_utils_de_code (pva_code_utils))
                             ,vre_servr_ldap.adres
                             ,vre_servr_ldap.port);
    return vbo_authe;
  exception
    when no_data_found
    then
      ete ();
      return false;
    when others
    then
      ete ();
      return false;
  end authe_apex;

  function authe_dn (pva_code_utils   in varchar2
                    ,pva_mot_passe    in varchar2)
    return boolean
  as
    vre_servr_ldap              vd_i_afw_12_servr_ldap%rowtype;
    vva_parmt_authe_exter_afw   vd_i_afw_12_utils.parmt_authe_exter_afw%type;
    v_session                   dbms_ldap.session;
    v_result                    pls_integer;
  begin
    vva_parmt_authe_exter_afw   := afw_12_utils_pkg.obten_parmt_authe_exter_afw (afw_12_utils_pkg.obten_utils_de_code (pva_code_utils));

    if vva_parmt_authe_exter_afw is not null
    then
      vre_servr_ldap            := obten_servr_ldap ();

      dbms_ldap.use_exception   := true;

      v_session                 :=
        dbms_ldap.init (hostname   => vre_servr_ldap.adres
                       ,portnum    => vre_servr_ldap.port);

      v_result                  :=
        dbms_ldap.simple_bind_s (ld       => v_session
                                ,dn       => vva_parmt_authe_exter_afw
                                ,passwd   => pva_mot_passe);

      v_result                  := dbms_ldap.unbind_s (v_session);

      return true;
    else
      return false;
    end if;
  exception
    when others
    then
      v_result   := dbms_ldap.unbind_s (v_session);
      return false;
  end authe_dn;

  function synch_utils (pva_nom                     in varchar2
                       ,pva_prenm                   in varchar2
                       ,pva_code                    in varchar2
                       ,pva_courl                   in varchar2
                       ,pva_indic_verl              in varchar2 default 'N'
                       ,pva_indic_chang_mot_passe   in varchar2 default 'O'
                       ,pva_indic_actif             in vd_i_afw_12_utils.indic_actif%type default 'N'
                       ,pva_temp_dn                 in vd_i_afw_12_utils.parmt_authe_exter_afw%type default null
                       ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type default null)
    return vd_i_afw_12_utils.seqnc%type
  is
    vbo_debg    boolean default false;
    vnu_utils   vd_i_afw_12_utils.seqnc%type;
  begin
    vnu_utils   := afw_12_utils_pkg.obten_utils_de_code (pva_code);

    if vnu_utils is not null
    then
      -- usager existant
      begin
        update vd_i_afw_12_utils su
           set su.parmt_authe_exter_afw   = pva_temp_dn
              ,su.mot_passe               = null
         where     su.seqnc = vnu_utils
               and (   su.parmt_authe_exter_afw <> pva_temp_dn
                    or su.parmt_authe_exter_afw is null
                    or su.mot_passe is not null);
      exception
        when others
        then
          ete (   'Erreur lors de la mise à jour de l''usager '
               || pva_code
               || '/'
               || pva_courl);
      end;
    else
      -- nouvel usage

      if    pva_nom is null
         or pva_prenm is null
         or pva_courl is null
      then
        ete ('Synchronisation LDAP'
            ,'données obligatoires manquantes');
      else
        -- créer l'utilisateur
        begin
          vnu_utils      :=
            afw_12_utils_pkg.creer_utils (pva_nom                     => pva_nom
                                         ,pva_prenm                   => pva_prenm
                                         ,pva_code                    => pva_code
                                         ,pva_courl                   => pva_courl
                                         ,pva_indic_verl              => 'N'
                                         ,pva_indic_chang_mot_passe   => 'N'
                                         ,pva_indic_actif             => 'O'
                                         ,pva_parmt_authe_exter_afw   => pva_temp_dn);

          --l'ajouter au domaine
          if pnu_domn is not null
          then
            afw_12_domn_pkg.ajout_utils (pnu_utils         => vnu_utils
                                        ,pnu_domn          => pnu_domn
                                        ,pda_debut_efect   => sysdate
                                        ,pda_fin_efect     => null);
          end if;
        exception
          when others
          then
            vnu_utils   := afw_12_utils_pkg.obten_utils_de_courl (pva_courl);

            if vnu_utils is not null
            then
              ete (   'Erreur lors de la création de l''usager '
                   || pva_code
                   || '/'
                   || pva_courl
                   || ' - un usager existe déjà pour ce courriel');
            else
              ete (   'Erreur lors de la création de l''usager '
                   || pva_code
                   || '/'
                   || pva_courl);
            end if;
        end;
      end if;
    end if;

    return vnu_utils;
  exception
    when others
    then
      ete ();
      raise;
  end synch_utils;
end afw_12_ldap_pkg;
/
