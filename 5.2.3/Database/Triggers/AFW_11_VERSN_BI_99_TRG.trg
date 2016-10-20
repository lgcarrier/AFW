SET DEFINE OFF;
create or replace trigger afw_11_versn_bi_99_trg
  before insert
  on afw_11_versn
  for each row
begin
  if     :new.dnr_ref_prodt is null
     and :new.ref_prodt is not null
  then
    :new.dnr_ref_prodt   := afw_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end afw_11_versn_bi_99_trg;
/