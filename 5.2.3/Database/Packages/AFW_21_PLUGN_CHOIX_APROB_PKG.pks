SET DEFINE OFF;
create or replace package afw_21_plugn_choix_aprob_pkg
as
  kva_id_dialg   constant varchar2 (23) default '_DIALG';

  procedure genr_item (p_item    in apex_plugin.t_page_item
                      ,p_value   in varchar2);

  procedure genr_item_lectr_seule (p_item                  in apex_plugin.t_page_item
                                  ,p_value                 in varchar2
                                  ,p_is_readonly           in boolean
                                  ,p_is_printer_friendly   in boolean);
end afw_21_plugn_choix_aprob_pkg;
/
