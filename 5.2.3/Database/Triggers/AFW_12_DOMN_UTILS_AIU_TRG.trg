SET DEFINE OFF;
create or replace trigger afw_12_domn_utils_aiu_trg
  after insert or update
  on afw_12_domn_utils
  for each row
begin
  afw_09_pile_pkg.empil_numbr ('DOMN_UTILS'
                              ,:new.seqnc);
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_domn_utils_aiu_trg;
/
