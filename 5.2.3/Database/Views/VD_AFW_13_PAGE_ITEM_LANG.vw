SET DEFINE OFF;
create or replace force view vd_afw_13_page_item_lang
(
  seqnc
 ,ref_page_item
 ,nom
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
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
    from vd_i_afw_13_page_item_lang
/
