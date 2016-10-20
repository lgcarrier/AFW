SET DEFINE OFF;
create or replace force view vd_afw_12_actio_audit
(
  seqnc
 ,ref_struc_aplic
 ,dnr_ref_prodt
 ,code
 ,nom
 ,ref_mesg
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_struc_aplic
        ,dnr_ref_prodt
        ,code
        ,nom
        ,ref_mesg
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_actio_audit
/
