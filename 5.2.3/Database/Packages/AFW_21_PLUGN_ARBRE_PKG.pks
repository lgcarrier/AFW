SET DEFINE OFF;
create or replace package afw_21_plugn_arbre_pkg
  authid current_user
as
  type typ_rec_enreg_arbre is record
  (
    titre              varchar2 (200)
   ,type               varchar2 (30)
   ,valr               varchar2 (100)
   ,aide_insta         varchar2 (200)
   ,titre_aide_insta   varchar2 (200)
   ,lien               varchar2 (4000)
   ,id                 varchar2 (100)
   ,id_parnt           varchar2 (100)
   ,trier_par          varchar2 (200)
  );

  type typ_table_rec_enreg_arbre is table of typ_rec_enreg_arbre;

  type typ_rec_confg_plugn is record
  (
    seqnc                            number (10)
   ,enonc_pre_reqt                   varchar2 (4000)
   ,code                             varchar2 (23)
   ,nom_table                        varchar2 (30)
   ,coln_titre                       varchar2 (30)
   ,coln_type                        varchar2 (30)
   ,coln_valr                        varchar2 (30)
   ,coln_titre_aide_insta            varchar2 (30)
   ,coln_aide_insta                  varchar2 (30)
   ,coln_lien                        varchar2 (30)
   ,coln_id                          varchar2 (30)
   ,coln_id_parnt                    varchar2 (30)
   ,enonc_condt                      varchar2 (400)
   ,indic_comnc_par_racn             varchar2 (1)
   ,indic_comnc_par_coln_parnt_nul   varchar2 (1)
   ,enonc_condt_comnc_par            varchar2 (400)
   ,enonc_trier_par                  varchar2 (400)
   ,indic_renmr                      varchar2 (1)
   ,indic_deplc                      varchar2 (1)
   ,image_sprit                      varchar2 (400)
   ,largr_regn_arbre                 number (10)
   ,hautr_regn_arbre                 number (10)
   ,item_noeud                       varchar2 (4000)
   ,obten_json_arbre_nombr_niv       number (10)
   ,obten_json_noeud_nombr_niv       number (10)
   ,mode_cache                       varchar2 (23)
   ,numr_page_apex                   number
   ,indic_charg_progr                varchar2 (1)
   ,nom_procd_glisr_elemn_arbre      varchar2 (92)
   ,nom_procd_depsr_elemn_arbre      varchar2 (92)
  );

  type typ_rec_glisr_elemn is record
  (
    vva_glisr_elemn   varchar2 (4000)
   ,vva_depsr_elemn   varchar2 (4000)
  );

  gre_glisr_elemn              typ_rec_glisr_elemn;

  kva_s_noeud_actif   constant varchar2 (60) default 'S_AFW_12_ARBRE_NOEUD_ACTIF';

  function obten_enreg_confg_plugn (pnu_numr_apex_regn in number)
    return typ_rec_confg_plugn;

  procedure genr_json_arbre (pnu_numr_apex_regn in number);

  procedure genr_json_racn_arbre (pnu_numr_apex_regn in number);

  procedure genr_json_arbre_contx (pnu_numr_apex_regn in number);

  procedure genr_json_arbre_compl (pnu_numr_apex_regn in number);

  procedure genr_json_noeud (pnu_numr_apex_regn   in number
                            ,pva_noeud            in varchar2);

  procedure actio_ouvri_noeud (pnu_numr_apex_regn   in number
                              ,pva_noeud            in varchar2);

  procedure actio_fermr_noeud (pnu_numr_apex_regn   in number
                              ,pva_noeud            in varchar2);

  procedure actio_selct_noeud (pnu_numr_apex_regn   in number
                              ,pva_noeud            in varchar2);

  procedure actio_glisr_elemn_arbre (pnu_numr_apex_regn   in number
                                    ,pva_glisr_elemn      in varchar2
                                    ,pva_depsr_elemn      in varchar2);

  procedure genr_json_type_noeud (pnu_numr_apex_regn in number);

  procedure initl_arbre (pnu_numr_apex_regn in number);

  procedure forcr_rafrc (pva_code             in varchar2
                        ,pnu_numr_page_apex   in number
                        ,pnu_utils            in number default null);

  procedure rafrc_efect (pva_code             in varchar2
                        ,pnu_numr_page_apex   in number
                        ,pnu_utils            in number default null
                        ,pnu_numr_apex        in number default afw_11_aplic_pkg.obten_numr_apex_aplic);

  function obten_chemn_resrc_simpl_noeud (pnu_noeud            in number
                                         ,pva_formt_bals_img   in varchar2 default 'N')
    return varchar2;

  procedure bascl_arbre_sesn (pnu_numr_apex_regn in number);

  procedure creer_noeud_deft (pnu_seqnc in number);
end afw_21_plugn_arbre_pkg;
/
