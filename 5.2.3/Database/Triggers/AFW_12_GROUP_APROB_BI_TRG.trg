SET DEFINE OFF;
create or replace trigger afw_12_group_aprob_bi_trg
  before insert
  on afw_12_group_aprob
  for each row
begin
  if inserting
  then
    :new.seqnc   := afw_12_group_aprob_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_12_group_aprob_bi_trg;
/
