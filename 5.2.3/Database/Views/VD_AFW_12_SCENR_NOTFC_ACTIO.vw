SET DEFINE OFF;
create or replace force view vd_afw_12_scenr_notfc_actio
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_scenr_notfc
 ,ref_struc_aplic_stat
 ,ref_atrib_struc_aplic_stat
 ,ref_stat
 ,ref_evenm_notfb
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_scenr_notfc
        ,ref_struc_aplic_stat
        ,ref_atrib_struc_aplic_stat
        ,ref_stat
        ,ref_evenm_notfb
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_prodt
    from vd_i_afw_12_scenr_notfc_actio
/
