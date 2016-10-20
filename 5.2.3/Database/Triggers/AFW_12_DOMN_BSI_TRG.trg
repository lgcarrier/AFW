SET DEFINE OFF;
create or replace trigger afw_12_domn_bsi_trg
  before insert
  on afw_12_domn
declare
begin
  afw_09_pile_pkg.init_pile ('DOMN_TYPE_TRAVL');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_domn_bsi_trg;
/
