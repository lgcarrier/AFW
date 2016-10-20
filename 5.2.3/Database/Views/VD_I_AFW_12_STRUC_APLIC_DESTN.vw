SET DEFINE OFF;
create or replace force view vd_i_afw_12_struc_aplic_destn
(
  seqnc
 ,ref_struc_aplic
 ,ref_destn
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_struc_aplic
        ,ref_destn
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_12_struc_aplic_destn
/
