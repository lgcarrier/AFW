SET DEFINE OFF;
create or replace trigger afw_11_prodt_asi_trg
  after insert
  on afw_11_prodt
declare
  vnu_seqnc   number (10);
begin
  afw_09_pile_pkg.mode_depil ('MESG_PRODT');
  vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('MESG_PRODT');

  while vnu_seqnc is not null
  loop
    if afw_11_migrt_pkg.gva_indic_migrt = 'N'
    then
      afw_11_prodt_pkg.creer_mesg_base_prodt (vnu_seqnc);
    end if;

    vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('MESG_PRODT');
  end loop;

  afw_09_pile_pkg.termn_utils_pile ('MESG_PRODT');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_11_prodt_asi_trg;
/
