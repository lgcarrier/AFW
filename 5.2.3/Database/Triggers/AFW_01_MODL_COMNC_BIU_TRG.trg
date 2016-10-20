SET DEFINE OFF;
create or replace trigger afw_01_modl_comnc_biu_trg
  before insert or update
  on afw_01_modl_comnc
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_01_modl_comnc_seq.nextval;
  end if;

  if :new.indic_systm is null
  then
    :new.indic_systm   := 'N';
  end if;

  if     inserting
     and :new.code is null
     and :new.indic_systm = 'N'
  then
    :new.code   := :new.seqnc;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_01_modl_comnc_biu_trg;
/
