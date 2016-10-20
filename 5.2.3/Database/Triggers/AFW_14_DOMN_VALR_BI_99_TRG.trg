SET DEFINE OFF;
create or replace trigger afw_14_domn_valr_bi_99_trg
  before insert
  on afw_14_domn_valr
  for each row
begin
  --CARLO
  if :new.ref_domn is null
  then
    if :new.dnr_ref_prodt is null
    then
      :new.dnr_ref_prodt   := afw_07_sesn_pkg.gva_prodt_en_cours;
    end if;
  end if;
end afw_14_domn_valr_bi_99_trg;
/
