SET DEFINE OFF;
create or replace trigger afw_13_regn_piltb_bsiud_trg
  before insert or update
  on afw_13_regn_piltb
declare
begin
  if inserting
  then
    afw_09_pile_pkg.init_pile ('VALDR_TYPE_REGN_INSER');
  elsif updating
  then
    afw_09_pile_pkg.init_pile ('VALDR_TYPE_REGN_UPDAT');
  end if;
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_13_regn_piltb_bsiud_trg;
/
