SET DEFINE OFF;
create or replace force view vd_afw_13_page
(
  seqnc
 ,numr_apex
 ,nom
 ,nom_formt
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_aplic
 ,app_id_formt
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,indic_prise_charg_afw01
 ,indic_prise_charg_afw04
 ,ref_mesg_suprs_specf
 ,ref_code_mesg_suprs_specf
 ,indic_prise_charg_afw19
 ,indic_prise_charg_afw13_navgt
 ,indic_prise_charg_afw13_confr
 ,indic_prise_charg_afw18
 ,indic_prise_charg_afw14_popup
 ,ref_page_rechr
 ,prefx_mesg
 ,date_dernr_maj_refrn_apex
 ,ref_mesg_sucs_specf
 ,ref_mesg_echec_specf
 ,ref_mesg_fetch_specf
 ,ref_mesg_range_suprm_specf
 ,ref_mesg_range_modf_specf
 ,ref_mesg_range_inser_specf
 ,ref_mesg_aucun_don_trouv
 ,ref_mesg_trop_don_trouv
 ,liste_fonct
)
as
  select seqnc
        ,numr_apex
        ,nom
        ,   numr_apex
         || ' - '
         || nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_aplic
        , (select p.numr_aplic_apex
             from vd_i_afw_11_aplic p
            where p.seqnc = pag.ref_aplic)
           app_id_formt
        ,ref_struc_aplic
        , (select nom
             from vd_i_afw_12_struc_aplic
            where seqnc = pag.ref_struc_aplic)
           ref_struc_aplic_formt
        ,indic_prise_charg_afw01
        ,indic_prise_charg_afw04
        ,ref_mesg_suprs_specf
        , (select m.numr_mesg
             from vd_i_afw_01_mesg m
            where m.seqnc = pag.ref_mesg_suprs_specf)
           ref_code_mesg_suprs_specf
        ,indic_prise_charg_afw19
        ,indic_prise_charg_afw13_navgt
        ,indic_prise_charg_afw13_confr
        ,indic_prise_charg_afw18
        ,indic_prise_charg_afw14_popup
        ,ref_page_rechr
        ,prefx_mesg
        ,date_dernr_maj_refrn_apex
        ,ref_mesg_sucs_specf
        ,ref_mesg_echec_specf
        ,ref_mesg_fetch_specf
        ,ref_mesg_range_suprm_specf
        ,ref_mesg_range_modf_specf
        ,ref_mesg_range_inser_specf
        ,ref_mesg_aucun_don_trouv
        ,ref_mesg_trop_don_trouv
        ,afw_12_fonct_pkg.obten_liste_fonct (pag.seqnc)
    from vd_i_afw_13_page pag
/
