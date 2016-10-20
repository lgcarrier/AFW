SET DEFINE OFF;
create or replace trigger afw_13_regn_piltb_la_bi_98_trg
  before insert
  on afw_13_regn_piltb_lang
  for each row
begin
  if :new.dnr_ref_aplic is null
  then
    :new.dnr_ref_aplic   := afw_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end afw_13_regn_piltb_la_bi_98_trg;
/
