SET DEFINE OFF;
create or replace trigger afw_12_i_regle_aprob_bsi_trg
  before insert
  on afw_12_insta_regle_aprob
begin
  afw_09_pile_pkg.init_pile ('EXECT_EVOLT_STAT');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_i_regle_aprob_bsi_trg;
/
