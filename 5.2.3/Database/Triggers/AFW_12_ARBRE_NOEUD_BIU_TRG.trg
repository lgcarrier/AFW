SET DEFINE OFF;
create or replace trigger afw_12_arbre_noeud_biu_trg
  before insert or update
  on afw_12_arbre_noeud
  for each row
declare
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_12_arbre_noeud_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_12_arbre_noeud_biu_trg;
/
