SET DEFINE OFF;
create or replace trigger afw_01_mesg_tr_apex_asu_trg
  after update
  on afw_01_mesg_tradc_apex
declare
  vnu_seqnc   number (10);
begin
  afw_09_pile_pkg.mode_depil ('POUSR_MESG_UPDAT');
  vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('POUSR_MESG_UPDAT');

  while vnu_seqnc is not null
  loop
    if afw_11_migrt_pkg.gva_indic_migrt = 'N'
    then
      afw_01_mesg_tradc_apex_pkg.pousr_mesg (vnu_seqnc);
    end if;

    vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('POUSR_MESG_UPDAT');
  end loop;

  afw_09_pile_pkg.termn_utils_pile ('POUSR_MESG_UPDAT');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_01_mesg_tr_apex_asu_trg;
/
