SET DEFINE OFF;
create or replace trigger afw_25_journ_travl_exe_biu_trg
  before insert or update
  on afw_25_journ_travl_exect
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_25_journ_travl_exect_seq.nextval;
  end if;
end afw_25_journ_travl_exe_biu_trg;
/
