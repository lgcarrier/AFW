SET DEFINE OFF;
create or replace force view vd_afw_30_page
(
  seqnc
 ,ref_afw_13_page
 ,nom
 ,numr_apex
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_afw_13_page
        ,nom
        ,numr_apex
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_30_page
/
