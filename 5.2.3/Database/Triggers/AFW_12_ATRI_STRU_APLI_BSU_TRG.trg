SET DEFINE OFF;
create or replace trigger afw_12_atri_stru_apli_bsu_trg
  before update
  on afw_12_atrib_struc_aplic
declare
begin
  --afw_09_pile_pkg.init_pile ('ATRIB_STRUC_APLIC');
  null;
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_atri_stru_apli_bsu_trg;
/
