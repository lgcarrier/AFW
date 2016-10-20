SET DEFINE OFF;
create or replace trigger afw_01_evenm_notfb_biu_trg
  before insert or update
  on afw_01_evenm_notfb
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_01_evenm_notfb_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if    inserting
     or (    updating
         and :old.code != :new.code)
  then
    :new.code   := upper (:new.code);
  end if;
end afw_01_evenm_notfb_biu_trg;
/
