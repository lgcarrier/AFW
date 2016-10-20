SET DEFINE OFF;
create or replace trigger afw_12_favr_biud_trg
  before insert or update or delete
  on afw_12_favr
  for each row
declare
  vnu_utils   number (10);
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_12_favr_seq.nextval;
  end if;

  if    inserting
     or updating
  then
    afw_07_util_pkg.genr_valr_audit (inserting
                                    ,updating
                                    ,:new.utils_creat
                                    ,:new.date_creat
                                    ,:new.utils_modfc
                                    ,:new.date_modfc);
  end if;

  if    inserting
     or updating
  then
    vnu_utils   := :new.ref_utils;
  elsif deleting
  then
    vnu_utils   := :new.ref_utils;
  end if;

  --Invalider l'arbre
  afw_21_plugn_arbre_pkg.forcr_rafrc ('P0_FAVRS'
                                     ,0
                                     ,vnu_utils);
end afw_12_favr_biud_trg;
/
