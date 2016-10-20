SET DEFINE OFF;
create or replace force view vd_afw_01_osa_evenm_notfb
(
  seqnc
 ,ref_hierc_aplic
 ,ref_confg_evenm_notfb
 ,ref_seqnc_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_hierc_aplic
        ,ref_confg_evenm_notfb
        ,ref_seqnc_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_01_osa_evenm_notfb
/
