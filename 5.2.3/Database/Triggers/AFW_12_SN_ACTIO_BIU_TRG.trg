SET DEFINE OFF;
create or replace trigger afw_12_sn_actio_biu_trg
  before insert or update
  on "AFW_12_SCENR_NOTFC_ACTIO"
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_12_scenr_notfc_actio_seq.nextval;
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
end afw_12_sn_actio_biu_trg;
/
