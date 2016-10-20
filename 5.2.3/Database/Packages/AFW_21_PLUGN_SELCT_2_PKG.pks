SET DEFINE OFF;
create or replace package afw_21_plugn_selct_2_pkg
is
  procedure genr_item_tag (p_item    in apex_plugin.t_page_item
                          ,p_value   in varchar2);

  procedure genr_item_selct (p_item    in apex_plugin.t_page_item
                            ,p_value   in varchar2);

  procedure genr_item_lectr_seule (p_item                  in apex_plugin.t_page_item
                                  ,p_value                 in varchar2
                                  ,p_is_readonly           in boolean
                                  ,p_is_printer_friendly   in boolean);

  procedure genr_json_rechr_lov (p_item in apex_plugin.t_page_item);

  procedure genr_json_initl_selct_lov (p_item in apex_plugin.t_page_item);
end afw_21_plugn_selct_2_pkg;
/
