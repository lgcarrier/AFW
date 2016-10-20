SET DEFINE OFF;
create or replace trigger afw_12_stat_aiu_trg
  after insert or update
  on afw_12_stat
  for each row
declare
begin
  if     :new.ref_group_stat is not null
     and :new.dnr_ref_domn is not null
     and afw_11_migrt_pkg.gva_indic_migrt = 'N'
  then
    afw_09_pile_pkg.empil_numbr ('MODFC_STAT_DOMN'
                                ,:new.ref_group_stat);
  end if;
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_stat_aiu_trg;
/
