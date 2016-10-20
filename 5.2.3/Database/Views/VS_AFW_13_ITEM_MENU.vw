SET DEFINE OFF;
create or replace force view vs_afw_13_item_menu
(
  seqnc
 ,code
 ,nom
 ,descr
 ,forml_libl
 ,forml_libl_formt
 ,ref_dv_valr_insta_libl
 ,ref_dv_vil_code
 ,aide_insta
 ,titre_aide_insta
 ,ordre_presn
 ,ref_page
 ,ref_page_formt
 ,ref_page_numr_apex
 ,ref_prodt_numr_apex_menu
 ,ref_page_struc_aplic
 ,ref_dv_valr_url
 ,forml_valr_url
 ,icone
 ,efacr_cache
 ,ref_menu
 ,ref_item_menu
 ,ref_item_menu_formt
 ,ref_dv_valr_reqst
 ,forml_valr_reqst
 ,indic_reint_pagnt
 ,indic_reint_page_ir
 ,indic_clear_page_ir
 ,indic_soums_page
 ,indic_reint_navgt
 ,ref_dv_valr_scpc
 ,forml_valr_scpc
 ,ref_dv_valr_sspc
 ,forml_valr_sspc
 ,ref_dv_valr_sapc
 ,forml_valr_sapc
 ,ref_dv_valr_scpi
 ,forml_valr_scpi
 ,ref_dv_valr_sspi
 ,forml_valr_sspi
 ,ref_dv_valr_sapi
 ,forml_valr_sapi
 ,ref_dv_valr_snpi
 ,forml_valr_snpi
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,liste_ref_page_activ
 ,ref_aplic
 ,ref_aplic_formt
 ,ref_struc_aplic
 ,ref_resrc
 ,ref_ocurn_resrc
 ,ref_formt_resrc
 ,lien_id_html
 ,lien_class_css_html
 ,lien_atrib_html
)
as
  select im.seqnc
        ,im.code
        ,im.nom
        ,im.descr
        ,im.forml_libl
        ,case
           when (select ddv.code_valr
                   from vd_i_afw_14_detl_domn_valr ddv
                  where ddv.seqnc = im.ref_dv_valr_insta_libl) in ('ITEM'
                                                                  ,'PL/SQL')
           then
             afw_13_menu_pkg.obten_libl (im.seqnc)
           else
             forml_libl
         end
           forml_libl_formt
        ,im.ref_dv_valr_insta_libl
        , (select ddv.code_valr
             from vd_i_afw_14_detl_domn_valr ddv
            where ddv.seqnc = im.ref_dv_valr_insta_libl)
           ref_dv_vil_code
        ,im.aide_insta
        ,im.titre_aide_insta
        ,im.ordre_presn
        ,im.ref_page
        ,p.nom
        ,p.numr_apex
        ,p.app_id_formt
        ,p.ref_struc_aplic
        ,im.ref_dv_valr_url
        ,im.forml_valr_url
        ,im.icone
        ,im.efacr_cache
        ,im.ref_menu
        ,im.ref_item_menu
        , (select im2.nom
             from vd_i_afw_13_item_menu im2
            where im2.seqnc = im.ref_item_menu)
           ref_item_menu_formt
        ,im.ref_dv_valr_reqst
        ,im.forml_valr_reqst
        ,im.indic_reint_pagnt
        ,im.indic_reint_page_ir
        ,im.indic_clear_page_ir
        ,im.indic_soums_page
        ,im.indic_reint_navgt
        ,im.ref_dv_valr_scpc
        ,im.forml_valr_scpc
        ,im.ref_dv_valr_sspc
        ,im.forml_valr_sspc
        ,im.ref_dv_valr_sapc
        ,im.forml_valr_sapc
        ,im.ref_dv_valr_scpi
        ,im.forml_valr_scpi
        ,im.ref_dv_valr_sspi
        ,im.forml_valr_sspi
        ,im.ref_dv_valr_sapi
        ,im.forml_valr_sapi
        ,im.ref_dv_valr_snpi
        ,im.forml_valr_snpi
        ,im.date_creat
        ,im.utils_creat
        ,im.date_modfc
        ,im.utils_modfc
        ,im.liste_ref_page_activ
        ,im.ref_aplic
        ,a.code ref_aplic_formt
        ,im.ref_struc_aplic
        ,im.ref_resrc
        ,im.ref_ocurn_resrc
        ,im.ref_formt_resrc
        ,im.lien_id_html
        ,im.lien_class_css_html
        ,im.lien_atrib_html
    from vd_afw_11_aplic       a
        ,vd_afw_13_page        p
        ,vd_i_afw_13_item_menu im
   where     a.seqnc(+) = im.ref_aplic
         and p.seqnc(+) = im.ref_page
/
