SET DEFINE OFF;
create or replace package body afw_12_authe_apex_pkg
is
  gbo_defnr_sesn           boolean default false;
  gnu_mod_encry   constant pls_integer default dbms_crypto.encrypt_aes256 + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5;
  gra_cle_encry            raw (2000) default 'B9E13AF9390AF7C509F12EB4DF031D433524A0E25A4E0052B0E36711253A6116';
  gva_charc_set   constant varchar2 (12) default 'WE8MSWIN1252';
  gva_code_utils           varchar2 (30);
  gva_code_utils_pour      varchar2 (30) default null;
  gva_code_domn            varchar2 (30);
  gva_code_domn_pour       varchar2 (30) default null;
  gbo_defnr_histr_acces    boolean default true;

  function encry (pva_valr in varchar2)
    return raw
  is
  begin
    return dbms_crypto.encrypt (utl_i18n.string_to_raw (pva_valr
                                                       ,gva_charc_set)
                               ,gnu_mod_encry
                               ,gra_cle_encry);
  end encry;

  procedure defnr_histr_acces (pva_code_evenm    in varchar2
                              ,pnu_seqnc_utils   in number
                              ,pnu_seqnc_pour    in number)
  is
    pragma autonomous_transaction;
  begin
    if gbo_defnr_histr_acces
    then
      insert into vd_i_afw_12_histr_acces (ref_utils
                                          ,ref_dv_type_evenm
                                          ,ref_utils_pour)
           values (pnu_seqnc_utils
                  ,afw_14_domn_valr_pkg.obten_seqnc ('HISTR_ACCES'
                                                    ,pva_code_evenm
                                                    ,'AFW')
                  ,pnu_seqnc_pour);
    end if;

    commit;
  exception
    when others
    then
      --Le message est identique à SEC.000003 ... il faudrait avoir un message spécifique
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000007'
                                              ,pva_code_prodt   => 'AFW');
  end defnr_histr_acces;

  procedure demnd_activ_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                    ,pnu_numr_aplic_apex_cible   in number
                                    ,pnu_numr_page_apex_cible    in number
                                    ,pbo_indic_desct             in boolean default false
                                    ,pva_procd_persn             in varchar2)
  is
    pragma autonomous_transaction;
  begin
    afw_12_reqt_inter_utils_pkg.demnd_activ_compt_utils (pnu_utils
                                                        ,pnu_domn
                                                        ,pnu_numr_aplic_apex_cible
                                                        ,pnu_numr_page_apex_cible
                                                        ,pbo_indic_desct
                                                        ,pva_procd_persn);

    commit;
  end demnd_activ_compt_utils;

  procedure valdr_utils (pva_code_utils    in varchar2
                        ,pva_mot_passe     in varchar2
                        ,pva_domn          in varchar2
                        ,pbo_forcr_authe   in boolean default false)
  is
    vva_ident               varchar2 (400);
    vva_ident_pour          varchar2 (400);
    vva_domn                varchar2 (61);
    vva_domn_pour           varchar2 (30);
    kva_seprt_conxn_derv    varchar2 (1) default '|';
    vva_indic_authe_courl   varchar2 (1) default afw_12_domn_pkg.obten_indic_authe_courl (pva_domn);
  begin
    if     pbo_forcr_authe
       and pva_code_utils is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000003'
                                              ,pva_code_prodt   => 'AFW');
    elsif     not pbo_forcr_authe
          and (   pva_code_utils is null
               or pva_mot_passe is null
               or pva_domn is null)
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000003'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    -- Tentative de "connexion dérivée"
    if instr (pva_code_utils
             ,kva_seprt_conxn_derv) > 0
    then
      --user source
      vva_ident      :=
        substr (upper (pva_code_utils)
               ,1
               ,  instr (upper (pva_code_utils)
                        ,kva_seprt_conxn_derv)
                - 1);

      if vva_indic_authe_courl = 'O'
      then
        gva_code_utils   := afw_12_utils_pkg.obten_code_utils_de_courl (vva_ident);
      else
        gva_code_utils   := vva_ident;
      end if;

      --user cible
      vva_ident_pour      :=
        substr (upper (pva_code_utils)
               ,  instr (upper (pva_code_utils)
                        ,kva_seprt_conxn_derv)
                + 1);

      if vva_indic_authe_courl = 'O'
      then
        gva_code_utils_pour   := afw_12_utils_pkg.obten_code_utils_de_courl (vva_ident_pour);
      else
        gva_code_utils_pour   := vva_ident_pour;
      end if;
    else
      if vva_indic_authe_courl = 'O'
      then
        gva_code_utils   := afw_12_utils_pkg.obten_code_utils_de_courl (pva_code_utils);
      else
        gva_code_utils   := upper (pva_code_utils);
      end if;
    end if;

    vva_domn   := upper (pva_domn);

    if instr (vva_domn
             ,kva_seprt_conxn_derv) > 0
    then
      vva_domn             :=
        substr (vva_domn
               ,1
               ,  instr (vva_domn
                        ,kva_seprt_conxn_derv)
                - 1);

      gva_code_domn        := vva_domn;
      vva_domn_pour        :=
        substr (upper (pva_domn)
               ,  instr (upper (pva_domn)
                        ,kva_seprt_conxn_derv)
                + 1);

      gva_code_domn_pour   := vva_domn_pour;
    elsif gva_code_utils_pour is not null
    then
      gva_code_domn_pour   := vva_domn;
      gva_code_domn        := vva_domn;
    else
      gva_code_domn   := vva_domn;
    end if;
  end valdr_utils;

  procedure valdr_etat_authe (pbo_etat_authe          in out boolean
                             ,pva_code_utils          in     varchar2
                             ,pva_code_domn           in     varchar2
                             ,pva_code_utils_pour     in     varchar2
                             ,pva_code_domn_pour      in     varchar2
                             ,pbo_ignor_indic_actif   in     boolean default false)
  is
    vva_indic_verl    varchar2 (1) default 'N';
    vva_indic_actif   varchar2 (1) default 'N';
    vda_date_expir    date default sysdate + 1;
    vnu_seqnc_utils   number (10);
    vnu_seqnc_pour    number (10);
    rec_utils         vd_i_afw_12_utils%rowtype;
  begin
    rec_utils   := afw_12_utils_pkg.obten_utils (afw_12_utils_pkg.obten_utils_de_code (pva_code_utils));

    if not pbo_etat_authe
    then
      -- Mauvais mot de passe
      defnr_histr_acces ('ECHEC_MOT_PASSE'
                        ,rec_utils.seqnc
                        ,null);

      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000003'
                                              ,pva_code_prodt   => 'AFW');
    elsif     not pbo_ignor_indic_actif
          and pbo_etat_authe
    then
      -- Bon mot de passe
      if rec_utils.indic_actif = 'N'
      then
        pbo_etat_authe   := false;
        defnr_histr_acces ('ECHEC_COMPT_INACT'
                          ,rec_utils.seqnc
                          ,null);

        begin
          -- Envoyer courriel pour activer le compte utilisateur
          demnd_activ_compt_utils (rec_utils.seqnc
                                  ,afw_12_domn_pkg.obten_seqnc_domn (pva_code_domn)
                                  ,afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_APLIC')
                                  ,afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_PAGE')
                                  ,false
                                  ,afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_PROCD_PERSN'));
        exception
          when others
          then
            --Afficher message compte inactif si impossible de résoudre l'activation de compte
            afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000029'
                                                    ,pva_code_prodt   => 'AFW');
        end;

        -- Afficher message d'erreur + Message disant qu'un courriel sera envoyé
        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000019'
                                                ,pva_code_prodt   => 'AFW');
      elsif rec_utils.indic_verl = 'O'
      then
        pbo_etat_authe   := false;
        defnr_histr_acces ('ECHEC_COMPT_VERL'
                          ,rec_utils.seqnc
                          ,null);

        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000002'
                                                ,pva_code_prodt   => 'AFW');
      elsif     rec_utils.date_expir is not null
            and rec_utils.date_expir <= sysdate
      then
        pbo_etat_authe   := false;
        defnr_histr_acces ('ECHEC_COMPT_EXPIR'
                          ,rec_utils.seqnc
                          ,null);

        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000005'
                                                ,pva_code_prodt   => 'AFW');
      end if;

      begin
        select seqnc
          into vnu_seqnc_utils
          from vd_i_afw_12_utils u
         where     code_utils = upper (pva_code_utils)
               and exists
                     (select 1
                        from vd_i_afw_12_domn_utils du
                            ,vd_i_afw_12_domn       d
                       where     d.code = upper (pva_code_domn)
                             and du.ref_domn = d.seqnc
                             and du.ref_utils = u.seqnc
                             and du.date_debut_efect <= sysdate
                             and (   du.date_fin_efect is null
                                  or du.date_fin_efect > sysdate));

        if pva_code_utils_pour is not null
        then
          if not afw_12_secrt_pkg.verif_apart_group_non_conct ('AUTOR_CONXN_DERV'
                                                              ,pva_code_utils)
          then
            -- Valider si l'utilisateur a les droits requis pour se connecter en tant qu'un autre utilisateur
            pbo_etat_authe   := false;

            afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000009'
                                                    ,pva_code_prodt   => 'AFW');
          elsif pva_code_utils_pour = pva_code_utils
          then
            -- Valider que l'utilisateur ne fait pas le comique en voulant se connecter en tant que lui même
            -- TODO:: CARLO
            -- Ajouter un message comique => Easter egg
            pbo_etat_authe   := false;

            afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000011'
                                                    ,pva_code_prodt   => 'AFW');
          end if;

          begin
            select seqnc
              into vnu_seqnc_pour
              from vd_i_afw_12_utils u
             where     code_utils = upper (pva_code_utils_pour)
                   and exists
                         (select 1
                            from vd_i_afw_12_domn_utils du
                                ,vd_i_afw_12_domn       d
                           where     d.code = upper (nvl (pva_code_domn_pour, pva_code_domn))
                                 and du.ref_domn = d.seqnc
                                 and du.ref_utils = u.seqnc
                                 and du.date_debut_efect <= sysdate
                                 and (   du.date_fin_efect is null
                                      or du.date_fin_efect > sysdate));
          exception
            when no_data_found
            then
              pbo_etat_authe   := false;
              defnr_histr_acces ('ECHEC_POUR'
                                ,rec_utils.seqnc
                                ,vnu_seqnc_pour);
              afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000010'
                                                      ,pva_code_prodt   => 'AFW');
          end;

          defnr_histr_acces ('SUCS_POUR'
                            ,rec_utils.seqnc
                            ,vnu_seqnc_pour);
        else
          defnr_histr_acces ('SUCS'
                            ,rec_utils.seqnc
                            ,vnu_seqnc_pour);
        end if;
      exception
        when no_data_found
        then
          pbo_etat_authe   := false;

          defnr_histr_acces ('ECHEC_DOMN'
                            ,rec_utils.seqnc
                            ,vnu_seqnc_pour);

          afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000012'
                                                  ,pva_code_prodt   => 'AFW');
      end;
    end if;
  exception
    when no_data_found
    then
      pbo_etat_authe   := false;
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000003'
                                              ,pva_code_prodt   => 'AFW');
  end valdr_etat_authe;

  function authe_utils (p_username              in varchar2
                       ,p_password              in varchar2
                       ,p_domaine               in number
                       ,pbo_ignor_indic_actif   in boolean default false
                       ,pbo_forcr_authe         in boolean default false)
    return boolean
  is
    vbo_info_vald    boolean default false;
    vva_procd_vald   vd_i_afw_12_domn.procd_authe_exter_afw%type;

    function valdt_procd_authe_exter_afw (pva_nom_procd    in varchar2
                                         ,pva_code_utils   in varchar2
                                         ,pva_mot_passe    in varchar2
                                         ,pnu_domn         in number)
      return boolean
    is
      vbo_valdt_procd_authe_exter   boolean default false;
      vva_progr_a_lancr             varchar2 (4000)
                                      default    'begin '
                                              || '  afw_12_authe_apex_pkg.gbo_valdt_procd_authe_exter := %PROCD_PERSN%(:p1, :p2); '
                                              || '  exception when others then ete();'
                                              || 'end;';
    begin
      vva_progr_a_lancr             :=
        replace (vva_progr_a_lancr
                ,'%PROCD_PERSN%'
                ,pva_nom_procd);

      execute immediate vva_progr_a_lancr
        using pva_code_utils
             ,pva_mot_passe;

      vbo_valdt_procd_authe_exter   := gbo_valdt_procd_authe_exter;

      gbo_valdt_procd_authe_exter   := false;

      return vbo_valdt_procd_authe_exter;
    exception
      when others
      then
        return false;
    end valdt_procd_authe_exter_afw;
  begin
    if not pbo_forcr_authe
    then
      -- Valider avec la méthode externe et ensuite valider avec la méthode interne

      -- Méthode d'authentification externe à AFW (ex.: LDAP)
      vva_procd_vald   := afw_12_domn_pkg.obten_procd_authe_exter_afw (p_domaine);

      if     vva_procd_vald is not null
         and p_password is not null
      then
        vbo_info_vald      :=
          valdt_procd_authe_exter_afw (vva_procd_vald
                                      ,p_username
                                      ,p_password
                                      ,p_domaine);
      end if;

      -- Méthode d'authentification interne à AFW
      if     not vbo_info_vald
         and p_password is not null
      then
        vbo_info_vald      :=
          afw_12_mot_passe_pkg.valdr_mot_passe (p_username
                                               ,p_password);
      end if;
    elsif pbo_forcr_authe
    then
      vbo_info_vald   := true;
    end if;

    valdr_etat_authe (vbo_info_vald
                     ,gva_code_utils
                     ,gva_code_domn
                     ,gva_code_utils_pour
                     ,gva_code_domn_pour
                     ,pbo_ignor_indic_actif);

    return vbo_info_vald;
  end authe_utils;

  procedure inser_sesn
  is
    pragma autonomous_transaction;
  begin
    insert into afw_12_sesn (id_sesn)
         values (null);

    commit;
  exception
    when dup_val_on_index
    then
      null;
  end inser_sesn;

  procedure inser_sesn_alter
  is
  begin
    insert into afw_12_sesn (id_sesn)
         values (null);

    commit;
  exception
    when dup_val_on_index
    then
      null;
  end inser_sesn_alter;

  --  procedure inser_lang_sesn
  --  is
  --  begin
  --    update afw_12_sesn
  --       set ref_lang   = afw_01_lang_pkg.obten_lang (apex_util.get_preference ('FSP_LANGUAGE_PREFERENCE'))
  --     where     id_sesn = afw_12_sesn_pkg.obten_sesn
  --           and app_user = afw_12_utils_pkg.obten_code_usagr_conct;
  --  exception
  --    when others
  --    then
  --      null;
  --  end inser_lang_sesn;

  procedure defnr_varbl_utils_domn
  is
  begin
    -- Utilisateur qui sert à l'authentification
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_UTILS'
                                    ,gva_code_utils);

    -- Connexion dérivée (optionnel et requiert des droits)
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_UTILS_POUR'
                                    ,gva_code_utils_pour);

    -- Domaine qui sert à l'authentification
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_DOMN'
                                    ,gva_code_domn);

    -- Connexion dérivée (optionnel et requiert des droits)
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_DOMN_POUR'
                                    ,gva_code_domn_pour);
  end defnr_varbl_utils_domn;

  procedure defnr_varbl_sesn
  is
  begin
    update afw_12_sesn
       set app_user   = afw_12_utils_pkg.obten_code_usagr_conct
          ,ref_lang      =
             sys_context ('ctx_infor_sesn'
                         ,'vnu_seqnc_lang')
     where id_sesn = afw_12_sesn_pkg.obten_sesn;

    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_SESN'
                                    ,encry (afw_12_sesn_pkg.obten_sesn));

    --inser_lang_sesn ();
    gbo_defnr_sesn   := false;
  exception
    when others
    then
      raise;
  end defnr_varbl_sesn;

  procedure rempl_mot_passe (pva_code_utils         in varchar2
                            ,pva_ancn_mot_passe     in varchar2
                            ,pva_nouv_mot_passe_1   in varchar2
                            ,pva_nouv_mot_passe_2   in varchar2)
  is
    vra_nouv_mot_passe   afw_12_utils.mot_passe%type;
    vva_code_utils       varchar2 (200);
    vbo_gestn_mdp        boolean;
  begin
    if    pva_nouv_mot_passe_1 is null
       or pva_nouv_mot_passe_2 is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000004'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    if trim (pva_nouv_mot_passe_1) != trim (pva_nouv_mot_passe_2)
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000001'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    vbo_gestn_mdp   := afw_12_secrt_pkg.verfr_presn_utils_group ('GESTN_MOT_PASSE');

    --Valider l'ancien mot de passe
    if vbo_gestn_mdp
    then
      vva_code_utils   := pva_code_utils;
    else
      if not afw_12_mot_passe_pkg.valdr_mot_passe (pva_code_utils
                                                  ,pva_ancn_mot_passe)
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000003'
                                                ,pva_code_prodt   => 'AFW');
      end if;

      vva_code_utils   := afw_07_util_pkg.v ('APP_USER');
    end if;

    -- Regler le nouveau mot de passe
    afw_12_mot_passe_pkg.defnr_mot_passe (vva_code_utils
                                         ,pva_nouv_mot_passe_1);
  end rempl_mot_passe;

  procedure reint_mot_passe (pnu_utils             in vd_i_afw_12_utils.seqnc%type
                            ,pva_mot_passe         in varchar2
                            ,pva_confr_mot_passe   in varchar2
                            ,pnu_domn              in vd_i_afw_12_domn.seqnc%type default null)
  is
    vra_nouv_mot_passe   afw_12_utils.mot_passe%type;
    rec_utils            vd_i_afw_12_utils%rowtype;
  begin
    rec_utils   := afw_12_utils_pkg.obten_utils (pnu_utils);

    if    pva_mot_passe is null
       or pva_confr_mot_passe is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000004'
                                              ,pva_code_prodt   => 'AFW');
    elsif trim (pva_mot_passe) <> trim (pva_confr_mot_passe)
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000001'
                                              ,pva_code_prodt   => 'AFW');
    elsif not afw_12_mot_passe_pkg.valdr_niv_secrt_mot_passe (pva_mot_passe
                                                             ,rec_utils.nom
                                                             ,rec_utils.prenm
                                                             ,pnu_domn)
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000015'
                                              ,pva_code_prodt   => 'AFW');
    else
      -- Définir le nouveau mot de passe
      afw_12_mot_passe_pkg.defnr_mot_passe (pnu_utils
                                           ,pva_mot_passe);

      -- Dévérouiller le compte utilisateur
      afw_12_utils_pkg.devrl_utils (pnu_utils);

      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SEC.000018'
                                                     ,pva_code_prodt   => 'AFW');
    end if;
  exception
    when others
    then
      raise;
  end reint_mot_passe;

  procedure activ_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type)
  is
  begin
    -- Activer le compte utilisateur
    afw_12_utils_pkg.activ_utils (pnu_utils);

    afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SEC.000020'
                                                   ,pva_code_prodt   => 'AFW');
  end activ_utils;

  function valdr_sesn_sentr
    return boolean
  is
    vnu_exist   number;
  begin
    -- Verifier si la session existe
    select 1
      into vnu_exist
      from vd_i_afw_12_sesn
     where     id_sesn = afw_12_sesn_pkg.obten_sesn
           and app_user = afw_12_utils_pkg.obten_code_usagr_conct;

    return true;
  exception
    when no_data_found
    then
      return false;
  end valdr_sesn_sentr;

  procedure redrg_page_conxn
  is
  begin
    afw_08_url_pkg.redrg_page_postn (afw_08_url_pkg.genr_url (afw_11_aplic_pkg.obten_numr_apex_aplic
                                                             ,afw_11_aplic_pkg.obten_numr_apex_page_conxn
                                                             ,pva_mode_debg   => afw_07_util_pkg.v ('DEBUG')));
  end redrg_page_conxn;

  procedure redrg_page_acuei
  is
  begin
    afw_08_url_pkg.redrg_page_postn (afw_08_url_pkg.genr_url (afw_11_prodt_pkg.obten_numr_apex_aplic_acuei
                                                             ,afw_11_prodt_pkg.obten_numr_apex_page_acuei
                                                             ,pva_mode_debg   => afw_07_util_pkg.v ('DEBUG')));
  end redrg_page_acuei;

  procedure defnr_parmt_url_apres_authe (pnu_numr_apex_aplic   in number default afw_11_aplic_pkg.obten_numr_apex_aplic
                                        ,pnu_numr_apex_page    in number default afw_13_page_pkg.obten_numr_apex_page
                                        ,pva_scpc              in varchar2 default null
                                        ,pnu_sspc              in number default null
                                        ,pva_sapc              in varchar2 default null
                                        ,pva_scpi              in varchar2 default null
                                        ,pnu_sspi              in number default null
                                        ,pva_sapi              in varchar2 default null
                                        ,pnu_snpi              in number default null
                                        ,pnu_sidf              in number default null)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_APLIC'
                                    ,pnu_numr_apex_aplic);
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_PAGE'
                                    ,pnu_numr_apex_page);

    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SCPC'
                                    ,pva_scpc);
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SSPC'
                                    ,pnu_sspc);
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SAPC'
                                    ,pva_sapc);

    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SCPI'
                                    ,pva_scpi);
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SSPI'
                                    ,pnu_sspi);
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SAPI'
                                    ,pva_sapi);
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SNPI'
                                    ,pnu_snpi);
  end defnr_parmt_url_apres_authe;

  function genr_url (pnu_numr_apex_aplic         in number
                    ,pnu_numr_apex_page          in number
                    ,pva_scpc                    in varchar2 default null
                    ,pnu_sspc                    in number default null
                    ,pva_sapc                    in varchar2 default null
                    ,pva_scpi                    in varchar2 default null
                    ,pnu_sspi                    in number default null
                    ,pva_sapi                    in varchar2 default null
                    ,pnu_snpi                    in number default null
                    ,pnu_sidf                    in number default null
                    ,pbo_indic_forcr_sspc        in boolean default false
                    ,pbo_indic_forcr_sidf        in boolean default false
                    ,pva_optio_reqst             in varchar2 default null
                    ,pva_optio_clear_page        in varchar2 default null
                    ,pva_indic_afich_valr_sesn   in varchar2 default 'O')
    return varchar2
  is
  begin
    return afw_08_url_pkg.genr_url (pnu_numr_aplic              => pnu_numr_apex_aplic
                                   ,pnu_numr_page               => pnu_numr_apex_page
                                   ,pva_nom_varbl_1             => case when pva_scpc is not null then 'SCPC' else null end
                                   ,pva_valr_varbl_1            => case when pva_scpc is not null then pva_scpc else null end
                                   ,pva_nom_varbl_2             => case when pbo_indic_forcr_sspc then 'SSPC' when pnu_sspc is not null then 'SSPC' else null end
                                   ,pva_valr_varbl_2            => case when pbo_indic_forcr_sspc then pnu_sspc when pnu_sspc is not null then pnu_sspc else null end
                                   ,pva_nom_varbl_3             => case when pva_sapc is not null then 'SAPC' else null end
                                   ,pva_valr_varbl_3            => case when pva_sapc is not null then pva_sapc else null end
                                   ,pva_nom_varbl_4             => case when pva_scpi is not null then 'SCPI' else null end
                                   ,pva_valr_varbl_4            => case when pva_scpi is not null then pva_scpi else null end
                                   ,pva_nom_varbl_5             => case when pnu_sspi is not null then 'SSPI' else null end
                                   ,pva_valr_varbl_5            => case when pnu_sspi is not null then pnu_sspi else null end
                                   ,pva_nom_varbl_6             => case when pva_sapi is not null then 'SAPI' else null end
                                   ,pva_valr_varbl_6            => case when pva_sapi is not null then pva_sapi else null end
                                   ,pva_nom_varbl_7             => case when pnu_snpi is not null then 'SNPI' else null end
                                   ,pva_valr_varbl_7            => case when pnu_snpi is not null then pnu_snpi else null end
                                   ,pva_nom_varbl_8             => case when pbo_indic_forcr_sidf then 'SIDF' when pnu_sidf is not null then 'SIDF' else null end
                                   ,pva_valr_varbl_8            => case when pbo_indic_forcr_sidf then pnu_sidf when pnu_sidf is not null then pnu_sidf else null end
                                   ,pva_optio_reqst             => pva_optio_reqst
                                   ,pva_optio_clear_page        => pva_optio_clear_page
                                   ,pva_indic_afich_valr_sesn   => pva_indic_afich_valr_sesn
                                   ,pva_mode_debg               => afw_07_util_pkg.v ('DEBUG'));
  end genr_url;

  procedure defnr_url_creat_utils (pva_url in varchar2)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_URL_CREAT_UTILS'
                                    ,pva_url);
  end defnr_url_creat_utils;

  function obten_url_creat_utils
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_URL_CREAT_UTILS');
  end obten_url_creat_utils;

  procedure exect_procd (pva_nom_prodc in varchar2)
  is
    vva_code_a_lancr    varchar2 (4000)
                          default    'declare '
                                  || 'begin'
                                  || ' %PROCD%(); '
                                  || 'end;';
    vva_progr_a_lancr   varchar2 (4000);
  begin
    if pva_nom_prodc is not null
    then
      vva_progr_a_lancr      :=
        replace (vva_code_a_lancr
                ,'%PROCD%'
                ,pva_nom_prodc);

      execute immediate vva_progr_a_lancr;
    end if;
  end exect_procd;

  procedure defnr_procd_persn (pva_nom_procd in varchar2)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_PROCD_PERSN'
                                    ,pva_nom_procd);
  end defnr_procd_persn;

  procedure exect_procd_persn
  is
    vva_nom_procd   varchar2 (61) default afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_PROCD_PERSN');
  begin
    exect_procd (vva_nom_procd);
  end exect_procd_persn;

  procedure defnr_authe_redrc_cible (pnu_numr_aplic_apex   in number
                                    ,pnu_numr_page_apex    in number)
  is
  begin
    -- Definir l'application cible apres l'authentification si elle est nulle
    if afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_APLIC') is null
    then
      afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_APLIC'
                                      ,pnu_numr_aplic_apex);
    end if;

    -- Definir la page cible apres l'authentification si elle est nulle
    if afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_PAGE') is null
    then
      afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_PAGE'
                                      ,pnu_numr_page_apex);
    end if;
  end defnr_authe_redrc_cible;

  procedure redrg_prodt_authe (pbo_forcr_redrc_cible in boolean default false)
  is
  begin
    redrg_aplic_authe (pbo_forcr_redrc_cible);
  end redrg_prodt_authe;

  procedure redrg_aplic_authe (pbo_forcr_redrc_cible in boolean default false)
  is
    vnu_ref_aplic_authe     vd_i_afw_11_aplic.ref_aplic_authe%type default afw_11_aplic_pkg.obten_aplic_authe;
    vnu_aplic_acuei_prodt   vd_i_afw_11_prodt.ref_aplic_acuei%type default afw_11_prodt_pkg.obten_numr_apex_aplic_acuei;
    vnu_page_acuei_prodt    vd_i_afw_11_prodt.ref_page_acuei%type default afw_11_prodt_pkg.obten_numr_apex_page_acuei;

    vvc_liste_item          apex_application_global.vc_arr2;
    vvc_liste_valeur_item   apex_application_global.vc_arr2;
  begin
    if     not pbo_forcr_redrc_cible
       and vnu_aplic_acuei_prodt is not null
       and vnu_page_acuei_prodt is not null
    then
      defnr_authe_redrc_cible (vnu_aplic_acuei_prodt
                              ,vnu_page_acuei_prodt);
    else
      defnr_authe_redrc_cible (afw_11_aplic_pkg.obten_numr_apex_aplic
                              ,afw_11_aplic_pkg.obten_numr_apex_page_acuei);

      afw_08_url_pkg.obten_item_url (v ('FSP_AFTER_LOGIN_URL')
                                    ,vvc_liste_item
                                    ,vvc_liste_valeur_item);

      for i in 1 .. vvc_liste_item.count
      loop
        case
          when vvc_liste_item (i) = 'SCPC'
          then
            if afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_SCPC') is null
            then
              afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SCPC'
                                              ,vvc_liste_valeur_item (i));
            end if;
          when vvc_liste_item (i) = 'SSPC'
          then
            if afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_SSPC') is null
            then
              afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SSPC'
                                              ,vvc_liste_valeur_item (i));
            end if;
          when vvc_liste_item (i) = 'SAPC'
          then
            if afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_SAPC') is null
            then
              afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SAPC'
                                              ,vvc_liste_valeur_item (i));
            end if;
          when vvc_liste_item (i) = 'SCPI'
          then
            if afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_SCPI') is null
            then
              afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SCPI'
                                              ,vvc_liste_valeur_item (i));
            end if;
          when vvc_liste_item (i) = 'SSPI'
          then
            if afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_SSPI') is null
            then
              afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SSPI'
                                              ,vvc_liste_valeur_item (i));
            end if;
          when vvc_liste_item (i) = 'SAPI'
          then
            if afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_SAPI') is null
            then
              afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SAPI'
                                              ,vvc_liste_valeur_item (i));
            end if;
          when vvc_liste_item (i) = 'SNPI'
          then
            if afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_SNPI') is null
            then
              afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SNPI'
                                              ,vvc_liste_valeur_item (i));
            end if;
          when vvc_liste_item (i) = 'SIDF'
          then
            if afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_SIDF') is null
            then
              afw_07_sesn_pkg.defnr_valr_sesn ('S_AUTHE_CIBLE_SIDF'
                                              ,vvc_liste_valeur_item (i));
            end if;
          else
            null;
        end case;
      end loop;
    end if;

    -- Redirection vers le produit d'authentification
    if vnu_ref_aplic_authe is not null
    then
      afw_08_url_pkg.redrg_page_postn (afw_08_url_pkg.genr_url (afw_11_aplic_pkg.obten_numr_apex_aplic (vnu_ref_aplic_authe)
                                                               ,afw_11_aplic_pkg.obten_numr_apex_page_conxn (vnu_ref_aplic_authe)
                                                               ,'SIDF'
                                                               ,afw_04_fil_arian_pkg.obten_fa_courn ()
                                                               ,pva_mode_debg   => afw_07_util_pkg.v ('DEBUG')));
    end if;
  exception
    when others
    then
      raise;
  end redrg_aplic_authe;

  procedure authe_redrg (pva_code_utils          in varchar2
                        ,pva_mot_passe           in varchar2
                        ,pva_domn                in varchar2
                        ,pnu_numr_apex_aplic     in number
                        ,pnu_numr_apex_page      in number
                        ,pva_scpc                in varchar2 default null
                        ,pnu_sspc                in number default null
                        ,pva_sapc                in varchar2 default null
                        ,pva_scpi                in varchar2 default null
                        ,pnu_sspi                in number default null
                        ,pva_sapi                in varchar2 default null
                        ,pnu_snpi                in number default null
                        ,pnu_sidf                in number default null
                        ,pbo_indic_forcr_sspc    in boolean default false
                        ,pbo_indic_forcr_sidf    in boolean default false
                        ,pva_optio_reqst         in varchar2 default null
                        ,pva_optio_clear_page    in varchar2 default null
                        ,pbo_ignor_indic_actif   in boolean default false
                        ,pbo_forcr_authe         in boolean default false)
  is
    vnu_numr_apex_aplic   number (10);
    vnu_numr_apex_page    number (10);
  begin
    begin
      if (   pnu_numr_apex_aplic is null
          or pnu_numr_apex_page is null)
      then
        vnu_numr_apex_aplic   := afw_11_prodt_pkg.obten_numr_apex_aplic_acuei;
        vnu_numr_apex_page    := afw_11_prodt_pkg.obten_numr_apex_page_acuei;

        defnr_authe_redrc_cible (vnu_numr_apex_aplic
                                ,vnu_numr_apex_page);
      else
        vnu_numr_apex_aplic   := pnu_numr_apex_aplic;
        vnu_numr_apex_page    := pnu_numr_apex_page;
      end if;
    exception
      when others
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000022'
                                                ,pva_code_prodt   => 'AFW');
    end;

    afw_07_util_pkg.defnr_etat_sesn ('FSP_AFTER_LOGIN_URL'
                                    ,genr_url (vnu_numr_apex_aplic
                                              ,vnu_numr_apex_page
                                              ,pva_scpc
                                              ,pnu_sspc
                                              ,pva_sapc
                                              ,pva_scpi
                                              ,pnu_sspi
                                              ,pva_sapi
                                              ,pnu_snpi
                                              ,pnu_sidf
                                              ,pbo_indic_forcr_sspc
                                              ,pbo_indic_forcr_sidf
                                              ,pva_optio_reqst
                                              ,pva_optio_clear_page));

    valdr_utils (pva_code_utils
                ,pva_mot_passe
                ,pva_domn
                ,pbo_forcr_authe);

    defnr_varbl_utils_domn ();

    -- Définir si on doit ingnorer l'indicateur actif (afw_12_utils) lors de la connexion
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_AUTHE_IGNOR_INDIC_ACTIF'
                                    ,case when pbo_ignor_indic_actif then 'O' else 'N' end);

    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_AUTHE_FORCR_AUTHE'
                                    ,case when pbo_forcr_authe then 'O' else 'N' end);

    -- 1er) Authentifier l'utilisateur avec AFW car l'engin d'APEX n'aime pas les RAISE qu'on fait pour afficher les erreurs de connexion
    if authe_utils (afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_UTILS')
                   ,pva_mot_passe
                   ,afw_12_domn_pkg.obten_seqnc_domn (afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN'))
                   ,pbo_ignor_indic_actif
                   ,pbo_forcr_authe)
    then
      gbo_defnr_histr_acces   := false;

      afw_15_htp_pkg.ajout_temn (pva_nom    => kva_temn_domn
                                ,pva_valr   => afw_12_domn_pkg.obten_code_domn_sesn);

      exect_procd (afw_12_domn_pkg.obten_procd_avant_conxn (afw_12_domn_pkg.obten_seqnc_domn (pva_domn)));

      -- 2e) Authentifier l'utilisateur avec l'engin d'APEX
      -- Passer l'utilisateur qui apparaîtra comme connecté car c'est le code qui sera dans APP_USER
      apex_custom_auth.login (nvl (gva_code_utils_pour, gva_code_utils)
                             ,pva_mot_passe
                             ,afw_12_sesn_pkg.obten_sesn);

      apex_util.set_preference (p_preference   => 'FSP_LANGUAGE_PREFERENCE'
                               ,p_value        => afw_01_lang_pkg.obten_code_lang (afw_11_prodt_pkg.obten_lang_deft));

      afw_07_polc_pkg.initl_contx ();

      if afw_12_utils_pkg.obten_code_usagr_conct is not null
      then
        defnr_varbl_sesn;

        if afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_UTILS_POUR') is null
        then
          afw_12_utils_pkg.updat_dernr_domn (afw_12_utils_pkg.obten_usagr_conct
                                            ,pva_domn);
        end if;
      end if;

      exect_procd (afw_12_domn_pkg.obten_procd_apres_conxn (afw_12_domn_pkg.obten_seqnc_domn (pva_domn)));
    end if;
  end authe_redrg;

  procedure authe_debg (pva_code_utils        in varchar2
                       ,pva_domn              in varchar2
                       ,pnu_numr_apex_aplic   in number
                       ,pnu_numr_apex_page    in number)
  is
    vnu_secrt_group_id   apex_aplic.security_group_id%type;
    l_cgivar_name        owa.vc_arr;
    l_cgivar_val         owa.vc_arr;
  begin
    htp.init;

    l_cgivar_name (1)                 := 'REQUEST_PROTOCOL';
    l_cgivar_val (1)                  := 'HTTP';

    owa.init_cgi_env (num_params   => 1
                     ,param_name   => l_cgivar_name
                     ,param_val    => l_cgivar_val);

    vnu_secrt_group_id                := afw_11_aplic_pkg.obten_secrt_group_id (afw_11_aplic_pkg.obten_aplic_numr_apex (pnu_numr_apex_aplic));

    apex_secrt.g_security_group_id    := vnu_secrt_group_id;

    apex_api.set_security_group_id (vnu_secrt_group_id);

    apex_application.g_instance       := 1;
    apex_application.g_flow_id        := pnu_numr_apex_aplic;
    apex_application.g_flow_step_id   := pnu_numr_apex_page;

    valdr_utils (pva_code_utils
                ,null
                ,pva_domn
                ,true);

    apex_custom_auth.post_login (p_uname        => nvl (gva_code_utils_pour, gva_code_utils)
                                ,p_session_id   => null
                                , -- could use APEX_CUSTOM_AUTH.GET_NEXT_SESSION_ID
                                 p_app_page     =>   apex_application.g_flow_id
                                                  || ':'
                                                  || pnu_numr_apex_page);

    apex_util.set_preference (p_preference   => 'FSP_LANGUAGE_PREFERENCE'
                             ,p_value        => afw_01_lang_pkg.obten_code_lang (afw_11_prodt_pkg.obten_lang_deft));

    inser_sesn_alter;

    afw_07_polc_pkg.initl_contx ();

    afw_07_sesn_pkg.defnr_valr_sesn_alter ('S_AFW_12_SESN'
                                          ,encry (afw_12_sesn_pkg.obten_sesn));

    -- Utilisateur qui sert à l'authentification
    afw_07_sesn_pkg.defnr_valr_sesn_alter ('S_AFW_12_UTILS'
                                          ,gva_code_utils);

    -- Connexion dérivée (optionnel et requiert des droits)
    afw_07_sesn_pkg.defnr_valr_sesn_alter ('S_AFW_12_UTILS_POUR'
                                          ,gva_code_utils_pour);

    -- Domaine qui sert à l'authentification
    afw_07_sesn_pkg.defnr_valr_sesn_alter ('S_AFW_12_DOMN'
                                          ,gva_code_domn);

    -- Connexion dérivée (optionnel et requiert des droits)
    afw_07_sesn_pkg.defnr_valr_sesn_alter ('S_AFW_12_DOMN_POUR'
                                          ,gva_code_domn_pour);

    if afw_12_utils_pkg.obten_code_usagr_conct is not null
    then
      defnr_varbl_sesn;

      if afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_UTILS_POUR') is null
      then
        afw_12_utils_pkg.updat_dernr_domn (afw_12_utils_pkg.obten_usagr_conct
                                          ,pva_domn);
      end if;
    end if;

    exect_procd (afw_12_domn_pkg.obten_procd_apres_conxn (afw_12_domn_pkg.obten_seqnc_domn (pva_domn)));
  end authe_debg;
begin
  gbo_valdt_procd_authe_exter   := false;
end afw_12_authe_apex_pkg;
/
