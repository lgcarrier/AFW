SET DEFINE OFF;
create or replace trigger afw_01_destn_confg_en_biu_t
  before insert or update
  on afw_01_destn_confg_evenm_notfb
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_01_destn_confg_en_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_01_destn_confg_en_biu_t;
/
