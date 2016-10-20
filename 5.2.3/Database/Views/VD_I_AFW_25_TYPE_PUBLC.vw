SET DEFINE OFF;
create or replace force view vd_i_afw_25_type_publc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_aplic
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_struc_aplic
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_25_type_publc
/
