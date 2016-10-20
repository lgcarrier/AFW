SET DEFINE OFF;
create or replace package afw_13_page_item_pkg
as
  function obten_tradc_libl (pnu_item_id in vd_i_afw_13_page_item.id_apex%type)
    return vd_afw_13_page_item_lang.nom%type;

  function obten_id_item (pnu_page       in vd_i_afw_13_page_item.seqnc%type
                         ,pva_nom_item   in varchar2)
    return vd_i_afw_13_page_item.id_apex%type;

  procedure chang_modl_page_item (pnu_item_id       in number
                                 ,pnu_templ_final   in number);

  function obten_icone_bulle_aide (pnu_item_id in vd_i_afw_13_page_item.id_apex%type)
    return vd_i_afw_13_page_item.icone_bulle_aide%type;

  function obten_ouvri_libl_aide (pnu_item_id in vd_i_afw_13_page_item.id_apex%type)
    return varchar2;

  function obten_fermr_libl_aide (pnu_item_id in vd_i_afw_13_page_item.id_apex%type)
    return varchar2;
end afw_13_page_item_pkg;
/
