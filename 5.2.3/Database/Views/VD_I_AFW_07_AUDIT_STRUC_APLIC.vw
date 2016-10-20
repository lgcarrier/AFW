SET DEFINE OFF;
create or replace force view vd_i_afw_07_audit_struc_aplic
(
  seqnc
 ,ref_utils
 ,ref_seqnc_struc_aplic
 ,dnr_ref_seqnc_sa_formt
 ,ref_struc_aplic
 ,ref_actio_audit
 ,ref_page
 ,natr_audit
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
)
as
  select seqnc
        ,ref_utils
        ,ref_seqnc_struc_aplic
        ,dnr_ref_seqnc_sa_formt
        ,ref_struc_aplic
        ,ref_actio_audit
        ,ref_page
        ,natr_audit
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
    from afw_07_audit_struc_aplic
/
