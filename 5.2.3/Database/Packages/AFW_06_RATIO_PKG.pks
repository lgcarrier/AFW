SET DEFINE OFF;
create or replace package afw_06_ratio_pkg
is
  function resdr_ratio (pnu_valr    in number
                       ,pva_ratio   in varchar2)
    return number;
end afw_06_ratio_pkg;
/
