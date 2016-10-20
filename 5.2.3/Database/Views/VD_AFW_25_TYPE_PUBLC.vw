SET DEFINE OFF;
create or replace force view vd_afw_25_type_publc
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
 ,ref_struc_aplic_formt
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
        , (select nom
             from vd_i_afw_12_struc_aplic sa
            where tp.ref_struc_aplic = sa.seqnc)
           ref_struc_aplic_formt
        ,ref_prodt
        ,dnr_ref_prodt
    from vd_i_afw_25_type_publc tp
/
