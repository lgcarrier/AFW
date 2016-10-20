SET DEFINE OFF;
create or replace force view vd_afw_25_engin
(
  seqnc
 ,code
 ,ref_dv_formt_sort
 ,ref_dv_formt_sort_formt
 ,url_servl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,url_servl_exter
)
as
  select seqnc
        ,code
        ,ref_dv_formt_sort
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_formt_sort)
        ,url_servl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,url_servl_exter
    from vd_i_afw_25_engin
/
