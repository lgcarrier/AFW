SET DEFINE OFF;
create or replace force view vd_afw_12_struc_aplic_destn
(
  seqnc
 ,ref_struc_aplic
 ,ref_struc_aplic_code
 ,ref_destn
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_struc_aplic
        , (select s.code
             from vd_i_afw_12_struc_aplic s
            where s.seqnc = sd.ref_struc_aplic)
           ref_struc_aplic_code
        ,ref_destn
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from vd_i_afw_12_struc_aplic_destn sd
/
