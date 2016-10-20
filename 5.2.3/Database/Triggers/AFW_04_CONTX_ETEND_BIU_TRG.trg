SET DEFINE OFF;
create or replace trigger afw_04_contx_etend_biu_trg
  before insert or update
  on afw_04_contx_etend
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_04_contx_etend_seq.nextval;
  end if;

  :new.nom   := upper (:new.nom);
  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_04_contx_etend_biu_trg;
/
