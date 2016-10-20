SET DEFINE OFF;
create or replace package afw_07_util_noyau_pkg
is
  function obten_schem_apex
    return all_synonyms.table_owner%type;
end afw_07_util_noyau_pkg;
/
