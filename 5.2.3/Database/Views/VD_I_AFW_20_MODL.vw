SET DEFINE OFF;
create or replace force view vd_i_afw_20_modl
(
  seqnc
 ,ref_versn
 ,ref_modl
 ,nom_organ
 ,numr_surch
 ,indic_agreg
 ,indic_pipln
 ,indic_detrm
 ,indic_authid_curnt_utils
 ,indic_publc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,versn_bd_aplic
 ,ref_dv_type_modl
)
as
  select seqnc
        ,ref_versn
        ,ref_modl
        ,nom_organ
        ,numr_surch
        ,indic_agreg
        ,indic_pipln
        ,indic_detrm
        ,indic_authid_curnt_utils
        ,indic_publc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,versn_bd_aplic
        ,ref_dv_type_modl
    from afw_20_modl
/
