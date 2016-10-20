SET DEFINE OFF;
create or replace force view vd_i_afw_07_valr_audit_str_apl
(
  seqnc
 ,ref_audit_struc_aplic
 ,code
 ,valr_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_audit_struc_aplic
        ,code
        ,valr_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_07_valr_audit_struc_aplic
/
