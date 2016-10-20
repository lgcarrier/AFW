SET DEFINE OFF;
create or replace force view vd_afw_25_elemn_confg_publc
(
  seqnc
 ,ref_type_publc
 ,ref_type_publc_formt
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_don
)
as
  select seqnc
        ,ref_type_publc
        , (select nom
             from vd_i_afw_25_type_publc
            where seqnc = ref_type_publc)
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_don
    from vd_i_afw_25_elemn_confg_publc
/
