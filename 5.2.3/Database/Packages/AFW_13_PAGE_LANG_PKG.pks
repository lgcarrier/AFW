SET DEFINE OFF;
create or replace package afw_13_page_lang_pkg
  authid current_user
as
  gva_libl   varchar2 (4000) default null;

  function genr_libl_page (pnu_numr_page_apex    in number
                          ,pnu_lang              in number default afw_01_lang_pkg.obten_lang_sesn ()
                          ,pnu_numr_aplic_apex   in number default afw_11_aplic_pkg.obten_numr_apex_aplic)
    return varchar2;
end afw_13_page_lang_pkg;
/
