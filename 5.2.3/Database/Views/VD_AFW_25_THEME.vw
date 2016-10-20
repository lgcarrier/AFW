SET DEFINE OFF;
create or replace force view vd_afw_25_theme
(
  seqnc
 ,ref_group_publc
 ,dnr_ref_prodt
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_group_publc
        ,dnr_ref_prodt
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_25_theme
/
