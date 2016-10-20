SET DEFINE OFF;
create or replace trigger afw_25_versn_publc_s_bi_99_trg
  before insert
  on afw_25_versn_publc_subst
  for each row
begin
  if :new.dnr_ref_prodt is null
  then
    :new.dnr_ref_prodt   := afw_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end afw_25_versn_publc_s_bi_99_trg;
/
