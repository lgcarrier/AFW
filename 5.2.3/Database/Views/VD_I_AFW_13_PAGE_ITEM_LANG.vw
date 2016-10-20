SET DEFINE OFF;
create or replace force view vd_i_afw_13_page_item_lang
(
  seqnc
 ,ref_page_item
 ,nom
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_page_item
        ,nom
        ,ref_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_page_item_lang
/
