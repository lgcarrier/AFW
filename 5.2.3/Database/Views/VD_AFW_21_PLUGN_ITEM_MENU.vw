SET DEFINE OFF;
create or replace force view vd_afw_21_plugn_item_menu
(
  seqnc
 ,ref_item_menu
 ,ref_item_menu_formt
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
 ,clas_css_elemn
 ,clas_css_racn
 ,ref_dv_contn_item_menu
 ,ref_dv_contn_item_menu_code
 ,ref_dv_contn_im_valr_organ
 ,ref_dv_align
 ,ref_dv_align_code
 ,ref_dv_align_valr_organ
)
as
  select seqnc
        ,ref_item_menu
        , (select nom
             from vd_i_afw_13_item_menu im
            where im.seqnc = pim.ref_item_menu)
           ref_item_menu_formt
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
        ,afw_21_plugn_menu_pkg.obten_clas_css_elemn (pim.seqnc)         clas_css_elemn
        ,afw_21_plugn_menu_pkg.obten_clas_css_racn (pim.seqnc)          clas_css_racn
        ,ref_dv_contn_item_menu
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_contn_item_menu)       ref_dv_contn_item_menu_code
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_contn_item_menu) ref_dv_contn_im_valr_organ
        ,ref_dv_align
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_align)                 ref_dv_align_code
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_align)           ref_dv_align_valr_organ
    from vd_i_afw_21_plugn_item_menu pim
/
