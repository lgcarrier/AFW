SET DEFINE OFF;
create or replace trigger afw_12_ip_aprob_stat_bi_97_trg
  before insert
  on afw_12_insta_procs_aprob_stat
  for each row
begin
  if :new.dnr_ref_domn is null
  then
    :new.dnr_ref_domn   := afw_04_contx_pkg.obten_seqnc_contx ('DOMN');
  end if;
end afw_12_ip_aprob_stat_bi_97_trg;
/
