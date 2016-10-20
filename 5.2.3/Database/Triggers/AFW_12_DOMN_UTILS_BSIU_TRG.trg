SET DEFINE OFF;
create or replace trigger afw_12_domn_utils_bsiu_trg
  before insert or update
  on afw_12_domn_utils
declare
begin
  afw_09_pile_pkg.init_pile ('DOMN_UTILS');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_domn_utils_bsiu_trg;
/
