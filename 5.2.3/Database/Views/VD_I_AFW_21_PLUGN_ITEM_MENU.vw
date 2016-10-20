SET DEFINE OFF;
create or replace force view vd_i_afw_21_plugn_item_menu
(
  seqnc
 ,ref_item_menu
 ,ref_plugn_menu
 ,niv_item
 ,etend_nombr_coln
 ,rang_item
 ,coln_item
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,ref_dv_contn_item_menu
 ,ref_dv_align
)
as
  select seqnc
        ,ref_item_menu
        ,ref_plugn_menu
        ,niv_item
        ,etend_nombr_coln
        ,rang_item
        ,coln_item
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
        ,ref_dv_contn_item_menu
        ,ref_dv_align
    from afw_21_plugn_item_menu
/
