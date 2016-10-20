SET DEFINE OFF;
create or replace force view vd_i_afw_13_page_ir
(
  seqnc
 ,libl_regn
 ,id_apex
 ,ref_page
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,largr_deft
 ,unite_mesr_largr_deft
 ,code
 ,dnr_ref_aplic
 ,indic_forcr_ajust_page
 ,nombr_page_largr
)
as
  select seqnc
        ,libl_regn
        ,id_apex
        ,ref_page
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,largr_deft
        ,unite_mesr_largr_deft
        ,code
        ,dnr_ref_aplic
        ,indic_forcr_ajust_page
        ,nombr_page_largr
    from afw_13_page_ir
/
