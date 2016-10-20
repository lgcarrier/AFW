SET DEFINE OFF;
create or replace trigger afw_13_expor_aplic_bi_trg
  before insert
  on afw_13_expor_aplic
  for each row
begin
  :new.seqnc      := afw_13_expor_aplic_seq.nextval;

  :new.ref_sesn   := afw_12_sesn_pkg.obten_sesn ();
end afw_13_expor_aplic_bi_trg;
/
