SET DEFINE OFF;
create or replace trigger afw_14_formt_biu_trg
  before insert or update
  on afw_14_formt
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_14_formt_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_14_formt_biu_trg;
/
