SET DEFINE OFF;
create or replace package afw_13_page_pkg
as
  type typ_info_extra is record
  (
    va_cache      varchar2 (5)
   ,va_schem      varchar2 (30)
   ,va_table      varchar2 (30)
   ,va_item_pk1   varchar2 (100)
   ,va_coln_pk1   varchar2 (30)
   ,va_item_pk2   varchar2 (100)
   ,va_coln_pk2   varchar2 (30)
  );

  procedure maj_pages_refrt_apex (pnu_ref_aplic in number default null);

  procedure maj_page_refrt_apex (pnu_page in number);

  procedure maj_table_a_partr_refrt_apex (pnu_ref_aplic     in number default null
                                         ,pva_indic_migrt   in varchar2 default 'N');

  function genr_elemn_liste_navgt
    return varchar2;

  procedure reint_exclu_liste_navgt;

  procedure ajout_exclu_liste_navgt (pva_code_elemn_navgt in varchar2);

  procedure cachr_liste_navgt;

  procedure forcr_afich_liste_navgt;

  procedure tradc_raprt_intrc;

  function obten_titre_page_lang
    return varchar2;

  function obten_page_sesn
    return number;

  function obten_page_zero_sesn
    return number;

  function obten_struc_aplic (pnu_page in number)
    return number;

  function obten_numr_apex_page (pnu_page in number default null)
    return number;

  function obten_info_extra (pnu_app_id        in number
                            ,pnu_app_page_id   in number)
    return typ_info_extra;

  function obten_info_extra (pnu_ref_page number default null)
    return typ_info_extra;

  function exist_info_extra (pnu_app_id        in number
                            ,pnu_app_page_id   in number)
    return boolean;

  function exist_info_extra (pnu_ref_page number default null)
    return boolean;

  function exist_info_extra_va (pnu_ref_page number default null)
    return varchar2;

  function obten_page_rechr (pnu_ref_page number default null)
    return number;

  function est_page_rechr (pnu_ref_page in number)
    return boolean;

  function obten_opert_dml (pva_reqt in varchar2 default null)
    return varchar2;

  function est_opert_inser (pva_reqt in varchar2 default null)
    return boolean;

  function est_opert_updat (pva_reqt in varchar2 default null)
    return boolean;

  function est_opert_delt (pva_reqt in varchar2 default null)
    return boolean;

  function est_opert_inser_va (pva_reqt in varchar2 default null)
    return varchar2;

  function est_opert_updat_va (pva_reqt in varchar2 default null)
    return varchar2;

  function est_opert_delt_va (pva_reqt in varchar2 default null)
    return varchar2;

  procedure chang_modl_page (pnu_numr_apex     in number
                            ,pnu_page_apex     in number
                            ,pnu_templ_initl   in number
                            ,pnu_templ_final   in number);

  function obten_mesg_confr_suprs
    return varchar2;

  procedure defnr_item_aplic_apex;

  function obten_icone_editn
    return varchar2;

  function obten_icone_consl
    return varchar2;

  function obten_lien_editn_raprt
    return varchar2;

  function obten_modl_mesg_sucs (pnu_page    in number default null
                                ,pnu_aplic   in number default afw_11_aplic_pkg.obten_aplic_sesn)
    return varchar2;

  function obten_modl_mesg_ereur (pnu_page    in number default null
                                 ,pnu_aplic   in number default afw_11_aplic_pkg.obten_aplic_sesn)
    return varchar2;

  function obten_nom_modl_page (pnu_page    in number default null
                               ,pnu_aplic   in number default afw_11_aplic_pkg.obten_aplic_sesn)
    return varchar2;

  function obten_page_ir (pnu_page in number)
    return number;

  procedure reint_soums_page (pnu_numr_apex_aplic   in number
                             ,pnu_numr_apex_page    in number
                             ,pnu_sesn              in number default afw_12_sesn_pkg.obten_sesn);

  function obten_page (pnu_numr_page_apex    in vd_i_afw_13_page.numr_apex%type
                      ,pnu_numr_aplic_apex   in vd_i_afw_11_aplic.numr_aplic_apex%type)
    return vd_i_afw_13_page.seqnc%type;

  function obten_icone_font_awesm (pnu_page in vd_i_afw_13_page.seqnc%type default obten_page_sesn)
    return varchar2;

  function exist_tutrl (pnu_page in vd_afw_13_page.seqnc%type default afw_13_page_pkg.obten_page_sesn)
    return boolean;
end afw_13_page_pkg;
/
