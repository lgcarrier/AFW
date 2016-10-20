SET DEFINE OFF;
create or replace package body afw_07_javsc_pkg
as
  procedure ajout_scrip_charg
  is
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 07 Utilitaires - JavaScript au chargement');
  --      afw_07_util_pkg.ajout_code_javsc_charg (
  --         'afw.afw_13.page.item.genr_poubl();');
  --      afw_07_util_pkg.ajout_code_javsc_charg (
  --         'afw.afw_13.page.boutn.cachr_boots_dropdown();');
  --afw_07_util_pkg.ajout_code_javsc_charg ('afw.afw_13.page.raprt_inter.postn_icone_charg();');

  --afw_07_util_pkg.ajout_code_javsc_charg ('afw.jQuery(".pagination img[src=''/i/jtfunexe.gif'']").attr("src","/res/afw/images/raprt_inter/enreg_suivn.png");');
  --afw_07_util_pkg.ajout_code_javsc_charg ('afw.jQuery(".pagination img[src=''/i/jtfupree.gif'']").attr("src","/res/afw/images/raprt_inter/enreg_precd.png");');
  end ajout_scrip_charg;

  function obten_date_debut_calnd_javsc
    return date
    result_cache
  is
  begin
    return to_date ('19700101'
                   ,'YYYYMMDD');
  end;

  function obten_date_oracl_calnd_javsc (pnu_milsc in number)
    return date
  is
  begin
    return obten_date_debut_calnd_javsc + pnu_milsc / 86400000 + (systimestamp - sys_extract_utc (systimestamp));
  end;
end afw_07_javsc_pkg;
/
