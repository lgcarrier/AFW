SET DEFINE OFF;
create or replace trigger afw_21_plugn_calnd_typ_biu_trg
  before insert or update
  on afw_21_plugn_calnd_type
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_21_plugn_calnd_type_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if     inserting
     and :new.ref_domn is null
  then
    :new.ref_domn   := afw_12_domn_pkg.obten_domn_sesn ();
  end if;
end afw_21_plugn_calnd_typ_biu_trg;
/
