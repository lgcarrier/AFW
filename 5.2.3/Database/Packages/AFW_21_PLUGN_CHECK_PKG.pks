SET DEFINE OFF;
create or replace package afw_21_plugn_check_pkg
is
  procedure genr_item_check (p_item    in apex_plugin.t_page_item
                            ,p_value   in varchar2);
end afw_21_plugn_check_pkg;
/
