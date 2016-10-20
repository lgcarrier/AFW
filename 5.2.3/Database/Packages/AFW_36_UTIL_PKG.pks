SET DEFINE OFF;
create or replace package afw_36_util_pkg
as
  function obten_valr_vue_afich (pnu_numr_page in number default afw_13_page_pkg.obten_numr_apex_page)
    return varchar2;
end afw_36_util_pkg;
/
