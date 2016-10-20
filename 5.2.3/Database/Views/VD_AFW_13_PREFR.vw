SET DEFINE OFF;
create or replace force view vd_afw_13_prefr
(
  seqnc
 ,code
 ,ref_dv_condt_utils
 ,ref_dv_condt_utils_formt
 ,ref_dv_condt_utils_organ
 ,forml_condt_utils
 ,ref_dv_condt_sauvg
 ,ref_dv_condt_sauvg_formt
 ,ref_dv_condt_sauvg_organ
 ,forml_condt_sauvg
 ,ref_dv_type_insta
 ,ref_dv_type_insta_formt
 ,ref_dv_type_insta_organ
 ,indic_contx
 ,ref_dv_valr_insta
 ,ref_dv_valr_insta_formt
 ,ref_dv_valr_insta_organ
 ,forml_valr_insta
 ,descr_comnt
 ,ref_item
 ,ref_item_formt
 ,ref_aplic
 ,ref_code_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,ref_dv_condt_utils
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_condt_utils)
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_condt_utils)
        ,forml_condt_utils
        ,ref_dv_condt_sauvg
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_condt_sauvg)
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_condt_sauvg)
        ,forml_condt_sauvg
        ,ref_dv_type_insta
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_insta)
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_type_insta)
        ,indic_contx
        ,ref_dv_valr_insta
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_valr_insta)
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_valr_insta)
        ,forml_valr_insta
        ,descr_comnt
        ,ref_item
        , (select pi.libl
             from vd_afw_13_page_item pi
            where pi.seqnc = pr.ref_item)
           ref_item_formt
        , (select a.seqnc
             from vd_afw_13_page      p
                 ,vd_afw_11_aplic     a
                 ,vd_afw_13_page_item pi
            where     pi.seqnc = pr.ref_item
                  and pi.ref_page = p.seqnc
                  and p.ref_aplic = a.seqnc)
           ref_aplic
        , (select a.code
             from vd_afw_13_page      p
                 ,vd_afw_11_aplic     a
                 ,vd_afw_13_page_item pi
            where     pi.seqnc = pr.ref_item
                  and pi.ref_page = p.seqnc
                  and p.ref_aplic = a.seqnc)
           ref_code_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_prefr pr
/
