SET DEFINE OFF;
create or replace trigger afw_01_mesg_tr_apex_au_trg
  after update
  on afw_01_mesg_tradc_apex
  for each row
declare
begin
  afw_09_pile_pkg.empil_numbr ('POUSR_MESG_UPDAT'
                              ,:new.seqnc);
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_01_mesg_tr_apex_au_trg;
/
