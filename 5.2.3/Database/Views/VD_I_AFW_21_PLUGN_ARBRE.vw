SET DEFINE OFF;
create or replace force view vd_i_afw_21_plugn_arbre
(
  seqnc
 ,enonc_pre_reqt
 ,nom_table
 ,coln_titre
 ,coln_type
 ,coln_valr
 ,coln_aide_insta
 ,coln_lien
 ,coln_id
 ,coln_id_parnt
 ,enonc_condt
 ,enonc_condt_comnc_par
 ,enonc_trier_par
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_renmr
 ,indic_deplc
 ,coln_titre_aide_insta
 ,largr_regn_arbre
 ,hautr_regn_arbre
 ,ref_plugn_arbre_noeud
 ,indic_comnc_par_racn
 ,image_sprit
 ,type_icone_noeud
 ,ref_formt_resrc
 ,ref_resrc_comps
 ,obten_json_arbre_nombr_niv
 ,obten_json_noeud_nombr_niv
 ,code
 ,mode_cache
 ,dnr_ref_prodt
 ,indic_charg_progr
 ,indic_flech_aide_insta
 ,ref_dv_cursr_aide_insta
 ,nom_procd_glisr_elemn_arbre
 ,nom_procd_depsr_elemn_arbre
 ,indic_comnc_par_coln_parnt_nul
 ,ref_prodt
)
as
  select seqnc
        ,enonc_pre_reqt
        ,nom_table
        ,coln_titre
        ,coln_type
        ,coln_valr
        ,coln_aide_insta
        ,coln_lien
        ,coln_id
        ,coln_id_parnt
        ,enonc_condt
        ,enonc_condt_comnc_par
        ,enonc_trier_par
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_renmr
        ,indic_deplc
        ,coln_titre_aide_insta
        ,largr_regn_arbre
        ,hautr_regn_arbre
        ,ref_plugn_arbre_noeud
        ,indic_comnc_par_racn
        ,image_sprit
        ,type_icone_noeud
        ,ref_formt_resrc
        ,ref_resrc_comps
        ,obten_json_arbre_nombr_niv
        ,obten_json_noeud_nombr_niv
        ,code
        ,mode_cache
        ,dnr_ref_prodt
        ,indic_charg_progr
        ,indic_flech_aide_insta
        ,ref_dv_cursr_aide_insta
        ,nom_procd_glisr_elemn_arbre
        ,nom_procd_depsr_elemn_arbre
        ,indic_comnc_par_coln_parnt_nul
        ,ref_prodt
    from afw_21_plugn_arbre
/
