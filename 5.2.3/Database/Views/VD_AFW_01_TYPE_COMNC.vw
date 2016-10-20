SET DEFINE OFF;
create or replace force view vd_afw_01_type_comnc
(
  seqnc
 ,code
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_01_type_comnc
/
