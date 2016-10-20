SET DEFINE OFF;
create or replace force view vd_i_afw_01_osa_evenm_notfb
(
  seqnc
 ,ref_hierc_aplic
 ,ref_confg_evenm_notfb
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_seqnc_struc_aplic
)
as
  select seqnc
        ,ref_hierc_aplic
        ,ref_confg_evenm_notfb
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_seqnc_struc_aplic
    from afw_01_ocurn_sa_evenm_notfb
/
