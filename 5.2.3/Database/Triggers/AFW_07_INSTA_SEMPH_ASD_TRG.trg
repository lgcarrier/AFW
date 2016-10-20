SET DEFINE OFF;
create or replace trigger afw_07_insta_semph_asd_trg
  after delete
  on afw_07_insta_semph
declare
  enfan_trouv   exception;
  pragma exception_init (enfan_trouv
                        ,-2292);

  vnu_seqnc     number;
begin
  afw_09_pile_pkg.mode_depil ('SEMPH');
  vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('SEMPH');

  while vnu_seqnc is not null
  loop
    begin
      delete afw_07_semph s
       where s.seqnc = vnu_seqnc;
    exception
      when enfan_trouv
      then
        null;
    end;

    vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('SEMPH');
  end loop;

  afw_09_pile_pkg.termn_utils_pile ('SEMPH');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_07_insta_semph_asd_trg;
/
