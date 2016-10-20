SET DEFINE OFF;
create or replace force view vd_afw_21_plugn_arbre_noeud
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_plugn_arbre
 ,indic_selct_noeud
 ,indic_selct_noeud_formt
 ,indic_ouvri_noeud
 ,indic_ouvri_noeud_formt
 ,indic_fermr_noeud
 ,indic_fermr_noeud_formt
 ,indic_creer_noeud
 ,indic_creer_noeud_formt
 ,indic_suprm_noeud
 ,indic_suprm_noeud_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_resrc
 ,ref_ocurn_resrc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_plugn_arbre
        ,indic_selct_noeud
        , (decode (indic_selct_noeud,  'O', 'Oui',  'N', 'Non')) indic_selct_noeud_formt
        ,indic_ouvri_noeud
        , (decode (indic_ouvri_noeud,  'O', 'Oui',  'N', 'Non')) indic_ouvri_noeud_formt
        ,indic_fermr_noeud
        , (decode (indic_fermr_noeud,  'O', 'Oui',  'N', 'Non')) indic_fermr_noeud_formt
        ,indic_creer_noeud
        , (decode (indic_creer_noeud,  'O', 'Oui',  'N', 'Non')) indic_creer_noeud_formt
        ,indic_suprm_noeud
        , (decode (indic_suprm_noeud,  'O', 'Oui',  'N', 'Non')) indic_suprm_noeud_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_resrc
        ,ref_ocurn_resrc
    from vd_i_afw_21_plugn_arbre_noeud
/
