SET DEFINE OFF;
create or replace package body afw_11_insta_afw_pkg
as
  --Exceptions
  gex_page_globl_non_trouv            exception;
  gex_page_conxn_non_trouv            exception;

  gnu_secrt_group_id                  apex_aplic.security_group_id%type;
  gnu_numr_apex_modl                  vd_i_afw_11_aplic.numr_aplic_apex%type; --À definir plus tard
  gnu_regn_item_cache_id              number;
  gnu_authe_afw_id                    number;

  --Constantes pour schema
  kva_schem_apex             constant varchar2 (30) default 'apex_050000';
  kva_code_aplic_modl        constant vd_i_afw_11_aplic.code%type default 'SAFP';
  knu_page_globl             constant number default 0;
  knu_page_conxn             constant number default 101;
  kva_mesg_afw_insta         constant varchar2 (50) default 'AFW deja installe.';
  kva_mesg_afw_non_insta     constant varchar2 (50) default 'AFW non installe.';
  kva_mesg_afw_insta_termn   constant varchar2 (50) default 'Installation AFW termine.';
  kva_chain_item_aplic       constant varchar2 (4000)
    default 'A_AFW_04_ACTIO:A_AFW_04_AUTOR_DUPLQ_PAGE:A_AFW_04_CONTX:A_AFW_04_CONTX_FORMT:A_AFW_04_SEQNC_CONTX:A_AFW_04_SOURC_ACTIO:A_AFW_04_SOURC_CONTX:A_AFW_04_SOURC_CONTX_FORMT:A_AFW_04_SOURC_NUMR_APLIC:A_AFW_04_SOURC_NUMR_PAGE:A_AFW_04_SOURC_SEQNC_CONTX:A_AFW_04_SOURC_URL:A_AFW_04_SUPRM_FIL_COURN:A_AFW_04_SUR_SOUMS:A_AFW_11_ACRON_PRODT:A_AFW_11_ACRON_APLIC:A_AFW_11_NOM_PRODT:A_AFW_11_NOM_APLIC:A_AFW_11_DEPLC_RANGE_RAPRT:A_AFW_11_DOSR_FICHR:A_AFW_11_DOSR_FICHR_AFW:A_AFW_11_ENVIR:A_AFW_11_JQUER_UI_CSS_SCOPE:A_AFW_11_MESG_SUPRS:A_AFW_11_MESG_TOUT_DROIT_RESRV:A_AFW_11_NUMR_VERSN_PRODT:A_AFW_11_NUMR_VERSN_PRODT_AFW:A_AFW_11_TEMPL_CUSTM:A_AFW_11_TEMPL_ECHO_CUSTM:A_AFW_11_TEMPL_JAVSC_CORE_1:A_AFW_11_TEMPL_JAVSC_CORE_2:A_AFW_11_TEMPL_JAVSC_JQUER:A_AFW_11_TEMPL_THEME_JQUER_UI:A_AFW_11_TRAIT_MESGS_ERR:A_AFW_11_URL_ACUEI:A_AFW_11_URL_AUTHE_CIBLE:A_AFW_11_VERSN_PRODT:A_AFW_12_UTILS:A_AFW_12_UTILS_CODE:A_AFW_12_UTILS_NOM_FORMT:A_AFW_13_LIEN_EDITN_RAPRT:A_AFW_13_MESG_AUCUN_DON_TROUV:A_AFW_13_MESG_ECHEC_SPECF:A_AFW_13_MESG_IMPOS_FETCH:A_AFW_13_MESG_RANGE_INSER:A_AFW_13_MESG_RANGE_MODF:A_AFW_13_MESG_RANGE_SUPRM:A_AFW_13_MESG_SUCS_SPECF:A_AFW_13_MESG_TROP_DON_TROUV:A_AFW_13_MESG_CONFR_SUPRS:A_AFW_13_MODE_RECHR:A_AFW_13_PAGE_META:A_AFW_13_PAGE_TITRE:A_AFW_13_PAGNT_NAVGT:A_AFW_14_POPUP_LOV_IR:A_AFW_14_POPUP_LOV_IR_RETR:A_AFW_25_URL_RAPRT' ;

  function afw_deja_insta (pnu_numr_apex in number)
    return boolean
  is
    vnu_exist   number (1) default 0;
  begin
    select 1
      into vnu_exist
      from dual
     where exists
             (select 1
                from apex_item_aplic aia
               where     aia.flow_id = pnu_numr_apex
                     and instr (   ':'
                                || kva_chain_item_aplic
                                || ':'
                               ,   ':'
                                || upper (aia.name)
                                || ':') > 0);

    return vnu_exist = 1;
  exception
    when no_data_found
    then
      return false;
  end afw_deja_insta;

  procedure verfr_afw_insta (pnu_numr_apex in number)
  is
  begin
    if not afw_deja_insta (pnu_numr_apex)
    then
      ete (kva_mesg_afw_non_insta);
    else
      ete (kva_mesg_afw_insta);
    end if;
  end verfr_afw_insta;

  function verfr_page_globl (pnu_numr_apex in number)
    return boolean
  is
    vnu_nombr   pls_integer;
  begin
    select 1
      into vnu_nombr
      from apex_050000.wwv_flow_steps fs
     where     fs.flow_id = pnu_numr_apex
           and fs.page_component_map = '14';

    --Pourrait définir une variable globale pour avoir la bonne ID de page globl

    return vnu_nombr = 1;
  exception
    when others
    then
      return false;
  end verfr_page_globl;

  function verfr_page_conxn (pnu_numr_apex in number)
    return boolean
  is
    vnu_nombr   pls_integer;
  begin
    select 1
      into vnu_nombr
      from apex_050000.wwv_flow_steps fs
     where     fs.flow_id = pnu_numr_apex
           and fs.page_component_map = '12';

    --Pourrait définir une variable globale pour avoir la bonne ID de page globl

    return vnu_nombr = 1;
  exception
    when others
    then
      return false;
  end verfr_page_conxn;

  procedure defnr_secrt_group_id (pnu_numr_apex in number)
  is
  begin
    gnu_secrt_group_id                                  := afw_11_aplic_pkg.obten_secrt_group_id (afw_11_aplic_pkg.obten_aplic (pnu_numr_apex));

    apex_050000.wwv_flow_security.g_security_group_id   := gnu_secrt_group_id;

    apex_050000.wwv_flow_api.set_security_group_id (gnu_secrt_group_id);
  exception
    when no_data_found
    then
      ete ();
      raise;
  end defnr_secrt_group_id;

  procedure defnr_numr_apex_modl
  is
  begin
    null; --Éventuellement,savoir à partir de quelle application il faut copier les objets
  end defnr_numr_apex_modl;

  function item_aplic_exist (pnu_numr_apex   in number
                            ,pva_nom_item    in varchar2)
    return boolean
  is
    vnu_exist   pls_integer;
  begin
    select 1
      into vnu_exist
      from apex_item_aplic aia
     where     aia.flow_id = pnu_numr_apex
           and aia.name = pva_nom_item
           and rownum = 1;

    return true;
  exception
    when no_data_found
    then
      return false;
  end item_aplic_exist;

  procedure creer_item_aplic (pnu_numr_apex in number)
  is
  begin
    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_ACTIO'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_AUTOR_DUPLQ_PAGE'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_CONTX'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_CONTX_FORMT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_SEQNC_CONTX'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_SOURC_ACTIO'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_SOURC_CONTX'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_SOURC_CONTX_FORMT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_SOURC_NUMR_APLIC'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_SOURC_NUMR_PAGE'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_SOURC_SEQNC_CONTX'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_SOURC_URL'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_SUPRM_FIL_COURN'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_04_SUR_SOUMS'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_ACRON_PRODT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_ACRON_APLIC'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_NOM_PRODT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_NOM_APLIC'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_DEPLC_RANGE_RAPRT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_DOSR_FICHR'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_DOSR_FICHR_AFW'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_ENVIR'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_JQUER_UI_CSS_SCOPE'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_MESG_SUPRS'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_MESG_TOUT_DROIT_RESRV'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_NUMR_VERSN_PRODT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_NUMR_VERSN_PRODT_AFW'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_TEMPL_CUSTM'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_TEMPL_ECHO_CUSTM'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_TEMPL_JAVSC_CORE_1'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_TEMPL_JAVSC_CORE_2'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_TEMPL_JAVSC_JQUER'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_TEMPL_THEME_JQUER_UI'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_TRAIT_MESGS_ERR'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_URL_ACUEI'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_URL_AUTHE_CIBLE'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_11_VERSN_PRODT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_12_UTILS'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_12_UTILS_CODE'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_12_UTILS_NOM_FORMT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_LIEN_EDITN_RAPRT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_MESG_AUCUN_DON_TROUV'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_MESG_ECHEC_SPECF'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_MESG_IMPOS_FETCH'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_MESG_RANGE_INSER'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_MESG_RANGE_MODF'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_MESG_RANGE_SUPRM'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_MESG_SUCS_SPECF'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_MESG_TROP_DON_TROUV'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_MESG_CONFR_SUPRS'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_MODE_RECHR'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_PAGE_META'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_PAGE_TITRE'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_13_PAGNT_NAVGT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_14_POPUP_LOV_IR'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_14_POPUP_LOV_IR_RETR'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    insert into apex_item_aplic (flow_id
                                ,name
                                ,data_type
                                ,is_persistent
                                ,protection_level)
         values (pnu_numr_apex
                ,'A_AFW_25_URL_RAPRT'
                ,'VARCHAR'
                ,'Y'
                ,'I');

    if not item_aplic_exist (pnu_numr_apex
                            ,'FSP_LANGUAGE_PREFERENCE')
    then
      insert into apex_item_aplic (flow_id
                                  ,name
                                  ,data_type
                                  ,is_persistent
                                  ,protection_level)
           values (pnu_numr_apex
                  ,'FSP_LANGUAGE_PREFERENCE'
                  ,'VARCHAR'
                  ,'Y'
                  ,'I');
    end if;

    if not item_aplic_exist (pnu_numr_apex
                            ,'FSP_AFTER_LOGIN_URL')
    then
      insert into apex_item_aplic (flow_id
                                  ,name
                                  ,data_type
                                  ,is_persistent
                                  ,protection_level)
           values (pnu_numr_apex
                  ,'FSP_AFTER_LOGIN_URL'
                  ,'VARCHAR'
                  ,'Y'
                  ,'N');
    end if;
  exception
    when others
    then
      ete ();
      raise;
  end creer_item_aplic;

  procedure creer_item_page_zero (pnu_numr_apex in number)
  is
  begin
    insert into apex_item_page (flow_id
                               ,flow_step_id
                               ,name
                               ,is_required
                               ,item_sequence
                               ,item_plug_id
                               ,use_cache_before_default
                               ,item_default_type
                               ,source_type
                               ,display_as
                               ,encrypt_session_state_yn
                               ,protection_level)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'SIDF'
                ,'N'
                ,10
                ,gnu_regn_item_cache_id
                ,'YES'
                ,'STATIC_TEXT_WITH_SUBSTITUTIONS'
                ,'STATIC'
                ,'NATIVE_HIDDEN'
                ,'N'
                ,'N');

    insert into apex_item_page (flow_id
                               ,flow_step_id
                               ,name
                               ,is_required
                               ,item_sequence
                               ,item_plug_id
                               ,use_cache_before_default
                               ,item_default_type
                               ,source_type
                               ,display_as
                               ,encrypt_session_state_yn
                               ,protection_level)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'SSPC'
                ,'N'
                ,30
                ,gnu_regn_item_cache_id
                ,'YES'
                ,'STATIC_TEXT_WITH_SUBSTITUTIONS'
                ,'STATIC'
                ,'NATIVE_HIDDEN'
                ,'N'
                ,'N');

    insert into apex_item_page (flow_id
                               ,flow_step_id
                               ,name
                               ,is_required
                               ,item_sequence
                               ,item_plug_id
                               ,use_cache_before_default
                               ,item_default_type
                               ,source_type
                               ,display_as
                               ,encrypt_session_state_yn
                               ,protection_level)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'SCPC'
                ,'N'
                ,20
                ,gnu_regn_item_cache_id
                ,'YES'
                ,'STATIC_TEXT_WITH_SUBSTITUTIONS'
                ,'STATIC'
                ,'NATIVE_HIDDEN'
                ,'N'
                ,'N');

    insert into apex_item_page (flow_id
                               ,flow_step_id
                               ,name
                               ,is_required
                               ,item_sequence
                               ,item_plug_id
                               ,use_cache_before_default
                               ,item_default_type
                               ,source_type
                               ,display_as
                               ,encrypt_session_state_yn
                               ,protection_level)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'SAPC'
                ,'N'
                ,40
                ,gnu_regn_item_cache_id
                ,'YES'
                ,'STATIC_TEXT_WITH_SUBSTITUTIONS'
                ,'STATIC'
                ,'NATIVE_HIDDEN'
                ,'N'
                ,'N');

    insert into apex_item_page (flow_id
                               ,flow_step_id
                               ,name
                               ,is_required
                               ,item_sequence
                               ,item_plug_id
                               ,use_cache_before_default
                               ,item_default_type
                               ,source_type
                               ,display_as
                               ,encrypt_session_state_yn
                               ,protection_level)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'SNPI'
                ,'N'
                ,80
                ,gnu_regn_item_cache_id
                ,'YES'
                ,'STATIC_TEXT_WITH_SUBSTITUTIONS'
                ,'STATIC'
                ,'NATIVE_HIDDEN'
                ,'N'
                ,'N');

    insert into apex_item_page (flow_id
                               ,flow_step_id
                               ,name
                               ,is_required
                               ,item_sequence
                               ,item_plug_id
                               ,use_cache_before_default
                               ,item_default_type
                               ,source_type
                               ,display_as
                               ,encrypt_session_state_yn
                               ,protection_level)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'SCPI'
                ,'N'
                ,50
                ,gnu_regn_item_cache_id
                ,'YES'
                ,'STATIC_TEXT_WITH_SUBSTITUTIONS'
                ,'STATIC'
                ,'NATIVE_HIDDEN'
                ,'N'
                ,'N');

    insert into apex_item_page (flow_id
                               ,flow_step_id
                               ,name
                               ,is_required
                               ,item_sequence
                               ,item_plug_id
                               ,use_cache_before_default
                               ,item_default_type
                               ,source_type
                               ,display_as
                               ,encrypt_session_state_yn
                               ,protection_level)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'SSPI'
                ,'N'
                ,60
                ,gnu_regn_item_cache_id
                ,'YES'
                ,'STATIC_TEXT_WITH_SUBSTITUTIONS'
                ,'STATIC'
                ,'NATIVE_HIDDEN'
                ,'N'
                ,'N');

    insert into apex_item_page (flow_id
                               ,flow_step_id
                               ,name
                               ,is_required
                               ,item_sequence
                               ,item_plug_id
                               ,use_cache_before_default
                               ,item_default_type
                               ,source_type
                               ,display_as
                               ,encrypt_session_state_yn
                               ,protection_level)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'SAPI'
                ,'N'
                ,70
                ,gnu_regn_item_cache_id
                ,'YES'
                ,'STATIC_TEXT_WITH_SUBSTITUTIONS'
                ,'STATIC'
                ,'NATIVE_HIDDEN'
                ,'N'
                ,'N');

    insert into apex_item_page (flow_id
                               ,flow_step_id
                               ,name
                               ,is_required
                               ,item_sequence
                               ,item_plug_id
                               ,use_cache_before_default
                               ,item_default_type
                               ,source_type
                               ,display_as
                               ,encrypt_session_state_yn
                               ,protection_level)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'SADA'
                ,'N'
                ,90
                ,gnu_regn_item_cache_id
                ,'YES'
                ,'STATIC_TEXT_WITH_SUBSTITUTIONS'
                ,'STATIC'
                ,'NATIVE_HIDDEN'
                ,'N'
                ,'N');
  exception
    when others
    then
      ete ();
      raise;
  end creer_item_page_zero;


  procedure creer_regn_page_zero (pnu_numr_apex in number)
  is
  begin
    insert into apex_regn (flow_id
                          ,page_id
                          ,plug_name
                          ,plug_template
                          ,plug_display_sequence
                          ,plug_display_column
                          ,plug_display_point
                          ,plug_caching
                          ,escape_on_http_output
                          ,plug_query_row_template
                          ,plug_query_headings_type
                          ,plug_query_num_rows_type
                          ,pagination_display_position
                          ,plug_query_row_count_max
                          ,plug_query_show_nulls_as
                          ,include_in_reg_disp_sel_yn
                          ,plug_customized
                          ,translate_title)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'AFW - items cachés'
                ,0
                ,10
                ,1
                ,'BEFORE_FOOTER'
                ,'NOCACHE'
                ,'Y'
                ,1
                ,'QUERY_COLUMNS'
                ,'NEXT_PREVIOUS_LINKS'
                ,'BOTTOM_RIGHT'
                ,500
                ,' - '
                ,'N'
                ,0
                ,'Y')
      returning id
           into gnu_regn_item_cache_id;
  exception
    when others
    then
      ete ();
      raise;
  end creer_regn_page_zero;

  procedure creer_procs (pnu_numr_apex in number)
  is
  begin
    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1
                                                 ,p_process_point            => 'ON_DEMAND'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 04 - Autoriser la duplication de la page dans le fil d''Ariane'
                                                 ,p_process_sql_clob         => ':A_AFW_04_AUTOR_DUPLQ_PAGE := ''O'';'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1
                                                 ,p_process_point            => 'ON_DEMAND'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 -  Tout lecture seule'
                                                 ,p_process_sql_clob         => 'afw_13_condt_piltb_pkg.lectr_seule_tout;'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1
                                                 ,p_process_point            => 'ON_DEMAND'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Cacher tous les boutons'
                                                 ,p_process_sql_clob         => 'afw_13_condt_piltb_pkg.cachr_tous_boutn;'
                                                 ,p_process_error_message    => '#SQLERRM#'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1
                                                 ,p_process_point            => 'ON_DEMAND'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Gérer touches haut/bas'
                                                 ,p_process_sql_clob         => 'htp.p('' < script type="text/javascript">
