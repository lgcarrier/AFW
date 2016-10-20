SET DEFINE OFF;
create or replace trigger afw_37_lien_g_p_r_bi_99_trg
  before insert
  on afw_37_lien_gadgt_parmt_racrc
  for each row
begin
  if :new.dnr_ref_prodt is null
  then
    :new.dnr_ref_prodt   := afw_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end afw_37_lien_g_p_r_bi_99_trg;
/
