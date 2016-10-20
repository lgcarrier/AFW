SET DEFINE OFF;
create or replace force view vd_afw_01_evenm_notfb
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
 ,ref_struc_aplic_code
 ,ref_struc_aplic_formt
 ,ref_prodt
 ,ref_prodt_formt
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
        , (select code
             from vd_afw_12_struc_aplic sa
            where sa.seqnc = en.ref_struc_aplic)
           ref_struc_aplic_code
        , (select nom
             from vd_afw_12_struc_aplic sa
            where sa.seqnc = en.ref_struc_aplic)
           ref_struc_aplic_formt
        , (select ref_prodt
             from vd_afw_12_struc_aplic sa
            where sa.seqnc = en.ref_struc_aplic)
           ref_prodt
        , (select ref_prodt_formt
             from vd_afw_12_struc_aplic sa
            where sa.seqnc = en.ref_struc_aplic)
           ref_prodt_formt
    from vd_i_afw_01_evenm_notfb en
/
