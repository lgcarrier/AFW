SET DEFINE OFF;
create or replace trigger afw_12_stat_bsiu_trg
  before insert or update
  on afw_12_stat
begin
  if afw_11_migrt_pkg.gva_indic_migrt = 'N'
  then
    afw_09_pile_pkg.init_pile ('MODFC_STAT_DOMN');
  end if;
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_stat_bsiu_trg;
/
