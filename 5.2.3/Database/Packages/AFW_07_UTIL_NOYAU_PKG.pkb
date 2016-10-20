SET DEFINE OFF;
create or replace package body afw_07_util_noyau_pkg
is
  --Result cache par session
  gva_schem   varchar2 (30);

  function obten_schem_apex
    return all_synonyms.table_owner%type
  is
  begin
    if gva_schem is null
    then
      select aa.owner
        into gva_schem
        from apex_aplic aa
       where aa.alias = 'BUILDER';
    end if;

    return gva_schem;
  end obten_schem_apex;
end afw_07_util_noyau_pkg;
/
