SET DEFINE OFF;
create or replace trigger afw_25_publc_travl_biu_trg
  before insert or update
  on afw_25_publc_travl
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_25_publc_travl_seq.nextval;
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
      afw_12_stat_pkg.obten_stat_initl_struc_aplic ('PUBLC_TRAVL'
                                                   ,'AFW');
  end if;
end afw_25_publc_travl_biu_trg;
/
