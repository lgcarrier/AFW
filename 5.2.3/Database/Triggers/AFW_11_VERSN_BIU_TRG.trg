SET DEFINE OFF;
create or replace trigger afw_11_versn_biu_trg
  before insert or update
  on afw_11_versn
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_11_versn_seq.nextval;
  end if;

  if     inserting
     and :new.code is null
  then
    :new.code      :=
         :new.numr_versn_1
      || :new.numr_versn_2
      || :new.numr_versn_3
      || :new.numr_versn_4;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_11_versn_biu_trg;
/
