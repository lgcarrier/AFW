SET DEFINE OFF;
create or replace trigger afw_12_stat_asiu_trg
  after insert or update
  on afw_12_stat
declare
  vnu_group_stat   number (10);
begin
  if afw_11_migrt_pkg.gva_indic_migrt = 'N'
  then
    afw_09_pile_pkg.mode_depil ('MODFC_STAT_DOMN');
    vnu_group_stat   := afw_09_pile_pkg.depil_numbr ('MODFC_STAT_DOMN');

    while vnu_group_stat is not null
    loop
      afw_12_stat_pkg.valdr_stat_initl_uniq (vnu_group_stat);

      vnu_group_stat   := afw_09_pile_pkg.depil_numbr ('MODFC_STAT_DOMN');
    end loop;

    afw_09_pile_pkg.termn_utils_pile ('MODFC_STAT_DOMN');
  end if;
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_stat_asiu_trg;
/
