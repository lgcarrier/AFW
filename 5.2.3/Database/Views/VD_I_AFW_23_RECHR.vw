SET DEFINE OFF;
create or replace force view vd_i_afw_23_rechr
(
  seqnc
 ,ref_utils
 ,date_exect
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_modl_rechr
)
as
  select seqnc
        ,ref_utils
        ,date_exect
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_modl_rechr
    from afw_23_rechr
/
