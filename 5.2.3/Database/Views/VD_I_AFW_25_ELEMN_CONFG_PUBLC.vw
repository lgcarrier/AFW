SET DEFINE OFF;
create or replace force view vd_i_afw_25_elemn_confg_publc
(
  seqnc
 ,ref_type_publc
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
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_don
    from afw_25_elemn_confg_publc
/
