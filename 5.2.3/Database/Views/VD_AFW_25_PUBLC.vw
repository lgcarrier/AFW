SET DEFINE OFF;
create or replace force view vd_afw_25_publc
(
  seqnc
 ,ref_type_publc
 ,ref_type_publc_fomrt
 ,ref_code_type_publc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_group_publc
)
as
  select seqnc
        ,ref_type_publc
        , (select nom
             from vd_afw_25_type_publc
            where seqnc = ref_type_publc)
        , (select code
             from vd_afw_25_type_publc
            where seqnc = ref_type_publc)
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_group_publc
    from vd_i_afw_25_publc
/
