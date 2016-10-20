SET DEFINE OFF;
create or replace trigger afw_12_domn_ai_trg
  after insert
  on afw_12_domn
  for each row
begin
  afw_12_domn_pkg.alimn_type_travl (:new.seqnc);

  afw_09_pile_pkg.empil_numbr ('DOMN_TYPE_TRAVL'
                              ,:new.seqnc);
end afw_12_domn_ai_trg;
/
