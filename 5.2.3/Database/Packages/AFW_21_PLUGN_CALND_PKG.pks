SET DEFINE OFF;
create or replace package afw_21_plugn_calnd_pkg
  authid current_user
as
  kva_s_mode                      constant varchar2 (60) default 'S_AFW_21_CALND_MODE';
  kva_s_date                      constant varchar2 (60) default 'S_AFW_21_CALND_DATE';
  kva_s_type_agend                constant varchar2 (60) default 'S_AFW_21_CALND_TYPE_AGEND';
  kva_s_selct_indic_journ_compl   constant varchar2 (60) default 'S_AFW_21_CALND_SELCT_INDIC_JOURN_COMPL';
  kva_s_selct_date_debut          constant varchar2 (60) default 'S_AFW_21_CALND_SELCT_DATE_DEBUT';
  kva_s_selct_date_fin            constant varchar2 (60) default 'S_AFW_21_CALND_SELCT_DATE_FIN';
  kva_s_choix_evenm_ident         constant varchar2 (60) default 'S_AFW_21_CALND_CHOIX_EVENM_IDENT';
  kva_s_deplc_ident               constant varchar2 (60) default 'S_AFW_21_CALND_DEPLC_EVENM_IDENT';
  kva_s_deplc_indic_journ_compl   constant varchar2 (60) default 'S_AFW_21_CALND_DEPLC_INDIC_JOURN_COMPL';
  kva_s_deplc_date_debut          constant varchar2 (60) default 'S_AFW_21_CALND_DEPLC_DATE_DEBUT';
  kva_s_deplc_date_fin            constant varchar2 (60) default 'S_AFW_21_CALND_DEPLC_DATE_FIN';
  kva_s_ajust_ident               constant varchar2 (60) default 'S_AFW_21_CALND_AJUST_EVENM_IDENT';
  kva_s_ajust_date_fin            constant varchar2 (60) default 'S_AFW_21_CALND_AJUST_DATE_FIN';
  kva_formt_date_javsc_in         constant varchar2 (34) default 'fmDay, fmDD fmMonth, YYYY, HH24:MI';
  kva_formt_date_javsc_out        constant varchar2 (14) default 'YYYYMMDDHH24MI';

  type typ_rec_config_plugn is record
  (
    enonc_pre_reqt                  varchar2 (4000)
   ,ref_dv_vue_deft                 number (10)
   ,conct_propr_entet_gauch         varchar2 (500)
   ,conct_propr_entet_centr         varchar2 (500)
   ,conct_propr_entet_droit         varchar2 (500)
   ,conct_propr_entet_gauch_formt   varchar2 (500)
   ,conct_propr_entet_centr_formt   varchar2 (500)
   ,conct_propr_entet_droit_formt   varchar2 (500)
   ,indic_evenm_modfb               varchar2 (1)
   ,nombr_mints_inter               number (4)
   ,heure_debut_norml               varchar2 (10)
   ,heure_fin_norml                 varchar2 (10)
   ,heure_debut_exten               varchar2 (10)
   ,heure_fin_exten                 varchar2 (10)
   ,nom_table                       varchar2 (30)
   ,coln_ident                      varchar2 (30)
   ,coln_agend                      varchar2 (30)
   ,coln_indic_journ_compl          varchar2 (30)
   ,coln_indic_evenm_modfb          varchar2 (30)
   ,coln_date_journ_compl           varchar2 (30)
   ,coln_date_fin_journ_compl       varchar2 (30)
   ,coln_date_debut                 varchar2 (30)
   ,coln_date_fin                   varchar2 (30)
   ,coln_titre                      varchar2 (30)
   ,coln_descr                      varchar2 (30)
   ,coln_type                       varchar2 (30)
   ,coln_titre_aide_insta           varchar2 (30)
   ,coln_aide_insta                 varchar2 (30)
   ,coln_lien                       varchar2 (30)
   ,largr_regn_calnd                number (4)
   ,agend_nom_table                 varchar2 (30)
  );

  type typ_rec_evenm is record
  (
    vva_ident                  varchar2 (4000)
   ,vva_agend                  varchar2 (4000)
   ,vva_indic_journ_compl      varchar2 (4000)
   ,vva_indic_modfb            varchar2 (4000)
   ,vda_date_journ_compl       date
   ,vda_date_fin_journ_compl   date
   ,vda_date_debut             date
   ,vda_date_fin               date
   ,vva_titre                  varchar2 (4000)
   ,vva_descr                  varchar2 (4000)
   ,vva_clas_css               varchar2 (4000)
   ,vva_titre_aide_insta       varchar2 (4000)
   ,vva_aide_insta             varchar2 (4000)
   ,vva_lien                   varchar2 (4000)
  );

  gre_evenm                                typ_rec_evenm;

  type typ_tab_rec_evenm is table of typ_rec_evenm
    index by pls_integer;

  function obten_enreg_config_plugn (pnu_numr_apex_regn in number)
    return typ_rec_config_plugn;

  function obten_clas_css (pnu_numr_apex_regn   in number
                          ,pva_agend            in varchar2)
    return varchar2;

  procedure obten_json_evenm_agend (pnu_numr_apex_regn     in number
                                   ,pnu_date_debut_milsc   in number
                                   ,pnu_date_fin_milsc     in number
                                   ,pva_agend              in varchar2);

  procedure obten_json_evenm (pnu_numr_apex_regn   in number
                             ,pva_ident            in varchar2);

  function obten_prop_entet_formt (pva_conct_enten in varchar2)
    return varchar2;

  procedure defnr_etat_calnd (pnu_numr_apex_regn     in number
                             ,pva_mode               in varchar2
                             ,pnu_date_debut_milsc   in number);

  procedure initl_actio_sesn;

  procedure defnr_actio_selct (pva_indic_journ_compl   in varchar2
                              ,pva_date_debut          in varchar2
                              ,pva_date_fin            in varchar2);

  procedure defnr_actio_choix_evenm (pva_ident in varchar2);

  procedure defnr_actio_deplc_evenm (pva_ident               in varchar2
                                    ,pva_indic_journ_compl   in varchar2
                                    ,pva_date_debut          in varchar2
                                    ,pva_date_fin            in varchar2);

  procedure defnr_actio_ajust_evenm (pva_ident      in varchar2
                                    ,pva_date_fin   in varchar2);

  procedure valdr_heure (pva_heure_debut         in varchar2
                        ,pva_heure_fin           in varchar2
                        ,pva_heure_debut_exten   in varchar2 default null
                        ,pva_heure_fin_exten     in varchar2 default null);

  function obten_vue_jour
    return varchar2;

  function obten_vue_jour_simpl
    return varchar2;

  function obten_vue_semn
    return varchar2;

  function obten_vue_semn_simpl
    return varchar2;

  function obten_vue_mois
    return varchar2;
end afw_21_plugn_calnd_pkg;
/
