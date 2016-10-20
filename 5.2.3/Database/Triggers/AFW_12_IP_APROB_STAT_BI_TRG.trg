SET DEFINE OFF;
create or replace trigger afw_12_ip_aprob_stat_bi_trg
  before insert or update
  on afw_12_insta_procs_aprob_stat
  for each row
begin
  if inserting
  then
    :new.seqnc   := afw_12_ip_aprob_stat_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_12_ip_aprob_stat_bi_trg;
/
