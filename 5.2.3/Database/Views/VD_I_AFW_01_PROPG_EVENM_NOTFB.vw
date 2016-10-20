SET DEFINE OFF;
create or replace force view vd_i_afw_01_propg_evenm_notfb
(
  seqnc
 ,ref_evenm_notfb
 ,ref_seqnc_struc_aplic
 ,ref_utils
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_evenm_notfb
        ,ref_seqnc_struc_aplic
        ,ref_utils
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_01_propg_evenm_notfb
/
