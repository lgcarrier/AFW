SET DEFINE OFF;
create or replace force view vd_afw_13_regn_piltb
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_page
 ,ref_dv_type_regn_piltb
 ,ref_dv_type_regn_piltb_formt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_page
        ,ref_dv_type_regn_piltb
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_regn_piltb)
    from vd_i_afw_13_regn_piltb
/
