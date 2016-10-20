SET DEFINE OFF;
create or replace force view vd_i_afw_01_destn
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_atrib_struc_aplic
 ,descr
 ,dnr_ref_prodt
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_atrib_struc_aplic
        ,descr
        ,dnr_ref_prodt
    from afw_01_destn
/
