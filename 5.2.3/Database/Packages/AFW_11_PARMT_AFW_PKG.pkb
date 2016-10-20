SET DEFINE OFF;
create or replace package body afw_11_parmt_afw_pkg
is
  function obten_valr_parmt (pva_code_parmt in varchar)
    return varchar2
  is
    vnu_valr   varchar2 (200);
  begin
    select valr
      into vnu_valr
      from afw_11_parmt_afw
     where code = pva_code_parmt;

    return vnu_valr;
  exception
    when no_data_found
    then
      return null;
  end obten_valr_parmt;
end afw_11_parmt_afw_pkg;
/
