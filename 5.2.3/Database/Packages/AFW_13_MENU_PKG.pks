SET DEFINE OFF;
create or replace package afw_13_menu_pkg
as
  gbo_menu_actif    boolean default false;
  gnu_page_cible    number default null;
  gnu_aplic_cible   number default null;

  function obten_url_cible (pnu_item_menu in number)
    return varchar2;

  function obten_url_cible_js (pnu_item_menu   in number
                              ,pnu_item_racn   in number default null) -- À utiliser que dans un menu avec un query dynamic (List dynamique)
    return varchar2;

  function valdt_noeud_actif (pnu_item_menu   in number
                             ,pnu_menu        in number)
    return varchar2;

  function verfr_droit_acces (pnu_item_menu in number)
    return number;

  function verfr_enfan_exist (pnu_item_menu in number)
    return boolean;

  function obten_libl (pnu_item_menu in number)
    return varchar2;

  function trait_condt_afich (pnu_item_menu in number)
    return boolean;

  function trait_condt_afich_numbr (pnu_item_menu in number)
    return number;

  function obten_menu_sesn (pva_code_menu in varchar2)
    return vd_i_afw_13_menu.seqnc%type;

  function obten_item_menu_sesn (pva_code_menu        in varchar2
                                ,pva_code_item_menu   in varchar2)
    return vd_i_afw_13_item_menu.seqnc%type;

  function obten_menu_part_item_menu (pnu_item_menu in number)
    return number;

  function obten_resrc_aditn (pnu_menu in number)
    return varchar2;

  function obten_icone (pnu_item_menu in number)
    return varchar2;
end afw_13_menu_pkg;
/
