SET DEFINE OFF;
create or replace trigger afw_13_regn_piltb_aiud_trg
  after insert or update
  on afw_13_regn_piltb
  for each row
declare
begin
  if inserting
  then
    afw_09_pile_pkg.empil_rowid ('VALDR_TYPE_REGN_INSER'
                                ,:new.rowid);
  elsif updating
  then
    afw_09_pile_pkg.empil_rowid ('VALDR_TYPE_REGN_UPDAT'
                                ,:new.rowid);
  end if;
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_13_regn_piltb_aiud_trg;
/
