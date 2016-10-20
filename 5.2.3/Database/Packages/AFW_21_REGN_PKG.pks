SET DEFINE OFF;
create or replace package afw_21_regn_pkg
  authid current_user
is
  type typ_code_plugn is table of varchar2 (30)
    index by varchar2 (30);

  gta_code_plugn   typ_code_plugn;

  function valdr_prise_charg (pva_code_plugn in varchar2)
    return boolean;

  function genr_plugn_regn_arbre (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function ajax_plugn_regn_arbre (p_region   in afw_21_util_pkg.t_regn
                                 ,p_plugin   in afw_21_util_pkg.t_plugn)
    return afw_21_util_pkg.t_regn_ajax_reslt;

  function genr_plugn_regn_calnd (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function ajax_plugn_regn_calnd (p_region   in afw_21_util_pkg.t_regn
                                 ,p_plugin   in afw_21_util_pkg.t_plugn)
    return afw_21_util_pkg.t_regn_ajax_reslt;

  function genr_plugn_regn_barre_rechr_ir (p_region                in afw_21_util_pkg.t_regn
                                          ,p_plugin                in afw_21_util_pkg.t_plugn
                                          ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_plugn_regn_acord (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_plugn_regn_acord_enfan (p_region                in afw_21_util_pkg.t_regn
                                       ,p_plugin                in afw_21_util_pkg.t_plugn
                                       ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_plugn_regn_dialg (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_plugn_regn_drop (p_region                in afw_21_util_pkg.t_regn
                                ,p_plugin                in afw_21_util_pkg.t_plugn
                                ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_domn_contx_autor (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function ajax_domn_contx_autor (p_region   in afw_21_util_pkg.t_regn
                                 ,p_plugin   in afw_21_util_pkg.t_plugn)
    return afw_21_util_pkg.t_regn_ajax_reslt;

  function genr_afw_04_fil_arian (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_afw_01_err_apex (p_region                in afw_21_util_pkg.t_regn
                                ,p_plugin                in afw_21_util_pkg.t_plugn
                                ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_afw_01_afich_mesg (p_region                in afw_21_util_pkg.t_regn
                                  ,p_plugin                in afw_21_util_pkg.t_plugn
                                  ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_afw_13_menu (p_region                in afw_21_util_pkg.t_regn
                            ,p_plugin                in afw_21_util_pkg.t_plugn
                            ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_afw_13_menu_smart_admin (p_region                in afw_21_util_pkg.t_regn
                                        ,p_plugin                in afw_21_util_pkg.t_plugn
                                        ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_menu_plein_ecran (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_afw_13_liste_navgt (p_region                in afw_21_util_pkg.t_regn
                                   ,p_plugin                in afw_21_util_pkg.t_plugn
                                   ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_aide_page (p_region                in afw_21_util_pkg.t_regn
                          ,p_plugin                in afw_21_util_pkg.t_plugn
                          ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function ajax_aide_page (p_region   in afw_21_util_pkg.t_regn
                          ,p_plugin   in afw_21_util_pkg.t_plugn)
    return afw_21_util_pkg.t_regn_ajax_reslt;

  function genr_ifram (p_region                in afw_21_util_pkg.t_regn
                      ,p_plugin                in afw_21_util_pkg.t_plugn
                      ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_telvr_fichr (p_region                in afw_21_util_pkg.t_regn
                            ,p_plugin                in afw_21_util_pkg.t_plugn
                            ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_time_line (p_region                in afw_21_util_pkg.t_regn
                          ,p_plugin                in afw_21_util_pkg.t_plugn
                          ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genr_gantt (p_region                in afw_21_util_pkg.t_regn
                      ,p_plugin                in afw_21_util_pkg.t_plugn
                      ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;

  function genrt_pdf (p_region                in afw_21_util_pkg.t_regn
                     ,p_plugin                in afw_21_util_pkg.t_plugn
                     ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt;
end afw_21_regn_pkg;
/
