SET DEFINE OFF;
create or replace trigger afw_25_travl_biu_trg
  before insert or update
  on afw_25_travl
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_25_travl_seq.nextval;
  end if;

  if :new.ref_type_travl is null
  then
    :new.ref_type_travl   := afw_12_domn_pkg.obten_type_travl_deft (:new.ref_domn);
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if inserting
  then
    :new.ref_stat      :=
      afw_12_stat_pkg.obten_stat_initl_struc_aplic ('TRAVL'
                                                   ,'AFW');
  end if;
end afw_25_travl_biu_trg;
/
