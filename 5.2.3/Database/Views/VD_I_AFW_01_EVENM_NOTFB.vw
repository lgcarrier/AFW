SET DEFINE OFF;
create or replace force view vd_i_afw_01_evenm_notfb
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
        ,dnr_ref_prodt
    from afw_01_evenm_notfb
/
