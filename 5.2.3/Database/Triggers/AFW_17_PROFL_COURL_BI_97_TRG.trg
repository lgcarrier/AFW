SET DEFINE OFF;
create or replace trigger afw_17_profl_courl_bi_97_trg
  before insert or update
  on afw_17_profl_courl
  for each row
begin
  if :new.dnr_ref_domn is null
  then
    :new.dnr_ref_domn   := afw_04_contx_pkg.obten_seqnc_contx ('DOMN');
  end if;
end afw_17_profl_courl_bi_97_trg;
/