SET DEFINE OFF;
create or replace package afw_12_menu_pkg
as
  function obten_item_actif (pnu_menu in number)
    return number;

  procedure defnr_item_actif (pnu_menu   in number
                             ,pnu_item   in number);

  function obten_menu_actif
    return number;

  procedure defnr_menu_actif (pnu_menu in number);
end afw_12_menu_pkg;
/
