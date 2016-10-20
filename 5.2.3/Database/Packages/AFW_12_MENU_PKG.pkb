SET DEFINE OFF;
create or replace package body afw_12_menu_pkg
as
  function obten_item_actif (pnu_menu in number)
    return number
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (   'S_AFW_13_MENU_'
                                            || pnu_menu);
  end obten_item_actif;

  procedure defnr_item_actif (pnu_menu   in number
                             ,pnu_item   in number)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (   'S_AFW_13_MENU_'
                                     || pnu_menu
                                    ,pnu_item);
  end defnr_item_actif;

  function obten_menu_actif
    return number
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_menu_pkg.kva_s_menu_actif);
  end obten_menu_actif;

  procedure defnr_menu_actif (pnu_menu in number)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (afw_21_plugn_menu_pkg.kva_s_menu_actif
                                    ,pnu_menu);
  end defnr_menu_actif;
end afw_12_menu_pkg;
/
