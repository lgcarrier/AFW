SET DEFINE OFF;
create or replace force view vd_afw_25_domn_type_publc
(
  seqnc
 ,ref_domn
 ,ref_type_publc
 ,ref_type_publc_formt
 ,ref_publc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_domn
        ,ref_type_publc
        , (select nom
             from vd_i_afw_25_type_publc
            where seqnc = ref_type_publc)
        ,ref_publc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_25_domn_type_publc
/
