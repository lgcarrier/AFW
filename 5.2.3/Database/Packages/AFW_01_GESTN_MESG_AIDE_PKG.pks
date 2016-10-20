SET DEFINE OFF;
create or replace package afw_01_gestn_mesg_aide_pkg
is
  function obten_aide_page_item (pnu_numr_apex_page_item in number)
    return varchar2;

  function obten_aide_coln_ir (p_sesn        in number
                              ,p_ir_id       in number
                              ,p_ir_col_id   in varchar2)
    return varchar2;
end afw_01_gestn_mesg_aide_pkg;
/
