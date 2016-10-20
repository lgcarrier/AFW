SET DEFINE OFF;
create or replace force view vd_afw_12_utils
(
  seqnc
 ,nom
 ,prenm
 ,courl
 ,nom_formt
 ,nom_formt_comnc
 ,code_utils
 ,mot_passe
 ,date_expir
 ,indic_verl
 ,indic_verl_formt
 ,indic_chang_mot_passe
 ,indic_chang_mot_passe_formt
 ,indic_actif
 ,indic_actif_formt
 ,dernr_prodt_acces
 ,dernr_domn_acces
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_dv_compl_maxm
 ,code_utils_base_don
 ,parmt_authe_exter_afw
)
as
  select seqnc
        ,nom
        ,prenm
        ,courl
        , (   prenm
           || ' '
           || nom)
           nom_formt
        , (   prenm
           || ' '
           || nom)
           nom_formt_comnc
        ,code_utils
        ,mot_passe
        ,date_expir
        ,indic_verl
        ,decode (indic_verl, 'O', '<i class="fa fa-lock"></i>', null)   indic_verl_formt
        ,indic_chang_mot_passe
        ,decode (indic_chang_mot_passe, 'O', 'X', null)                 indic_chang_mot_passe_formt
        ,indic_actif
        ,decode (indic_actif, 'O', '<i class="fa fa-check"></i>', null) indic_actif_formt
        ,dernr_prodt_acces
        ,dernr_domn_acces
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_dv_compl_maxm
        ,code_utils_base_don
        ,parmt_authe_exter_afw
    from vd_i_afw_12_utils
/
