SET DEFINE OFF;
create or replace trigger afw_01_modl_mesg_notfc_biu_trg
  before insert or update
  on afw_01_modl_mesg_notfc
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_01_modl_mesg_notfc_seq.nextval;
  end if;
end afw_01_modl_mesg_notfc_biu_trg;
/
