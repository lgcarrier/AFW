SET DEFINE OFF;
create or replace trigger afw_12_fonct_str_ap_bi_99_trg
  before insert
  on afw_12_fonct_struc_aplic
  for each row
begin
  if :new.dnr_ref_prodt is null
  then
    :new.dnr_ref_prodt   := afw_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end afw_12_fonct_str_ap_bi_99_trg;
/
