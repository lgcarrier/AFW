SET DEFINE OFF;
create or replace trigger afw_12_ip_aprob_stat_bsi_trg
  before insert
  on afw_12_insta_procs_aprob_stat
begin
  afw_09_pile_pkg.init_pile ('EVOLT_STAT');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_ip_aprob_stat_bsi_trg;
/
