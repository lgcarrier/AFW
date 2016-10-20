SET DEFINE OFF;
create or replace force view vd_i_afw_04_navgt_histr
(
  seqnc
 ,ref_utils
 ,dnr_libl
 ,dnr_url
 ,dnr_icon
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,dnr_libl
        ,dnr_url
        ,dnr_icon
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_04_navgt_histr
/
