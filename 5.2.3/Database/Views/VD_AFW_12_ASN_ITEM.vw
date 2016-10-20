SET DEFINE OFF;
create or replace force view vd_afw_12_asn_item
(
  seqnc
 ,ref_page
 ,ref_numr_aplic
 ,ref_numr_page
 ,ref_page_item
 ,ref_page_item_nom_apex
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
        , (select numr_aplic_apex
             from vd_i_afw_11_aplic a
                 ,vd_i_afw_13_page  p
            where     p.seqnc = asni.ref_page
                  and a.seqnc = p.ref_aplic)
           ref_numr_aplic
        ,afw_13_page_pkg.obten_numr_apex_page (ref_page) ref_numr_page
        ,"REF_PAGE_ITEM"
        , (select nom_apex
             from vd_i_afw_13_page_item pi
            where pi.seqnc = asni.ref_page_item)
           ref_page_item_nom_apex
        ,"REF_ATRIB_SCENR_NOTFC"
        ,"UTILS_CREAT"
        ,"DATE_CREAT"
        ,"UTILS_MODFC"
        ,"DATE_MODFC"
        ,"DNR_REF_APLIC"
    from vd_i_afw_12_asn_item asni
/
