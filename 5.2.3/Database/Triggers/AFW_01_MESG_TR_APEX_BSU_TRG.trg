SET DEFINE OFF;
create or replace trigger afw_01_mesg_tr_apex_bsu_trg
  before update
  on afw_01_mesg_tradc_apex
declare
begin
  afw_09_pile_pkg.init_pile ('POUSR_MESG_UPDAT');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_01_mesg_tr_apex_bsu_trg;
/
