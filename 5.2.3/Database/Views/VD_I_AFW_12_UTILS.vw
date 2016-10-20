SET DEFINE OFF;
create or replace force view vd_i_afw_12_utils
(
  seqnc
 ,nom
 ,prenm
 ,code_utils
 ,mot_passe
 ,date_expir
 ,indic_verl
 ,indic_chang_mot_passe
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,courl
 ,dernr_prodt_acces
 ,indic_actif
 ,dernr_domn_acces
 ,ref_dv_compl_maxm
 ,code_utils_base_don
 ,parmt_authe_exter_afw
)
as
  select seqnc
        ,nom
        ,prenm
        ,code_utils
        ,mot_passe
        ,date_expir
        ,indic_verl
        ,indic_chang_mot_passe
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,courl
        ,dernr_prodt_acces
        ,indic_actif
        ,dernr_domn_acces
        ,ref_dv_compl_maxm
        ,code_utils_base_don
        ,parmt_authe_exter_afw
    from afw_12_utils
/
