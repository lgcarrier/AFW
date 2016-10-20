SET DEFINE OFF;
create or replace package afw_25_travl_publc_cu_pkg
  authid current_user
is
  function obten_pdf (pnu_travl         in number
                     ,pnu_publc_travl   in number
                     ,pva_iden_procd    in varchar2)
    return blob;
end afw_25_travl_publc_cu_pkg;
/
