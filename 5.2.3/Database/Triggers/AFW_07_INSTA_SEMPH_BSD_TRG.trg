SET DEFINE OFF;
create or replace trigger afw_07_insta_semph_bsd_trg
  before delete
  on afw_07_insta_semph
declare
begin
  afw_09_pile_pkg.init_pile ('SEMPH');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_07_insta_semph_bsd_trg;
/
