SET DEFINE OFF;
create or replace trigger afw_11_plugn_biu_trg
  before insert or update
  on afw_11_plugn
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_11_plugn_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if    inserting
     or (    updating
         and :old.code_inter != :new.code_inter)
  then
    :new.code_inter   := upper (:new.code_inter);
  end if;
end afw_11_plugn_biu_trg;
/
