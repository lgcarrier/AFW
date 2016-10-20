SET DEFINE OFF;
create or replace force view vd_i_afw_21_plugn_arbre_noeud
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_plugn_arbre
 ,indic_selct_noeud
 ,indic_ouvri_noeud
 ,indic_creer_noeud
 ,indic_suprm_noeud
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_fermr_noeud
 ,ref_resrc
 ,ref_ocurn_resrc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_plugn_arbre
        ,indic_selct_noeud
        ,indic_ouvri_noeud
        ,indic_creer_noeud
        ,indic_suprm_noeud
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_fermr_noeud
        ,ref_resrc
        ,ref_ocurn_resrc
        ,dnr_ref_prodt
    from afw_21_plugn_arbre_noeud
/
