SET DEFINE OFF;
create or replace package afw_04_contx_pkg
as
  procedure synch_varbl (pnu_ofset_fil   in number default 0
                        ,pnu_fa_courn    in number default afw_04_fil_arian_pkg.obten_fa_courn ());

  procedure synch;

  procedure maj (pnu_seqnc_contx   in afw_04_contx.seqnc_contx%type default null
                ,pva_actio         in afw_04_contx.actio%type default null
                ,pva_contx         in afw_04_contx.contx%type default null);

  procedure maj_seqnc_contx;

  procedure defnr_contx_etend_numbr (pva_nom           in varchar2
                                    ,pnu_valr          in number
                                    ,pva_type_alimn    in varchar2 default 'A'
                                    ,pbo_page_cible    in boolean default true
                                    ,pva_struc_aplic   in varchar2 default null);

  procedure defnr_contx_etend_varch (pva_nom           in varchar2
                                    ,pva_valr          in varchar2
                                    ,pva_type_alimn    in varchar2 default 'A'
                                    ,pbo_page_cible    in boolean default true
                                    ,pva_struc_aplic   in varchar2 default null);

  procedure defnr_contx_etend_item (pva_nom           in varchar2
                                   ,pva_item          in varchar2
                                   ,pva_type_alimn    in varchar2 default 'A'
                                   ,pbo_page_cible    in boolean default true
                                   ,pva_struc_aplic   in varchar2 default null);

  procedure defnr_contx_etend_contx (pva_struc_aplic   in varchar2
                                    ,pva_nom           in varchar2
                                    ,pva_valr          in varchar2 default null
                                    ,pnu_valr          in number default null
                                    ,pva_item          in varchar2 default null);

  function obten_contx_etend_numbr (pva_nom in varchar2)
    return number;

  function obten_contx_etend_varch (pva_nom in varchar2)
    return varchar2;

  function verif_contx_etend_item_page (pva_nom in varchar2)
    return boolean;

  procedure deplc_contx_etend (pnu_contx         in number
                              ,pnu_contx_parnt   in number);

  /*bp ajout du code d'application ici*/
  function obten_contx (pva_contx         in     afw_04_contx.contx%type
                       ,pva_actio         in out afw_04_contx.actio%type
                       ,pnu_seqnc_contx      out afw_04_contx.seqnc_contx%type)
    return number;

  /*bp n'est pas utilisé ailleurs*/
  /*function cherc_contx (pva_contx in afw_04_contx.contx%type,
                        pva_actio in afw_04_contx.actio%type default null)
    return number;*/

  /*bp ajout du code d'application ici*/
  function obten_seqnc_contx (pva_contx   in afw_04_contx.contx%type
                             ,pva_actio   in afw_04_contx.actio%type default null)
    return number;

  function obten_seqnc_fa_contx (pva_contx   in afw_04_contx.contx%type
                                ,pva_actio   in afw_04_contx.actio%type default null)
    return number;

  procedure defnr_seqnc_selon_contx (pva_contx         in afw_04_contx.contx%type
                                    ,pnu_seqnc_contx   in afw_04_contx.seqnc_contx%type);

  function nv (pva_nom     in varchar2
              ,pva_contx   in afw_04_contx.contx%type default null
              ,pva_actio   in afw_04_contx.actio%type default null)
    return number;

  function v (pva_nom     in varchar2
             ,pva_contx   in afw_04_contx.contx%type default null
             ,pva_actio   in afw_04_contx.actio%type default null)
    return varchar2;

  function genr_url_en_contx (pnu_page                in number default null
                             ,pnu_seqnc_contx         in number default null
                             ,pva_actio               in varchar2 default null
                             ,pva_contx               in varchar2 default null
                             ,pnu_seqnc_contx_inter   in number default null
                             ,pva_actio_inter         in varchar2 default null
                             ,pva_contx_inter         in varchar2 default null
                             ,pnu_numr_page_inter     in number default null
                             ,pva_reint_sidf          in varchar2 default 'N'
                             ,pva_optio_reqst         in varchar2 default null
                             ,pva_optio_clear_page    in varchar2 default null
                             ,pnu_aplic               in number default null)
    return varchar2;

  /*bp n'est pas utilisé tout court et si l'est dans les apps, doit etre enlevé*/
  procedure retr_modl;

  procedure valdr_contx (pnu_ref_fil_arian   in vd_i_afw_04_contx.ref_fil_arian%type
                        ,pva_contx           in vd_i_afw_04_contx.contx%type);

  procedure suprm_contx_page (pnu_page_apex in number);
--procedure trace_item_aplic;
end afw_04_contx_pkg;
/
