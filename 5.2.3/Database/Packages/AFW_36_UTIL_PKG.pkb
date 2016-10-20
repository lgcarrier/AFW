SET DEFINE OFF;
create or replace package body afw_36_util_pkg
as
  kva_item_vue_afich        constant varchar2 (200) default 'SEM_#NUMR_PAGE#_AFW_36_VUE_AFICH';
  kva_numr_page_vue_afich   constant varchar2 (20) default '#NUMR_PAGE#';

  function obten_valr_vue_afich (pnu_numr_page in number default afw_13_page_pkg.obten_numr_apex_page)
    return varchar2
  is
    vva_nom_item   varchar2 (200)
                     default replace (kva_item_vue_afich
                                     ,kva_numr_page_vue_afich
                                     ,pnu_numr_page);
  begin
    if afw_07_util_pkg.exist_item (vva_nom_item)
    then
      return afw_07_util_pkg.v (vva_nom_item);
    end if;

    return null;
  exception
    when others
    then
      return null;
  end obten_valr_vue_afich;
end afw_36_util_pkg;
/
