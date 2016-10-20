SET DEFINE OFF;
create or replace package body afw_01_javsc_pkg
as
  procedure ajout_libr
  is
  begin
    afw_07_util_pkg.ajout_libr_javsc ('afw_01_err');
  end ajout_libr;

  procedure ajout_scrip_charg
  is
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 01 Messages - JavaScript au chargement');
  --afw_07_util_pkg.ajout_code_javsc_charg('afw.afw_01.mesg.gestn_err_apex();');
  end ajout_scrip_charg;
end afw_01_javsc_pkg;
/
