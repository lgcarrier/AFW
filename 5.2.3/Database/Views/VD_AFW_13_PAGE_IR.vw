SET DEFINE OFF;
create or replace force view vd_afw_13_page_ir
(
  seqnc
 ,libl_regn
 ,id_apex
 ,ref_page
 ,app_id_formt
 ,app_page_id_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,largr_deft
 ,unite_mesr_largr_deft
 ,code
 ,indic_forcr_ajust_page
 ,nombr_page_largr
)
as
  select seqnc
        ,libl_regn
        ,id_apex
        ,ref_page
        , (select pag.app_id_formt
             from vd_afw_13_page pag
            where pag.seqnc = pir.ref_page)
           app_id_formt
        , (select pag.numr_apex
             from vd_afw_13_page pag
            where pag.seqnc = pir.ref_page)
           app_page_id_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,largr_deft
        ,unite_mesr_largr_deft
        ,code
        ,indic_forcr_ajust_page
        ,nombr_page_largr
    from vd_i_afw_13_page_ir pir
/
