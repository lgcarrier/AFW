SET DEFINE OFF;
create or replace force view vd_i_afw_12_insta_sn_log
(
  seqnc
 ,ref_utils
 ,ref_struc_aplic
 ,ref_seqnc_struc_aplic
 ,ref_insta_scenr_notfc
 ,ref_atrib_scenr_notfc_item
 ,id_item_apex
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_struc_aplic
        ,ref_seqnc_struc_aplic
        ,ref_insta_scenr_notfc
        ,ref_atrib_scenr_notfc_item
        ,id_item_apex
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_12_insta_scenr_notfc_log
/
