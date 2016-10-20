SET DEFINE OFF;
create or replace trigger afw_14_detl_dv_bi_99_trg
  before insert
  on afw_14_detl_domn_valr
  for each row
declare
  vnu_dnr_ref_prodt_domn   number;
begin
  select dnr_ref_prodt
    into vnu_dnr_ref_prodt_domn
    from vd_i_afw_14_domn_valr
   where seqnc = :new.ref_domn_valr;

  if vnu_dnr_ref_prodt_domn is not null
  then
    if :new.dnr_ref_prodt is null
    then
      :new.dnr_ref_prodt   := afw_07_sesn_pkg.gva_prodt_en_cours;
    end if;
  end if;
end afw_14_detl_dv_bi_99_trg;
/
