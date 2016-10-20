SET DEFINE OFF;
create or replace force view vd_i_afw_25_publc
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
 ,ref_group_publc
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
        ,ref_group_publc
    from afw_25_publc
/
