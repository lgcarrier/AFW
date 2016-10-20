SET DEFINE OFF;
create or replace trigger afw_12_ip_aprob_stat_ai_trg
  after insert
  on afw_12_insta_procs_aprob_stat
  for each row
begin
  if :new.date_fin_efect is null
  then
    afw_09_pile_pkg.empil_numbr ('EVOLT_STAT'
                                ,:new.seqnc);
  end if;
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_ip_aprob_stat_ai_trg;
/
