SET DEFINE OFF;
create or replace package afw_07_util_cu_pkg
  authid current_user
as
  function obten_sourc_shutl_selct (pva_selct   in varchar2
                                   ,pva_seprt   in varchar2 default ':')
    return varchar2;

  function obten_sourc_shutl_selct (pre_selct   in sys_refcursor
                                   ,pva_seprt   in varchar2 default ':')
    return varchar2;
end afw_07_util_cu_pkg;
/
