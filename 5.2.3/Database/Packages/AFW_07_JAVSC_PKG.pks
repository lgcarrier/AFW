SET DEFINE OFF;
create or replace package afw_07_javsc_pkg
as
  procedure ajout_scrip_charg;

  --01.01.1970
  function obten_date_debut_calnd_javsc
    return date
    result_cache;

  function obten_date_oracl_calnd_javsc (pnu_milsc in number)
    return date;
end afw_07_javsc_pkg;
/