apex.jQuery(document).keydown(checkUpDownKey);
</script>'');'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1
                                                 ,p_process_point            => 'ON_DEMAND'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 04 - Réinitialiser la séquence'
                                                 ,p_process_sql_clob         => 'declare
  vnu_page           number default afw_07_util_pkg.nv (''APP_PAGE_ID'');
  vvc_nom_item_seqnc varchar2 (30) default ''P'' || to_char (vnu_page) || ''_SEQNC'';
begin
  if afw_07_util_pkg.exist_item (vvc_nom_item_seqnc) then
    afw_07_util_pkg.defnr_etat_sessn (vvc_nom_item_seqnc, null);
  end if;
end;'
                                                 ,p_process_error_message    => '#SQLERRM#'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1
                                                 ,p_process_point            => 'AFTER_SUBMIT'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 04 - Synchroniser variables fil d''Ariane'
                                                 ,p_process_sql_clob         => 'afw_04_fil_arian_pkg.synch_varbl();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => 'afw_13_page_pkg.obten_page_sesn <>  afw_11_aplic_pkg.obten_page_conxn'
                                                 ,p_process_when_type        => 'PLSQL_EXPRESSION'
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1
                                                 ,p_process_point            => 'ON_DEMAND'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 04 - Retourner valeurs modales'
                                                 ,p_process_sql_clob         => 'if :A_AFW_04_ACTIO = ''XRM'' then
  afw_04_contx_pkg.retr_modl;
end if;'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => 'A_AFW_04_ACTIO'
                                                 ,p_process_when_type        => 'VAL_OF_ITEM_IN_COND_EQ_COND2'
                                                 ,p_process_when2            => 'XRM'
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1
                                                 ,p_process_point            => 'ON_DEMAND'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Cacher la liste de navigation'
                                                 ,p_process_sql_clob         => 'afw_13_page_pkg.cachr_liste_navgt();'
                                                 ,p_process_error_message    => 'Erreur
'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1.1
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 07 - Libérer les sémaphores hors persistances'
                                                 ,p_process_sql_clob         => 'afw_07_semph_pkg.libr_semph_perst_page();'
                                                 ,p_process_error_message    => 'Error'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1.1
                                                 ,p_process_point            => 'ON_SUBMIT_BEFORE_COMPUTATION'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 04 - Valider info de provenance avant Submit'
                                                 ,p_process_sql_clob         => 'if not afw_04_fil_arian_pkg.est_valid_sidf(true) then
  afw_08_url_pkg.redrg_page_acuei_postn;
end if;
        '
                                                 ,p_process_error_message    => 'erreur lors de la validation de la provenance.'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => 'afw_13_page_pkg.obten_page_sesn <>  afw_11_aplic_pkg.obten_page_conxn'
                                                 ,p_process_when_type        => 'PLSQL_EXPRESSION'
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1.2
                                                 ,p_process_point            => 'AFTER_AUTHENTICATION'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 11 - Alimenter les variables des numéros de produits'
                                                 ,p_process_sql_clob         => 'afw_11_aplic_pkg.defnr_varbl_numr_aplic();'
                                                 ,p_process_error_message    => 'Erreur'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1.2
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 11 - Définir la langue'
                                                 ,p_process_sql_clob         => 'afw_01_lang_pkg.defnr_lang_sesn();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ':FSP_LANGUAGE_PREFERENCE is null'
                                                 ,p_process_when_type        => 'PLSQL_EXPRESSION'
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1.2
                                                 ,p_process_point            => 'ON_SUBMIT_BEFORE_COMPUTATION'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 04 - Synchroniser variables contexte'
                                                 ,p_process_sql_clob         => 'afw_04_contx_pkg.synch_varbl;'
                                                 ,p_process_error_message    => '#SQLERRM#'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => 'afw_13_page_pkg.obten_page_sesn <>  afw_11_aplic_pkg.obten_page_conxn'
                                                 ,p_process_when_type        => 'PLSQL_EXPRESSION'
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1.3
                                                 ,p_process_point            => 'ON_SUBMIT_BEFORE_COMPUTATION'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Recherche'
                                                 ,p_process_sql_clob         => 'afw_13_navgt_pkg.efect_rechr ();'
                                                 ,p_process_error_message    => 'Erreur'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => 'AFW_13_RECHR_FORML'
                                                 ,p_process_when_type        => 'REQUEST_EQUALS_CONDITION'
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1.3
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 11 - Définir items application'
                                                 ,p_process_sql_clob         => 'afw_11_prodt_pkg.defnr_item_aplic_apex();'
                                                 ,p_process_error_message    => 'Erreur'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1.4
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 12 - Définir items application'
                                                 ,p_process_sql_clob         => 'afw_12_utils_pkg.defnr_item_aplic_apex();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1.5
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Définir items application'
                                                 ,p_process_sql_clob         => 'afw_13_page_pkg.defnr_item_aplic_apex;'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 5
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Aller au dernier enregistrement'
                                                 ,p_process_sql_clob         => 'afw_13_navgt_pkg.obten_dernr_enreg();'
                                                 ,p_process_error_message    => 'Erreur'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ':SAPC = ''XDE'''
                                                 ,p_process_when_type        => 'PLSQL_EXPRESSION'
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 8
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 04 - Synchroniser fil d''ariane'
                                                 ,p_process_sql_clob         => 'afw_04_fil_arian_pkg.synch;'
                                                 ,p_process_error_message    => 'Erreur lors de la synchronisation du fil d''ariane.'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 9
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 04 - Synchroniser le contexte'
                                                 ,p_process_sql_clob         => 'afw_04_contx_pkg.synch;'
                                                 ,p_process_error_message    => '#SQLERRM#'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 9.1
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Gérer le mode recherche'
                                                 ,p_process_sql_clob         => 'afw_13_navgt_pkg.trait_mode_rechr ();
:a_afw_13_mode_rechr := afw_13_navgt_pkg.est_en_mode_rechr_va();'
                                                 ,p_process_error_message    => 'Erreur'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 9.2
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Définir contexte navigation'
                                                 ,p_process_sql_clob         => 'afw_13_navgt_pkg.defnr_contx_navgt();'
                                                 ,p_process_error_message    => 'Erreur'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 9.5
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Charger les préférences'
                                                 ,p_process_sql_clob         => 'afw_13_prefr_pkg.charg_prefr_page();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 12.1
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 25 - Export CSV'
                                                 ,p_process_sql_clob         => 'afw_25_spx_expor_ir_pkg.afich_csv ();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => 'CSV'
                                                 ,p_process_when_type        => 'REQUEST_EQUALS_CONDITION'
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 12.1
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 25 - Export CSV'
                                                 ,p_process_sql_clob         => 'afw_25_spx_expor_ir_pkg.afich_csv ();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => 'CSV'
                                                 ,p_process_when_type        => 'REQUEST_EQUALS_CONDITION'
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 12.2
                                                 ,p_process_point            => 'BEFORE_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 25 - Export PDF'
                                                 ,p_process_sql_clob         => 'afw_25_plpdf_expor_ir_pkg.afich_pdf ();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => 'PDF'
                                                 ,p_process_when_type        => 'REQUEST_EQUALS_CONDITION'
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 20
                                                 ,p_process_point            => 'BEFORE_FOOTER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Script mode recherche'
                                                 ,p_process_sql_clob         => 'afw_13_navgt_pkg.script_mode_rechr ();'
                                                 ,p_process_error_message    => 'Erreur'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1000000000
                                                 ,p_process_point            => 'BEFORE_FOOTER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 25 - Générer le script d''affichage du rapport'
                                                 ,p_process_sql_clob         => 'afw_25_appel_raprt_apex_pkg.genr_script_popup_raprt();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => 'A_AFW_25_URL_RAPRT'
                                                 ,p_process_when_type        => 'ITEM_IS_NOT_NULL'
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1000000000
                                                 ,p_process_point            => 'AFTER_FOOTER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Réinitialiser la variable d''exclusion'
                                                 ,p_process_sql_clob         => 'afw_13_page_pkg.reint_exclu_liste_navgt();'
                                                 ,p_process_error_message    => 'Erreur'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1000000000.1
                                                 ,p_process_point            => 'AFTER_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Initialiser le contexte d''exécution d''une page'
                                                 ,p_process_sql_clob         => 'afw_13_condt_piltb_pkg.defn_contx_exect_page();'
                                                 ,p_process_error_message    => 'Erreur'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1000000000.1
                                                 ,p_process_point            => 'AFTER_SUBMIT'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 04 - Mettre à jour le contexte'
                                                 ,p_process_sql_clob         => 'afw_04_contx_pkg.maj_seqnc_contx();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1000000000.2
                                                 ,p_process_point            => 'AFTER_SUBMIT'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 13 - Sauvegarde des préférences'
                                                 ,p_process_sql_clob         => 'afw_13_prefr_pkg.sauvg_prefr_page();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'INLINE_IN_NOTIFICATION'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1000000000.3
                                                 ,p_process_point            => 'AFTER_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - 19 - Definir les variables de sessions'
                                                 ,p_process_sql_clob         => 'afw_19_boutn_pkg.defnr_varbl_sesn();'
                                                 ,p_process_error_message    => 'Erreur'
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');

    apex_050000.wwv_flow_api.create_flow_process (p_flow_id                  => pnu_numr_apex
                                                 ,p_process_sequence         => 1000000000.4
                                                 ,p_process_point            => 'AFTER_HEADER'
                                                 ,p_process_type             => 'PLSQL'
                                                 ,p_process_name             => 'AFW - JavaScript au chargement'
                                                 ,p_process_sql_clob         => 'afw_01_javsc_pkg.ajout_scrip_charg ();
afw_07_javsc_pkg.ajout_scrip_charg ();
--afw_19_javsc_pkg.ajout_scrip_charg ();
afw_25_javsc_pkg.ajout_scrip_charg ();'
                                                 ,p_process_error_message    => ''
                                                 ,p_error_display_location   => 'ON_ERROR_PAGE'
                                                 ,p_process_when             => ''
                                                 ,p_process_when_type        => ''
                                                 ,p_process_when2            => ''
                                                 ,p_process_when_type2       => ''
                                                 ,p_security_scheme          => ''
                                                 ,p_required_patch           => '');
  exception
    when others
    then
      ete ();
      raise;
  end creer_procs;

  procedure creer_racrc (pnu_numr_apex in number)
  is
  begin
    --Penser à vérifier si le DELETE_CONFIRM_MSG est déjà existant, mais non utilisé par afw
    --Si c'est le cas, update celui présent pour DELETE_CONFIRM_MESG_[CODE_NUMR_APEX]
    insert into apex_aplic_short (flow_id
                                 ,shortcut_name
                                 ,shortcut_consideration_seq
                                 ,shortcut_type
                                 ,error_text
                                 ,shortcut)
         values (pnu_numr_apex
                ,'DELETE_CONFIRM_MSG'
                ,1
                ,'FUNCTION_BODY'
                ,''
                ,'return afw_07_util_pkg.obten_mesg_suprs();');

    insert into apex_aplic_short (flow_id
                                 ,shortcut_name
                                 ,shortcut_consideration_seq
                                 ,shortcut_type
                                 ,error_text
                                 ,shortcut)
         values (pnu_numr_apex
                ,'AFW_13_LISTE_NAVGT'
                ,1
                ,'FUNCTION_BODY'
                ,''
                ,'declare
         vva_optio_liste_navgt varchar2 (32767)
                           default afw_13_page_pkg.genr_elemn_liste_navgt;
      begin
          -- Ne pas generer si la liste est vide
         -- Exclure la page de connexion
         if     vva_optio_liste_navgt is not null
            and afw_13_page_pkg.obten_page_sesn !=
                   afw_11_aplic_pkg.obten_page_conxn
         then
            return vva_optio_liste_navgt;
         end if;
end;'             );

    insert into apex_aplic_short (flow_id
                                 ,shortcut_name
                                 ,shortcut_consideration_seq
                                 ,shortcut_type
                                 ,error_text
                                 ,shortcut)
         values (pnu_numr_apex
                ,'AFW_13_LIBL_ITEM'
                ,1
                ,'FUNCTION_BODY'
                ,'Erreur'
                ,'return afw_13_page_item_pkg.obten_tradc_libl(#CURRENT_ITEM_ID#);');

    insert into apex_aplic_short (flow_id
                                 ,shortcut_name
                                 ,shortcut_consideration_seq
                                 ,shortcut_type
                                 ,error_text
                                 ,shortcut)
         values (pnu_numr_apex
                ,'AFW_13_ICONE_BULLE_AIDE_ITEM'
                ,1
                ,'FUNCTION_BODY'
                ,'Erreur'
                ,'return afw_13_page_item_pkg.obten_icone_bulle_aide(#CURRENT_ITEM_ID#);');
  exception
    when others
    then
      ete ();
      raise;
  end creer_racrc;

  procedure creer_plugn_evenm (pnu_numr_apex in number)
  is
  begin
    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_ARBRE_AJAX')
                ,'close_node.jstree'
                ,'Fermer un noeud');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_ARBRE_AJAX')
                ,'create_node.jstree'
                ,'Ajouter un noeud');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_ARBRE_AJAX')
                ,'delete_node.jstree'
                ,'Supprimer un noeud');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_ARBRE_AJAX')
                ,'move_node.jstree'
                ,'Déplacer un noeud');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_ARBRE_AJAX')
                ,'open_node.jstree'
                ,'Ouvrir un noeud');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_ARBRE_AJAX')
                ,'rename_node.jstree'
                ,'Renommer un noeud');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_ARBRE_AJAX')
                ,'select_node.jstree'
                ,'Sélectionner un noeud');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_DIALG')
                ,'ouvridialg'
                ,'Ouvrir le dialogue');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_MODFR_MDP')
                ,'afw_21_actio_dynmq_modfr_mp_afich'
                ,'Afficher');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SUPRM_ITEM_CLOB')
                ,'suprm_item_clob_delete_termn'
                ,'Supprimer items CLOB terminé (DELETE)');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'dayclick'
                ,'dayClick');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'drop'
                ,'drop');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventafterrender'
                ,'eventAfterRender');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventclick'
                ,'eventClick');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventdragstart'
                ,'eventDragStart');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventdragstop'
                ,'eventDragStop');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventdrop'
                ,'eventDrop');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventmouseout'
                ,'eventMouseout');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventmouseover'
                ,'eventMouseover');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventrender'
                ,'eventRender');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventresize'
                ,'eventResize');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventresizestart'
                ,'eventResizeStart');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'eventresizestop'
                ,'eventResizeStop');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'loading'
                ,'loading');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'loadingstart'
                ,'loadingStart');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'loadingstop'
                ,'loadingStop');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'select'
                ,'select');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'unselect'
                ,'unselect');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'viewdisplay'
                ,'viewDisplay');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_CALND')
                ,'windowresize'
                ,'windowResize');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogbeforeclose'
                ,'beforeClose');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogclose'
                ,'close');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogclose_actio_dynmq'
                ,'close Dynamic Action Plugin');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogclose_procs'
                ,'close Process Plugin');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogdrag'
                ,'drag');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogdragstart'
                ,'dragStart');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogdragstop'
                ,'dragStop');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogfocus'
                ,'focus');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogopen'
                ,'open');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogresize'
                ,'resize');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogresizestart'
                ,'resizeStart');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'dialogresizestop'
                ,'resizeStop');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SOUMT_CLOB')
                ,'soumt_create_clob_termn'
                ,'Soumettre CLOB terminé (CREATE)');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SOUMT_CLOB')
                ,'soumt_delete_clob_termn'
                ,'Soumettre CLOB terminé (DELETE)
