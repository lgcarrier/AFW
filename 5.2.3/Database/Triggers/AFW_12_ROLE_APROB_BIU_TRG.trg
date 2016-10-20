SET DEFINE OFF;
create or replace trigger afw_12_role_aprob_biu_trg
  before insert or update
  on afw_12_role_aprob
  for each row
begin
  if inserting
  then
    :new.seqnc   := afw_12_role_aprob_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if :new.code is null
  then
    :new.code   := :new.seqnc;
  end if;
end afw_12_role_aprob_biu_trg;
/
