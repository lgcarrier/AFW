SET DEFINE OFF;
create or replace force view vd_afw_11_utils
(
  seqnc
 ,ref_prodt
 ,ref_utils
 ,role
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,ref_utils
        ,role
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_11_utils
/
