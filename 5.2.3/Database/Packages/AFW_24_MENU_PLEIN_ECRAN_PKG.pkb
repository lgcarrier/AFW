SET DEFINE OFF;
create or replace package body afw_24_menu_plein_ecran_pkg
as
  function obten_enreg_confg_plugn (pnu_numr_apex_regn in number)
    return typ_rec_confg_plugn
  is
    cursor cur_plugn_menu
    is
      select m.seqnc
        from vd_afw_13_menu m
            ,apex_regn      ar
       where     ar.attribute_01 = m.code
             and ar.id = pnu_numr_apex_regn
             and ar.flow_id in (select a.numr_aplic_apex
                                  from vd_afw_11_aplic a
                                 where a.ref_prodt = m.ref_prodt);

    rec_confg_plugn   typ_rec_confg_plugn;
  begin
    open cur_plugn_menu;

    fetch cur_plugn_menu
      into rec_confg_plugn;

    close cur_plugn_menu;

    return rec_confg_plugn;
  end obten_enreg_confg_plugn;

  procedure ouvri_menu
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('nav'
                              ,'class'
                              ,'menu-plein-ecran');
  end ouvri_menu;

  procedure fermr_menu
  is
  begin
    afw_15_htp_pkg.fermr_bals ('nav');
  end fermr_menu;

  procedure ouvri_rang
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('div'
                              ,'class'
                              ,'row');
  end ouvri_rang;

  procedure fermr_rang
  is
  begin
    afw_15_htp_pkg.fermr_bals ('div');
  end fermr_rang;

  procedure creer_icone (pva_icone in varchar2 default null)
  is
    vvc_icone   apex_application_global.vc_arr2;
  begin
    if pva_icone is not null
    then
      vvc_icone   := afw_07_util_pkg.string_to_table (pva_icone);

      if vvc_icone.count () > 1
      then
        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'fa-stack');

        for i in vvc_icone.first () .. vvc_icone.last ()
        loop
          afw_15_htp_pkg.ouvri_bals ('i'
                                    ,'class'
                                    ,   'fa fa-stack-1x '
                                     || vvc_icone (i));
          afw_15_htp_pkg.fermr_bals ('i');
        end loop;

        afw_15_htp_pkg.fermr_bals ('span');
      else
        afw_15_htp_pkg.ouvri_bals ('i'
                                  ,'class'
                                  ,   'fa '
                                   || pva_icone);
        afw_15_htp_pkg.fermr_bals ('i');
      end if;
    end if;
  end creer_icone;

  procedure creer_libl (pva_libl in varchar2 default null)
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('h6');
    afw_15_htp_pkg.ecrir (pva_libl
                         ,false);
    afw_15_htp_pkg.fermr_bals ('h6');
  end creer_libl;

  procedure creer_elemn (pva_libl                  in varchar2
                        ,pva_url_cible             in varchar2 default null
                        ,pva_icone                 in varchar2 default null
                        ,pva_lien_id_html          in varchar2 default null
                        ,pva_lien_class_css_html   in varchar2 default null
                        ,pva_lien_atrib_html       in varchar2 default null)
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('div'
                              ,'class'
                              ,   'col-xs-6 col-sm-6 col-md-4 col-lg-2 '
                               || pva_lien_class_css_html
                              ,'id'
                              ,pva_lien_id_html
                              ,pva_extra   => pva_lien_atrib_html);

    afw_15_htp_pkg.ouvri_bals ('a'
                              ,'href'
                              ,pva_url_cible);

    afw_15_htp_pkg.ouvri_bals ('div'
                              ,'class'
                              ,'jumbotron text-center bg-color-white icon');

    creer_icone (pva_icone);
    afw_15_htp_pkg.fermr_bals ('div');

    afw_15_htp_pkg.ouvri_bals ('div'
                              ,'class'
                              ,'text-center description');
    creer_libl (pva_libl);
    afw_15_htp_pkg.fermr_bals ('div');
    afw_15_htp_pkg.fermr_bals ('a');

    afw_15_htp_pkg.fermr_bals ('div');
  end creer_elemn;
end afw_24_menu_plein_ecran_pkg;
/
