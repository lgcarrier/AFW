SET DEFINE OFF;
create or replace force view vs_afw_20_raprt_pkg
(
  numrt
 ,seqnc
 ,ref_dv_type_modl
 ,ref_dv_type_modl_formt
 ,ref_versn
 ,ref_modl
 ,ref_modl_formt
 ,nom_organ
 ,numr_surch
 ,indic_agreg
 ,indic_agreg_formt
 ,indic_pipln
 ,indic_pipln_formt
 ,indic_detrm
 ,indic_detrm_formt
 ,indic_authid_curnt_utils
 ,indic_authid_curnt_utils_formt
 ,indic_publc
 ,indic_publc_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,versn_bd_aplic
)
as
  select null
        ,seqnc
        ,ref_dv_type_modl
        ,ref_dv_type_modl_formt
        ,ref_versn
        ,ref_modl
        ,ref_modl_formt
        ,nom_organ
        ,numr_surch
        ,indic_agreg
        ,indic_agreg_formt
        ,indic_pipln
        ,indic_pipln_formt
        ,indic_detrm
        ,indic_detrm_formt
        ,indic_authid_curnt_utils
        ,indic_authid_curnt_utils_formt
        ,indic_publc
        ,indic_publc_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,versn_bd_aplic
    from vd_afw_20_modl m
   where m.ref_dv_type_modl_formt = 'Package'
/
