SET DEFINE OFF;
create or replace package body afw_13_page_item_pkg
as
  function obten_tradc_libl (pnu_item_id in vd_i_afw_13_page_item.id_apex%type)
    return vd_afw_13_page_item_lang.nom%type
  is
    vva_nom   vd_afw_13_page_item_lang.nom%type;
  begin
    select pil.nom
      into vva_nom
      from vd_i_afw_13_page_item      pi
          ,vd_i_afw_13_page_item_lang pil
     where     pil.ref_page_item = pi.seqnc
           and pi.id_apex = pnu_item_id
           and pil.ref_lang = afw_01_lang_pkg.obten_lang_sesn ();

    return vva_nom;
  exception
    when others
    then
      return null;
  end obten_tradc_libl;

  function obten_id_item (pnu_page       in vd_i_afw_13_page_item.seqnc%type
                         ,pva_nom_item   in varchar2)
    return vd_i_afw_13_page_item.id_apex%type
  is
    vnu_id_apex   vd_i_afw_13_page_item.id_apex%type;
  begin
    select id_apex
      into vnu_id_apex
      from vd_i_afw_13_page_item pi
     where     ref_page = pnu_page
           and nom_apex = pva_nom_item;

    return vnu_id_apex;
  exception
    when others
    then
      return null;
  end obten_id_item;

  procedure chang_modl_page_item (pnu_item_id       in number
                                 ,pnu_templ_final   in number)
  is
  begin
    update apex_item_page aip
       set aip.item_field_template   = pnu_templ_final
     where aip.id = pnu_item_id;
  end chang_modl_page_item;

  function obten_icone_bulle_aide (pnu_item_id in vd_i_afw_13_page_item.id_apex%type)
    return vd_i_afw_13_page_item.icone_bulle_aide%type
  is
    vva_icone_bulle_aide   vd_i_afw_13_page_item.icone_bulle_aide%type;
  begin
    select pi.icone_bulle_aide
      into vva_icone_bulle_aide
      from vd_i_afw_13_page_item pi
     where pi.id_apex = pnu_item_id;

    return vva_icone_bulle_aide;
  exception
    when no_data_found
    then
      return null;
  end obten_icone_bulle_aide;

  function exist_aide (pnu_item_id in vd_i_afw_13_page_item.id_apex%type)
    return boolean
  is
    vnu_exist   pls_integer;
  begin
    select 1
      into vnu_exist
      from vd_i_afw_13_page_item pi
     where     pi.ref_mesg_aide is not null
           and pi.id_apex = pnu_item_id;

    return true;
  exception
    when no_data_found
    then
      return false;
  end exist_aide;


  function obten_ouvri_libl_aide (pnu_item_id in vd_i_afw_13_page_item.id_apex%type)
    return varchar2
  is
  begin
    if exist_aide (pnu_item_id)
    then
      return    '<a href="javascript:afw.afw_21.actio_dynmq.aide_page_item.afich('''
             || pnu_item_id
             || ''');" tabindex="-1">';
    else
      return null;
    end if;
  exception
    when no_data_found
    then
      return null;
  end obten_ouvri_libl_aide;

  function obten_fermr_libl_aide (pnu_item_id in vd_i_afw_13_page_item.id_apex%type)
    return varchar2
  is
  begin
    if exist_aide (pnu_item_id)
    then
      return ' <i class="fa fa-question-circle"></i></a>';
    else
      return null;
    end if;
  exception
    when no_data_found
    then
      return null;
  end obten_fermr_libl_aide;
end afw_13_page_item_pkg;
/
