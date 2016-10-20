SET DEFINE OFF;
create or replace package body afw_21_plugn_favr_pkg
as
  kva_clas_base   constant varchar2 (50) default 'afw-21-togl-favr icon-only fa ';

  procedure alimn_item_filtr (pva_gerer_filtr           in varchar2 default 'N'
                             ,pva_indic_bascl           in varchar2 default 'N'
                             ,pva_id_item_alimn_filtr   in varchar2 default null
                             ,pva_valr_alimn_filtr      in varchar2 default null)
  is
  begin
    if pva_gerer_filtr = 'Y'
    then
      if afw_07_util_pkg.exist_item (pva_id_item_alimn_filtr)
      then
        afw_07_util_pkg.defnr_etat_sesn (pva_id_item_alimn_filtr
                                        ,case pva_indic_bascl when 'O' then pva_valr_alimn_filtr else null end);
      end if;
    end if;
  end alimn_item_filtr;

  procedure alimn_item_bascl (pva_id_item_alimn_bascl   in varchar2 default null
                             ,pva_indic_bascl           in varchar2 default 'N')
  is
  begin
    if afw_07_util_pkg.exist_item (pva_id_item_alimn_bascl)
    then
      afw_07_util_pkg.defnr_etat_sesn (pva_id_item_alimn_bascl
                                      ,pva_indic_bascl);
    end if;
  end alimn_item_bascl;

  procedure bascl_favr (pva_id_item_alimn_bascl   in varchar2 default null
                       ,pva_gerer_filtr           in varchar2 default 'N'
                       ,pva_id_alimn_filtr        in varchar2 default null
                       ,pva_valr_alimn_filtr      in varchar2 default null
                       ,pva_clas_actif            in varchar2 default 'fa-star'
                       ,pva_titre_actif           in varchar2 default 'Voir tous'
                       ,pva_clas_inact            in varchar2 default 'fa-star-o'
                       ,pva_titre_inact           in varchar2 default 'Voir favoris'
                       ,pbo_save_prefr            in boolean default true)
  is
    vva_valr_bascl   varchar2 (1) default case afw_07_util_pkg.v (pva_id_item_alimn_bascl) when 'O' then 'N' else 'O' end;

    procedure impri_json_clas
    is
      vva_clas         varchar2 (50) default pva_clas_inact;
      vva_clas_inver   varchar2 (50) default pva_clas_actif;
      vva_titre        varchar2 (50) default pva_titre_inact;
    begin
      if vva_valr_bascl = 'O'
      then
        vva_clas         := pva_clas_actif;
        vva_clas_inver   := pva_clas_inact;
        vva_titre        := pva_titre_actif;
      end if;

      afw_15_htp_pkg.ecrir (   '{"class_ajout":"'
                            || vva_clas
                            || '","class_delt":"'
                            || vva_clas_inver
                            || '","title":"'
                            || vva_titre
                            || '"}');
    end impri_json_clas;
  begin
    alimn_item_filtr (pva_gerer_filtr
                     ,vva_valr_bascl
                     ,pva_id_alimn_filtr
                     ,pva_valr_alimn_filtr);
    alimn_item_bascl (pva_id_item_alimn_bascl
                     ,vva_valr_bascl);

    impri_json_clas;

    if pbo_save_prefr
    then
      afw_13_prefr_pkg.sauvg_prefr_page;
    end if;
  end bascl_favr;

  procedure genr_icone_favr (pva_id_item               in varchar2
                            ,pva_id_item_alimn_bascl   in varchar2 default null
                            ,pva_gerer_filtr           in varchar2 default 'N'
                            ,pva_id_item_alimn_filtr   in varchar2 default null
                            ,pva_valr_alimn_filtr      in varchar2 default null
                            ,pva_clas_actif            in varchar2 default 'fa-star'
                            ,pva_titre_actif           in varchar2 default 'Voir tous'
                            ,pva_clas_inact            in varchar2 default 'fa-star-o'
                            ,pva_titre_inact           in varchar2 default 'Voir favoris')
  is
    vva_valr_bascl   varchar2 (1) default nvl (afw_07_util_pkg.v (pva_id_item_alimn_bascl), 'N');
    vva_icone_favr   varchar2 (4000) default null;

    procedure genr_icone_bascl_favr_tous
    is
    begin
      vva_icone_favr      :=
           afw_15_htp_pkg.ouvri_bals ('i'
                                     ,'class'
                                     ,   kva_clas_base
                                      || pva_clas_inact
                                     ,'title'
                                     ,pva_titre_inact
                                     ,'id'
                                     ,pva_id_item)
        || afw_15_htp_pkg.fermr_bals ('i');
    end genr_icone_bascl_favr_tous;

    procedure genr_icone_bascl_favr
    is
    begin
      vva_icone_favr      :=
           afw_15_htp_pkg.ouvri_bals ('i'
                                     ,'class'
                                     ,   kva_clas_base
                                      || pva_clas_actif
                                     ,'title'
                                     ,pva_titre_actif
                                     ,'id'
                                     ,pva_id_item)
        || afw_15_htp_pkg.fermr_bals ('i');
    end genr_icone_bascl_favr;
  begin
    if vva_valr_bascl = 'N'
    then
      genr_icone_bascl_favr_tous;
    elsif vva_valr_bascl = 'O'
    then
      genr_icone_bascl_favr;
    end if;

    alimn_item_filtr (pva_gerer_filtr
                     ,vva_valr_bascl
                     ,pva_id_item_alimn_filtr
                     ,pva_valr_alimn_filtr);

    afw_15_htp_pkg.ecrir (vva_icone_favr);
  end genr_icone_favr;
end afw_21_plugn_favr_pkg;
/
