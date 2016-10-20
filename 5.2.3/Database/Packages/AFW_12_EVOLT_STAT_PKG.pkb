SET DEFINE OFF;
create or replace package body afw_12_evolt_stat_pkg
as
  function obten_stat (pnu_evolt_stat in number)
    return number
  is
    vnu_stat   vd_i_afw_12_evolt_stat.ref_stat%type;
  begin
    select ref_stat
      into vnu_stat
      from vd_i_afw_12_evolt_stat es
     where es.seqnc = pnu_evolt_stat;

    return vnu_stat;
  end obten_stat;

  function obten_stat_evolt (pnu_evolt_stat in number)
    return number
  is
    vnu_stat_evolt   vd_i_afw_12_evolt_stat.ref_stat_evolt%type;
  begin
    select ref_stat_evolt
      into vnu_stat_evolt
      from vd_i_afw_12_evolt_stat es
     where es.seqnc = pnu_evolt_stat;

    return vnu_stat_evolt;
  end obten_stat_evolt;
end afw_12_evolt_stat_pkg;
/
