SET DEFINE OFF;
create or replace package afw_21_plugn_favr_pkg
as
  procedure bascl_favr (pva_id_item_alimn_bascl   in varchar2 default null
                       ,pva_gerer_filtr           in varchar2 default 'N'
                       ,pva_id_alimn_filtr        in varchar2 default null
                       ,pva_valr_alimn_filtr      in varchar2 default null
                       ,pva_clas_actif            in varchar2 default 'fa-star'
                       ,pva_titre_actif           in varchar2 default 'Voir tous'
                       ,pva_clas_inact            in varchar2 default 'fa-star-o'
                       ,pva_titre_inact           in varchar2 default 'Voir favoris'
                       ,pbo_save_prefr            in boolean default true);

  procedure genr_icone_favr (pva_id_item               in varchar2
                            ,pva_id_item_alimn_bascl   in varchar2 default null
                            ,pva_gerer_filtr           in varchar2 default 'N'
                            ,pva_id_item_alimn_filtr   in varchar2 default null
                            ,pva_valr_alimn_filtr      in varchar2 default null
                            ,pva_clas_actif            in varchar2 default 'fa-star'
                            ,pva_titre_actif           in varchar2 default 'Voir tous'
                            ,pva_clas_inact            in varchar2 default 'fa-star-o'
                            ,pva_titre_inact           in varchar2 default 'Voir favoris');
end afw_21_plugn_favr_pkg;
/