'                 );

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SOUMT_CLOB')
                ,'soumt_save_clob_termn'
                ,'Soumettre CLOB terminé (SAVE)');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'selct2_opening'
                ,'opening');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'selct2_open'
                ,'open');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'selct2_close'
                ,'close');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'selct2_highlight'
                ,'highlight');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'selct2_selecting'
                ,'selecting');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'selct2_removing'
                ,'removing');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'selct2_removed'
                ,'removed');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'selct2_loaded'
                ,'loaded');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'selct2_focus'
                ,'focus');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'selct2_blur'
                ,'blur');

    insert into apex_050000.wwv_flow_plugin_events (flow_id
                                                   ,plugin_id
                                                   ,name
                                                   ,display_name)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AIDE_PAGE')
                ,'afw_21_actio_dynmq_aide_page_afich'
                ,'Afficher');
  end creer_plugn_evenm;

  procedure creer_plugn_fichr (pnu_numr_apex in number)
  is
  begin
    null; --Pas utilisé par les plugins du framework
  end creer_plugn_fichr;

  procedure creer_plugn_optio (pnu_numr_apex in number)
  is
  begin
    insert into apex_050000.wwv_flow_plugin_settings (flow_id
                                                     ,plugin_type
                                                     ,plugin
                                                     ,attribute_01
                                                     ,attribute_02
                                                     ,attribute_03
                                                     ,attribute_04
                                                     ,attribute_05
                                                     ,attribute_06
                                                     ,attribute_07
                                                     ,attribute_08
                                                     ,attribute_09
                                                     ,attribute_10
                                                     ,attribute_11
                                                     ,attribute_12
                                                     ,attribute_13
                                                     ,attribute_14
                                                     ,attribute_15)
         values (pnu_numr_apex
                ,'ITEM TYPE'
                ,'PLUGIN_IO_AFW_21_ITEM_POPUP_ARBOR'
                ,'&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
                ,'&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'');

    insert into apex_050000.wwv_flow_plugin_settings (flow_id
                                                     ,plugin_type
                                                     ,plugin
                                                     ,attribute_01
                                                     ,attribute_02
                                                     ,attribute_03
                                                     ,attribute_04
                                                     ,attribute_05
                                                     ,attribute_06
                                                     ,attribute_07
                                                     ,attribute_08
                                                     ,attribute_09
                                                     ,attribute_10
                                                     ,attribute_11
                                                     ,attribute_12
                                                     ,attribute_13
                                                     ,attribute_14
                                                     ,attribute_15)
         values (pnu_numr_apex
                ,'ITEM TYPE'
                ,'PLUGIN_IO_AFW_21_ITEM_POPUP_LOV_IR'
                ,'&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_item_popup_lov_ir.js'
                ,'&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_item_popup_lov_ir.css'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'');
  end creer_plugn_optio;

  procedure creer_plugn_atrib (pnu_numr_apex in number)
  is
  begin
    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'COMPONENT'
                ,1
                ,10
                ,'Type'
                ,'SELECT LIST'
                ,'Y'
                ,'SINGL_VALUE'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('81189314005887439');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'COMPONENT'
                ,6
                ,60
                ,'Maximum number of items that can be selected'
                ,'NUMBER'
                ,'Y'
                ,'0'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,gta_id_atrib_plugn ('81189314005887439')
                ,'EQUALS'
                ,'MULTP_VALUE'
                ,'The maximum number of items that can be selected in a multi-select control. If this number is less than 1 selection is not limited.'
                ,'')
      returning id
           into gta_id_atrib_plugn ('81267915864495387');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'COMPONENT'
                ,2
                ,20
                ,'Allow clear'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,gta_id_atrib_plugn ('81189314005887439')
                ,'EQUALS'
                ,'SINGL_VALUE'
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('81288527965703549');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'COMPONENT'
                ,3
                ,30
                ,'Loading Remote Data'
                ,'CHECKBOX'
                ,'N'
                ,'N'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('81266929248473974');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
           values (
                    pnu_numr_apex
                   ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                   ,'COMPONENT'
                   ,4
                   ,40
                   ,'Minimum number of results'
                   ,'NUMBER'
                   ,'Y'
                   ,'10'
                   ,null
                   ,null
                   ,null
                   ,null
                   ,''
                   ,'N'
                   ,gta_id_atrib_plugn ('81266929248473974')
                   ,'EQUALS'
                   ,'N'
                   ,'The minimum number of results that must be initially (after opening the dropdown for the first time) populated in order to keep the search field. This is useful for cases where local data is used with just a few results, in which case the search box is not very useful and wastes screen space.

The option can be set to a negative value to permanently hide the search field.'
                   ,'')
      returning id
           into gta_id_atrib_plugn ('81267307250484146');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'COMPONENT'
                ,10
                ,35
                ,'Search type'
                ,'SELECT LIST'
                ,'Y'
                ,'LIKE_IGNORE'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,gta_id_atrib_plugn ('81266929248473974')
                ,'EQUALS'
                ,'Y'
                ,'CONTAINS_CASE   -- uses INSTR
CONTAINS_IGNORE -- uses INSTR with UPPER
EXACT_CASE      -- uses LIKE value%
EXACT_IGNORE    -- uses LIKE VALUE% with UPPER
LIKE_CASE       -- uses LIKE %value%
LIKE_IGNORE     -- uses LIKE %VALUE% with UPPER
LOOKUP          -- uses = value'
                ,'')
      returning id
           into gta_id_atrib_plugn ('81275900883155519');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'COMPONENT'
                ,7
                ,70
                ,'Number of characters necessary to start a search'
                ,'NUMBER'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('81268811539512573');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'COMPONENT'
                ,8
                ,80
                ,'Maximum number of characters that can be entered for an input.'
                ,'NUMBER'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('81269108951513772');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'COMPONENT'
                ,9
                ,90
                ,'Separator'
                ,'TEXT'
                ,'Y'
                ,':'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'Separator character or string used to delimit ids in value attribute of the multi-valued selects.'
                ,'')
      returning id
           into gta_id_atrib_plugn ('81269429857519268');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'COMPONENT'
                ,5
                ,50
                ,'Maximum number of results'
                ,'NUMBER'
                ,'Y'
                ,'100'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('81275300693125233');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SELCT_2')
                ,'COMPONENT'
                ,11
                ,110
                ,'initSelection Query'
                ,'SQL'
                ,'N'
                ,'select nom d, seqnc r
    from vd_afw_13_page
order by 1'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('81294631235457771');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_PRODT_CONTX_A')
                ,'COMPONENT'
                ,1
                ,10
                ,'Changement de produits'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('436748269614443476');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_CONFR_SAUVG')
                ,'COMPONENT'
                ,1
                ,10
                ,'Message de confirmation'
                ,'TEXTAREA'
                ,'Y'
                ,'Des modifications au formulaire ne sont pas sauvegardées.'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('447211059729900770');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
           values (
                    pnu_numr_apex
                   ,gta_id_plugn ('IO_AFW_21_PAGE_ITEM_MASQ')
                   ,'COMPONENT'
                   ,3
                   ,30
                   ,'Caractère de soulignement'
                   ,'TEXT'
                   ,'Y'
                   ,'_'
                   ,1
                   ,1
                   ,null
                   ,null
                   ,''
                   ,'Y'
                   ,null
                   ,''
                   ,''
                   ,'Si vous n''êtes pas satisfait avec le caractère de soulignement (''_'') comme un espace réservé, vous pouvez passer un argument optionnel.'
                   ,'')
      returning id
           into gta_id_atrib_plugn ('447605276709184907');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR')
                ,'COMPONENT'
                ,1
                ,10
                ,'Logo ouvrir popup LOV IR'
                ,'TEXT'
                ,'Y'
                ,'/i/lov_16x16.gif'
                ,60
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,'URL

ex.: /i/lov_16x16.gif'
                ,'')
      returning id
           into gta_id_atrib_plugn ('447714650816915446');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR')
                ,'APPLICATION'
                ,1
                ,10
                ,'Librairie JavaScript du plugin'
                ,'TEXT'
                ,'Y'
                ,'&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
                ,60
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'URL

ex.: &A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
                ,'')
      returning id
           into gta_id_atrib_plugn ('447715169301930242');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR')
                ,'APPLICATION'
                ,2
                ,20
                ,'Fichier CSS du plugin'
                ,'TEXT'
                ,'Y'
                ,'&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
                ,60
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'URL

ex.: &A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
                ,'')
      returning id
           into gta_id_atrib_plugn ('447715674627941250');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR')
                ,'COMPONENT'
                ,6
                ,15
                ,'Largeur du popup'
                ,'NUMBER'
                ,'Y'
                ,'600'
                ,10
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('447761963928658834');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR')
                ,'COMPONENT'
                ,7
                ,20
                ,'Hauteur du popup'
                ,'NUMBER'
                ,'Y'
                ,'500'
                ,10
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('447762575010661987');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR')
                ,'COMPONENT'
                ,3
                ,30
                ,'Mode gestion'
                ,'SELECT LIST'
                ,'Y'
                ,'SIMPL'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('447837150070291429');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR')
                ,'COMPONENT'
                ,2
                ,40
                ,'Page popup lov'
                ,'TEXT'
                ,'Y'
                ,''
                ,20
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,gta_id_atrib_plugn ('447837150070291429')
                ,'IN_LIST'
                ,'SIMPL,AVANC'
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('447720580108279471');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR')
                ,'COMPONENT'
                ,4
                ,40
                ,'Items qui reçoivent les valeurs'
                ,'PAGE ITEMS'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,gta_id_atrib_plugn ('447837150070291429')
                ,'EQUALS'
                ,'AVANC'
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('447755367345931178');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR')
                ,'COMPONENT'
                ,5
                ,50
                ,'Colonnes qui retournent les valeurs'
                ,'PAGE ITEMS'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,gta_id_atrib_plugn ('447837150070291429')
                ,'EQUALS'
                ,'AVANC'
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('447755976003933739');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR')
                ,'COMPONENT'
                ,8
                ,35
                ,'Application popup lov IR'
                ,'NUMBER'
                ,'Y'
                ,''
                ,20
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,gta_id_atrib_plugn ('447837150070291429')
                ,'IN_LIST'
                ,'SIMPL,AVANC'
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('447803172798170451');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_ARBOR')
                ,'APPLICATION'
                ,1
                ,10
                ,'Librairie JavaScript du plugin'
                ,'TEXT'
                ,'N'
                ,'&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
                ,60
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'URL

ex.: &A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
                ,'')
      returning id
           into gta_id_atrib_plugn ('448065765219121185');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_ARBOR')
                ,'APPLICATION'
                ,2
                ,20
                ,'Fichier CSS du plugin'
                ,'TEXT'
                ,'N'
                ,'&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
                ,60
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'URL

ex.: &A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
                ,'')
      returning id
           into gta_id_atrib_plugn ('448066269028122310');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_ARBOR')
                ,'COMPONENT'
                ,1
                ,10
                ,'Logo ouvrir popup'
                ,'TEXT'
                ,'Y'
                ,'/i/lov_16x16.gif'
                ,60
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,'URL

ex.: /i/lov_16x16.gif'
                ,'')
      returning id
           into gta_id_atrib_plugn ('448068761157176765');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_ARBOR')
                ,'COMPONENT'
                ,2
                ,20
                ,'Largeur du popup'
                ,'NUMBER'
                ,'Y'
                ,'600'
                ,10
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('448069281589182729');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_ITEM_POPUP_ARBOR')
                ,'COMPONENT'
                ,3
                ,30
                ,'Hauteur du popup'
                ,'NUMBER'
                ,'Y'
                ,'600'
                ,10
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('448069757132185046');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_ARBRE_AJAX')
                ,'COMPONENT'
                ,1
                ,10
                ,'Item qui contient le ID du noeud'
                ,'TEXT'
                ,'Y'
                ,''
                ,60
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('448137881493107190');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_PAGE_ITEM_MASQ')
                ,'COMPONENT'
                ,1
                ,10
                ,'Type de masque'
                ,'SELECT LIST'
                ,'Y'
                ,'PERSN'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('449618791079690316');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_PAGE_ITEM_MASQ')
                ,'COMPONENT'
                ,2
                ,20
                ,'Masque personnalisé'
                ,'TEXT'
                ,'Y'
                ,''
                ,60
                ,200
                ,null
                ,null
                ,''
                ,'Y'
                ,gta_id_atrib_plugn ('449618791079690316')
                ,'EQUALS'
                ,'PERSN'
                ,'a - Représente un caractère alphabétique (A-Z, a-z)
