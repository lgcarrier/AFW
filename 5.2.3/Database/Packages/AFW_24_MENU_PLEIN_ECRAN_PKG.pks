SET DEFINE OFF;
create or replace package afw_24_menu_plein_ecran_pkg
  authid current_user
as
  type typ_rec_confg_plugn is record (ref_menu number (10));

  function obten_enreg_confg_plugn (pnu_numr_apex_regn in number)
    return typ_rec_confg_plugn;

  procedure ouvri_menu;

  procedure fermr_menu;

  procedure ouvri_rang;

  procedure fermr_rang;

  procedure creer_elemn (pva_libl                  in varchar2
                        ,pva_url_cible             in varchar2 default null
                        ,pva_icone                 in varchar2 default null
                        ,pva_lien_id_html          in varchar2 default null
                        ,pva_lien_class_css_html   in varchar2 default null
                        ,pva_lien_atrib_html       in varchar2 default null);
end afw_24_menu_plein_ecran_pkg;
/
