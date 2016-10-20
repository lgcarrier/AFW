SET DEFINE OFF;
create or replace package body afw_12_reqt_inter_utils_pkg
is
  --kva_prefx_scpi constant varchar2 (30) default 'REQT_';
  knu_duree_inter_vald   constant number default 1;

  function genr_uuid
    return raw
  is
    v_uuid   raw (16);
  begin
    v_uuid   := sys.dbms_crypto.randombytes (16);
    return (utl_raw.overlay (utl_raw.bit_or (utl_raw.bit_and (utl_raw.substr (v_uuid
                                                                             ,7
                                                                             ,1)
                                                             ,'0F')
                                            ,'40')
                            ,v_uuid
                            ,7));
  end genr_uuid;

  function genr_ident
    return raw
  is
  begin
    --    return    sys_guid ()
    --           || genr_uuid ();

    return sys_guid ();
  end genr_ident;

  function obten_reqt_inter_utils (pnu_reqt_inter_utils in vd_i_afw_12_reqt_inter_utils.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils%rowtype
  is
    rec_reqt_inter_utils   vd_i_afw_12_reqt_inter_utils%rowtype;
  begin
    select riu.*
      into rec_reqt_inter_utils
      from vd_i_afw_12_reqt_inter_utils riu
     where riu.seqnc = pnu_reqt_inter_utils;

    return rec_reqt_inter_utils;
  exception
    when no_data_found
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000034'
                                              ,pva_code_prodt   => 'AFW');
  end obten_reqt_inter_utils;

  function obten_reqt_inter_utils_ident (pva_ident in vd_i_afw_12_reqt_inter_utils.ident%type)
    return vd_i_afw_12_reqt_inter_utils%rowtype
  is
    rec_reqt_inter_utils   vd_i_afw_12_reqt_inter_utils%rowtype;
  begin
    select riu.*
      into rec_reqt_inter_utils
      from vd_i_afw_12_reqt_inter_utils riu
     where riu.ident = pva_ident;

    return rec_reqt_inter_utils;
  exception
    when no_data_found
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000034'
                                              ,pva_code_prodt   => 'AFW');
  end obten_reqt_inter_utils_ident;

  function obten_ident (pnu_reqt_inter_utils in vd_i_afw_12_reqt_inter_utils.seqnc%type)
    return varchar2
  is
    vra_ident   vd_i_afw_12_reqt_inter_utils.ident%type;
  begin
    select ident
      into vra_ident
      from vd_i_afw_12_reqt_inter_utils riu
     where riu.seqnc = pnu_reqt_inter_utils;

    return to_char (vra_ident);
  end obten_ident;

  function obten_url_inter (pnu_reqt_inter_utils in vd_i_afw_12_reqt_inter_utils.seqnc%type)
    return varchar2
  is
    vva_base_url           varchar2 (1000);
    rec_reqt_inter_utils   vd_i_afw_12_reqt_inter_utils%rowtype;
    vnu_aplic_authe        vd_i_afw_11_aplic.seqnc%type;
    vnu_url_aplic_cible    number;
    vnu_url_page_cible     number;
  begin
    rec_reqt_inter_utils   := obten_reqt_inter_utils (pnu_reqt_inter_utils);

    begin
      vva_base_url      :=
        afw_11_prodt_pkg.obten_base_url (afw_11_aplic_pkg.obten_prodt (afw_11_aplic_pkg.obten_aplic_numr_apex (rec_reqt_inter_utils.numr_aplic_apex)));
    exception
      when others
      then
        null;
    end;

    vnu_aplic_authe        := afw_11_aplic_pkg.obten_aplic_authe (afw_11_aplic_pkg.obten_aplic_numr_apex (rec_reqt_inter_utils.numr_aplic_apex));

    vnu_url_aplic_cible    := afw_11_aplic_pkg.obten_numr_apex_aplic (vnu_aplic_authe);
    vnu_url_page_cible     := nvl (afw_11_aplic_pkg.obten_numr_apex_page_conxn (vnu_aplic_authe), 101);
    /*
        return vva_base_url
               || afw_08_url_pkg.genr_url (
                    vnu_url_aplic_cible,
                    vnu_url_page_cible,
                    'SSPI',
                    rec_reqt_inter_utils.seqnc,
                    'SCPI',
                    kva_prefx_scpi
                    || afw_14_domn_valr_pkg.obten_code (
                         rec_reqt_inter_utils.ref_dv_type_reqt_inter),
                    'SAPI',
                    to_char (rec_reqt_inter_utils.ident),
                    'SAPC',
                    afw_14_domn_valr_pkg.obten_code (
                      rec_reqt_inter_utils.ref_dv_type_reqt_inter),
                    pva_indic_afich_valr_sesn  => 'N');
              */

    return    vva_base_url
           || afw_08_url_pkg.genr_url (vnu_url_aplic_cible
                                      ,vnu_url_page_cible
                                      ,'SAPC'
                                      ,to_char (rec_reqt_inter_utils.ident)
                                      ,pva_indic_afich_valr_sesn   => 'N');
  end obten_url_inter;

  function obten_url_inter_formt_html (pnu_reqt_inter_utils in vd_i_afw_12_reqt_inter_utils.seqnc%type)
    return varchar2
  is
    rec_reqt_inter_utils       vd_i_afw_12_reqt_inter_utils%rowtype;
    vva_type_reqt_inter_code   varchar2 (30);
  begin
    rec_reqt_inter_utils       := obten_reqt_inter_utils (pnu_reqt_inter_utils);

    vva_type_reqt_inter_code   := afw_14_domn_valr_pkg.obten_code (rec_reqt_inter_utils.ref_dv_type_reqt_inter);

    return    afw_15_htp_pkg.ouvri_bals ('a'
                                        ,'href'
                                        ,obten_url_inter (pnu_reqt_inter_utils))
           || case vva_type_reqt_inter_code
                when 'REINT_MOT_PASSE'
                then
                  afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SEC.000016'
                                                            ,'AFW')
                when 'ACTIV_COMPT_UTILS'
                then
                  afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SEC.000021'
                                                            ,'AFW')
                else
                  'Cliquer ici'
              end
           || afw_15_htp_pkg.fermr_bals ('a');
  end obten_url_inter_formt_html;

  function obten_type_reqt_inter_code (pva_ident in vd_i_afw_12_reqt_inter_utils.ident%type)
    return varchar2
  is
    rec_reqt_inter_utils       vd_i_afw_12_reqt_inter_utils%rowtype;
    vva_type_reqt_inter_code   vd_afw_14_detl_domn_valr.code_valr%type;
    vnu_exist                  pls_integer;
  begin
    rec_reqt_inter_utils       := obten_reqt_inter_utils_ident (pva_ident);

    vva_type_reqt_inter_code   := afw_14_domn_valr_pkg.obten_code (rec_reqt_inter_utils.ref_dv_type_reqt_inter);

    if vva_type_reqt_inter_code is not null
    then
      begin
        select 1
          into vnu_exist
          from vd_i_afw_12_reqt_inter_utils riu
         where     riu.seqnc = rec_reqt_inter_utils.seqnc
               and riu.date_debut_efect <= sysdate
               and (   riu.date_fin_efect is null
                    or riu.date_fin_efect > sysdate)
               and riu.date_trait is null;
      exception
        when no_data_found
        then
          case vva_type_reqt_inter_code
            when 'ACTIV_COMPT_UTILS'
            then
              -- Afficher message d'erreur
              afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000036'
                                                      ,pva_code_prodt   => 'AFW');
            when 'REINT_MOT_PASSE'
            then
              -- Afficher message d'erreur
              afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000039'
                                                      ,pva_code_prodt   => 'AFW');
            else
              afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000017'
                                                      ,pva_code_prodt   => 'AFW');
          end case;
      end;
    end if;

    return vva_type_reqt_inter_code;
  end obten_type_reqt_inter_code;

  function obten_utils_reqt_inter_utils (pva_ident in vd_i_afw_12_reqt_inter_utils.ident%type)
    return vd_i_afw_12_reqt_inter_utils.ref_utils%type
  is
    vnu_utils   vd_i_afw_12_reqt_inter_utils.ref_utils%type;
  begin
    select ref_utils
      into vnu_utils
      from vd_i_afw_12_reqt_inter_utils riu
     where     riu.ident = pva_ident
           and riu.date_debut_efect <= sysdate
           and (   riu.date_fin_efect is null
                or riu.date_fin_efect > sysdate)
           and riu.date_trait is null;

    return vnu_utils;
  exception
    when no_data_found
    then
      --TODO::CARLO
      -- Gérer différent message selon le type de requete
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000017'
                                              ,pva_code_prodt   => 'AFW');
  end obten_utils_reqt_inter_utils;

  function reqt_creat_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                  ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                  ,pnu_numr_aplic_apex_cible   in number
                                  ,pnu_numr_page_apex_cible    in number
                                  ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type
  is
    vnu_duree_inter_vald   number default knu_duree_inter_vald;
    vnu_reqt_inter_utils   vd_i_afw_12_reqt_inter_utils.seqnc%type;
    vva_ident              vd_i_afw_12_reqt_inter_utils.ident%type;
  begin
    vva_ident   := genr_ident ();

    insert into vd_i_afw_12_reqt_inter_utils (ident
                                             ,ref_utils
                                             ,ref_dv_type_reqt_inter
                                             ,date_debut_efect
                                             ,date_fin_efect
                                             ,ref_domn
                                             ,ref_prodt
                                             ,numr_aplic_apex
                                             ,numr_page_apex)
         values (vva_ident
                ,pnu_utils
                ,afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REQT_INTER'
                                                  ,'CREAT_COMPT_UTILS'
                                                  ,'AFW')
                ,sysdate
                ,sysdate + vnu_duree_inter_vald
                ,pnu_domn
                ,pnu_prodt_evenm_notfb
                ,pnu_numr_aplic_apex_cible
                ,pnu_numr_page_apex_cible)
      returning seqnc
           into vnu_reqt_inter_utils;

    return vnu_reqt_inter_utils;
  end reqt_creat_compt_utils;

  function reqt_activ_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                  ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                  ,pnu_numr_aplic_apex_cible   in number
                                  ,pnu_numr_page_apex_cible    in number
                                  ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type
                                  ,pva_procd_persn             in vd_i_afw_12_reqt_inter_utils.procd_persn_url_apres_authe%type default null)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type
  is
    vnu_duree_inter_vald   number default knu_duree_inter_vald;
    vnu_reqt_inter_utils   vd_i_afw_12_reqt_inter_utils.seqnc%type;
    vva_ident              vd_i_afw_12_reqt_inter_utils.ident%type;
  begin
    vva_ident   := genr_ident ();

    insert into vd_i_afw_12_reqt_inter_utils (ident
                                             ,ref_utils
                                             ,ref_dv_type_reqt_inter
                                             ,date_debut_efect
                                             ,date_fin_efect
                                             ,ref_domn
                                             ,ref_prodt
                                             ,numr_aplic_apex
                                             ,numr_page_apex
                                             ,procd_persn_url_apres_authe)
         values (vva_ident
                ,pnu_utils
                ,afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REQT_INTER'
                                                  ,'ACTIV_COMPT_UTILS'
                                                  ,'AFW')
                ,sysdate
                ,sysdate + vnu_duree_inter_vald
                ,pnu_domn
                ,pnu_prodt_evenm_notfb
                ,pnu_numr_aplic_apex_cible
                ,pnu_numr_page_apex_cible
                ,pva_procd_persn)
      returning seqnc
           into vnu_reqt_inter_utils;

    return vnu_reqt_inter_utils;
  exception
    when others
    then
      raise;
  end reqt_activ_compt_utils;

  function reqt_reint_mot_passe (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                ,pnu_numr_aplic_apex_cible   in number
                                ,pnu_numr_page_apex_cible    in number
                                ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type
  is
    vnu_duree_inter_vald   number default knu_duree_inter_vald;
    vnu_reqt_inter_utils   vd_i_afw_12_reqt_inter_utils.seqnc%type;
    vva_ident              vd_i_afw_12_reqt_inter_utils.ident%type;
  begin
    vva_ident   := genr_ident ();

    insert into vd_i_afw_12_reqt_inter_utils (ident
                                             ,ref_utils
                                             ,ref_dv_type_reqt_inter
                                             ,date_debut_efect
                                             ,date_fin_efect
                                             ,ref_domn
                                             ,ref_prodt
                                             ,numr_aplic_apex
                                             ,numr_page_apex)
         values (vva_ident
                ,pnu_utils
                ,afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REQT_INTER'
                                                  ,'REINT_MOT_PASSE'
                                                  ,'AFW')
                ,sysdate
                ,sysdate + vnu_duree_inter_vald
                ,pnu_domn
                ,pnu_prodt_evenm_notfb
                ,pnu_numr_aplic_apex_cible
                ,pnu_numr_page_apex_cible)
      returning seqnc
           into vnu_reqt_inter_utils;

    return vnu_reqt_inter_utils;
  end reqt_reint_mot_passe;

  function reqt_reint_mot_passe_exter (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                      ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                      ,pnu_numr_aplic_apex_cible   in number
                                      ,pnu_numr_page_apex_cible    in number
                                      ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type
  is
    vnu_duree_inter_vald   number default knu_duree_inter_vald;
    vnu_reqt_inter_utils   vd_i_afw_12_reqt_inter_utils.seqnc%type;
    vva_ident              vd_i_afw_12_reqt_inter_utils.ident%type;
  begin
    vva_ident   := genr_ident ();

    insert into vd_i_afw_12_reqt_inter_utils (ident
                                             ,ref_utils
                                             ,ref_dv_type_reqt_inter
                                             ,date_debut_efect
                                             ,date_fin_efect
                                             ,ref_domn
                                             ,ref_prodt
                                             ,numr_aplic_apex
                                             ,numr_page_apex)
         values (vva_ident
                ,pnu_utils
                ,afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REQT_INTER'
                                                  ,'REINT_MOT_PASSE_EXTER'
                                                  ,'AFW')
                ,sysdate
                ,sysdate + vnu_duree_inter_vald
                ,pnu_domn
                ,pnu_prodt_evenm_notfb
                ,pnu_numr_aplic_apex_cible
                ,pnu_numr_page_apex_cible)
      returning seqnc
           into vnu_reqt_inter_utils;

    return vnu_reqt_inter_utils;
  end reqt_reint_mot_passe_exter;

  function reqt_creat_initl_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                        ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                        ,pnu_numr_aplic_apex_cible   in number
                                        ,pnu_numr_page_apex_cible    in number
                                        ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type
  is
    --TODO::CARLO
    -- 30 jours?
    vnu_duree_inter_vald   number default knu_duree_inter_vald;
    vnu_reqt_inter_utils   vd_i_afw_12_reqt_inter_utils.seqnc%type;
    vva_ident              vd_i_afw_12_reqt_inter_utils.ident%type;
  begin
    vva_ident   := genr_ident ();

    insert into vd_i_afw_12_reqt_inter_utils (ident
                                             ,ref_utils
                                             ,ref_dv_type_reqt_inter
                                             ,date_debut_efect
                                             ,date_fin_efect
                                             ,ref_domn
                                             ,ref_prodt
                                             ,numr_aplic_apex
                                             ,numr_page_apex)
         values (vva_ident
                ,pnu_utils
                ,afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REQT_INTER'
                                                  ,'INITL_MOT_PASSE'
                                                  ,'SAFP')
                ,sysdate
                ,sysdate + vnu_duree_inter_vald
                ,pnu_domn
                ,pnu_prodt_evenm_notfb
                ,pnu_numr_aplic_apex_cible
                ,pnu_numr_page_apex_cible)
      returning seqnc
           into vnu_reqt_inter_utils;
  end reqt_creat_initl_compt_utils;

  function reqt_obten_code_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                 ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                 ,pnu_numr_aplic_apex_cible   in number
                                 ,pnu_numr_page_apex_cible    in number
                                 ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type
  is
    vnu_duree_inter_vald   number default knu_duree_inter_vald;
    vnu_reqt_inter_utils   vd_i_afw_12_reqt_inter_utils.seqnc%type;
    vra_ident              vd_i_afw_12_reqt_inter_utils.ident%type;
  begin
    vra_ident   := genr_ident;

    insert into vd_i_afw_12_reqt_inter_utils (ident
                                             ,ref_utils
                                             ,ref_dv_type_reqt_inter
                                             ,date_debut_efect
                                             ,date_fin_efect
                                             ,ref_domn
                                             ,ref_prodt
                                             ,numr_aplic_apex
                                             ,numr_page_apex)
         values (vra_ident
                ,pnu_utils
                ,afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REQT_INTER'
                                                  ,'OBTEN_CODE_UTILS'
                                                  ,'AFW')
                ,sysdate
                ,sysdate + vnu_duree_inter_vald
                ,pnu_domn
                ,pnu_prodt_evenm_notfb
                ,pnu_numr_aplic_apex_cible
                ,pnu_numr_page_apex_cible)
      returning seqnc
           into vnu_reqt_inter_utils;

    return vnu_reqt_inter_utils;
  exception
    when others
    then
      afw_03_journ_pkg.ecrir_journ (sqlerrm
                                   ,'reqt_obten_code_utils');
      raise;
  end reqt_obten_code_utils;

  procedure demnd_reint_mot_passe_oubli (pva_code_utils              in vd_i_afw_12_utils.code_utils%type
                                        ,pva_courl                   in vd_i_afw_12_utils.courl%type
                                        ,pva_code_domn               in vd_i_afw_12_domn.code%type
                                        ,pnu_numr_aplic_apex_cible   in number
                                        ,pnu_numr_page_apex_cible    in number
                                        ,pbo_indic_verl              in boolean default false)
  is
    vnu_utils_de_code       vd_i_afw_12_utils.seqnc%type;
    vnu_utils_de_courl      vd_i_afw_12_utils.seqnc%type;
    vnu_domn                vd_i_afw_12_domn.seqnc%type;
    vnu_prodt_evenm_notfb   vd_i_afw_11_prodt.seqnc%type;
    vnu_reqt_inter_utils    vd_i_afw_12_reqt_inter_utils.seqnc%type;
    rec_utils               vd_i_afw_12_utils%rowtype;
  begin
    vnu_utils_de_code       := afw_12_utils_pkg.obten_utils_de_code (pva_code_utils);
    vnu_utils_de_courl      := afw_12_utils_pkg.obten_utils_de_courl (pva_courl);

    vnu_domn                := afw_12_domn_pkg.obten_seqnc_domn (pva_code_domn);
    vnu_prodt_evenm_notfb   := afw_11_prodt_pkg.obten_prodt ('AFW');

    if    vnu_domn is null
       or vnu_utils_de_code is null
       or vnu_utils_de_courl is null
       or vnu_utils_de_code <> vnu_utils_de_courl
    then
      -- Afficher un message disant que le compte ne peut être identifié
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000013'
                                              ,pva_code_prodt   => 'AFW');
    else
      rec_utils   := afw_12_utils_pkg.obten_utils (vnu_utils_de_code);

      if     rec_utils.date_expir is not null
         and rec_utils.date_expir <= sysdate
      then
        -- Afficher un message disant que le compte est expiré
        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000005'
                                                ,pva_code_prodt   => 'AFW');
      elsif rec_utils.indic_verl = 'O'
      then
        -- Afficher un message disant que le compte est vérouillé
        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000002'
                                                ,pva_code_prodt   => 'AFW');
      else
        if     afw_12_domn_pkg.obten_procd_authe_exter_afw (vnu_domn) is not null
           and rec_utils.mot_passe is null
        then
          -- Authentification externe (ex.: LDAP)
          vnu_reqt_inter_utils      :=
            reqt_reint_mot_passe_exter (vnu_utils_de_code
                                       ,vnu_domn
                                       ,pnu_numr_aplic_apex_cible
                                       ,pnu_numr_page_apex_cible
                                       ,vnu_prodt_evenm_notfb);

          afw_01_evenm_notfb_cu_pkg.propg_evenm_notfb ('REINT_MOT_PASSE_EXTER'
                                                      ,vnu_reqt_inter_utils
                                                      ,'AFW'
                                                      ,pva_code_domn);
        else
          -- Authentification AFW
          vnu_reqt_inter_utils      :=
            reqt_reint_mot_passe (vnu_utils_de_code
                                 ,vnu_domn
                                 ,pnu_numr_aplic_apex_cible
                                 ,pnu_numr_page_apex_cible
                                 ,vnu_prodt_evenm_notfb);

          afw_01_evenm_notfb_cu_pkg.propg_evenm_notfb ('REINT_MOT_PASSE'
                                                      ,vnu_reqt_inter_utils
                                                      ,'AFW'
                                                      ,pva_code_domn);
        end if;

        -- Vérouiller le compte utilisateur
        if pbo_indic_verl
        then
          afw_12_utils_pkg.verlr_utils (vnu_utils_de_code);
        end if;

        -- Afficher un message disant qu'un courriel sera envoyé
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SEC.000014'
                                                       ,pva_code_prodt   => 'AFW');
      end if;
    end if;
  end demnd_reint_mot_passe_oubli;

  procedure demnd_reint_mot_passe_oubli (pva_courl                   in vd_i_afw_12_utils.courl%type
                                        ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                        ,pnu_numr_aplic_apex_cible   in number
                                        ,pnu_numr_page_apex_cible    in number
                                        ,pbo_indic_verl              in boolean default false)
  is
    vnu_utils               vd_i_afw_12_utils.seqnc%type;
    vnu_prodt_evenm_notfb   vd_i_afw_11_prodt.seqnc%type;
    vnu_reqt_inter_utils    vd_i_afw_12_reqt_inter_utils.seqnc%type;
    rec_utils               vd_i_afw_12_utils%rowtype;
  begin
    vnu_utils               := afw_12_utils_pkg.obten_utils_de_courl (pva_courl);

    vnu_prodt_evenm_notfb   := afw_11_prodt_pkg.obten_prodt ('AFW');

    if    pnu_domn is null
       or vnu_utils is null
    then
      -- Afficher un message disant que le compte ne peut être identifié
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000013'
                                              ,pva_code_prodt   => 'AFW');
    else
      rec_utils   := afw_12_utils_pkg.obten_utils (vnu_utils);

      if     rec_utils.date_expir is not null
         and rec_utils.date_expir <= sysdate
      then
        -- Afficher un message disant que le compte est expiré
        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000005'
                                                ,pva_code_prodt   => 'AFW');
      elsif rec_utils.indic_verl = 'O'
      then
        -- Afficher un message disant que le compte est vérouillé
        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000002'
                                                ,pva_code_prodt   => 'AFW');
      else
        if     afw_12_domn_pkg.obten_procd_authe_exter_afw (pnu_domn) is not null
           and rec_utils.mot_passe is null
        then
          -- Authentification externe (ex.: LDAP)
          vnu_reqt_inter_utils      :=
            reqt_reint_mot_passe_exter (vnu_utils
                                       ,pnu_domn
                                       ,pnu_numr_aplic_apex_cible
                                       ,pnu_numr_page_apex_cible
                                       ,vnu_prodt_evenm_notfb);

          afw_01_evenm_notfb_cu_pkg.propg_evenm_notfb ('REINT_MOT_PASSE_EXTER'
                                                      ,vnu_reqt_inter_utils
                                                      ,'AFW'
                                                      ,afw_12_domn_pkg.obten_code_domn (pnu_domn)
                                                      ,pnu_lang   => afw_11_prodt_pkg.obten_lang_deft);
        else
          -- Authentification AFW
          vnu_reqt_inter_utils      :=
            reqt_reint_mot_passe (vnu_utils
                                 ,pnu_domn
                                 ,pnu_numr_aplic_apex_cible
                                 ,pnu_numr_page_apex_cible
                                 ,vnu_prodt_evenm_notfb);

          afw_01_evenm_notfb_cu_pkg.propg_evenm_notfb ('REINT_MOT_PASSE'
                                                      ,vnu_reqt_inter_utils
                                                      ,'AFW'
                                                      ,afw_12_domn_pkg.obten_code_domn (pnu_domn)
                                                      ,pnu_lang   => afw_11_prodt_pkg.obten_lang_deft);
        end if;

        -- Afficher un message disant qu'un courriel sera envoyé
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SEC.000014'
                                                       ,pva_code_prodt   => 'AFW');
      end if;
    end if;
  end demnd_reint_mot_passe_oubli;

  procedure demnd_code_utils_oubli (pva_courl                   in vd_i_afw_12_utils.courl%type
                                   ,pva_code_domn               in vd_i_afw_12_domn.code%type
                                   ,pnu_numr_aplic_apex_cible   in number
                                   ,pnu_numr_page_apex_cible    in number
                                   ,pbo_indic_verl              in boolean default false)
  is
    vnu_utils_de_courl      vd_i_afw_12_utils.seqnc%type;
    vnu_domn                vd_i_afw_12_domn.seqnc%type;
    vnu_prodt_evenm_notfb   vd_i_afw_11_prodt.seqnc%type;
    vnu_reqt_inter_utils    vd_i_afw_12_reqt_inter_utils.seqnc%type;
    rec_utils               vd_i_afw_12_utils%rowtype;
  begin
    vnu_utils_de_courl      := afw_12_utils_pkg.obten_utils_de_courl (pva_courl);
    vnu_domn                := afw_12_domn_pkg.obten_seqnc_domn (pva_code_domn);
    vnu_prodt_evenm_notfb   := afw_11_prodt_pkg.obten_prodt ('AFW');

    if    vnu_prodt_evenm_notfb is null
       or vnu_domn is null
       or vnu_utils_de_courl is null
    then
      -- Afficher ERREUR: le compte ne peut être identifié
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000013'
                                              ,pva_code_prodt   => 'AFW');
    else
      rec_utils   := afw_12_utils_pkg.obten_utils (vnu_utils_de_courl);

      if     rec_utils.date_expir is not null
         and rec_utils.date_expir <= sysdate
      then
        -- Afficher ERREUR: le compte est expiré
        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000005'
                                                ,pva_code_prodt   => 'AFW');
      elsif rec_utils.indic_verl = 'O'
      then
        -- Afficher ERREUR:  le compte est vérouillé
        afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000002'
                                                ,pva_code_prodt   => 'AFW');
      else
        -- Executer la requête d'intervention
        vnu_reqt_inter_utils      :=
          reqt_obten_code_utils (vnu_utils_de_courl
                                ,vnu_domn
                                ,pnu_numr_aplic_apex_cible
                                ,pnu_numr_page_apex_cible
                                ,vnu_prodt_evenm_notfb);


        afw_01_evenm_notfb_cu_pkg.propg_evenm_notfb ('OBTEN_CODE_UTILS'
                                                    ,vnu_reqt_inter_utils
                                                    ,'AFW'
                                                    ,pva_code_domn);

        -- On peut vérouiller le compte
        if pbo_indic_verl
        then
          -- Vérouiller le compte utilisateur
          afw_12_utils_pkg.verlr_utils (vnu_utils_de_courl);
        end if;

        -- Afficher : SUCCES MESSAGE
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SEC.000014'
                                                       ,pva_code_prodt   => 'AFW');
      end if;
    end if;
  exception
    when others
    then
      afw_03_journ_pkg.ecrir_journ (sqlerrm
                                   ,'demnd_code_utils_oubli');
      raise;
  end demnd_code_utils_oubli;

  procedure demnd_activ_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                    ,pnu_numr_aplic_apex_cible   in number
                                    ,pnu_numr_page_apex_cible    in number
                                    ,pbo_indic_desct             in boolean default false
                                    ,pva_procd_persn             in vd_i_afw_12_reqt_inter_utils.procd_persn_url_apres_authe%type default null)
  is
    vnu_prodt_evenm_notfb   vd_i_afw_11_prodt.seqnc%type;
    vnu_reqt_inter_utils    vd_i_afw_12_reqt_inter_utils.seqnc%type;
  begin
    vnu_prodt_evenm_notfb   := afw_11_prodt_pkg.obten_prodt ('AFW');

    if    pnu_domn is null
       or pnu_utils is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000013'
                                              ,pva_code_prodt   => 'AFW');
    else
      vnu_reqt_inter_utils      :=
        reqt_activ_compt_utils (pnu_utils
                               ,pnu_domn
                               ,pnu_numr_aplic_apex_cible
                               ,pnu_numr_page_apex_cible
                               ,vnu_prodt_evenm_notfb
                               ,pva_procd_persn);

      afw_01_evenm_notfb_cu_pkg.propg_evenm_notfb ('ACTIV_COMPT_UTILS'
                                                  ,vnu_reqt_inter_utils
                                                  ,'AFW'
                                                  ,afw_12_domn_pkg.obten_code_domn (pnu_domn)
                                                  ,pnu_lang   => afw_11_prodt_pkg.obten_lang_deft);

      if pbo_indic_desct
      then
        afw_12_utils_pkg.desct_utils (pnu_utils);
      end if;
    end if;
  end demnd_activ_compt_utils;

  procedure infor_creat_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                    ,pnu_numr_aplic_apex_cible   in number
                                    ,pnu_numr_page_apex_cible    in number
                                    ,pbo_indic_activ_utils       in boolean default true)
  is
    vnu_prodt_evenm_notfb   vd_i_afw_11_prodt.seqnc%type;
    vnu_reqt_inter_utils    vd_i_afw_12_reqt_inter_utils.seqnc%type;
  begin
    vnu_prodt_evenm_notfb   := afw_11_prodt_pkg.obten_prodt ('AFW');

    if    pnu_domn is null
       or pnu_utils is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000013'
                                              ,pva_code_prodt   => 'AFW');
    else
      vnu_reqt_inter_utils      :=
        reqt_creat_compt_utils (pnu_utils
                               ,pnu_domn
                               ,pnu_numr_aplic_apex_cible
                               ,pnu_numr_page_apex_cible
                               ,vnu_prodt_evenm_notfb);

      afw_01_evenm_notfb_cu_pkg.propg_evenm_notfb ('CREAT_COMPT_UTILS'
                                                  ,vnu_reqt_inter_utils
                                                  ,'AFW'
                                                  ,afw_12_domn_pkg.obten_code_domn (pnu_domn));

      if pbo_indic_activ_utils
      then
        afw_12_utils_pkg.activ_utils (pnu_utils);
      end if;
    end if;
  end infor_creat_compt_utils;

  procedure infor_creat_initl_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                          ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                          ,pnu_numr_aplic_apex_cible   in number
                                          ,pnu_numr_page_apex_cible    in number
                                          ,pbo_indic_activ_utils       in boolean default true)
  is
    vnu_prodt_evenm_notfb   vd_i_afw_11_prodt.seqnc%type;
    vnu_reqt_inter_utils    vd_i_afw_12_reqt_inter_utils.seqnc%type;
  begin
    vnu_prodt_evenm_notfb   := afw_11_prodt_pkg.obten_prodt ('AFW');

    if    pnu_domn is null
       or pnu_utils is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000013'
                                              ,pva_code_prodt   => 'AFW');
    else
      vnu_reqt_inter_utils      :=
        reqt_creat_compt_utils (pnu_utils
                               ,pnu_domn
                               ,pnu_numr_aplic_apex_cible
                               ,pnu_numr_page_apex_cible
                               ,vnu_prodt_evenm_notfb);

      afw_01_evenm_notfb_cu_pkg.propg_evenm_notfb ('CREAT_INITL_COMPT_UTILS'
                                                  ,vnu_reqt_inter_utils
                                                  ,'AFW'
                                                  ,afw_12_domn_pkg.obten_code_domn (pnu_domn));

      if pbo_indic_activ_utils
      then
        afw_12_utils_pkg.activ_utils (pnu_utils);
      end if;
    end if;
  end infor_creat_initl_compt_utils;

  procedure trait_reqt_inter_utils (pva_ident vd_i_afw_12_reqt_inter_utils.ident%type)
  is
  begin
    update vd_i_afw_12_reqt_inter_utils riu
       set riu.date_trait   = sysdate
     where     riu.ident = pva_ident
           and riu.date_debut_efect <= sysdate
           and (   riu.date_fin_efect is null
                or riu.date_fin_efect > sysdate)
           and riu.date_trait is null;
  end trait_reqt_inter_utils;

  procedure defnr_aplic_authe_redrc_cible (pva_ident vd_i_afw_12_reqt_inter_utils.ident%type)
  is
    vnu_numr_aplic_apex   vd_i_afw_12_reqt_inter_utils.numr_aplic_apex%type;
    vnu_numr_page_apex    vd_i_afw_12_reqt_inter_utils.numr_page_apex%type;
    vva_procd_persn       vd_i_afw_12_reqt_inter_utils.procd_persn_url_apres_authe%type;
  begin
    select numr_aplic_apex
          ,numr_page_apex
          ,procd_persn_url_apres_authe
      into vnu_numr_aplic_apex
          ,vnu_numr_page_apex
          ,vva_procd_persn
      from vd_i_afw_12_reqt_inter_utils riu
     where riu.ident = pva_ident;

    afw_12_authe_apex_pkg.defnr_authe_redrc_cible (vnu_numr_aplic_apex
                                                  ,vnu_numr_page_apex);

    if vva_procd_persn is not null
    then
      afw_12_authe_apex_pkg.defnr_procd_persn (vva_procd_persn);
    end if;
  end defnr_aplic_authe_redrc_cible;

  procedure trait_reqt_activ_compt_utils (pva_ident vd_i_afw_12_reqt_inter_utils.ident%type)
  is
    vnu_utils   vd_i_afw_12_reqt_inter_utils.ref_utils%type;
  begin
    vnu_utils   := obten_utils_reqt_inter_utils (pva_ident);

    afw_12_authe_apex_pkg.activ_utils (vnu_utils);

    trait_reqt_inter_utils (pva_ident);
  exception
    when others
    then
      -- Afficher message d'erreur
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000036'
                                              ,pva_code_prodt   => 'AFW');
  end trait_reqt_activ_compt_utils;

  procedure trait_reqt_reint_mot_passe (pva_ident             in vd_i_afw_12_reqt_inter_utils.ident%type
                                       ,pva_mot_passe         in varchar2
                                       ,pva_confr_mot_passe   in varchar2)
  is
    vnu_utils              vd_i_afw_12_reqt_inter_utils.ref_utils%type;
    rec_reqt_inter_utils   vd_i_afw_12_reqt_inter_utils%rowtype;
  begin
    vnu_utils              := obten_utils_reqt_inter_utils (pva_ident);

    rec_reqt_inter_utils   := obten_reqt_inter_utils_ident (pva_ident);

    afw_12_authe_apex_pkg.reint_mot_passe (vnu_utils
                                          ,pva_mot_passe
                                          ,pva_confr_mot_passe
                                          ,rec_reqt_inter_utils.ref_domn);

    --TODO::LGCARRIER
    -- p-e envoyer un courriel pour avertir du changement de mot de passe

    trait_reqt_inter_utils (pva_ident);
  end trait_reqt_reint_mot_passe;
end afw_12_reqt_inter_utils_pkg;
/