9 - Représente un caractère numérique (0-9)
* - Représente un caractère alphanumérique (AZ, az ,0-9)'
                ,'')
      returning id
           into gta_id_atrib_plugn ('447604755107169154');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_ACORD')
                ,'COMPONENT'
                ,1
                ,10
                ,'Largeur (px)'
                ,'TEXT'
                ,'Y'
                ,'215'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'1- Exemple: 215
2- Exemple: P1_LARGR_REGN_ACORD'
                ,'')
      returning id
           into gta_id_atrib_plugn ('452430063549519499');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_ACORD')
                ,'COMPONENT'
                ,2
                ,20
                ,'Largeur par défaut (px)'
                ,'NUMBER'
                ,'Y'
                ,'215'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'Exemple: 215'
                ,'')
      returning id
           into gta_id_atrib_plugn ('454300181398329774');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_AFICH_MESG')
                ,'COMPONENT'
                ,1
                ,10
                ,'Numéro de message    '
                ,'TEXT'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('473520143532245626');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_CONTX_FIL_ARIAN')
                ,'COMPONENT'
                ,1
                ,10
                ,'Informations supplémentaires (HTML)'
                ,'TEXTAREA'
                ,'N'
                ,''
                ,null
                ,4000
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('491838350685219078');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_CONTX_FIL_ARIAN')
                ,'COMPONENT'
                ,2
                ,20
                ,'Informations supplémentaires'
                ,'PLSQL EXPRESSION'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('491842766961223771');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_MENU')
                ,'COMPONENT'
                ,1
                ,10
                ,'Code du menu'
                ,'TEXT'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('515605022605227797');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_DIALG')
                ,'COMPONENT'
                ,7
                ,70
                ,'Largeur'
                ,'NUMBER'
                ,'Y'
                ,'300'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('519835056570564309');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_MATRC_RAPRT_SQL')
                ,'COMPONENT'
                ,1
                ,10
                ,'Nombre de colonnes à gauche'
                ,'NUMBER'
                ,'Y'
                ,'1'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'Nombre de dimensions verticales.<br/>Ex.: 1'
                ,'')
      returning id
           into gta_id_atrib_plugn ('520473164089491904');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_MATRC_RAPRT_SQL')
                ,'COMPONENT'
                ,2
                ,20
                ,'Surligner des lignes'
                ,'TEXT'
                ,'N'
                ,'Total,**Tous**'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,'Permet de mettre en évidence certaines lignes (totaux).<br/>Ex.: Total,**Tous**'
                ,'')
      returning id
           into gta_id_atrib_plugn ('520474076210495414');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_DIALG')
                ,'COMPONENT'
                ,1
                ,10
                ,'Modale'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('530333946293176901');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_DIALG')
                ,'COMPONENT'
                ,2
                ,20
                ,'Redimensionner'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('530778753382412312');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_DIALG')
                ,'COMPONENT'
                ,3
                ,30
                ,'Fermer avec la touche "Échap" (Esc)'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('530779374160418280');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_DIALG')
                ,'COMPONENT'
                ,4
                ,40
                ,'Classe CSS'
                ,'TEXT'
                ,'N'
                ,''
                ,60
                ,100
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'Pour cacher le bouton "Fermer" (X). Ajouter la classe: no-close.<br />Ex.: ui-afw no-close'
                ,'')
      returning id
           into gta_id_atrib_plugn ('530780077408428657');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_DIALG')
                ,'COMPONENT'
                ,5
                ,50
                ,'Ouvrir automatiquement'
                ,'CHECKBOX'
                ,'N'
                ,'N'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('530781059146830257');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_DIALG')
                ,'COMPONENT'
                ,6
                ,60
                ,'Déplaçable'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('530781777500835579');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_CHAMP_RECHR')
                ,'COMPONENT'
                ,1
                ,10
                ,'Filigrane'
                ,'TEXT'
                ,'Y'
                ,'Recherche...'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('595898849929552854');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_CHAMP_RECHR')
                ,'COMPONENT'
                ,2
                ,20
                ,'Nombre critères en mémoire'
                ,'NUMBER'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('595903360664555888');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_PRODT_CONTX_A')
                ,'COMPONENT'
                ,2
                ,20
                ,'Afficher date dernière m-à-j référentiel AFW'
                ,'CHECKBOX'
                ,'N'
                ,'N'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('596766653794658012');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_PRODT_CONTX_A')
                ,'COMPONENT'
                ,3
                ,30
                ,'Produits affichés'
                ,'SELECT LIST'
                ,'Y'
                ,'TOUS'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('629419043194676002');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_PRODT_CONTX_A')
                ,'COMPONENT'
                ,4
                ,40
                ,'Produits SAF'
                ,'CHECKBOXES'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,gta_id_atrib_plugn ('629419043194676002')
                ,'EQUALS'
                ,'SEULM_AFW'
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('629258464956578251');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_LISTE_NAVGT')
                ,'COMPONENT'
                ,1
                ,10
                ,'Icône'
                ,'SELECT LIST'
                ,'Y'
                ,'ui-icon-arrowthick-1-e'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('681316156849983643');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_TRAIT_MESS_ERR')
                ,'COMPONENT'
                ,1
                ,10
                ,'Traiter messages'
                ,'CHECKBOX'
                ,'N'
                ,'N'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('690465143667346710');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DEFNR_ITEM_PAGE')
                ,'COMPONENT'
                ,1
                ,10
                ,'Définir ces éléments'
                ,'PAGE ITEMS'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('697520862811824697');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DEFNR_ITEM_PAGE')
                ,'COMPONENT'
                ,2
                ,20
                ,'Avec ces valeurs'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,gta_id_atrib_plugn ('697520862811824697')
                ,'NOT_NULL'
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('697525269045826527');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_FERMR_DIALG_IFRAM')
                ,'COMPONENT'
                ,1
                ,10
                ,'Fenêtre parent (Item clé étrangère) - Valeur de retour'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('697784092004965553');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_INSER_TRACE')
                ,'COMPONENT'
                ,1
                ,10
                ,'Valeur 1'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('776950646679677056');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_INSER_TRACE')
                ,'COMPONENT'
                ,2
                ,20
                ,'Valeur 2'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('776955149796677931');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_CONFR_SAUVG_REQT')
                ,'COMPONENT'
                ,1
                ,10
                ,'Message de confirmation'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('854686355232622290');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_CONFR_SAUVG_REQT')
                ,'COMPONENT'
                ,2
                ,20
                ,'Requêtes'
                ,'TEXTAREA'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('854686863543624659');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REDRC_URL')
                ,'COMPONENT'
                ,1
                ,10
                ,'URL'
                ,'PLSQL EXPRESSION'
                ,'Y'
                ,'afw_08_url_pkg.genr_url([saisir les paramètres])'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('857986563176375634');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_TRANS_IDENT_COLN')
                ,'COMPONENT'
                ,1
                ,10
                ,'Identifiants'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,'"A":"Libellé A","B":"Libellé B"'
                ,'')
      returning id
           into gta_id_atrib_plugn ('858696452588385806');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_PRIS_CHARG_NAVGT')
                ,'COMPONENT'
                ,1
                ,10
                ,'Titre'
                ,'TEXT'
                ,'Y'
                ,'Avertissement'
                ,80
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('865270047016288243');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_PRIS_CHARG_NAVGT')
                ,'COMPONENT'
                ,2
                ,20
                ,'Message'
                ,'TEXT'
                ,'Y'
                ,'La version de votre navigateur n''est pas supportée. Veuillez en faire la mise à jour ou utilisez un autre navigateur.'
                ,80
                ,1000
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('865270657752291340');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_CHANG_LIBL_FIL_ARI')
                ,'COMPONENT'
                ,1
                ,10
                ,'Nouveau libellé'
                ,'PLSQL EXPRESSION'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('880949664706905291');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_REGN_DIALG')
                ,'COMPONENT'
                ,1
                ,10
                ,'Largeur'
                ,'TEXT'
                ,'N'
                ,''
                ,10
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('896439187347572104');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_MODE_PAGE')
                ,'COMPONENT'
                ,1
                ,10
                ,'Item cible'
                ,'PAGE ITEM'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('906221772315661012');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_MODE_PAGE')
                ,'COMPONENT'
                ,2
                ,20
                ,'Valeur par défaut'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('906317864397687188');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AIDE_PAGE_ITEM')
                ,'COMPONENT'
                ,1
                ,10
                ,'Afficher plusieurs à la fois'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('926596150147540736');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_FIL_ARIAN')
                ,'COMPONENT'
                ,7
                ,70
                ,'Afficher premier niveau'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1001811058557499134');



    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT_SQL')
                ,'COMPONENT'
                ,1
                ,10
                ,'Ligne 1 - Entêtes '
                ,'TEXT'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,'Liste des libellés dans les entêtes.<br/>Ex.: ,Valeur,%'
                ,'')
      returning id
           into gta_id_atrib_plugn ('1184047898318573414');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
           values (
                    pnu_numr_apex
                   ,gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT_SQL')
                   ,'COMPONENT'
                   ,2
                   ,20
                   ,'Ligne 1 - colspan/rowspan'
                   ,'TEXT'
                   ,'Y'
                   ,''
                   ,null
                   ,null
                   ,null
                   ,null
                   ,''
                   ,'N'
                   ,null
                   ,''
                   ,''
                   ,'Formatage des entêtes.<br/>Ex.: 1;
1,4;
1,4;
1<br/><br/>colspan;
                                                                                                                                                                                                                                             rowspan,colspan;rowspan,colspan;rowspan'
                   ,'')
      returning id
           into gta_id_atrib_plugn ('1184048408015576164');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT_SQL')
                ,'COMPONENT'
                ,3
                ,30
                ,'Ligne 2 - Entête'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,'Liste des libellés dans les entêtes.<br/>Ex.: ,Valeur,%'
                ,'')
      returning id
           into gta_id_atrib_plugn ('1184049589445580307');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT_SQL')
                ,'COMPONENT'
                ,4
                ,40
                ,'Ligne 2 - colspan/rowspan'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'Formatage des entêtes.<br/>Ex.: 1;1,4;1,4;1<br/><br/>colspan;rowspan,colspan;rowspan,colspan;rowspan'
                ,'')
      returning id
           into gta_id_atrib_plugn ('1184050093601581495');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT_SQL')
                ,'COMPONENT'
                ,5
                ,50
                ,'Ligne 3 - Entêtes'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,'Liste des libellés dans les entêtes.<br/>Ex.: ,Valeur,%'
                ,'')
      returning id
           into gta_id_atrib_plugn ('1184051005029584808');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT_SQL')
                ,'COMPONENT'
                ,6
                ,60
                ,'Ligne 3 - colspan/rowspan'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,'Formatage des entêtes.<br/>Ex.: 1;1,4;1,4;1<br/><br/>colspan;rowspan,colspan;rowspan,colspan;rowspan'
                ,'')
      returning id
           into gta_id_atrib_plugn ('1184051506414585224');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,14
                ,18
                ,'Application'
                ,'PLSQL EXPRESSION'
                ,'Y'
                ,'afw_11_prodt_pkg.obten_numr_apex_prodt'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1206058734940019136');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,15
                ,19
                ,'Page'
                ,'PLSQL EXPRESSION'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1206067240135020637');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,6
                ,130
                ,'SAPC'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1207749519944932548');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,2
                ,105
                ,'SCPI'
                ,'TEXT'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1209515622086463072');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT')
                ,'COMPONENT'
                ,1
                ,10
                ,'Ligne 1 - Entêtes/colspan/rowspan'
                ,'TEXT'
                ,'Y'
                ,''
                ,100
                ,200
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1214258715411685092');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT')
                ,'COMPONENT'
                ,2
                ,20
                ,'Ligne 2 - Entêtes/colspan/rowspan'
                ,'TEXT'
                ,'N'
                ,''
                ,100
                ,200
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1214270921991686996');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT')
                ,'COMPONENT'
                ,3
                ,30
                ,'Ligne 3 - Entêtes/colspan/rowspan'
                ,'TEXT'
                ,'N'
                ,''
                ,100
                ,200
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1214275324761687770');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_VALDT_CLOB')
                ,'COMPONENT'
                ,1
                ,10
                ,'Type de validation'
                ,'SELECT LIST'
                ,'Y'
                ,'NOT_NULL'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1299491177008827801');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_VALDT_CLOB')
                ,'COMPONENT'
                ,2
                ,20
                ,'Numéro message'
                ,'TEXT'
                ,'Y'
                ,''
                ,30
                ,20
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1299526787181840259');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_VALDT_CLOB')
                ,'COMPONENT'
                ,3
                ,30
                ,'Item'
                ,'PAGE ITEM'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1299546773807845838');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_VALDT_CLOB')
                ,'COMPONENT'
                ,4
                ,40
                ,'Colonne'
                ,'TEXT'
                ,'Y'
                ,''
                ,60
                ,30
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1299555081079847971');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SUPRM_ITEM_CLOB')
                ,'COMPONENT'
                ,1
                ,10
                ,'Liste des items (clob)'
                ,'PAGE ITEMS'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1309331352513157087');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,10
                ,100
                ,'Définir élément SSPC'
                ,'PAGE ITEM'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1391911752360804746');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,11
                ,110
                ,'Définir élément SSPI'
                ,'PAGE ITEM'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1469233052891720691');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,12
                ,120
                ,'Item clé étrangère'
                ,'PAGE ITEM'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1470328541443616224');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,1
                ,10
                ,'Titre'
                ,'TEXT'
                ,'Y'
                ,''
                ,30
                ,50
                ,null
                ,null
                ,''
                ,'Y'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1481334537892572364');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,3
                ,30
                ,'Largeur'
                ,'NUMBER'
                ,'Y'
                ,'640'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1481343362396598395');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,5
                ,50
                ,'Classe CSS'
                ,'TEXT'
                ,'N'
                ,''
                ,30
                ,100
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1481347749713604143');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,7
                ,70
                ,'Redimensionner'
                ,'CHECKBOX'
                ,'N'
                ,'N'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1481356538070610300');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,8
                ,80
                ,'Fermer avec la touche "Échap" (Esc)'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1481360949498613597');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,9
                ,90
                ,'Déplaçable'
                ,'CHECKBOX'
                ,'N'
                ,'N'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1481365364735617978');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM')
                ,'COMPONENT'
                ,4
                ,40
                ,'Hauteur'
                ,'NUMBER'
                ,'Y'
                ,'480'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1481655455213453797');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_SOUMT_CLOB')
                ,'COMPONENT'
                ,1
                ,10
                ,'Liste des items (clob)'
                ,'PAGE ITEMS'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1702755239132488057');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_OBTEN_CLOB')
                ,'COMPONENT'
                ,1
                ,10
                ,'Table (Vue)'
                ,'TEXT'
                ,'Y'
                ,''
                ,60
                ,92
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1706005824428347788');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_OBTEN_CLOB')
                ,'COMPONENT'
                ,2
                ,20
                ,'Elément contenant la valeur de colonne de clé primaire'
                ,'PAGE ITEM'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1706050808629352712');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_OBTEN_CLOB')
                ,'COMPONENT'
                ,3
                ,30
                ,'Colonne de clé primaire'
                ,'TEXT'
                ,'Y'
                ,''
                ,60
                ,30
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1706055215901354754');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_OBTEN_CLOB')
                ,'COMPONENT'
                ,4
                ,40
                ,'Elément contenant la valeur de colonne de clé secondaire'
                ,'PAGE ITEM'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1706059622135356587');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_OBTEN_CLOB')
                ,'COMPONENT'
                ,5
                ,50
                ,'Colonne de clé secondaire'
                ,'TEXT'
                ,'N'
                ,''
                ,60
                ,30
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1706064033216359752');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_OBTEN_CLOB')
                ,'COMPONENT'
                ,6
                ,60
                ,'Liste des items (séparées par des virgules)'
                ,'PAGE ITEMS'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1707032921535763274');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_OBTEN_CLOB')
                ,'COMPONENT'
                ,7
                ,70
                ,'Liste des colonnes (séparées par des virgules)'
                ,'TEXT'
                ,'Y'
                ,''
                ,100
                ,200
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1707070931232766007');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_MAJ_CLOB')
                ,'COMPONENT'
                ,1
                ,10
                ,'Table (Vue)'
                ,'TEXT'
                ,'Y'
                ,''
                ,60
                ,92
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1721926294441997720');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_MAJ_CLOB')
                ,'COMPONENT'
                ,2
                ,20
                ,'Elément contenant la valeur de colonne de clé primaire'
                ,'PAGE ITEM'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1721930703100000223');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_MAJ_CLOB')
                ,'COMPONENT'
                ,3
                ,30
                ,'Colonne de clé primaire'
                ,'TEXT'
                ,'Y'
                ,''
                ,60
                ,30
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1721935108295001635');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_MAJ_CLOB')
                ,'COMPONENT'
                ,4
                ,40
                ,'Elément contenant la valeur de colonne de clé secondaire'
                ,'PAGE ITEM'
                ,'N'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1721939481414003357');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_MAJ_CLOB')
                ,'COMPONENT'
                ,5
                ,50
                ,'Colonne de clé secondaire'
                ,'TEXT'
                ,'N'
                ,''
                ,60
                ,30
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1721943886262004781');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_MAJ_CLOB')
                ,'COMPONENT'
                ,6
                ,60
                ,'Liste des items (séparées par des virgules)'
                ,'PAGE ITEMS'
                ,'Y'
                ,''
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1721963405655010362');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_DML_MAJ_CLOB')
                ,'COMPONENT'
                ,7
                ,70
                ,'Liste des colonnes (séparées par des virgules)'
                ,'TEXT'
                ,'Y'
                ,''
                ,100
                ,200
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1721967781545012860');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_FIL_ARIAN')
                ,'COMPONENT'
                ,1
                ,10
                ,'Icône'
                ,'SELECT LIST'
                ,'Y'
                ,'ui-icon-arrowthick-1-e'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1908507902161920089');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_FIL_ARIAN')
                ,'COMPONENT'
                ,3
                ,30
                ,'Préfixe'
                ,'TEXT'
                ,'N'
                ,''
                ,30
                ,50
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1908510826946920102');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_FIL_ARIAN')
                ,'COMPONENT'
                ,4
                ,40
                ,'Mode'
                ,'SELECT LIST'
                ,'Y'
                ,'AVANC'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1908511206340920102');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_FIL_ARIAN')
                ,'COMPONENT'
                ,5
                ,50
                ,'Afficher informations supplémentaires'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,null
                ,''
                ,''
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1908512630746920103');

    insert into apex_050000.wwv_flow_plugin_attributes (flow_id
                                                       ,plugin_id
                                                       ,attribute_scope
                                                       ,attribute_sequence
                                                       ,display_sequence
                                                       ,prompt
                                                       ,attribute_type
                                                       ,is_required
                                                       ,default_value
                                                       ,display_length
                                                       ,max_length
                                                       ,sql_min_column_count
                                                       ,sql_max_column_count
                                                       ,column_data_types
                                                       ,is_translatable
                                                       ,depending_on_attribute_id
                                                       ,depending_on_condition_type
                                                       ,depending_on_expression
                                                       ,help_text
                                                       ,attribute_comment)
         values (pnu_numr_apex
                ,gta_id_plugn ('IO_AFW_21_REGN_FIL_ARIAN')
                ,'COMPONENT'
                ,6
                ,60
                ,'Inclure le contexte'
                ,'CHECKBOX'
                ,'N'
                ,'Y'
                ,null
                ,null
                ,null
                ,null
                ,''
                ,'N'
                ,gta_id_atrib_plugn ('1908512630746920103')
                ,'EQUALS'
                ,'Y'
                ,''
                ,'')
      returning id
           into gta_id_atrib_plugn ('1908513007670920103');
  end creer_plugn_atrib;

  procedure creer_plugn_valr_atrib (pnu_numr_apex in number)
  is
  begin
    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('81189314005887439')
                ,20
                ,'Mutliple-value'
                ,'MULTP_VALUE');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('81189314005887439')
                ,10
                ,'Single-value'
                ,'SINGL_VALUE');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('447837150070291429')
                ,10
                ,'Simple'
                ,'SIMPL');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('447837150070291429')
                ,20
                ,'Avancée'
                ,'AVANC');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('447837150070291429')
                ,30
                ,'AFW'
                ,'AFW');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('449618791079690316')
                ,5
                ,'Personnalisé'
                ,'PERSN');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('449618791079690316')
                ,10
                ,'Téléphone'
                ,'999-999-9999');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('449618791079690316')
                ,20
                ,'Code postal (Canada)'
                ,'a9a 9a9');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('449618791079690316')
                ,30
                ,'Permis de conduire'
                ,'a9999-999999-99');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('629419043194676002')
                ,10
                ,'Tous les produits'
                ,'TOUS');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('629419043194676002')
                ,20
                ,'Exclure les produits AFW'
                ,'EXCLU_AFW');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('629419043194676002')
                ,30
                ,'Seulement les produits AFW'
                ,'SEULM_AFW');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('629258464956578251')
                ,10
                ,'SAFP'
                ,'SAFP');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('629258464956578251')
                ,20
                ,'SAFD'
                ,'SAFD');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('629258464956578251')
                ,30
                ,'SAFU'
                ,'SAFU');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('629258464956578251')
                ,40
                ,'SAFS'
                ,'SAFS');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('629258464956578251')
                ,50
                ,'SGA'
                ,'SGA');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('681316156849983643')
                ,10
                ,'ui-icon-arrowthick-1-e'
                ,'ui-icon-arrowthick-1-e');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('681316156849983643')
                ,20
                ,'ui-icon-arrow-1-e'
                ,'ui-icon-arrow-1-e');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('681316156849983643')
                ,30
                ,'ui-icon-carat-1-e'
                ,'ui-icon-carat-1-e');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('681316156849983643')
                ,40
                ,'ui-icon-triangle-1-e'
                ,'ui-icon-triangle-1-e');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('681316156849983643')
                ,50
                ,'ui-icon-circle-arrow-e'
                ,'ui-icon-circle-arrow-e');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('1299491177008827801')
                ,10
                ,'La valeur n''est pas nulle'
                ,'NOT_NULL');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('1908507902161920089')
                ,10
                ,'ui-icon-arrowthick-1-e'
                ,'ui-icon-arrowthick-1-e');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('1908507902161920089')
                ,20
                ,'ui-icon-arrow-1-e'
                ,'ui-icon-arrow-1-e');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('1908507902161920089')
                ,30
                ,'ui-icon-carat-1-e'
                ,'ui-icon-carat-1-e');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('1908507902161920089')
                ,40
                ,'ui-icon-triangle-1-e'
                ,'ui-icon-triangle-1-e');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('1908507902161920089')
                ,50
                ,'ui-icon-circle-arrow-e'
                ,'ui-icon-circle-arrow-e');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('1908511206340920102')
                ,10
                ,'Classique'
                ,'CLASQ');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('1908511206340920102')
                ,20
                ,'Avancé'
                ,'AVANC');

    --    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
    --                                                        ,plugin_attribute_id
    --                                                        ,display_sequence
    --                                                        ,display_value
    --                                                        ,return_value)
    --         values (pnu_numr_apex
    --                ,gta_id_atrib_plugn ('64670911225199394543')
    --                ,10
    --                ,'Simple'
    --                ,'SIMPL');
    --
    --    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
    --                                                        ,plugin_attribute_id
    --                                                        ,display_sequence
    --                                                        ,display_value
    --                                                        ,return_value)
    --         values (pnu_numr_apex
    --                ,gta_id_atrib_plugn ('64670911225199394543')
    --                ,20
    --                ,'Multiple'
    --                ,'MULTP');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('81275900883155519')
                ,10
                ,'Contains case'
                ,'CONTAINS_CASE');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('81275900883155519')
                ,20
                ,'Contains ignore'
                ,'CONTAINS_IGNORE');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('81275900883155519')
                ,30
                ,'Exact case'
                ,'EXACT_CASE');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('81275900883155519')
                ,40
                ,'Exact ignore'
                ,'EXACT_IGNORE');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('81275900883155519')
                ,50
                ,'Like case'
                ,'LIKE_CASE');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('81275900883155519')
                ,60
                ,'Like ignore'
                ,'LIKE_IGNORE');

    insert into apex_050000.wwv_flow_plugin_attr_values (flow_id
                                                        ,plugin_attribute_id
                                                        ,display_sequence
                                                        ,display_value
                                                        ,return_value)
         values (pnu_numr_apex
                ,gta_id_atrib_plugn ('81275900883155519')
                ,70
                ,'Lookup'
                ,'LOOKUP');
  end creer_plugn_valr_atrib;

  procedure creer_exten (pnu_numr_apex in number)
  is
  begin
    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHENTICATION TYPE'
                ,'IO_AFW_21_AUTHE_11_UTILS'
                ,'AFW - 21 - Authentification Utilisateur (AFW_11_UTILS)'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_authe_pkg.sentn'
                ,''
                ,'afw_21_authe_pkg.authe_11_utils'
                ,''
                ,''
                ,''
                ,'INVALID_SESSION'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTHE_11_UTILS');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHENTICATION TYPE'
                ,'IO_AFW_21_AUTHE_12_UTILS'
                ,'AFW - 21 - Authentification Utilisateur (AFW_12_UTILS)'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_authe_pkg.sentn'
                ,''
                ,'afw_21_authe_pkg.authe_12_utils'
                ,''
                ,''
                ,''
                ,'INVALID_SESSION'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTHE_12_UTILS');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHORIZATION TYPE'
                ,'IO_AFW_21_AUTOR_ACCES_PAGE'
                ,'AFW - 21 - Autorisation Accès Page'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_autor_pkg.genr_autor_acces_page'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTOR_ACCES_PAGE');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHORIZATION TYPE'
                ,'IO_AFW_21_AUTOR_ADMIN_DOMN'
                ,'AFW - 21 - Autorisation administrateur Domaine'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_autor_pkg.genr_autor_admin_domn'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTOR_ADMIN_DOMN');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHORIZATION TYPE'
                ,'IO_AFW_21_AUTOR_ADMIN_PRODT'
                ,'AFW - 21 - Autorisation administrateur Produit'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_autor_pkg.genr_autor_admin_prodt'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTOR_ADMIN_PRODT');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHORIZATION TYPE'
                ,'IO_AFW_21_AUTOR_CREAT'
                ,'AFW - 21 - Autorisation Création'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_autor_pkg.genr_autor_creat'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'256326647326815230'
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTOR_CREAT');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHORIZATION TYPE'
                ,'IO_AFW_21_AUTOR_DEVLP_PRODT'
                ,'AFW - 21 - Autorisation développeur Produit'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_autor_pkg.genr_autor_devlp_prodt'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTOR_DEVLP_PRODT');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHORIZATION TYPE'
                ,'IO_AFW_21_AUTOR_MODFC'
                ,'AFW - 21 - Autorisation Modification'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_autor_pkg.genr_autor_modfc'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTOR_MODFC');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHORIZATION TYPE'
                ,'IO_AFW_21_AUTOR_OPERT_DML'
                ,'AFW - 21 - Autorisation Opération DML'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_autor_pkg.genr_autor_opert_dml'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTOR_OPERT_DML');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHORIZATION TYPE'
                ,'IO_AFW_21_AUTOR_SUPER_UTILS'
                ,'AFW - 21 - Autorisation super utilisateur'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_autor_pkg.genr_autor_super_utils'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTOR_SUPER_UTILS');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'AUTHORIZATION TYPE'
                ,'IO_AFW_21_AUTOR_SUPRS'
                ,'AFW - 21 - Autorisation Suppression'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_autor_pkg.genr_autor_suprs'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AUTOR_SUPRS');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_AFICH_DIALG_IFRAM'
                ,'AFW - 21 - Afficher dialogue (iFrame)'
                ,'NOTIFICATION'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_afich_dialg_ifram'
                ,'afw_21_actio_dynmq_pkg.ajax_afich_dialg_ifram'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AFICH_DIALG_IFRAM');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_AFICH_PRODT_AUTOR'
                ,'AFW - 21 - Afficher la liste des produits autorisés'
                ,'INIT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_afich_prodt_autor'
                ,'afw_21_actio_dynmq_pkg.ajax_afich_prodt_autor'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'JQUERY_SELECTOR'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AFICH_PRODT_AUTOR');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_AFICH_REGN_DIALG'
                ,'AFW - 21 - Afficher dialogue (Région)'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_afich_regn_dialg'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'REGION'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AFICH_REGN_DIALG');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_AIDE_PAGE_ITEM'
                ,'AFW - 21 - Aide page item'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_aide_page_item'
                ,'afw_21_actio_dynmq_pkg.ajax_aide_page_item'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'420769810180509321'
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AIDE_PAGE_ITEM');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_CLIQR_SELCT_TEXTE'
                ,'AFW - 21 - Cliquer pour sélectionner tout le texte'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_plugn_cliqr_selct_texte'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'ITEM'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_CLIQR_SELCT_TEXTE');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_CONFR_SAUVG'
                ,'AFW - 21 - Confirmer la sauvegarde (Initialisation)'
                ,'NOTIFICATION'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_plugn_confr_sauvg'
                ,'afw_21_actio_dynmq_pkg.ajax_plugn_confr_sauvg'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_CONFR_SAUVG');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_CONFR_SAUVG_REINTL'
                ,'AFW - 21 - Confirmer la sauvegarde (Réinitilisation)'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_plugn_confr_sauvg_reint'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_CONFR_SAUVG_REINTL');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_DEPSM_TABLR_FORM'
                ,'AFW - 21 - Dépassement Tabular Form'
                ,'INIT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_afw_18_depsm_tablr_form'
                ,'afw_21_actio_dynmq_pkg.ajax_afw_18_depsm_tablr_form'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_DEPSM_TABLR_FORM');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_DML_OBTEN_CLOB'
                ,'AFW - 21 - Extraction de ligne automatisée (DML) - CLOB'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_dml_obten_clob'
                ,'afw_21_actio_dynmq_pkg.ajax_dml_obten_clob'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'STOP_EXECUTION_ON_ERROR'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_DML_OBTEN_CLOB');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_FERMR_DIALG_IFRAM'
                ,'AFW - 21 - Fermer dialogue (iFrame)'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_fermr_dialg_ifram'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_FERMR_DIALG_IFRAM');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_FERMR_REGN_DIALG'
                ,'AFW - 21 - Fermer dialogue (Région)'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_fermr_regn_dialg'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'REGION'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_FERMR_REGN_DIALG');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_GESTN_TABLR_FORM'
                ,'AFW - 21 - Gestion Tabular Form'
                ,'INIT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_plugn_gestn_tablr_form'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_GESTN_TABLR_FORM');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_GROUP_ENTET_RAPRT'
                ,'AFW - 21 - Groupe entêtes rapport interactif'
                ,'COMPONENT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_group_entet_raprt_inter'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'REGION'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_GROUP_ENTET_RAPRT_SQL'
                ,'AFW - 21 - Groupe entêtes rapport SQL'
                ,'COMPONENT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_group_entet_raprt_sql'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'REGION'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_GROUP_ENTET_RAPRT_SQL');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_INITL_COMPS'
                ,'AFW - 21 - Initialisation composants'
                ,'INIT'
                ,'DESKTOP'
                ,''
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_initl_comps'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_INITL_COMPS');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_MATRC_RAPRT_SQL'
                ,'AFW - 21 - Matrice rapport SQL'
                ,'COMPONENT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_matrc_raprt_sql'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'REGION'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_MATRC_RAPRT_SQL');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_MENU_REDRC'
                ,'AFW - 21 - Menu redirection'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_menu_redrc'
                ,'afw_21_actio_dynmq_pkg.ajax_menu_redrc'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'420470922400147878'
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_MENU_REDRC');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_NAVGT_ENREG'
                ,'AFW - 21 - Navigation par enregistrement'
                ,'INIT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_afw_21_navgt_enreg'
                ,'afw_21_actio_dynmq_pkg.ajax_afw_21_navgt_enreg'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_NAVGT_ENREG');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_NAVGT_TABLR_FORM'
                ,'AFW - 21 - Navigation Tabular Form'
                ,'INIT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_plugn_navgt_tablr_form'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_NAVGT_TABLR_FORM');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_POPUP_LOV'
                ,'AFW - 21 - Popup LOV'
                ,'INIT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_plugn_popup_lov_ir'
                ,'afw_21_actio_dynmq_pkg.ajax_plugn_popup_lov_ir'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_POPUP_LOV');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_PRIS_CHARG_NAVGT'
                ,'AFW - 21 - Prise en charge du navigateur'
                ,'NOTIFICATION'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_pris_charg_navgt'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_PRIS_CHARG_NAVGT');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_REDRC_URL'
                ,'AFW - 21 - Redirection URL'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_redrc_url'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REDRC_URL');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_REGN_AFICH_MESG_IN'
                ,'AFW - 21 - Afficher message informatif'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_afich_mesg_infor'
                ,'afw_21_actio_dynmq_pkg.ajax_afich_mesg_infor'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_AFICH_MESG_IN');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_REGN_AFICH_MESG_PR'
                ,'AFW - 21 - Afficher message processus'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_afich_mesg_procs'
                ,'afw_21_actio_dynmq_pkg.ajax_afich_mesg_procs'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_AFICH_MESG_PR');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_MODFR_MDP'
                ,'AFW - 21 - modifier mot passe'
                ,'INIT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_afw_12_modfr_mot_passe'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_MODFR_MDP');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_AIDE_PAGE'
                ,'AFW - 21 - Aide page'
                ,'INIT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_aide_page'
                ,'afw_21_actio_dynmq_pkg.ajax_aide_page'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_AIDE_PAGE');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_SOUMT_CLOB'
                ,'AFW - 21 - Soumettre - CLOB'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_soumt_clob'
                ,'afw_21_actio_dynmq_pkg.ajax_soumt_clob'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'STOP_EXECUTION_ON_ERROR'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_SOUMT_CLOB');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_SUPRM_ITEM_CLOB'
                ,'AFW - 21 - Supprimer contenu items - CLOB'
                ,'EXECUTE'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_suprm_item_clob'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'STOP_EXECUTION_ON_ERROR'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_SUPRM_ITEM_CLOB');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'DYNAMIC ACTION'
                ,'IO_AFW_21_TRANS_IDENT_COLN'
                ,'AFW - 21 - Transformer les identifiants de colonnes d''un IR'
                ,'INIT'
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_actio_dynmq_pkg.genr_trans_ident_coln_ir'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_TRANS_IDENT_COLN');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'ITEM TYPE'
                ,'IO_AFW_21_ITEM_POPUP_ARBOR'
                ,'AFW - 21 - Popup LOV Arborescence'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_item_pkg.genr_plugn_item_popup_arbor'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'VISIBLE:READONLY:SOURCE:ELEMENT:WIDTH:ELEMENT_OPTION:LOV:LOV_DISPLAY_NULL'
                ,'2'
                ,'2'
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_ITEM_POPUP_ARBOR');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'ITEM TYPE'
                ,'IO_AFW_21_ITEM_POPUP_LOV_IR'
                ,'AFW - 21 - Popup LOV IR'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_item_pkg.genr_plugn_item_popup_lov_ir'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'VISIBLE:READONLY:SOURCE:ELEMENT:WIDTH:ELEMENT_OPTION:LOV:LOV_REQUIRED:LOV_DISPLAY_NULL'
                ,'2'
                ,'2'
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_ITEM_POPUP_LOV_IR');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'ITEM TYPE'
                ,'IO_AFW_21_CHAMP_RECHR'
                ,'AFW - 21 - Champ de recherche'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_item_pkg.genr_champ_rechr'
                ,'afw_21_item_pkg.ajax_champ_rechr'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'VISIBLE:SOURCE:WIDTH'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_CHAMP_RECHR');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'ITEM TYPE'
                ,'IO_AFW_21_PAGE_ITEM_MASQ'
                ,'AFW - 21 - Masque pour la saisie'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_item_pkg.genr_plugn_item_masq'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'VISIBLE:SESSION_STATE:READONLY:ESCAPE_OUTPUT:SOURCE:ELEMENT:WIDTH'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_PAGE_ITEM_MASQ');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
           values (
                    pnu_numr_apex
                   ,'ITEM TYPE'
                   ,'IO_AFW_21_SELCT_2'
                   ,'AFW - 21 - select2'
                   ,''
                   ,'DESKTOP'
                   ,'#PLUGIN_PREFIX#'
                   ,''
                   ,'afw_21_item_pkg.genr_selct_2'
                   ,'afw_21_item_pkg.ajax_selct_2'
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,'VISIBLE:SESSION_STATE:READONLY:ESCAPE_OUTPUT:QUICKPICK:SOURCE:ELEMENT:WIDTH:ELEMENT_OPTION:PLACEHOLDER:ENCRYPT:LOV:LOV_REQUIRED:LOV_DISPLAY_NULL:CASCADING_LOV'
                   ,'2'
                   ,'3'
                   ,''
                   ,'Y'
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,''
                   ,'Y'
                   ,''
                   ,'0.8'
                   ,'http://www.afw.io'
                   ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_SELCT_2');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_CHANG_LIBL_FIL_ARI'
                ,'AFW - 21 - Changer libellé fil d''ariane'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.chang_libl_fil_arian'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_CHANG_LIBL_FIL_ARI');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_CONFR_SAUVG_REQT'
                ,'AFW - 21 - Confirmer la sauvegarde (Requêtes)'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.defnr_afw_21_confr_sauvg'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_CONFR_SAUVG_REQT');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_CONTX_FIL_ARIAN'
                ,'AFW - 21 - Contexte fil d''ariane'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.defnr_contx_afw_04_fil_arian'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_CONTX_FIL_ARIAN');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_DEFNR_ITEM_PAGE'
                ,'AFW - 21 - Définir item(s) page'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.defnr_item_page'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_DEFNR_ITEM_PAGE');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_DEFNR_PRODT_SAFP'
                ,'AFW - 21 - Définir produit SAFP'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.defnr_prodt_safp'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_DEFNR_PRODT_SAFP');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_DML_MAJ_CLOB'
                ,'AFW - 21 - Traitement de ligne automatique (DML) - CLOB'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.dml_maj_clob'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_DML_MAJ_CLOB');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_FERMR_DIALG_IFRAM'
                ,'AFW - 21 - Fermer dialogue (iFrame)'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.fermr_dialg_ifram'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_FERMR_DIALG_IFRAM');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_INSER_TRACE'
                ,'AFW - 21 - Insérer trace'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.inser_trace'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_INSER_TRACE');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_MODE_PAGE'
                ,'AFW - 21 - Définir le mode de la page (AFW_04)'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.defnr_afw_04_mode_page'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_MODE_PAGE');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_SURPM_COLCT_CLOB'
                ,'AFW - 21 - Supprimer collection - CLOB'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.suprm_afw_21_colct_clob'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_SURPM_COLCT_CLOB');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_TRAIT_MESS_ERR'
                ,'AFW - 21 - Traiter messages d''erreur'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.trait_mesgs_err'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_TRAIT_MESS_ERR');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'PROCESS TYPE'
                ,'IO_AFW_21_VALDT_CLOB'
                ,'AFW - 21 - Validation - CLOB'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,''
                ,''
                ,''
                ,'afw_21_procs_pkg.valdt_afw_21_colct_clob'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_VALDT_CLOB');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_LISTE_NAVGT'
                ,'AFW - 21 - Liste de navigation'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_afw_13_liste_navgt'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_LISTE_NAVGT');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_REGN_ACORD'
                ,'AFW - 21 - Accordion'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_plugn_regn_acord'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_ACORD');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_REGN_AFICH_MESG'
                ,'AFW - 21 - Afficher message'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_afw_01_afich_mesg'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_AFICH_MESG');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_REGN_ARBRE_AJAX'
                ,'AFW - 21 - Arborescence'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_plugn_regn_arbre'
                ,'afw_21_regn_pkg.ajax_plugn_regn_arbre'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'SOURCE_PLAIN'
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_ARBRE_AJAX');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_REGN_BARRE_RECHR_IR'
                ,'AFW - 21 - Barre recherche IR'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_plugn_regn_barre_rechr_ir'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_BARRE_RECHR_IR');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_REGN_CALND'
                ,'AFW - 21 - Calendrier'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_plugn_regn_calnd'
                ,'afw_21_regn_pkg.ajax_plugn_regn_calnd'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_CALND');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_REGN_DIALG'
                ,'AFW - 21 - Boîte de dialogue'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_plugn_regn_dialg'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'<br />
