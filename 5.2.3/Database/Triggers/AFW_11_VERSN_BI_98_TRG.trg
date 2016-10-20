SET DEFINE OFF;
create or replace trigger afw_11_versn_bi_98_trg
  before insert
  on afw_11_versn
  for each row
begin
  if     :new.dnr_ref_aplic is null
     and :new.ref_aplic is not null
  then
    :new.dnr_ref_aplic   := afw_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end afw_11_versn_bi_98_trg;
/
