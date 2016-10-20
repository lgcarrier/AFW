SET DEFINE OFF;
create or replace force view vd_afw_11_prodt
(
  seqnc
 ,code
 ,nom
 ,nom_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,procd_expor_metdn
 ,tail_tabl_extra
 ,indic_extra_tout
 ,ref_group_utils_admin
 ,dosr_fichr
 ,ident_envir
 ,ref_versn
 ,ref_numr_versn_formt
 ,ref_nom_versn
 ,mesg_tout_droit_resrv
 ,jquer_ui_css_scope
 ,indic_afich_err_code
 ,ref_mesg_sucs
 ,ref_mesg_echec
 ,ref_mesg_fetch
 ,ref_mesg_range_suprm
 ,ref_mesg_range_modf
 ,ref_mesg_range_inser
 ,ref_mesg_aucun_don_trouv
 ,ref_mesg_trop_don_trouv
 ,ref_mesg_audit_creat
 ,ref_mesg_audit_modfc
 ,ref_mesg_audit_suprs
 ,fonct_obten_base_url
 ,ref_aplic_acuei
 ,ref_numr_aplic_acuei
 ,ref_page_acuei
 ,ref_numr_page_acuei
 ,ref_aplic_comnt_bogue
 ,ref_numr_aplic_comnt_bogue
 ,ref_page_comnt_bogue
 ,ref_numr_page_comnt_bogue
 ,indic_page_inexs_maj_refrn
 ,procd_impre_entet_pdf_ir
 ,procd_impre_pied_page_pdf_ir
 ,procd_plpdf_coulr
 ,compt_genrl
 ,domn_docmn_html
 ,initl_comps_javsc
 ,note_scrip_pre_migrt
 ,note_scrip_post_migrt
 ,procd_initl_sesn
 ,fonct_migrt_persn
 ,indic_systm
)
as
  select seqnc
        ,code
        ,nom
        ,   p.nom
         || ' '
         || (select afw_11_versn_pkg.obten_versn (v.numr_versn_1
                                                 ,v.numr_versn_2
                                                 ,v.numr_versn_3
                                                 ,v.numr_versn_4)
               from vd_i_afw_11_versn v
              where v.seqnc = p.ref_versn)
           nom_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,procd_expor_metdn
        ,tail_tabl_extra
        ,indic_extra_tout
        ,ref_group_utils_admin
        ,dosr_fichr
        ,ident_envir
        ,ref_versn
        , (select afw_11_versn_pkg.obten_versn (v.numr_versn_1
                                               ,v.numr_versn_2
                                               ,v.numr_versn_3
                                               ,v.numr_versn_4)
             from vd_i_afw_11_versn v
            where v.seqnc = p.ref_versn)
           ref_numr_versn_formt
        , (select v.nom
             from vd_afw_11_versn v
            where v.seqnc = ref_versn)
           ref_nom_versn
        ,mesg_tout_droit_resrv
        ,jquer_ui_css_scope
        ,indic_afich_err_code
        , --afw_11_prodt_pkg.obten_lang_sesn ref_lang,
         --afw_11_prodt_pkg.obten_code_lang_sesn lang_formt,
         ref_mesg_sucs
        ,ref_mesg_echec
        ,ref_mesg_fetch
        ,ref_mesg_range_suprm
        ,ref_mesg_range_modf
        ,ref_mesg_range_inser
        ,ref_mesg_aucun_don_trouv
        ,ref_mesg_trop_don_trouv
        ,ref_mesg_audit_creat
        ,ref_mesg_audit_modfc
        ,ref_mesg_audit_suprs
        ,fonct_obten_base_url
        ,ref_aplic_acuei
        ,afw_11_prodt_pkg.obten_numr_apex_aplic_acuei
        , --afw_11_aplic_pkg.obten_numr_apex_aplic (p.ref_aplic_acuei) ref_numr_aplic_acuei,
         ref_page_acuei
        ,afw_11_prodt_pkg.obten_numr_apex_page_acuei
        , --afw_13_page_pkg.obten_numr_apex_page (p.ref_page_acuei) ref_numr_page_acuei,
         ref_aplic_comnt_bogue
        ,afw_11_aplic_pkg.obten_numr_apex_aplic (p.ref_aplic_comnt_bogue) ref_numr_aplic_comnt_bogue
        ,ref_page_comnt_bogue
        ,afw_13_page_pkg.obten_numr_apex_page (p.ref_page_comnt_bogue)    ref_numr_page_comnt_bogue
        ,indic_page_inexs_maj_refrn
        ,procd_impre_entet_pdf_ir
        ,procd_impre_pied_page_pdf_ir
        ,procd_plpdf_coulr
        ,compt_genrl
        ,domn_docmn_html
        ,initl_comps_javsc
        ,note_scrip_pre_migrt
        ,note_scrip_post_migrt
        ,procd_initl_sesn
        ,fonct_migrt_persn
        ,indic_systm
    from vd_i_afw_11_prodt p
/
