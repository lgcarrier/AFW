SET DEFINE OFF;
create or replace package afw_12_evolt_stat_pkg
as
  function obten_stat (pnu_evolt_stat in number)
    return number;

  function obten_stat_evolt (pnu_evolt_stat in number)
    return number;
end afw_12_evolt_stat_pkg;
/
