SET DEFINE OFF;
create or replace package body afw_04_fil_arian_pkg
as
  gbo_mode_debug        constant boolean default false;
  gnu_mod_encry         constant pls_integer default dbms_crypto.encrypt_aes256 + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5;
  gnu_longr_cle_encry   constant pls_integer default 256 / 8;
  gra_cle_encry                  raw (2000) default 'B9E13AF9390AF7C509F12EB4DF031D433524A0E25A4E0052B0E36711253A6116';
  gva_charc_set         constant varchar2 (12) default 'WE8MSWIN1252';

  procedure trace_exect (pva_1   in varchar2 default null
                        ,pva_2   in varchar2 default null)
  is
  begin
    if gbo_mode_debug
    then
      ete (pva_1
          ,pva_2);
      apex_debug_message.trace (   pva_1
                                || ': '
                                || pva_2);
    end if;
  end trace_exect;

  function encry (pva_valr in varchar2)
    return raw
  is
  begin
    return dbms_crypto.encrypt (utl_i18n.string_to_raw (pva_valr
                                                       ,gva_charc_set)
                               ,gnu_mod_encry
                               ,gra_cle_encry);
  end encry;

  function obten_dernr_page
    return number
  is
    vnu_page   number;
  begin
    begin
      select page
        into vnu_page
        from (  select page
                  from vd_afw_04_fil_arian
              order by timst desc)
       where rownum = 1;

      return vnu_page;
    exception
      when no_data_found
      then
        return null;
    end;
  end obten_dernr_page;

  function trait_page (pnu_page_id in number default null)
    return boolean
  is
    vva_indic_trait   varchar2 (1);
  begin
    select aap.indic_prise_charg_afw04
      into vva_indic_trait
      from vd_i_afw_13_page  aap
          ,vd_i_afw_11_aplic pro
     where     aap.ref_aplic = pro.seqnc
           and pro.seqnc = afw_11_aplic_pkg.obten_aplic_sesn ()
           and aap.numr_apex = nvl (pnu_page_id, afw_13_page_pkg.obten_numr_apex_page)
           and aap.indic_prise_charg_afw04 = 'O';

    return true;
  exception
    when others
    then
      return false;
  end trait_page;

  function obten_seqnc_fa_de_page_dest (pnu_page_dest     in number
                                       ,pnu_aplic_dest    in number default afw_07_polc_pkg.obten_valr_contx_numr_aplic
                                       ,pnu_seqnc_deprt   in number default null)
    return number
  is
    vnu_seqnc_destn   number;
  begin
    select seqnc
      into vnu_seqnc_destn
      from (  select seqnc
                from vd_afw_04_fil_arian fa
               where     fa.page = pnu_page_dest
                     and (   (fa.app_id = pnu_aplic_dest)
                          or pnu_aplic_dest is null)
                     and (   timst <= (select fa3.timst
                                         from vd_afw_04_fil_arian fa3
                                        where fa3.seqnc = pnu_seqnc_deprt)
                          or pnu_seqnc_deprt is null)
            order by timst desc)
     where rownum = 1;

    return vnu_seqnc_destn;
  exception
    when no_data_found
    then
      return null;
    when too_many_rows
    then
      ete;
      raise;
  end obten_seqnc_fa_de_page_dest;

  procedure suprm_elemn_apres (pnu_seqnc_a_partr_de number)
  is
  begin
    trace_exect ('suprm_elemn_apres()');
    trace_exect ('pnu_seqnc_a_partr_de'
                ,pnu_seqnc_a_partr_de);

    delete vd_afw_04_fil_arian
     where timst > (select fa2.timst
                      from vd_afw_04_fil_arian fa2
                     where fa2.seqnc = pnu_seqnc_a_partr_de);
  end suprm_elemn_apres;

  /*
   On peut exécuter cette fonction lorsqu'on est authentifié.
   Autrement, il faut exécuter la fonction synch qui s'occupera d'initialiser les variables et la table de session.
 */
  procedure synch_login
  is
    pragma autonomous_transaction;
    vnu_numr_apex_page_acuei    number;
    vnu_numr_apex_aplic_acuei   number;
    vnu_seqnc_fa                number (10);
  begin
    trace_exect ('synch_login()');

    -- Initialiser les variables
    vnu_numr_apex_page_acuei    := nvl (afw_11_prodt_pkg.obten_numr_apex_page_acuei, afw_11_aplic_pkg.obten_numr_apex_page_acuei);

    vnu_numr_apex_aplic_acuei   := nvl (afw_11_prodt_pkg.obten_numr_apex_aplic_acuei, afw_11_aplic_pkg.obten_numr_apex_aplic);

    vnu_seqnc_fa                :=
      obten_seqnc_fa_de_page_dest (vnu_numr_apex_page_acuei
                                  ,vnu_numr_apex_aplic_acuei);

    if vnu_seqnc_fa is null
    then
      --supprimer les informations liées à la session
      delete from vd_afw_04_fil_arian;

      insert into vd_afw_04_fil_arian (page
                                      ,app_id
                                      ,session_id
                                      ,ref_elemn_sup
                                      ,hash_dernr_url
                                      ,timst
                                      ,indic_afich)
           values (vnu_numr_apex_page_acuei
                  ,vnu_numr_apex_aplic_acuei
                  ,afw_12_sesn_pkg.obten_sesn
                  ,null
                  ,afw_07_util_pkg.hash ('/')
                  ,systimestamp - interval '0.001' second
                  ,'O')
        returning seqnc
             into vnu_seqnc_fa;

      trace_exect ('numr apex page ajouté'
                  ,vnu_numr_apex_page_acuei);
      trace_exect ('numr apex aplic ajouté'
                  ,vnu_numr_apex_aplic_acuei);
      trace_exect ('seqnc ajouté'
                  ,vnu_seqnc_fa);
    else
      suprm_elemn_apres (vnu_seqnc_fa);
    end if;

    afw_07_util_pkg.defnr_etat_sesn ('SIDF'
                                    ,vnu_seqnc_fa);
    afw_07_polc_pkg.defnr_contx_sesn_sidf (vnu_seqnc_fa);

    commit;
  end synch_login;

  procedure synch_varbl (pbo_sur_soums   in boolean default false
                        ,pnu_fa_courn    in number default afw_07_polc_pkg.obten_valr_contx_sidf)
  is
    vnu_fa_courn     number;
    vnu_fa_provn     number;
    vnu_app_parnt    number;
    vnu_page_parnt   number;
    vva_url_parnt    varchar2 (200);
  begin
    vnu_fa_courn   := pnu_fa_courn;

    if not trait_page ()
    then
      return;
    end if;

    begin
      select parnt.app_id
            ,parnt.page
            ,parnt.seqnc
        into vnu_app_parnt
            ,vnu_page_parnt
            ,vnu_fa_provn
        from vd_afw_04_fil_arian parnt
            ,vd_afw_04_fil_arian actue
       where     parnt.seqnc = actue.ref_elemn_sup
             and actue.seqnc = vnu_fa_courn;
    exception
      when no_data_found
      then
        null;
    end;

    if     vnu_app_parnt is not null
       and vnu_page_parnt is not null
    then
      vva_url_parnt      :=
        afw_08_url_pkg.genr_url (pnu_numr_aplic     => vnu_app_parnt
                                ,pnu_numr_page      => vnu_page_parnt
                                ,pva_nom_varbl_1    => 'SIDF'
                                ,pva_valr_varbl_1   => vnu_fa_courn
                                ,pva_nom_varbl_2    => 'SAPC'
                                ,pva_valr_varbl_2   =>   'XFA'
                                                      || vnu_fa_provn);
    end if;

    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_SOURC_NUMR_PAGE'
                                    ,vnu_page_parnt);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_SOURC_NUMR_APLIC'
                                    ,vnu_app_parnt);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_SOURC_URL'
                                    ,vva_url_parnt);

    if pbo_sur_soums
    then
      afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_SUR_SOUMS'
                                      ,'O');
    else
      afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_SUR_SOUMS'
                                      ,null);
    end if;
  end synch_varbl;

  procedure synch
  is
    pragma autonomous_transaction;
    sidf_inval                       exception;
    snpi_inval                       exception;
    contx_intrv                      exception;
    parnt_intrv                      exception;
    parnt_intro                      exception;

    pragma exception_init (parnt_intro
                          ,-2291);

    vnu_numr_apex_page_courn         number;
    vnu_numr_apex_aplic_courn        number;
    vnu_numr_apex_page_acuei         number;
    vnu_numr_apex_aplic_acuei        number;
    vnu_numr_apex_page_auth_cible    number;
    vnu_numr_apex_aplic_auth_cible   number;

    vnu_page_courn                   vd_i_afw_13_page.seqnc%type;
    vnu_page_acuei                   vd_i_afw_13_page.seqnc%type;
    vnu_page_conxn                   vd_i_afw_11_aplic.ref_page_conxn%type;
    vnu_page_authe_cible             number;

    vbo_autor_duplq_page             boolean default nvl (afw_07_util_pkg.v ('A_AFW_04_AUTOR_DUPLQ_PAGE'), 'N') = 'O';
    vbo_suprm_fil_courn              boolean default nvl (afw_07_util_pkg.v ('A_AFW_04_SUPRM_FIL_COURN'), 'N') = 'O';
    vbo_sur_soums                    boolean default nvl (afw_07_util_pkg.v ('A_AFW_04_SUR_SOUMS'), 'N') = 'O';
    vva_actio                        afw_04_contx.actio%type default afw_07_util_pkg.v ('SAPC');
    vra_hash_dernr_url               vd_afw_04_fil_arian.hash_dernr_url%type;
    vbo_afich_page_inter             boolean default false;
    vnu_page_inter                   number;
    vnu_page_parnt                   number;
    vnu_fa_pp                        number;
    vnu_fa_provn                     number;
    vnu_fa_courn                     number;
    vnu_fa_parnt_courn               number;
    vnu_dummy                        number;
    vnu_app_id_parnt                 number;

    procedure ajout_elemn (pnu_provn           in number
                          ,vva_indic_afich     in varchar2 default 'O'
                          ,vva_indic_moins_1   in varchar2 default 'N'
                          ,pva_indic_virtl     in varchar2 default 'N')
    is
    begin
      trace_exect ('ajout_elemn()');
      trace_exect ('numr_apex_page'
                  ,vnu_numr_apex_page_courn);
      trace_exect ('numr_apex_aplic'
                  ,afw_07_util_pkg.nv ('APP_ID'));
      trace_exect ('pnu_provn'
                  ,pnu_provn);

      insert into vd_afw_04_fil_arian (page
                                      ,session_id
                                      ,ref_elemn_sup
                                      ,hash_dernr_url
                                      ,indic_afich
                                      ,timst
                                      ,indic_virtl
                                      ,indic_duplc)
           values (vnu_numr_apex_page_courn
                  ,afw_07_util_pkg.nv ('SESSION')
                  ,pnu_provn
                  ,vra_hash_dernr_url
                  ,vva_indic_afich
                  ,case when vva_indic_moins_1 = 'O' then systimestamp - interval '0.001' second else systimestamp end
                  ,pva_indic_virtl
                  ,nvl (afw_07_util_pkg.v ('A_AFW_04_AUTOR_DUPLQ_PAGE'), 'N'))
        returning seqnc
             into vnu_fa_courn;

      trace_exect ('numr apex page ajouté'
                  ,vnu_numr_apex_page_courn);
      trace_exect ('numr apex aplic ajouté'
                  ,afw_07_util_pkg.nv ('APP_ID'));
      trace_exect ('seqnc ajouté'
                  ,vnu_fa_courn);
    exception
      when parnt_intro
      then
        raise parnt_intrv;
    end ajout_elemn;

    procedure reint_item_aplic
    is
    begin
      afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_AUTOR_DUPLQ_PAGE'
                                      ,'N');
      afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_SUPRM_FIL_COURN'
                                      ,'N');
      afw_07_util_pkg.defnr_etat_sesn ('SIDF'
                                      ,null);
      afw_07_polc_pkg.defnr_contx_sesn_sidf (null);
      afw_07_util_pkg.defnr_etat_sesn ('SNPI'
                                      ,null);
      afw_07_util_pkg.defnr_etat_sesn ('SAPC'
                                      ,null);
    end reint_item_aplic;

    procedure initl_varbl
    is
    begin
      -- Initialisation des variables
      trace_exect ('Initialisation des variables'
                  ,'Début');

      trace_exect ('session id'
                  ,afw_07_util_pkg.nv ('SESSION'));

      vra_hash_dernr_url          := afw_07_util_pkg.hash (afw_07_util_pkg.obten_parmt_url ());
      trace_exect ('parmt_url'
                  ,afw_07_util_pkg.obten_parmt_url ());
      trace_exect ('vra_hash_dernr_url'
                  ,vra_hash_dernr_url);

      vnu_numr_apex_page_courn    := afw_13_page_pkg.obten_numr_apex_page;
      trace_exect ('vnu_numr_apex_page_courn'
                  ,vnu_numr_apex_page_courn);

      vnu_numr_apex_aplic_courn   := afw_11_aplic_pkg.obten_numr_apex_aplic;
      trace_exect ('vnu_numr_apex_aplic_courn'
                  ,vnu_numr_apex_aplic_courn);

      trace_exect ('S_AUTHE_CIBLE_NUMR_APEX_PAGE'
                  ,afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_PAGE'));
      trace_exect ('S_AUTHE_CIBLE_NUMR_APEX_APLIC'
                  ,afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_APLIC'));

      vnu_numr_apex_page_auth_cible      :=
        coalesce (afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_PAGE')
                 ,afw_11_prodt_pkg.obten_numr_apex_page_acuei
                 ,afw_11_aplic_pkg.obten_numr_apex_page_acuei);
      trace_exect ('vnu_numr_apex_page_auth_cible'
                  ,vnu_numr_apex_page_auth_cible);

      vnu_numr_apex_aplic_auth_cible      :=
        coalesce (afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_APLIC')
                 ,afw_11_prodt_pkg.obten_numr_apex_aplic_acuei
                 ,afw_11_aplic_pkg.obten_numr_apex_aplic);
      trace_exect ('vnu_numr_apex_aplic_auth_cible'
                  ,vnu_numr_apex_aplic_auth_cible);

      vnu_numr_apex_page_acuei    := nvl (afw_11_prodt_pkg.obten_numr_apex_page_acuei, afw_11_aplic_pkg.obten_numr_apex_page_acuei);
      trace_exect ('vnu_numr_apex_page_acuei'
                  ,vnu_numr_apex_page_acuei);

      vnu_numr_apex_aplic_acuei   := nvl (afw_11_prodt_pkg.obten_numr_apex_aplic_acuei, afw_11_aplic_pkg.obten_numr_apex_aplic);
      trace_exect ('vnu_numr_apex_aplic_acuei'
                  ,vnu_numr_apex_aplic_acuei);

      vnu_page_courn              := afw_13_page_pkg.obten_page_sesn;
      trace_exect ('vnu_page_courn'
                  ,vnu_page_courn);

      vnu_page_conxn              := nvl (afw_11_aplic_pkg.obten_page_conxn_aplic_authe, afw_11_aplic_pkg.obten_page_conxn);
      trace_exect ('vnu_page_conxn'
                  ,vnu_page_conxn);

      vnu_page_authe_cible        :=
        afw_13_page_pkg.obten_page (vnu_numr_apex_page_auth_cible
                                   ,vnu_numr_apex_aplic_auth_cible);
      trace_exect ('vnu_page_authe_cible'
                  ,vnu_page_authe_cible);

      vnu_page_acuei              :=
        afw_13_page_pkg.obten_page (vnu_numr_apex_page_acuei
                                   ,vnu_numr_apex_aplic_acuei);
      trace_exect ('vnu_page_acuei'
                  ,vnu_page_acuei);

      trace_exect ('Initialisation des variables'
                  ,'Fin');
    end initl_varbl;

    procedure valdr_sesn_apex
    is
    begin
      trace_exect ('Valider la session APEX');

      --TODO::CARLO
      if afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_SESN') is null
      then
        afw_12_authe_apex_pkg.inser_sesn;
        afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_SESN'
                                        ,encry (afw_12_sesn_pkg.obten_sesn));
      end if;

      if not (encry (afw_12_sesn_pkg.obten_sesn) = afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_SESN'))
      then
        afw_08_url_pkg.decnt_et_redrg_page_login ();
      end if;
    end valdr_sesn_apex;

    procedure gerer_histr_navgt
    is
    begin
      trace_exect ('Gérer historique de navigation');
    /*
   --TODO::PRIBR
    if vva_actio like 'XNH%' then
      afw_04_histr_navgt_pkg.creer_fil_arian_de_histr(to_number(substr(vva_actio, 4)));
    end if;*/
    end gerer_histr_navgt;

    procedure maj_refrn_apex
    is
    begin
      -- Mettre à jour la page dans le référentiel de AFW (habituellement activé en DEV)
      if     vnu_numr_apex_page_courn is null
         and afw_11_prodt_pkg.obten_page_inexs_maj_refrn (afw_11_prodt_pkg.obten_prodt_sesn)
      then
        trace_exect ('La page courante n''est pas dans le référentiel AFW et on va la mettre à jour.');
        afw_13_page_pkg.maj_pages_refrt_apex (afw_11_aplic_pkg.obten_aplic_sesn);
        afw_13_page_pkg.maj_page_refrt_apex (afw_13_page_pkg.obten_page_sesn);
        vnu_numr_apex_page_courn   := afw_13_page_pkg.obten_numr_apex_page;
      end if;
    end maj_refrn_apex;

    procedure gerer_page_inter
    is
    begin
      trace_exect ('Gestion de page intermédiaire');

      if afw_07_util_pkg.v ('SNPI') like '@%'
      then
        trace_exect ('Il faudra afficher une page intermédiaire (SNPI like @%).');

        --        vbo_afich_page_inter   := true;
        afw_07_util_pkg.defnr_etat_sesn ('SNPI'
                                        ,substr (afw_07_util_pkg.v ('SNPI')
                                                ,2));
      end if;

      vbo_afich_page_inter   := true;
      vnu_page_inter         := afw_07_util_pkg.nv ('SNPI');
    exception
      when others
      then
        raise snpi_inval;
    end gerer_page_inter;

    function valdt_item_provn
      return boolean
    is
      vbo_reslt   boolean default false;
    begin
      if true
      then
        vbo_reslt   := true;
      end if;

      return vbo_reslt;
    end valdt_item_provn;
  begin
    afw_07_polc_pkg.defnr_contx_sesn_sidf (afw_07_util_pkg.nv ('SIDF'));

    afw_07_util_pkg.ajout_info_debug ('AFW 04 Fil Arian - Synchroniser le fil d''ariane');

    trace_exect ('synch()');

    initl_varbl ();

    if not trait_page ()
    then
      trace_exect ('Ne pas traiter la page');
      commit;
      return;
    end if;

    valdr_sesn_apex ();

    --gerer_histr_navgt();

    maj_refrn_apex ();

    gerer_page_inter ();

    begin
      --      if vnu_page_courn <> vnu_page_conxn then
      --        vnu_fa_provn :=   obten_fa_courn();
      --
      --        ete ('La provenance = SIDF', vnu_fa_provn);
      --      else
      --        vnu_fa_provn :=   null;
      --
      --        ete ('La provenance = NULL');
      --      end if;
      vnu_fa_provn   := obten_fa_courn ();
      trace_exect ('La provenance = SIDF'
                  ,vnu_fa_provn);
    exception
      when others
      then
        raise sidf_inval;
    end;

    if vnu_page_courn = vnu_page_acuei
    then
      trace_exect ('La page courante est une page d''accueil');

      vnu_fa_provn      :=
        obten_seqnc_fa_de_page_dest (vnu_numr_apex_page_acuei
                                    ,vnu_numr_apex_aplic_acuei);

      trace_exect ('vnu_fa_provn'
                  ,vnu_fa_provn);

      if vnu_fa_provn is null
      then
        trace_exect ('Initialiser le fil d''Ariane');
        synch_login ();
        vnu_fa_provn   := obten_fa_courn ();
      end if;
    elsif vnu_fa_provn is null
    then
      trace_exect ('La provenance est nulle (SIDF=null)');

      begin
        trace_exect ('Déterminer s''il existe un fil d''Ariane');

        select seqnc
          into vnu_fa_provn
          from vd_afw_04_fil_arian
         where ref_elemn_sup is null;

        trace_exect ('Conserver le premier niveau');
        suprm_elemn_apres (vnu_fa_provn);
      exception
        when no_data_found
        then
          trace_exect ('Initialiser le fil d''Ariane');
          synch_login ();

          select seqnc
            into vnu_fa_provn
            from vd_afw_04_fil_arian
           where ref_elemn_sup is null;
      end;
    end if;

    if     not vbo_autor_duplq_page
       and not vbo_sur_soums
    then
      begin
        trace_exect ('Déterminer si l''URL demandé existe déjà');

        select seqnc
          into vnu_fa_courn
          from vd_afw_04_fil_arian
         where hash_dernr_url = vra_hash_dernr_url;

        if vnu_fa_courn is not null
        then
          trace_exect ('simuler un clic sur l''element de fil d''Ariane depuis l''element lui-même (boucle)');

          vva_actio      :=
               'XFA'
            || vnu_fa_courn;
          vnu_fa_provn   := vnu_fa_courn;
        end if;
      exception
        when no_data_found
        then
          null;
      end;
    end if;

    -- Valider que le fil d'ariane de provenance est valide
    -- Sauf dans le cas de la page d'accueil, on laisse tjrs passer
    if     vnu_page_courn <> vnu_page_acuei
       and not est_valid_sidf (false
                              ,vnu_fa_provn)
    then
      raise contx_intrv;
    end if;

    -- Se positionner sur l'avant-derniere entree si demande
    if vbo_suprm_fil_courn
    then
      afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_SUPRM_FIL_COURN'
                                      ,'N');

      begin
        select seqnc
          into vnu_fa_provn
          from (  select fa1.seqnc
                    from vd_afw_04_fil_arian fa1
                   where     fa1.timst < (select fa2.timst
                                            from vd_afw_04_fil_arian fa2
                                           where fa2.seqnc = vnu_fa_provn)
                         and fa1.ref_elemn_sup is not null -- Filtrer la page d'accueil
                order by timst desc)
         where rownum = 1;
      exception
        when no_data_found
        then
          null; -- Ne rien faire, demeurer sur l'entree actuelle
      end;
    end if;

    -- Se remettre en contexte, au cas ou l'usager a utilise "Back"
    trace_exect ('2. call suprm_elemn_apres()');
    suprm_elemn_apres (vnu_fa_provn);

    if vnu_page_inter is not null
    then
      -- Chercher si la page intermediaire existe
      vnu_fa_parnt_courn   := obten_seqnc_fa_de_page_dest (vnu_page_inter);

      if    vnu_fa_parnt_courn is null
         or vbo_autor_duplq_page
      then
        vnu_page_parnt             := vnu_numr_apex_page_courn;
        vnu_numr_apex_page_courn   := vnu_page_inter;
        trace_exect ('1. on call ajout_elemn()');
        ajout_elemn (vnu_fa_provn
                    ,case when vbo_afich_page_inter then 'O' else 'N' end
                    ,'O'
                    ,'O');
        gnu_fa_page_inter          := vnu_fa_courn;
        vnu_fa_provn               := vnu_fa_courn;
        vnu_numr_apex_page_courn   := vnu_page_parnt;
      else
        gnu_fa_page_inter   := vnu_fa_parnt_courn;
        trace_exect ('3. call suprm_elemn_apres()');
        suprm_elemn_apres (vnu_fa_parnt_courn);
        vnu_fa_provn        := vnu_fa_parnt_courn;
      end if;
    end if;

    --Verifier le META pour traiter les particularites
    if vva_actio like 'XPP%'
    then
      trace_exect ('vva_actio like XPP%');

      -- Lire le numero de page parent et l'application dans le META
      --Si pas de page parent (pas la portion de xxx|yyy, trouver l'application la plus proche)
      if vva_actio like 'XPP%|%'
      then
        vnu_app_id_parnt      :=
          to_number (substr (vva_actio
                            ,4
                            ,  instr (vva_actio
                                     ,'|')
                             - 4));
        vnu_page_parnt      :=
          to_number (substr (vva_actio
                            ,  instr (vva_actio
                                     ,'|')
                             + 1));
      else
        vnu_page_parnt      :=
          to_number (substr (vva_actio
                            ,4));

        declare
          cursor cur_fa_parnt
          is
              select app_id
                from vd_afw_04_fil_arian fa
               where fa.page = vnu_page_parnt
            order by timst desc;
        begin
          --Trouver l'application en remontant
          for rec_fa in cur_fa_parnt
          loop
            vnu_app_id_parnt   := rec_fa.app_id;
            exit;
          end loop;
        end;
      end if;

      -- Le META est lu, on peut le discarter
      --afw_07_util_pkg.defnr_etat_sesn ('SAPC', null);
      -- Chercher la page parent et la page courante dans le fil actuel
      vnu_fa_pp      :=
        obten_seqnc_fa_de_page_dest (vnu_page_parnt
                                    ,vnu_app_id_parnt);
      vnu_fa_courn      :=
        obten_seqnc_fa_de_page_dest (vnu_numr_apex_page_courn
                                    ,vnu_numr_apex_aplic_courn);

      -- Verifier si les pages sont deja directement liees
      begin
        select 1
          into vnu_dummy
          from vd_afw_04_fil_arian
         where     seqnc = vnu_fa_courn
               and ref_elemn_sup = vnu_fa_pp;

        trace_exect ('4. call suprm_elemn_apres()');
        suprm_elemn_apres (vnu_fa_courn);

        update vd_afw_04_fil_arian
           set hash_dernr_url   = vra_hash_dernr_url
         where     seqnc = vnu_fa_courn
               and ref_elemn_sup is not null;
      exception
        when no_data_found
        then
          -- Si les pages ne sont pas liees
          if vnu_fa_pp is null
          then
            -- Pas normal, il devrait exister
            raise parnt_intrv;
          else
            --Déplacer les contextes étendu
            afw_04_contx_pkg.deplc_contx_etend (vnu_fa_courn
                                               ,vnu_fa_pp);

            trace_exect ('5. call suprm_elemn_apres()');
            suprm_elemn_apres (vnu_fa_pp);
            trace_exect ('2. on call ajout_elemn()');
            ajout_elemn (vnu_fa_pp);
          end if;
      end;
    elsif vva_actio like 'XFA%'
    then
      trace_exect ('vva_actio like XFA%');
      -- Lire le numero de fil d'ariane dans le META
      vnu_fa_courn      :=
        to_number (substr (vva_actio
                          ,4));

      -- Le META est lu, on peut le discarter
      --afw_07_util_pkg.defnr_etat_sesn ('SAPC', null);

      -- Valider que le fil d'ariane lu est valide
      if not est_valid_sidf (false
                            ,vnu_fa_courn)
      then
        raise contx_intrv;
      end if;

      trace_exect ('6. call suprm_elemn_apres()');
      suprm_elemn_apres (vnu_fa_courn);

      update vd_afw_04_fil_arian
         set hash_dernr_url   = vra_hash_dernr_url
       where     seqnc = vnu_fa_courn
             and ref_elemn_sup is not null;
    else
      trace_exect ('');
      vnu_fa_courn      :=
        obten_seqnc_fa_de_page_dest (vnu_numr_apex_page_courn
                                    ,vnu_numr_apex_aplic_courn);

      if (vnu_fa_courn is null)
      then
        trace_exect ('3. on call ajout_elemn()');
        ajout_elemn (vnu_fa_provn);
      elsif     vbo_autor_duplq_page
            and valdt_item_provn
      then
        trace_exect ('3. on call ajout_elemn()');
        trace_exect ('Autoriser la duplication de la page');
        ajout_elemn (vnu_fa_provn);
      else
        trace_exect ('7. call suprm_elemn_apres()');
        suprm_elemn_apres (vnu_fa_courn);

        update vd_afw_04_fil_arian
           set hash_dernr_url   = vra_hash_dernr_url
         where     seqnc = vnu_fa_courn
               and ref_elemn_sup is not null;
      end if;
    end if;

    --    elsif vbo_autor_duplq_page
    --    then
    --      trace_exect ('Autoriser la duplication de la page');
    --
    --      begin
    --        select seqnc
    --          into vnu_fa_courn
    --          from vd_afw_04_fil_arian
    --         where hash_dernr_url = vra_hash_dernr_url;
    --
    --        vnu_fa_courn      :=
    --          obten_seqnc_fa_de_page_dest (vnu_numr_apex_page_courn
    --                                      ,vnu_numr_apex_aplic_courn);
    --      exception
    --        when no_data_found
    --        then
    --          ajout_elemn (vnu_fa_provn);
    --      end;
    --    elsif vnu_fa_courn is null
    --    then
    --      vnu_fa_courn      :=
    --        obten_seqnc_fa_de_page_dest (vnu_numr_apex_page_courn
    --                                    ,vnu_numr_apex_aplic_courn);
    --
    --      trace_exect ('SIDF = null (ajout_elemn)');
    --      ajout_elemn (vnu_fa_provn);
    --    else
    --      trace_exect ('7. call suprm_elemn_apres()');
    --      suprm_elemn_apres (vnu_fa_courn);
    --
    --      update vd_afw_04_fil_arian
    --         set hash_dernr_url   = vra_hash_dernr_url
    --       where seqnc = vnu_fa_courn and ref_elemn_sup is not null;
    --    end if;

    -- S'assurer que l'item soit affiche

    update vd_afw_04_fil_arian
       set indic_afich   = 'O'
     where seqnc = vnu_fa_courn;

    -- Synchroniser les variables
    afw_07_util_pkg.defnr_etat_sesn ('SIDF'
                                    ,vnu_fa_courn);
    afw_07_polc_pkg.defnr_contx_sesn_sidf (vnu_fa_courn);
    synch_varbl;

    commit;
  exception
    when sidf_inval
    then
      --MESSAGE= La séquence du fil d'ariane est invalide: SIDF = %1%
      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SIE.000003'
                                                     ,obten_fa_courn ()
                                                     ,pva_code_prodt   => 'AFW');

      if gbo_mode_debug
      then
        afw_07_util_pkg.aret_trait_page_apex;
      else
        afw_08_url_pkg.redrg_navgt_ilegl;
      end if;

      reint_item_aplic ();
      commit;
      return;
    when snpi_inval
    then
      --MESSAGE= La séquence du contexte est invalide: %1% = %2%
      afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000004'
                                              ,'SNPI'
                                              ,afw_07_util_pkg.v ('SNPI')
                                              ,pva_code_prodt   => 'AFW');

      if gbo_mode_debug
      then
        afw_07_util_pkg.aret_trait_page_apex;
      else
        afw_08_url_pkg.redrg_navgt_ilegl;
      end if;

      reint_item_aplic ();
      commit;
      return;
    when contx_intrv
    then
      --MESSAGE= Vous avez été redirigé à la page d'accueil étant donné que votre pile de navigation était corrompue.
      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SIE.000002'
                                                     ,pva_code_prodt   => 'AFW');

      if gbo_mode_debug
      then
        afw_07_util_pkg.aret_trait_page_apex;
      else
        afw_08_url_pkg.redrg_navgt_ilegl;
      end if;

      reint_item_aplic ();
      commit;
      return;
    when parnt_intrv
    then
      --MESSAGE= Vous avez été redirigé à la page d'accueil étant donné que votre pile de navigation était corrompue.
      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SIE.000002'
                                                     ,pva_code_prodt   => 'AFW');

      if gbo_mode_debug
      then
        afw_07_util_pkg.aret_trait_page_apex;
      else
        afw_08_url_pkg.redrg_navgt_ilegl;
      end if;

      reint_item_aplic ();
      commit;
      return;
    when others
    then
      ete ();
      raise;
  end synch;

  procedure persn (pva_titre_persn   in varchar2
                  ,pnu_index         in number default 0)
  is
    pragma autonomous_transaction;
    vnu_seqnc_provn   number (10) default obten_fa_courn ();
    vnu_index         number (10) default pnu_index;
  begin
    while vnu_index < 0
    loop
      select ref_elemn_sup
        into vnu_seqnc_provn
        from vd_afw_04_fil_arian
       where seqnc = vnu_seqnc_provn;

      vnu_index   := vnu_index + 1;
    end loop;

    update vd_afw_04_fil_arian
       set libl   = pva_titre_persn
     where seqnc = vnu_seqnc_provn;

    commit;
  exception
    when others
    then
      rollback;
  end persn;

  function afich (pbo_regrp_menu in boolean default false)
    return clob
  is
    --    cursor cur_fil
    --    is
    --          select count (1) over (partition by session_id) nb
    --                ,rank () over (order by timst) rg
    --                ,libl
    --                ,page
    --                ,seqnc
    --                ,app_id
    --                ,indic_virtl
    --                ,indic_duplc
    --            from vd_afw_04_fil_arian fa
    --           where fa.indic_afich = 'O'
    --      connect by fa.ref_elemn_sup = prior fa.seqnc
    --      start with fa.ref_elemn_sup is null;

    cursor cur_fil_arian
    is
        select libl
              ,page
              ,seqnc
              ,app_id
              ,indic_virtl
              ,indic_duplc
              ,lead (indic_virtl) over (order by seqnc desc) proch_indic_virtl
              ,lead (indic_duplc) over (order by seqnc desc) proch_indic_duplc
          from vd_afw_04_fil_arian fa
         where fa.indic_afich = 'O'
      order by seqnc desc;

    vva_lien          varchar2 (150)
                        default    '<a href="f?p=%app_id%'
                                || ':%page%:'
                                || v ('SESSION') --|| '::NO::a_afw_04_seqnc_clic:%seqnc%">%libl%</a>';
                                || '::NO::SIDF,SAPC:'
                                || obten_fa_courn ()
                                || ',XFA%seqnc%">%libl%</a>';

    vva_fil           clob;
    vnu_debut_subst   pls_integer;
    vnu_fin_subst     pls_integer;
    vbo_menu_actif    boolean default false;

    procedure creer_fil_vide (pva_libl in varchar2)
    is
    begin
      vva_fil      :=
           '<li>'
        || pva_libl
        || '</li>'
        || vva_fil;
    end creer_fil_vide;

    procedure creer_fil (pnu_aplic   in number
                        ,pnu_page    in number
                        ,pnu_seqnc   in number
                        ,pva_libl    in varchar2)
    is
    begin
      vva_fil      :=
           '<li>'
        || replace (replace (replace (replace (vva_lien
                                              ,'%page%'
                                              ,pnu_page)
                                     ,'%libl%'
                                     ,pva_libl)
                            ,'%seqnc%'
                            ,pnu_seqnc)
                   ,'%app_id%'
                   ,pnu_aplic)
        || '</li>'
        || vva_fil;
    end creer_fil;

    procedure valdt_ouver_sous_menu (pva_indic_duplc         in varchar2
                                    ,pva_proch_indic_duplc   in varchar2
                                    ,pva_proch_indic_virtl   in varchar2)
    is
    begin
      if     pva_proch_indic_duplc = 'N' --and pva_indic_duplc = 'O'
         and pva_proch_indic_virtl = 'N'
         and vbo_menu_actif
      --and pbo_regrp_menu
      then
        vva_fil          :=
             '<li class="afw-04-fil-arian-dropdown"><div class="afw-04-dropdown-container"">[...]<div class="afw-04-dropdown"><ul>'
          || vva_fil;
        vbo_menu_actif   := false;
      end if;
    end valdt_ouver_sous_menu;

    procedure valdt_fermt_sous_menu (pva_proch_indic_virtl   in varchar2
                                    ,pva_proch_indic_duplc   in varchar2)
    is
    begin
      --Laissons tomber la premiere entree
      if     vva_fil is not null
         and pva_proch_indic_duplc = 'O'
         and pva_proch_indic_virtl = 'N'
         and not vbo_menu_actif
      --and pbo_regrp_menu
      then
        vva_fil          :=
             '</ul></div></div></li>'
          || vva_fil;
        vbo_menu_actif   := true;
      end if;
    end valdt_fermt_sous_menu;
  begin
    if not trait_page ()
    then
      return null;
    end if;

    for rec_fil in cur_fil_arian
    loop
      valdt_fermt_sous_menu (rec_fil.indic_virtl
                            ,rec_fil.indic_duplc);

      if vva_fil is null
      then
        creer_fil_vide (rec_fil.libl);
      else
        creer_fil (rec_fil.app_id
                  ,rec_fil.page
                  ,rec_fil.seqnc
                  ,rec_fil.libl);
      end if;

      valdt_ouver_sous_menu (rec_fil.indic_duplc
                            ,rec_fil.proch_indic_duplc
                            ,rec_fil.proch_indic_virtl);
    end loop;

    --    for rec_fil in cur_fil
    --    loop
    --      if rec_fil.rg = rec_fil.nb
    --      then
    --        vva_fil      :=
    --             vva_fil
    --          || '<li>'
    --          || rec_fil.libl;
    --      else
    --        vva_fil      :=
    --             vva_fil
    --          || '<li>'
    --          || replace (replace (replace (replace (vva_lien
    --                                                ,'%page%'
    --                                                ,rec_fil.page)
    --                                       ,'%libl%'
    --                                       ,rec_fil.libl)
    --                              ,'%seqnc%'
    --                              ,rec_fil.seqnc)
    --                     ,'%app_id%'
    --                     ,rec_fil.app_id)
    --          || '</li>';
    --      end if;
    --    end loop;

    --a replacer dans chacun des entrees du fil ariane (ne foncitonne pas sur clob)
    vva_fil   := apex_application.do_substitutions (vva_fil);
    return    '<ol class="breadcrumb">'
           || vva_fil
           || '</ol>';
  end afich;

  function est_valid_sidf (pbo_postn   in boolean default false
                          ,pnu_fa      in number default null)
    return boolean
  is
    vva_exist_sidf   pls_integer;
    vnu_sidf         number (10) default nvl (pnu_fa, obten_fa_courn ());
    vnu_page         number;
    vbo_valid        boolean default true;
  begin
    if vnu_sidf is not null
    then
      if pbo_postn
      then
        vnu_page   := afw_07_polc_pkg.obten_valr_contx_numr_page;
      end if;

      select 1
        into vva_exist_sidf
        from vd_afw_04_fil_arian fa
       where     fa.seqnc = vnu_sidf
             and (   fa.page = vnu_page
                  or vnu_page is null);

      vbo_valid   := (vva_exist_sidf = 1);
    end if;

    return vbo_valid;
  exception
    when others
    then
      return false;
  end;

  function obten_fa_courn
    return number
  is
  begin
    return afw_07_polc_pkg.obten_valr_contx_sidf;
  end;

  procedure migr_sesn (pnu_ancn_sesn    in number
                      ,pnu_nouvl_sesn   in number)
  is
  begin
    update vd_i_afw_04_fil_arian
       set session_id   = pnu_nouvl_sesn
     where session_id = pnu_ancn_sesn;
  end migr_sesn;

  function obten_url_fa (pnu_seqnc_fa          in vd_afw_04_fil_arian.seqnc%type
                        ,pva_indic_mesg_sucs   in varchar2 default 'N')
    return varchar2
  is
    vre_fa   vd_afw_04_fil_arian%rowtype;
  begin
    select *
      into vre_fa
      from vd_afw_04_fil_arian
     where seqnc = pnu_seqnc_fa;

    return    afw_08_url_pkg.genr_url (pnu_numr_aplic   => vre_fa.app_id
                                      ,pnu_numr_page    => vre_fa.page)
           || case when pva_indic_mesg_sucs = 'O' then '&success_msg=#SUCCESS_MSG#' else null end;
  end obten_url_fa;

  --deprecated

  procedure suprm_elemn_apres_courn
  is
    vnu_fa_courn   number;
  begin
    vnu_fa_courn   := obten_seqnc_fa_de_page_dest (afw_13_page_pkg.obten_numr_apex_page);

    -- Supprimer les éléments du fil d'ariane qui suivent la
    suprm_elemn_apres (vnu_fa_courn);

    -- Synchroniser les variables
    afw_07_util_pkg.defnr_etat_sesn ('SIDF'
                                    ,vnu_fa_courn);
    afw_07_polc_pkg.defnr_contx_sesn_sidf (vnu_fa_courn);
    synch_varbl;
    afw_04_contx_pkg.synch_varbl;
  end suprm_elemn_apres_courn;
begin
  trace_exect ('Exécution du package'
              ,'afw_04_fil_arian_pkg');
end afw_04_fil_arian_pkg;
/
