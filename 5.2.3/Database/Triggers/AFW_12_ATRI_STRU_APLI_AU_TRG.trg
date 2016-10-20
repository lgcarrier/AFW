SET DEFINE OFF;
create or replace trigger afw_12_atri_stru_apli_au_trg
  after update
  on afw_12_atrib_struc_aplic
  for each row
declare
begin
  --afw_09_pile_pkg.empil_numbr ('ATRIB_STRUC_APLIC', :new.seqnc);
  null;
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_atri_stru_apli_au_trg;
/
