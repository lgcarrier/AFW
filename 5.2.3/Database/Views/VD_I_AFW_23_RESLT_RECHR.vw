SET DEFINE OFF;
create or replace force view vd_i_afw_23_reslt_rechr
(
  seqnc
 ,ref_rechr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_libl_struc_aplic_html
 ,dnr_libl_struc_aplic
 ,dnr_pertn
 ,dnr_lien
 ,dnr_decmp_reslt
 ,ref_aplic_modl_rechr
 ,dnr_ref_struc_aplic
 ,ref_seqnc_struc_aplic
)
as
  select seqnc
        ,ref_rechr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_libl_struc_aplic_html
        ,dnr_libl_struc_aplic
        ,dnr_pertn
        ,dnr_lien
        ,dnr_decmp_reslt
        ,ref_aplic_modl_rechr
        ,dnr_ref_struc_aplic
        ,ref_seqnc_struc_aplic
    from afw_23_reslt_rechr
/
