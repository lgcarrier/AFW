SET DEFINE OFF;
create or replace trigger afw_11_prodt_ai_trg
  after insert
  on afw_11_prodt
  for each row
declare
begin
  afw_09_pile_pkg.empil_numbr ('MESG_PRODT'
                              ,:new.seqnc);
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_11_prodt_ai_trg;
/
