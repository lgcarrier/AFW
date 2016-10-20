SET DEFINE OFF;
create or replace package afw_25_plpdf_util_pkg
is
  function convr (pnu_mesr         in number
                 ,pva_unite_mesr   in varchar2)
    return number;
end afw_25_plpdf_util_pkg;
/
