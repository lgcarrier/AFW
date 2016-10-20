SET DEFINE OFF;
create or replace force view vd_afw_21_plugn_menu
(
  seqnc
 ,code
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,ref_dv_type_menu
 ,ref_dv_type_menu_code
 ,ref_dv_type_menu_formt
 ,largr_regn_menu
 ,hautr_regn_menu
 ,ref_dv_orien_menu
 ,ref_dv_orien_menu_code
 ,ref_dv_orien_menu_formt
 ,ref_dv_coulr_theme
 ,ref_dv_coulr_theme_code
 ,ref_dv_coulr_theme_formt
 ,ref_dv_coulr_princ
 ,ref_dv_coulr_princ_code
 ,ref_dv_coulr_princ_formt
 ,ref_dv_formt_menu
 ,ref_dv_formt_menu_code
 ,ref_dv_formt_menu_formt
 ,ref_menu
 ,ref_menu_formt
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
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_menu)   ref_dv_type_menu_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_menu)   ref_dv_type_menu_formt
        ,largr_regn_menu
        ,hautr_regn_menu
        ,ref_dv_orien_menu
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_orien_menu)  ref_dv_orien_menu_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_orien_menu)  ref_dv_orien_menu_formt
        ,ref_dv_coulr_theme
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_coulr_theme) ref_dv_coulr_theme_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_coulr_theme) ref_dv_coulr_theme_formt
        ,ref_dv_coulr_princ
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_coulr_princ) ref_dv_coulr_princ_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_coulr_princ) ref_dv_coulr_princ_formt
        ,ref_dv_formt_menu
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_formt_menu)  ref_dv_formt_menu_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_formt_menu)  ref_dv_formt_menu_formt
        ,ref_menu
        , (select nom
             from vd_i_afw_13_menu m
            where m.seqnc = ref_menu)
           ref_menu_formt
        ,ref_prodt
    from vd_i_afw_21_plugn_menu
/
