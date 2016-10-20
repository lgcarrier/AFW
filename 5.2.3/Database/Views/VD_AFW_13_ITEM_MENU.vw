SET DEFINE OFF;
create or replace force view vd_afw_13_item_menu
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
 ,ref_code_aplic_formt
 ,ref_aplic_formt
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,ref_resrc
 ,ref_ocurn_resrc
 ,ref_formt_resrc
 ,indic_gerer_sidf
 ,ref_dv_valr_insta_condt_afich
 ,forml_condt_afich
 ,lien_id_html
 ,lien_class_css_html
 ,lien_atrib_html
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,forml_libl
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
           as forml_libl_formt
        ,ref_dv_valr_insta_libl
        , (select ddv.code_valr
             from vd_i_afw_14_detl_domn_valr ddv
            where ddv.seqnc = im.ref_dv_valr_insta_libl)
           as ref_dv_vil_code
        ,aide_insta
        ,titre_aide_insta
        ,ordre_presn
        ,ref_page
        , (select p.nom
             from vd_i_afw_13_page p
            where p.seqnc = im.ref_page)
           as ref_page_formt
        , (select p.numr_apex
             from vd_i_afw_13_page p
            where p.seqnc = im.ref_page)
           as ref_page_numr_apex
        , (select p.app_id_formt
             from vd_afw_13_page p
            where p.seqnc = im.ref_page)
           as ref_prodt_numr_apex_menu
        , (select p.ref_struc_aplic
             from vd_i_afw_13_page p
            where p.seqnc = im.ref_page)
           as ref_page_struc_aplic
        ,ref_dv_valr_url
        ,forml_valr_url
        ,icone
        ,efacr_cache
        ,ref_menu
        ,ref_item_menu
        , (select im2.nom
             from vd_i_afw_13_item_menu im2
            where im2.seqnc = im.ref_item_menu)
           as ref_item_menu_formt
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
        , (select p.code
             from vd_i_afw_11_aplic p
            where p.seqnc = im.ref_aplic)
           as ref_code_aplic_formt
        , (select a.nom
             from vd_afw_11_aplic a
            where a.seqnc = im.ref_aplic)
           as ref_aplic_formt
        ,ref_struc_aplic
        , (select nom
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = im.ref_struc_aplic)
           as ref_struc_aplic_formt
        ,ref_resrc
        ,ref_ocurn_resrc
        ,ref_formt_resrc
        ,indic_gerer_sidf
        ,ref_dv_valr_insta_condt_afich
        ,forml_condt_afich
        ,lien_id_html
        ,lien_class_css_html
        ,lien_atrib_html
    from vd_i_afw_13_item_menu im
/
