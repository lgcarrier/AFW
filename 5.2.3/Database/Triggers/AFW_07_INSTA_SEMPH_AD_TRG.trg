SET DEFINE OFF;
create or replace trigger afw_07_insta_semph_ad_trg
  after delete
  on afw_07_insta_semph
  for each row
declare
begin
  afw_09_pile_pkg.empil_numbr ('SEMPH'
                              ,:old.ref_semph);
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_07_insta_semph_ad_trg;
/
