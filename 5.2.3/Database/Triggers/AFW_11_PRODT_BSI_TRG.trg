SET DEFINE OFF;
create or replace trigger afw_11_prodt_bsi_trg
  before insert
  on afw_11_prodt
declare
begin
  afw_09_pile_pkg.init_pile ('MESG_PRODT');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_11_prodt_bsi_trg;
/
