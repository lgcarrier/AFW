SET DEFINE OFF;
create or replace force view vd_afw_23_detl_reslt_rechr
(
  seqnc
 ,ref_rechr
 ,ref_enonc_rechr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_detl_aplic_modl_rechr
 ,dnr_pertn
 ,ref_seqnc_struc_aplic
 ,ref_reslt_rechr
)
as
  select seqnc
        ,ref_rechr
        ,ref_enonc_rechr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_detl_aplic_modl_rechr
        ,dnr_pertn
        ,ref_seqnc_struc_aplic
        ,ref_reslt_rechr
    from vd_i_afw_23_detl_reslt_rechr
/
