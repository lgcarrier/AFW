SET DEFINE OFF;
create or replace force view vd_i_afw_13_page_prefr_navgt
(
  seqnc
 ,ref_page
 ,ref_page_ir
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_page
        ,ref_page_ir
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_page_prefr_navgt
/
