SET DEFINE OFF;
create or replace package afw_21_util_pkg
  authid current_user
is
  subtype t_plugn is apex_plugin.t_plugin;

  subtype t_actn_dynmq is apex_plugin.t_dynamic_action;

  subtype t_page_item is apex_plugin.t_page_item;

  subtype t_regn is apex_plugin.t_region;

  subtype t_regn_rendr_reslt is apex_plugin.t_region_render_result;

  subtype t_regn_ajax_reslt is apex_plugin.t_region_ajax_result;

  --Constante pour obten_confg_plugn (À partir de WWV_FLOW_LIST_OF_VALUES_DATA)
  kva_type_plugn_actio_dynmq   constant varchar2 (50) default 'DYNAMIC ACTION';
  kva_type_plugn_regn          constant varchar2 (50) default 'REGION TYPE';
  kva_type_plugn_item          constant varchar2 (50) default 'ITEM TYPE';


  procedure debug_actio_dynmq (p_dynamic_action   in t_actn_dynmq
                              ,p_plugin           in t_plugn);

  procedure debug_page_item (p_page_item               in t_page_item
                            ,p_plugin                  in t_plugn
                            ,pva_value                 in varchar2
                            ,pbo_is_readonly           in boolean
                            ,pbo_is_printer_friendly   in boolean);

  procedure ajout_libr_javsc (pva_nom          in varchar2
                             ,pva_reprt        in varchar2 default    afw_11_prodt_pkg.obten_dosr_fichr_afw
                                                                   || 'assets/js/'
                             ,pva_versn        in varchar2 default    '?v='
                                                                   || afw_11_prodt_pkg.obten_numr_versn_prodt_afw
                             ,pbo_saut_extns   in boolean default true
                             ,pbo_exten_mini   in boolean default false);

  procedure ajout_code_javsc_charg (pva_code   in varchar2
                                   ,pva_cle    in varchar2 default null);

  procedure ajout_libr_css (pva_nom          in varchar2
                           ,pva_reprt        in varchar2 default    afw_11_prodt_pkg.obten_dosr_fichr_afw
                                                                 || 'assets/css/'
                           ,pva_versn        in varchar2 default    '?v='
                                                                 || afw_11_prodt_pkg.obten_numr_versn_prodt_afw
                           ,pbo_saut_extns   in boolean default true);

  procedure ajout_css (pva_style            in varchar2
                      ,pbo_inser_en_ligne   in boolean default true);

  procedure formt_url_fichr (pva_url         in     varchar2
                            ,pva_reprt       in out varchar2
                            ,pva_nom_fichr   in out varchar2
                            ,pva_extns       in out varchar2);

  procedure ecrir_item_input (p_item            in t_page_item
                             ,p_plugin          in t_plugn
                             ,pva_value         in varchar2
                             ,pva_type_input    in varchar2
                             ,pvc_clas_css      in apex_application_global.vc_arr2
                             ,pva_place_holdr   in varchar2 default null
                             ,pnu_nombr_reslt   in number default null);

  procedure ecrir_item_input_lectr_seule (p_item         in t_page_item
                                         ,p_plugin       in t_plugn
                                         ,pva_value      in varchar2
                                         ,pvc_clas_css   in apex_application_global.vc_arr2);

  procedure ecrir_item_input_mode_imprs (p_item      in t_page_item
                                        ,p_plugin    in t_plugn
                                        ,pva_value   in varchar2);

  procedure ecrir_item_input_popup_arbor (p_item                         in t_page_item
                                         ,p_plugin                       in t_plugn
                                         ,pva_value                      in varchar2
                                         ,pva_type_input                 in varchar2
                                         ,pvc_clas_css_input             in apex_application_global.vc_arr2
                                         ,pva_logo_ouvr_popup            in varchar2
                                         ,pvc_clas_css_logo_ouvr_popup   in apex_application_global.vc_arr2);

  function obten_reslt_expre_plsql (pva_expre_plsql in varchar2)
    return varchar2;

  function obten_reslt_expre_plsql_date (pva_expre_plsql in varchar2)
    return date;

  function obten_reslt_expre_plsql_numbr (pva_expre_plsql in varchar2)
    return number;

  function obten_reslt_expre_plsql_boln (pva_expre_plsql in varchar2)
    return boolean;

  function obten_reslt_expre_plsql_boln_v (pva_expre_plsql in varchar2)
    return varchar2;

  function formt_plugn_atrib_boln (pva_atrib_boln in varchar2)
    return boolean;

  function obten_tabl_javsc_liste_items (pva_liste_items   in varchar2
                                        ,pva_seprt         in varchar2 default ',')
    return varchar2;

  function ajout_atrib_tabl_javsc (pva_nom_atrib          in varchar2
                                  ,pva_tabl_javsc         in varchar2
                                  ,pbo_pas_afich_si_nul   in boolean default true
                                  ,pbo_afich_virgl        in boolean default true)
    return varchar2;

  function ajout_atrib_objet_javsc (pva_nom_atrib          in varchar2
                                   ,pva_objet_javsc        in varchar2
                                   ,pbo_pas_afich_si_nul   in boolean default true
                                   ,pbo_afich_virgl        in boolean default true)
    return varchar2;

  function ajout_atrib_fonct_javsc (pva_nom_atrib          in varchar2
                                   ,pva_fonct_javsc        in varchar2
                                   ,pbo_pas_afich_si_nul   in boolean default true
                                   ,pbo_afich_virgl        in boolean default true)
    return varchar2;

  procedure ecrir_json_ereur (pva_sourc   in varchar2
                             ,pva_code    in varchar2
                             ,pva_mesg    in varchar2);

  function obten_confg_plugn (pva_type_plugn        in varchar2
                             ,pva_nom_plugn         in varchar2
                             ,pnu_numr_apex_aplic   in number default null)
    return t_plugn;
end afw_21_util_pkg;
/
