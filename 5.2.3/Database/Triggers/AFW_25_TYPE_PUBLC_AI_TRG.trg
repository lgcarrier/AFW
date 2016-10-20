SET DEFINE OFF;
create or replace trigger afw_25_type_publc_ai_trg
  after insert
  on afw_25_type_publc
  for each row
begin
  afw_25_type_publc_pkg.alimn_domn_type_publc (:new.seqnc);
end afw_25_type_publc_ai_trg;
/
