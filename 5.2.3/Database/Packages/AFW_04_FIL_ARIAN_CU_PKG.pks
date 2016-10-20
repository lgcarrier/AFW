SET DEFINE OFF;
create or replace package afw_04_fil_arian_cu_pkg
  authid current_user
as
  function afich (pbo_regrp_menu in boolean default false)
    return clob;
end afw_04_fil_arian_cu_pkg;
/
