SET DEFINE OFF;
create or replace trigger afw_12_histr_acces_biu_trg
  before insert or update
  on afw_12_histr_acces
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_12_histr_acces_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if inserting
  then
    :new.date_evenm   := sysdate;
  end if;

  :new.adres_ip   := afw_07_util_pkg.obten_ip ();
end afw_12_histr_acces_biu_trg;
/