'
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_DIALG');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_REGN_FIL_ARIAN'
                ,'AFW - 21 - Fil d''ariane'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_afw_04_fil_arian'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'448659041313949161'
                ,'Y'
                ,''
                ,'1'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_FIL_ARIAN');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_REGN_MENU'
                ,'AFW - 21 - Menu'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_afw_13_menu'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'174315002511187337'
                ,'Y'
                ,''
                ,'1.0'
                ,''
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_MENU');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_REGN_PILE_MESG'
                ,'AFW - 21 - Pile messages'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_afw_01_err_apex'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_PILE_MESG');

    insert into apex_050000.wwv_flow_plugins (flow_id
                                             ,plugin_type
                                             ,name
                                             ,display_name
                                             ,category
                                             ,supported_ui_types
                                             ,image_prefix
                                             ,plsql_code
                                             ,render_function
                                             ,ajax_function
                                             ,validation_function
                                             ,execution_function
                                             ,session_sentry_function
                                             ,invalid_session_function
                                             ,authentication_function
                                             ,post_logout_function
                                             ,builder_validation_function
                                             ,migration_function
                                             ,standard_attributes
                                             ,sql_min_column_count
                                             ,sql_max_column_count
                                             ,sql_examples
                                             ,substitute_attributes
                                             ,attribute_01
                                             ,attribute_02
                                             ,attribute_03
                                             ,attribute_04
                                             ,attribute_05
                                             ,attribute_06
                                             ,attribute_07
                                             ,attribute_08
                                             ,attribute_09
                                             ,attribute_10
                                             ,attribute_11
                                             ,attribute_12
                                             ,attribute_13
                                             ,attribute_14
                                             ,attribute_15
                                             ,reference_id
                                             ,subscribe_plugin_settings
                                             ,help_text
                                             ,version_identifier
                                             ,about_url
                                             ,plugin_comment)
         values (pnu_numr_apex
                ,'REGION TYPE'
                ,'IO_AFW_21_REGN_PRODT_CONTX_A'
                ,'AFW - 21 - Produit contexte autorisé'
                ,''
                ,'DESKTOP'
                ,'#PLUGIN_PREFIX#'
                ,''
                ,'afw_21_regn_pkg.genr_prodt_contx_autor'
                ,'afw_21_regn_pkg.ajax_prodt_contx_autor'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,''
                ,'0.8'
                ,'http://www.afw.io'
                ,'')
      returning id
           into gta_id_plugn ('IO_AFW_21_REGN_PRODT_CONTX_A');

    creer_plugn_evenm (pnu_numr_apex);

    creer_plugn_fichr (pnu_numr_apex);

    creer_plugn_optio (pnu_numr_apex);

    creer_plugn_atrib (pnu_numr_apex);

    creer_plugn_valr_atrib (pnu_numr_apex);
  exception
    when others
    then
      ete ();
      raise;
  end creer_exten;

  procedure creer_autor_schem (pnu_numr_apex in number)
  is
  begin
    insert into apex_050000.wwv_flow_security_schemes (flow_id
                                                      ,name
                                                      ,scheme_type
                                                      ,attribute_01
                                                      ,attribute_02
                                                      ,attribute_03
                                                      ,attribute_04
                                                      ,attribute_05
                                                      ,attribute_06
                                                      ,attribute_07
                                                      ,attribute_08
                                                      ,attribute_09
                                                      ,attribute_10
                                                      ,attribute_11
                                                      ,attribute_12
                                                      ,attribute_13
                                                      ,attribute_14
                                                      ,attribute_15
                                                      ,scheme
                                                      ,scheme_text
                                                      ,error_message
                                                      ,caching
                                                      ,comments)
         values (pnu_numr_apex
                ,'Accès page'
                ,'PLUGIN_IO_AFW_21_AUTOR_ACCES_PAGE'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Accès refusé.'
                ,'BY_USER_BY_PAGE_VIEW'
                ,'');

    insert into apex_050000.wwv_flow_security_schemes (flow_id
                                                      ,name
                                                      ,scheme_type
                                                      ,attribute_01
                                                      ,attribute_02
                                                      ,attribute_03
                                                      ,attribute_04
                                                      ,attribute_05
                                                      ,attribute_06
                                                      ,attribute_07
                                                      ,attribute_08
                                                      ,attribute_09
                                                      ,attribute_10
                                                      ,attribute_11
                                                      ,attribute_12
                                                      ,attribute_13
                                                      ,attribute_14
                                                      ,attribute_15
                                                      ,scheme
                                                      ,scheme_text
                                                      ,error_message
                                                      ,caching
                                                      ,comments)
         values (pnu_numr_apex
                ,'Création'
                ,'PLUGIN_IO_AFW_21_AUTOR_CREAT'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Accès refusé.'
                ,'BY_USER_BY_PAGE_VIEW'
                ,'');

    insert into apex_050000.wwv_flow_security_schemes (flow_id
                                                      ,name
                                                      ,scheme_type
                                                      ,attribute_01
                                                      ,attribute_02
                                                      ,attribute_03
                                                      ,attribute_04
                                                      ,attribute_05
                                                      ,attribute_06
                                                      ,attribute_07
                                                      ,attribute_08
                                                      ,attribute_09
                                                      ,attribute_10
                                                      ,attribute_11
                                                      ,attribute_12
                                                      ,attribute_13
                                                      ,attribute_14
                                                      ,attribute_15
                                                      ,scheme
                                                      ,scheme_text
                                                      ,error_message
                                                      ,caching
                                                      ,comments)
         values (pnu_numr_apex
                ,'Modification'
                ,'PLUGIN_IO_AFW_21_AUTOR_MODFC'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Accès refusé.'
                ,'BY_USER_BY_PAGE_VIEW'
                ,'');

    insert into apex_050000.wwv_flow_security_schemes (flow_id
                                                      ,name
                                                      ,scheme_type
                                                      ,attribute_01
                                                      ,attribute_02
                                                      ,attribute_03
                                                      ,attribute_04
                                                      ,attribute_05
                                                      ,attribute_06
                                                      ,attribute_07
                                                      ,attribute_08
                                                      ,attribute_09
                                                      ,attribute_10
                                                      ,attribute_11
                                                      ,attribute_12
                                                      ,attribute_13
                                                      ,attribute_14
                                                      ,attribute_15
                                                      ,scheme
                                                      ,scheme_text
                                                      ,error_message
                                                      ,caching
                                                      ,comments)
         values (pnu_numr_apex
                ,'Opération DML'
                ,'PLUGIN_IO_AFW_21_AUTOR_OPERT_DML'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Accès refusé.'
                ,'BY_USER_BY_PAGE_VIEW'
                ,'');

    insert into apex_050000.wwv_flow_security_schemes (flow_id
                                                      ,name
                                                      ,scheme_type
                                                      ,attribute_01
                                                      ,attribute_02
                                                      ,attribute_03
                                                      ,attribute_04
                                                      ,attribute_05
                                                      ,attribute_06
                                                      ,attribute_07
                                                      ,attribute_08
                                                      ,attribute_09
                                                      ,attribute_10
                                                      ,attribute_11
                                                      ,attribute_12
                                                      ,attribute_13
                                                      ,attribute_14
                                                      ,attribute_15
                                                      ,scheme
                                                      ,scheme_text
                                                      ,error_message
                                                      ,caching
                                                      ,comments)
         values (pnu_numr_apex
                ,'Suppression'
                ,'PLUGIN_IO_AFW_21_AUTOR_SUPRS'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Accès refusé.'
                ,'BY_USER_BY_PAGE_VIEW'
                ,'');
  exception
    when others
    then
      ete ();
      raise;
  end creer_autor_schem;

  procedure creer_authe_schem (pnu_numr_apex in number)
  is
  begin
    insert into apex_050000.wwv_flow_authentications (flow_id
                                                     ,name
                                                     ,scheme_type
                                                     ,invalid_session_type
                                                     ,invalid_session_url
                                                     ,cookie_name
                                                     ,cookie_path
                                                     ,cookie_domain
                                                     ,use_secure_cookie_yn
                                                     ,logout_url
                                                     ,plsql_code
                                                     ,verification_function
                                                     ,pre_auth_process
                                                     ,post_auth_process
                                                     ,attribute_01
                                                     ,attribute_02
                                                     ,attribute_03
                                                     ,attribute_04
                                                     ,attribute_05
                                                     ,attribute_06
                                                     ,attribute_07
                                                     ,attribute_08
                                                     ,attribute_09
                                                     ,attribute_10
                                                     ,attribute_11
                                                     ,attribute_12
                                                     ,attribute_13
                                                     ,attribute_14
                                                     ,attribute_15
                                                     ,help_text
                                                     ,comments)
         values (pnu_numr_apex
                ,'AFW - 21 - Authentification Utilisateur (12)'
                ,'PLUGIN_IO_AFW_21_AUTHE_12_UTILS'
                ,'URL'
                ,'f?p=&APP_ID.:101'
                ,'AFW'
                ,''
                ,''
                ,'N'
                ,'f?p=&APP_ID.:101'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Authentification AFW')
      returning id
           into gnu_authe_afw_id;
  exception
    when others
    then
      ete ();
      raise;
  end creer_authe_schem;

  procedure ajust_propr_aplic (pnu_numr_apex in number)
  is
  begin
    update apex_aplic
       set authentication_id         = gnu_authe_afw_id
          ,authentication            = 'PLUGIN'
          ,error_handling_function   = 'afw_01_err_apex_pkg.gestn_mesg_err_apex'
     where     id = pnu_numr_apex
           and security_group_id = gnu_secrt_group_id;
  exception
    when others
    then
      ete ();
      raise;
  end ajust_propr_aplic;

  procedure creer_exten_page_zero (pnu_numr_apex in number)
  is
  begin
    apex_050000.wwv_flow_wizard_api.create_page_dynamic_action (p_flow_id                        => pnu_numr_apex
                                                               ,p_page_id                        => knu_page_globl
                                                               ,p_event_name                     => 'AFW'
                                                               ,p_event_sequence                 => 10
                                                               ,p_event_triggering_elem_type     => ''
                                                               ,p_event_triggering_region_id     => null
                                                               , --Si jamais il est pour en avoir, corriger manuellement
                                                                p_event_triggering_button_id     => null
                                                               , --Si jamais il est pour en avoir, corriger manuellement
                                                                p_event_triggering_element       => ''
                                                               ,p_event_triggering_cond_type     => ''
                                                               ,p_event_triggering_expression    => ''
                                                               ,p_event_bind_type                => 'bind'
                                                               ,p_event_bind_delegate_to         => ''
                                                               ,p_event_bind_event_type          => 'ready'
                                                               ,p_event_bind_event_type_custom   => ''
                                                               ,p_event_display_when_type        => ''
                                                               ,p_event_display_when_cond        => ''
                                                               ,p_event_display_when_cond2       => ''
                                                               ,p_event_comment                  => ''
                                                               ,p_action_true_action_sequence    => 1
                                                               ,p_action_true_exec_on_init       => 'N'
                                                               ,p_action_true_action             => 'NATIVE_EXECUTE_PLSQL_CODE'
                                                               ,p_action_true_aff_elems_type     => null);

    apex_050000.wwv_flow_wizard_api.create_page_dynamic_action (p_flow_id                        => pnu_numr_apex
                                                               ,p_page_id                        => knu_page_globl
                                                               ,p_event_name                     => 'AFW - Commentaires/Bogues (Afficher dialogue)'
                                                               ,p_event_sequence                 => 20
                                                               ,p_event_triggering_elem_type     => 'JQUERY_SELECTOR'
                                                               ,p_event_triggering_region_id     => null
                                                               , --Si jamais il est pour en avoir, corriger manuellement
                                                                p_event_triggering_button_id     => null
                                                               , --Si jamais il est pour en avoir, corriger manuellement
                                                                p_event_triggering_element       => '#boutn_comnt_bogue'
                                                               ,p_event_triggering_cond_type     => ''
                                                               ,p_event_triggering_expression    => ''
                                                               ,p_event_bind_type                => 'live'
                                                               ,p_event_bind_delegate_to         => ''
                                                               ,p_event_bind_event_type          => 'click'
                                                               ,p_event_bind_event_type_custom   => ''
                                                               ,p_event_display_when_type        => ''
                                                               ,p_event_display_when_cond        => ''
                                                               ,p_event_display_when_cond2       => ''
                                                               ,p_event_comment                  => ''
                                                               ,p_action_true_action_sequence    => 1
                                                               ,p_action_true_exec_on_init       => 'N'
                                                               ,p_action_true_action             => 'NATIVE_EXECUTE_PLSQL_CODE'
                                                               ,p_action_true_aff_elems_type     => null);

    apex_050000.wwv_flow_wizard_api.create_page_dynamic_action (
      p_flow_id                        => pnu_numr_apex
     ,p_page_id                        => knu_page_globl
     ,p_event_name                     => 'AFW - Commentaires/Bogues (Fermer dialogue)'
     ,p_event_sequence                 => 30
     ,p_event_triggering_elem_type     => 'JQUERY_SELECTOR'
     ,p_event_triggering_region_id     => null
     , --Si jamais il est pour en avoir, corriger manuellement
      p_event_triggering_button_id     => null
     , --Si jamais il est pour en avoir, corriger manuellement
      p_event_triggering_element       => 'div.dialg_comnt_bogue div.afw_21_actio_dynmq_dialg'
     ,p_event_triggering_cond_type     => ''
     ,p_event_triggering_expression    => ''
     ,p_event_bind_type                => 'live'
     ,p_event_bind_delegate_to         => ''
     ,p_event_bind_event_type          => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
     ,p_event_bind_event_type_custom   => ''
     ,p_event_display_when_type        => ''
     ,p_event_display_when_cond        => ''
     ,p_event_display_when_cond2       => ''
     ,p_event_comment                  => ''
     ,p_action_true_action_sequence    => 1
     ,p_action_true_exec_on_init       => 'N'
     ,p_action_true_action             => 'NATIVE_EXECUTE_PLSQL_CODE'
     ,p_action_true_aff_elems_type     => null);

    apex_050000.wwv_flow_wizard_api.create_page_dynamic_action (
      p_flow_id                        => pnu_numr_apex
     ,p_page_id                        => knu_page_globl
     ,p_event_name                     => 'AFW - Modifier mot de passe (Afficher dialogue)'
     ,p_event_sequence                 => 40
     ,p_event_triggering_elem_type     => 'DOM_OBJECT'
     ,p_event_triggering_region_id     => null
     , --Si jamais il est pour en avoir, corriger manuellement
      p_event_triggering_button_id     => null
     , --Si jamais il est pour en avoir, corriger manuellement
      p_event_triggering_element       => 'document'
     ,p_event_triggering_cond_type     => ''
     ,p_event_triggering_expression    => ''
     ,p_event_bind_type                => 'bind'
     ,p_event_bind_delegate_to         => ''
     ,p_event_bind_event_type          => 'PLUGIN_IO_AFW_21_MODFR_MDP|DYNAMIC ACTION|afw_21_actio_dynmq_modfr_mp_afich'
     ,p_event_bind_event_type_custom   => ''
     ,p_event_display_when_type        => ''
     ,p_event_display_when_cond        => ''
     ,p_event_display_when_cond2       => ''
     ,p_event_comment                  => ''
     ,p_action_true_action_sequence    => 1
     ,p_action_true_exec_on_init       => 'N'
     ,p_action_true_action             => 'NATIVE_EXECUTE_PLSQL_CODE'
     ,p_action_true_aff_elems_type     => null);

    apex_050000.wwv_flow_wizard_api.create_page_dynamic_action (
      p_flow_id                        => pnu_numr_apex
     ,p_page_id                        => knu_page_globl
     ,p_event_name                     => 'AFW - Modifier mot de passe (Fermer dialogue)'
     ,p_event_sequence                 => 50
     ,p_event_triggering_elem_type     => 'JQUERY_SELECTOR'
     ,p_event_triggering_region_id     => null
     , --Si jamais il est pour en avoir, corriger manuellement
      p_event_triggering_button_id     => null
     , --Si jamais il est pour en avoir, corriger manuellement
      p_event_triggering_element       => 'div.dialg_modfr_mot_passe div.afw_21_actio_dynmq_dialg'
     ,p_event_triggering_cond_type     => ''
     ,p_event_triggering_expression    => ''
     ,p_event_bind_type                => 'live'
     ,p_event_bind_delegate_to         => ''
     ,p_event_bind_event_type          => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
     ,p_event_bind_event_type_custom   => ''
     ,p_event_display_when_type        => ''
     ,p_event_display_when_cond        => ''
     ,p_event_display_when_cond2       => ''
     ,p_event_comment                  => ''
     ,p_action_true_action_sequence    => 1
     ,p_action_true_exec_on_init       => 'N'
     ,p_action_true_action             => 'NATIVE_EXECUTE_PLSQL_CODE'
     ,p_action_true_aff_elems_type     => null);

    --IL FAUT SUPPRIMER les true events créées (On en a pas besoin, mais la procedure l'exige)
    delete from apex_actio_dynmq_actio ada
          where     ada.flow_id = pnu_numr_apex
                and ada.page_id = knu_page_globl
                and ada.event_id in (select ade.id
                                       from apex_actio_dynmq_evenm ade
                                      where     ade.flow_id = ada.flow_id
                                            and ade.page_id = ada.page_id
                                            and ade.name like 'AFW%');
  exception
    when others
    then
      ete ();
      raise;
  end creer_exten_page_zero;

  procedure creer_exten_actio_page_zero (pnu_numr_apex in number)
  is
  begin
    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,100
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_NAVGT_ENREG'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,90
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_INITL_COMPS'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,70
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_AIDE_PAGE_ITEM'
                ,''
                ,null
                ,null
                ,''
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,80
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_AIDE_PAGE'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,60
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_MENU_REDRC'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,10
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_CONFR_SAUVG'
                ,''
                ,null
                ,null
                ,''
                ,'Êtes-vous certain de vouloir quitter cette page sans sauvegarder les modifications apportées?'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,20
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_DEPSM_TABLR_FORM'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,30
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_NAVGT_TABLR_FORM'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,40
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_GESTN_TABLR_FORM'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,50
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_POPUP_LOV'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,100
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_MODFR_MDP'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW - Commentaires/Bogues (Afficher dialogue)')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,10
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
                ,''
                ,null
                ,null
                ,''
                ,'Ajouter un commentaire et/ou bogue'
                ,''
                ,'640'
                ,'480'
                ,'dialg_comnt_bogue'
                ,''
                ,'N'
                ,'Y'
                ,'N'
                ,''
                ,''
                ,''
                ,'Y'
                ,'afw_11_aplic_pkg.obten_numr_apex_aplic'
                ,'102'
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW - Commentaires/Bogues (Fermer dialogue)')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,10
                ,'N'
                ,'Y'
                ,'NATIVE_EXECUTE_PLSQL_CODE'
                ,''
                ,null
                ,null
                ,''
                ,'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW - Commentaires/Bogues (Fermer dialogue)')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,20
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW - Commentaires/Bogues (Fermer dialogue)')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,30
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW - Modifier mot de passe (Afficher dialogue)')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,10
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
                ,''
                ,null
                ,null
                ,''
                ,'Modifier votre mot de passe'
                ,''
                ,'640'
                ,'480'
                ,'dialg_modfr_mot_passe'
                ,''
                ,'N'
                ,'Y'
                ,'N'
                ,''
                ,''
                ,''
                ,'Y'
                ,'afw_11_aplic_pkg.obten_numr_apex_aplic(afw_11_aplic_pkg.obten_aplic_authe)'
                ,'106'
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW - Modifier mot de passe (Fermer dialogue)')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,10
                ,'N'
                ,'Y'
                ,'NATIVE_EXECUTE_PLSQL_CODE'
                ,''
                ,null
                ,null
                ,''
                ,'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW - Modifier mot de passe (Fermer dialogue)')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,20
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');

    insert into apex_actio_dynmq_actio (event_id
                                       ,flow_id
                                       ,page_id
                                       ,event_result
                                       ,action_sequence
                                       ,execute_on_page_init
                                       ,wait_for_result
                                       ,action
                                       ,affected_elements_type
                                       ,affected_region_id
                                       ,affected_button_id
                                       ,affected_elements
                                       ,attribute_01
                                       ,attribute_02
                                       ,attribute_03
                                       ,attribute_04
                                       ,attribute_05
                                       ,attribute_06
                                       ,attribute_07
                                       ,attribute_08
                                       ,attribute_09
                                       ,attribute_10
                                       ,attribute_11
                                       ,attribute_12
                                       ,attribute_13
                                       ,attribute_14
                                       ,attribute_15
                                       ,stop_execution_on_error
                                       ,da_action_comment)
         values ( (select ade.id
                     from apex_actio_dynmq_evenm ade
                    where     ade.flow_id = pnu_numr_apex
                          and ade.page_id = knu_page_globl
                          and ade.name = 'AFW - Modifier mot de passe (Fermer dialogue)')
                ,pnu_numr_apex
                ,knu_page_globl
                ,'TRUE'
                ,30
                ,'N'
                ,''
                ,'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
                ,''
                ,null
                ,null
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'Y'
                ,'');
  exception
    when others
    then
      ete ();
      raise;
  end creer_exten_actio_page_zero;

  --Produit le minimum pour les regn_plugn (Fil ariane, zone de message, liste de navigation)
  --Le reste des instances (Menu + Recherche?) ne sont pas jugée nécessaires car présent dans guide du développeur
  procedure creer_insta_exten_page_zero (pnu_numr_apex in number)
  is
  begin
    insert into apex_050000.wwv_flow_page_plugs (flow_id
                                                ,page_id
                                                ,plug_name
                                                ,plug_template
                                                ,plug_display_sequence
                                                ,plug_display_column
                                                ,plug_display_point
                                                ,plug_caching
                                                ,escape_on_http_output
                                                ,plug_query_row_template
                                                ,plug_query_headings_type
                                                ,plug_query_num_rows_type
                                                ,pagination_display_position
                                                ,plug_query_row_count_max
                                                ,plug_query_show_nulls_as
                                                ,plug_source_type
                                                ,attribute_01
                                                ,attribute_02
                                                ,attribute_03
                                                ,attribute_04
                                                ,attribute_05
                                                ,attribute_06
                                                ,attribute_07
                                                ,attribute_08
                                                ,attribute_09
                                                ,attribute_10
                                                ,attribute_11
                                                ,attribute_12
                                                ,attribute_13
                                                ,attribute_14
                                                ,attribute_15
                                                ,attribute_16
                                                ,attribute_17
                                                ,attribute_18
                                                ,attribute_19
                                                ,attribute_20
                                                ,attribute_21
                                                ,attribute_22
                                                ,attribute_23
                                                ,attribute_24
                                                ,attribute_25
                                                ,include_in_reg_disp_sel_yn
                                                ,plug_customized
                                                ,translate_title)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'Fil d''ariane'
                ,0
                ,30
                ,1
                ,'REGION_POSITION_01'
                ,'NOCACHE'
                ,'Y'
                ,1
                ,'COLON_DELMITED_LIST'
                ,''
                ,''
                ,500
                ,''
                ,'PLUGIN_IO_AFW_21_REGN_FIL_ARIAN'
                ,'ui-icon-arrowthick-1-e'
                ,''
                ,''
                ,'AVANC'
                ,'Y'
                ,'N'
                ,'Y'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'N'
                ,0
                ,'Y');

    insert into apex_050000.wwv_flow_page_plugs (flow_id
                                                ,page_id
                                                ,plug_name
                                                ,plug_template
                                                ,plug_display_sequence
                                                ,plug_display_column
                                                ,plug_display_point
                                                ,plug_caching
                                                ,escape_on_http_output
                                                ,plug_query_row_template
                                                ,plug_query_headings_type
                                                ,plug_query_num_rows_type
                                                ,pagination_display_position
                                                ,plug_query_row_count_max
                                                ,plug_query_show_nulls_as
                                                ,plug_source_type
                                                ,attribute_01
                                                ,attribute_02
                                                ,attribute_03
                                                ,attribute_04
                                                ,attribute_05
                                                ,attribute_06
                                                ,attribute_07
                                                ,attribute_08
                                                ,attribute_09
                                                ,attribute_10
                                                ,attribute_11
                                                ,attribute_12
                                                ,attribute_13
                                                ,attribute_14
                                                ,attribute_15
                                                ,attribute_16
                                                ,attribute_17
                                                ,attribute_18
                                                ,attribute_19
                                                ,attribute_20
                                                ,attribute_21
                                                ,attribute_22
                                                ,attribute_23
                                                ,attribute_24
                                                ,attribute_25
                                                ,include_in_reg_disp_sel_yn
                                                ,plug_customized
                                                ,translate_title)
         values (pnu_numr_apex
                ,knu_page_globl
                ,'Messages Informatifs'
                ,0
                ,70
                ,1
                ,'REGION_POSITION_07'
                ,'NOCACHE'
                ,'Y'
                ,1
                ,'COLON_DELMITED_LIST'
                ,''
                ,''
                ,500
                ,''
                ,'PLUGIN_IO_AFW_21_REGN_PILE_MESG'
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,''
                ,'N'
                ,0
                ,'Y');
  exception
    when others
    then
      ete ();
      raise;
  end creer_insta_exten_page_zero;

  procedure creer_redrc_page_conxn (pnu_numr_apex in number)
  is
  begin
    apex_050000.wwv_flow_api.create_page_process (p_id                        => null
                                                 ,p_flow_id                   => pnu_numr_apex
                                                 ,p_flow_step_id              => knu_page_conxn
                                                 ,p_process_sequence          => 60
                                                 ,p_process_point             => 'BEFORE_HEADER'
                                                 ,p_region_id                 => null
                                                 ,p_process_type              => 'PLSQL'
                                                 ,p_process_name              => 'AFW - Redirection vers le produit d''authentification'
                                                 ,p_process_sql               => 'afw_12_authe_apex_pkg.redrg_prodt_authe;'
                                                 ,p_attribute_01              => ''
                                                 ,p_attribute_02              => ''
                                                 ,p_attribute_03              => ''
                                                 ,p_attribute_04              => ''
                                                 ,p_attribute_05              => ''
                                                 ,p_attribute_06              => ''
                                                 ,p_attribute_07              => ''
                                                 ,p_attribute_08              => ''
                                                 ,p_attribute_09              => ''
                                                 ,p_attribute_10              => ''
                                                 ,p_attribute_11              => ''
                                                 ,p_attribute_12              => ''
                                                 ,p_attribute_13              => ''
                                                 ,p_attribute_14              => ''
                                                 ,p_attribute_15              => ''
                                                 ,p_process_item_name         => ''
                                                 ,p_process_error_message     => ''
                                                 ,p_error_display_location    => 'ON_ERROR_PAGE'
                                                 ,p_process_when_button_id    => null
                                                 ,p_process_when              => ''
                                                 ,p_process_when2             => ''
                                                 ,p_process_when_type         => ''
                                                 ,p_exec_cond_for_each_row    => ''
                                                 ,p_only_for_changed_rows     => ''
                                                 ,p_process_success_message   => ''
                                                 ,p_required_patch            => null
                                                 ,p_process_comment           => null);
  end creer_redrc_page_conxn;

  procedure creer_conxn_page_conxn (pnu_numr_apex in number)
  is
  begin
    apex_050000.wwv_flow_api.create_page_process (p_id                        => null
                                                 ,p_flow_id                   => pnu_numr_apex
                                                 ,p_flow_step_id              => knu_page_conxn
                                                 ,p_process_sequence          => 30
                                                 ,p_process_point             => 'AFTER_SUBMIT'
                                                 ,p_region_id                 => null
                                                 ,p_process_type              => 'PLSQL'
                                                 ,p_process_name              => 'AFW - Connexion'
                                                 ,p_process_sql               => 'begin
  afw_12_authe_apex_pkg.exect_procd_persn();

  afw_12_authe_apex_pkg.authe_redrg (
    pva_code_utils        => :p101_code_utils,
    pva_mot_passe         => :p101_mot_passe,
    pva_domn              => :p101_domn,
    pnu_numr_apex_aplic   => afw_07_sesn_pkg.obten_valr_sesn (
                              ''s_authe_cible_numr_apex_aplic''),
    pnu_numr_apex_page    => afw_07_sesn_pkg.obten_valr_sesn (
                              ''s_authe_cible_numr_apex_page''),
    pbo_indic_forcr_sspc  => true,
    pbo_indic_forcr_sidf  => true,
    pva_scpc              => afw_07_sesn_pkg.obten_valr_sesn (
                              ''s_authe_cible_scpc''),
    pnu_sspc              => afw_07_sesn_pkg.obten_valr_sesn (
                              ''s_authe_cible_sspc''),
    pva_sapc              => afw_07_sesn_pkg.obten_valr_sesn (
                              ''s_authe_cible_sapc''),
    pva_scpi              => afw_07_sesn_pkg.obten_valr_sesn (
                              ''s_authe_cible_scpi''),
    pnu_sspi              => afw_07_sesn_pkg.obten_valr_sesn (
                              ''s_authe_cible_sspi''),
    pva_sapi              => afw_07_sesn_pkg.obten_valr_sesn (
                              ''s_authe_cible_sapi''),
    pnu_snpi              => afw_07_sesn_pkg.obten_valr_sesn (
                              ''s_authe_cible_snpi''),
    pnu_sidf              => afw_07_sesn_pkg.obten_valr_sesn (
                              ''s_authe_cible_sidf''));
end;'
                                                 ,p_attribute_01              => ''
                                                 ,p_attribute_02              => ''
                                                 ,p_attribute_03              => ''
                                                 ,p_attribute_04              => ''
                                                 ,p_attribute_05              => ''
                                                 ,p_attribute_06              => ''
                                                 ,p_attribute_07              => ''
                                                 ,p_attribute_08              => ''
                                                 ,p_attribute_09              => ''
                                                 ,p_attribute_10              => ''
                                                 ,p_attribute_11              => ''
                                                 ,p_attribute_12              => ''
                                                 ,p_attribute_13              => ''
                                                 ,p_attribute_14              => ''
                                                 ,p_attribute_15              => ''
                                                 ,p_process_item_name         => ''
                                                 ,p_process_error_message     => ''
                                                 ,p_error_display_location    => 'INLINE_IN_NOTIFICATION'
                                                 ,p_process_when_button_id    => null
                                                 ,p_process_when              => ''
                                                 ,p_process_when2             => ''
                                                 ,p_process_when_type         => ''
                                                 ,p_exec_cond_for_each_row    => ''
                                                 ,p_only_for_changed_rows     => ''
                                                 ,p_process_success_message   => ''
                                                 ,p_required_patch            => null
                                                 ,p_process_comment           => null);
  end creer_conxn_page_conxn;

  procedure insta_afw_aplic_apex (pnu_id_apex in number)
  is
  begin
    if not verfr_page_globl (pnu_id_apex)
    then
      raise gex_page_globl_non_trouv;
    elsif not verfr_page_conxn (pnu_id_apex)
    then
      raise gex_page_conxn_non_trouv;
    end if;

    if not afw_deja_insta (pnu_id_apex)
    then
      --Définir le groupe de sécurité pour le vpd apex (security_group_id)
      defnr_secrt_group_id (pnu_id_apex);

      creer_item_aplic (pnu_id_apex);

      creer_regn_page_zero (pnu_id_apex);

      creer_item_page_zero (pnu_id_apex);

      creer_procs (pnu_id_apex);

      creer_racrc (pnu_id_apex);

      creer_exten (pnu_id_apex);

      creer_exten_page_zero (pnu_id_apex);

      creer_exten_actio_page_zero (pnu_id_apex);

      creer_insta_exten_page_zero (pnu_id_apex);

      --Créer les autorizations schemes et authentifications schemes à partir des plugins nouvellements créés
      --Voir p-e même les sélectionner en tant que PAR DÉFAUT
      creer_autor_schem (pnu_id_apex);

      creer_authe_schem (pnu_id_apex);

      creer_redrc_page_conxn (pnu_id_apex);

      creer_conxn_page_conxn (pnu_id_apex);

      --Pour finir, ajuster les proprietes de l'application
      ajust_propr_aplic (pnu_id_apex);

      ete (kva_mesg_afw_insta_termn);
    else
      ete (kva_mesg_afw_insta);
    end if;
  exception
    when gex_page_globl_non_trouv
    then
      ete ('Page commune (Global page) non trouvee.  Veuillez creer la page ou definir la variable "knu_page_globl" selon la page existante.'
          ,   'Valeur courante:'
           || knu_page_globl);
      raise;
    when gex_page_conxn_non_trouv
    then
      ete ('Page connexion (Login page) non trouvee.  Veuillez creer la page ou definir la variable "knu_page_conxn" selon la page existante.'
          ,   'Valeur courante:'
           || knu_page_conxn);
      raise;
    when others
    then
      ete ();
      raise;
  end insta_afw_aplic_apex;

  procedure anals_versn_plugn (pnu_id_apex in number)
  is
    cursor cur_plugn
    is
        select *
          from apex_050000.wwv_flow_plugins fp
         where     fp.flow_id = pnu_id_apex
               and fp.name like 'IO_AFW_%'
      order by fp.name;

    vva_code_aplic_safp   varchar2 (23) default 'SAFP';
    vnu_numr_aplic_safp   number default afw_11_aplic_pkg.obten_numr_apex_aplic (vva_code_aplic_safp);

    cursor cur_plugn_afw (vva_nom_plugn in varchar2)
    is
      select *
        from apex_050000.wwv_flow_plugins fp
       where     fp.flow_id = vnu_numr_aplic_safp
             and fp.name = vva_nom_plugn;
  begin
    ete ('-- Analyse du versionnage des plugins AFW --'
        ,   'Application: '
         || pnu_id_apex);

    for rec_plugn in cur_plugn
    loop
      ete (   'Comparation plugin '
           || rec_plugn.name
          ,   'Nom: '
           || rec_plugn.display_name);

      for rec_afw in cur_plugn_afw (rec_plugn.name)
      loop
        --Pour l'instant, ne valider que si les versions concordent.
        if rec_afw.version_identifier <> rec_plugn.version_identifier
        then
          ete (   'Version non correspondante.  Veuillez exporter/importer "'
               || rec_plugn.display_name
               || '" de l''application '
               || vva_code_aplic_safp
               || '.');
        else
          ete ('Version identique.');
        end if;
      end loop;
    end loop;
  end anals_versn_plugn;

  --On suppose que l'installation du framework a été exécuté SANS l'ajout des events / attributes
  procedure maj_evenm_atrib_plugn (pnu_numr_apex in number)
  is
    cursor cur_plugn
    is
      select fp.id
            ,fp.name
        from apex_050000.wwv_flow_plugins fp
       where     fp.flow_id = pnu_numr_apex
             and fp.name like 'IO_AFW_%';
  begin
    defnr_secrt_group_id (pnu_numr_apex);

    --Alimenter le tableau des plugins (ID)
    for rec_plugn in cur_plugn
    loop
      gta_id_plugn (rec_plugn.name)   := rec_plugn.id;
    end loop;

    creer_plugn_evenm (pnu_numr_apex);

    creer_plugn_fichr (pnu_numr_apex);

    creer_plugn_optio (pnu_numr_apex);

    creer_plugn_atrib (pnu_numr_apex);

    creer_plugn_valr_atrib (pnu_numr_apex);
  end maj_evenm_atrib_plugn;
end afw_11_insta_afw_pkg;
/
