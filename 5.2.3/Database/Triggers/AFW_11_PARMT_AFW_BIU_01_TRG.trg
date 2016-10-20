SET DEFINE OFF;
create or replace trigger afw_11_parmt_afw_biu_01_trg
  before insert or update
  on afw_11_parmt_afw
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_11_parmt_afw_seqnc.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_11_parmt_afw_biu_01_trg;
/
