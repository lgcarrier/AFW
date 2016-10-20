SET DEFINE OFF;
create or replace force view vd_afw_13_page_lang
(
  seqnc
 ,ref_page
 ,nom
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
 ,ref_dv_type_expre
 ,ref_dv_type_expre_formt
)
as
  select seqnc
        ,ref_page
        ,nom
        ,ref_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
        ,ref_dv_type_expre
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_expre) ref_dv_type_expre_formt
    from vd_i_afw_13_page_lang
/
