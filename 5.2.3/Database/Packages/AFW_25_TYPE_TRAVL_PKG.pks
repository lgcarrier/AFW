SET DEFINE OFF;
create or replace package afw_25_type_travl_pkg
is
  function obten_seqnc (pnu_domn   in number
                       ,pva_code   in varchar2)
    return vd_afw_25_type_publc.seqnc%type;
end afw_25_type_travl_pkg;
/
