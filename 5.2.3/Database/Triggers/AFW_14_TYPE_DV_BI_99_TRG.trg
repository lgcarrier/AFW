SET DEFINE OFF;
create or replace trigger afw_14_type_dv_bi_99_trg
  before insert
  on afw_14_type_domn_valr
  for each row
begin
  if :new.dnr_ref_prodt is null
  then
    :new.dnr_ref_prodt   := afw_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end afw_14_type_dv_bi_99_trg;
/
