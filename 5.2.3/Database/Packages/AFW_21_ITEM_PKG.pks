SET DEFINE OFF;
create or replace package afw_21_item_pkg
  authid current_user
is
  type typ_code_plugn is table of varchar2 (30)
    index by varchar2 (30);

  gta_code_plugn   typ_code_plugn;

  function valdr_prise_charg (pva_code_plugn in varchar2)
    return boolean;

  function genr_plugn_item_masq (p_item                  in apex_plugin.t_page_item
                                ,p_plugin                in apex_plugin.t_plugin
                                ,p_value                 in varchar2
                                ,p_is_readonly           in boolean
                                ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result;

  function genr_plugn_item_popup_arbor (p_item                  in apex_plugin.t_page_item
                                       ,p_plugin                in apex_plugin.t_plugin
                                       ,p_value                 in varchar2
                                       ,p_is_readonly           in boolean
                                       ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result;

  function genr_champ_rechr (p_item                  in apex_plugin.t_page_item
                            ,p_plugin                in apex_plugin.t_plugin
                            ,p_value                 in varchar2
                            ,p_is_readonly           in boolean
                            ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result;

  function ajax_champ_rechr (p_item     in apex_plugin.t_page_item
                            ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result;

  function genr_selct_2 (p_item                  in apex_plugin.t_page_item
                        ,p_plugin                in apex_plugin.t_plugin
                        ,p_value                 in varchar2
                        ,p_is_readonly           in boolean
                        ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result;

  function ajax_selct_2 (p_item     in apex_plugin.t_page_item
                        ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result;

  function genr_favr (p_item                  in apex_plugin.t_page_item
                     ,p_plugin                in apex_plugin.t_plugin
                     ,p_value                 in varchar2
                     ,p_is_readonly           in boolean
                     ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result;

  function ajax_favr (p_item     in apex_plugin.t_page_item
                     ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result;

  function genr_bascl_favr (p_item                  in apex_plugin.t_page_item
                           ,p_plugin                in apex_plugin.t_plugin
                           ,p_value                 in varchar2
                           ,p_is_readonly           in boolean
                           ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result;

  function ajax_bascl_favr (p_item     in apex_plugin.t_page_item
                           ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result;

  function genr_tradc_champ (p_item                  in apex_plugin.t_page_item
                            ,p_plugin                in apex_plugin.t_plugin
                            ,p_value                 in varchar2
                            ,p_is_readonly           in boolean
                            ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result;

  function ajax_tradc_champ (p_item     in apex_plugin.t_page_item
                            ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result;

  function genr_item_choix_aprob (p_item                  in apex_plugin.t_page_item
                                 ,p_plugin                in apex_plugin.t_plugin
                                 ,p_value                 in varchar2
                                 ,p_is_readonly           in boolean
                                 ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result;

  function ajax_item_choix_aprob (p_item     in apex_plugin.t_page_item
                                 ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result;

  function genr_check (p_item                  in apex_plugin.t_page_item
                      ,p_plugin                in apex_plugin.t_plugin
                      ,p_value                 in varchar2
                      ,p_is_readonly           in boolean
                      ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result;

  function ajax_check (p_item     in apex_plugin.t_page_item
                      ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result;
end afw_21_item_pkg;
/
