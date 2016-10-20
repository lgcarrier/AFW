SET DEFINE OFF;
create or replace force view vd_i_afw_21_plugn_menu
(
  seqnc
 ,code
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,ref_dv_type_menu
 ,largr_regn_menu
 ,hautr_regn_menu
 ,ref_dv_orien_menu
 ,ref_dv_coulr_theme
 ,ref_dv_coulr_princ
 ,ref_menu
 ,ref_dv_formt_menu
 ,ref_prodt
)
as
  select seqnc
        ,code
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
        ,ref_dv_type_menu
        ,largr_regn_menu
        ,hautr_regn_menu
        ,ref_dv_orien_menu
        ,ref_dv_coulr_theme
        ,ref_dv_coulr_princ
        ,ref_menu
        ,ref_dv_formt_menu
        ,ref_prodt
    from afw_21_plugn_menu
/
