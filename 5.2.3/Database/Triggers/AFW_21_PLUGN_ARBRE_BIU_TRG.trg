SET DEFINE OFF;
create or replace trigger afw_21_plugn_arbre_biu_trg
  before insert or update
  on afw_21_plugn_arbre
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_21_plugn_arbre_seq.nextval;
  end if;

  if :new.code is null
  then
    :new.code   := :new.seqnc;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_21_plugn_arbre_biu_trg;
/
