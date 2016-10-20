SET DEFINE OFF;
create or replace force view vd_i_afw_13_condt_piltb
(
  seqnc
 ,ref_page
 ,code
 ,nom
 ,descr
 ,condt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_page_item_focus
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_page
        ,code
        ,nom
        ,descr
        ,condt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_page_item_focus
        ,dnr_ref_aplic
    from afw_13_condt_piltb
/
