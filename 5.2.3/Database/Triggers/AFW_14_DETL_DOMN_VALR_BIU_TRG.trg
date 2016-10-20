SET DEFINE OFF;
create or replace trigger afw_14_detl_domn_valr_biu_trg
  before insert or update
  on afw_14_detl_domn_valr
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_14_detl_domn_valr_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if    inserting
     or (    updating
         and :old.code_valr != :new.code_valr)
  then
    :new.code_valr   := upper (:new.code_valr);
  end if;
end afw_14_detl_domn_valr_biu_trg;
/
