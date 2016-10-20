SET DEFINE OFF;
create or replace trigger afw_29_contr_biud_trg
  before insert or update or delete
  on afw_29_contr
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_29_contr_seq.nextval;
  end if;

  if    inserting
     or updating
  then
    :new.code_contr   := upper (:new.code_contr);
    afw_07_util_pkg.genr_valr_audit (inserting
                                    ,updating
                                    ,:new.utils_creat
                                    ,:new.date_creat
                                    ,:new.utils_modfc
                                    ,:new.date_modfc);
  end if;
end afw_29_contr_biud_trg;
/
