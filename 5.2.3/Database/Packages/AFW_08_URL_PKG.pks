SET DEFINE OFF;
create or replace package afw_08_url_pkg
as
  knu_sesn          constant number default afw_12_sesn_pkg.obten_sesn;
  knu_app_id        constant number default afw_11_aplic_pkg.obten_numr_apex_aplic;
  knu_app_page_id   constant number default afw_13_page_pkg.obten_numr_apex_page;
  knu_sidf          constant number default afw_04_fil_arian_pkg.obten_fa_courn;

  procedure redrg_page_postn (pva_url in varchar2);

  procedure redrg_page_rendr (pva_url in varchar2);

  procedure redrg_page_acuei_postn;

  procedure redrg_page_acuei_rendr;

  procedure redrg_page_conxn_rendr;

  procedure redrg_navgt_ilegl;

  function genr_do_submt3 (pva_reqst   in varchar2
                          ,pnu_sidf    in number default knu_sidf
                          ,pnu_sspc    in number default null
                          ,pva_sapc    in varchar2 default null
                          ,pnu_sspi    in number default null
                          ,pva_sapi    in varchar2 default null)
    return varchar2;

  function genr_url (pnu_numr_aplic              in number default afw_11_aplic_pkg.obten_numr_apex_aplic
                    ,pnu_numr_page               in number default afw_13_page_pkg.obten_numr_apex_page
                    ,pva_nom_varbl_1             in varchar2 default null
                    ,pva_valr_varbl_1            in varchar2 default null
                    ,pva_nom_varbl_2             in varchar2 default null
                    ,pva_valr_varbl_2            in varchar2 default null
                    ,pva_nom_varbl_3             in varchar2 default null
                    ,pva_valr_varbl_3            in varchar2 default null
                    ,pva_nom_varbl_4             in varchar2 default null
                    ,pva_valr_varbl_4            in varchar2 default null
                    ,pva_nom_varbl_5             in varchar2 default null
                    ,pva_valr_varbl_5            in varchar2 default null
                    ,pva_nom_varbl_6             in varchar2 default null
                    ,pva_valr_varbl_6            in varchar2 default null
                    ,pva_nom_varbl_7             in varchar2 default null
                    ,pva_valr_varbl_7            in varchar2 default null
                    ,pva_nom_varbl_8             in varchar2 default null
                    ,pva_valr_varbl_8            in varchar2 default null
                    ,pva_nom_varbl_9             in varchar2 default null
                    ,pva_valr_varbl_9            in varchar2 default null
                    ,pva_nom_varbl_10            in varchar2 default null
                    ,pva_valr_varbl_10           in varchar2 default null
                    ,pva_sesn                    in varchar2 default null
                    ,pva_optio_reqst             in varchar2 default null
                    ,pva_optio_clear_page        in varchar2 default null
                    ,pva_mode_debg               in varchar2 default 'NO'
                    ,pva_indic_afich_valr_sesn   in varchar2 default 'O')
    return varchar2;

  function genr_url_en_contx (pnu_numr_aplic            number default afw_11_aplic_pkg.obten_numr_apex_aplic
                             ,pnu_numr_page             number default afw_13_page_pkg.obten_numr_apex_page
                             ,pva_sesn                  varchar2 default afw_12_sesn_pkg.obten_sesn
                             ,pva_optio_reqst        in varchar2 default null
                             ,pva_mode_debg          in varchar2 default 'NO'
                             ,pva_optio_clear_page   in varchar2 default null
                             ,pva_sidf                  varchar2 default null
                             ,pnu_sspc                  number default null
                             ,pva_sapc                  varchar2 default null
                             ,pva_scpc                  varchar2 default null
                             ,pnu_sspi                  number default null
                             ,pva_sapi                  varchar2 default null
                             ,pva_scpi                  varchar2 default null
                             ,pnu_snpi                  number default null)
    return varchar2;

  procedure decnt_et_redrg_page_login;

  procedure obten_pdf_de_url (pva_url    in            varchar2
                             ,pbo_blob   in out nocopy blob);

  function obten_protc_reqt
    return varchar2;

  function obten_port_servr
    return number;

  function obten_host_http
    return varchar2;

  function obten_nom_scrip
    return varchar2;

  procedure obten_item_url (pva_url                 in     varchar2 default null
                           ,pvc_liste_item          in out apex_application_global.vc_arr2
                           ,pvc_liste_valeur_item   in out apex_application_global.vc_arr2);
end afw_08_url_pkg;
/
