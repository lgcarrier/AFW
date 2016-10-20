SET DEFINE OFF;
create or replace force view vd_i_afw_01_hierc_aplic
(
  seqnc
 ,ref_evenm_notfb
 ,aplic_prior
 ,ref_atrib_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_evenm_notfb
        ,aplic_prior
        ,ref_atrib_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_01_hierc_aplic
/
