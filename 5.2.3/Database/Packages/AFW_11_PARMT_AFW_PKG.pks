SET DEFINE OFF;
create or replace package afw_11_parmt_afw_pkg
is
  function obten_valr_parmt (pva_code_parmt in varchar)
    return varchar2;
end afw_11_parmt_afw_pkg;
/
