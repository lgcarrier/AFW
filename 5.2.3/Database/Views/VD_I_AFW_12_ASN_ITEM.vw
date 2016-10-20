SET DEFINE OFF;
create or replace force view vd_i_afw_12_asn_item
(
  seqnc
 ,ref_page
 ,ref_page_item
 ,ref_atrib_scenr_notfc
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_aplic
)
as
  select "SEQNC"
        ,"REF_PAGE"
        ,"REF_PAGE_ITEM"
        ,"REF_ATRIB_SCENR_NOTFC"
        ,"UTILS_CREAT"
        ,"DATE_CREAT"
        ,"UTILS_MODFC"
        ,"DATE_MODFC"
        ,"DNR_REF_APLIC"
    from afw_12_atrib_scenr_notfc_item
/
