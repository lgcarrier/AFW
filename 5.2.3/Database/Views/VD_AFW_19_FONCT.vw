SET DEFINE OFF;
create or replace force view vd_afw_19_fonct
(
  seqnc
 ,code
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom_formt
 ,descr_formt
 ,titre_atrib1
 ,titre_atrib2
 ,titre_atrib3
 ,titre_atrib4
 ,titre_atrib5
 ,ref_dv_type_atrib1
 ,ref_dv_type_atrib1_formt
 ,ref_code_type_atrib1_formt
 ,ref_dv_type_atrib2
 ,ref_dv_type_atrib2_formt
 ,ref_code_type_atrib2_formt
 ,ref_dv_type_atrib3
 ,ref_dv_type_atrib3_formt
 ,ref_code_type_atrib3_formt
 ,ref_dv_type_atrib4
 ,ref_dv_type_atrib4_formt
 ,ref_code_type_atrib4_formt
 ,ref_dv_type_atrib5
 ,ref_dv_type_atrib5_formt
 ,ref_code_type_atrib5_formt
 ,valr_deft_atrib1
 ,valr_deft_atrib2
 ,valr_deft_atrib3
 ,valr_deft_atrib4
 ,valr_deft_atrib5
 ,ref_dv_type_actio
 ,ref_dv_type_actio_formt
 ,ref_code_type_actio_formt
 ,expre_actio
 ,ref_dv_type_expre
 ,ref_dv_type_expre_formt
 ,ref_code_type_expre_formt
 ,indic_afect_input_html
 ,indic_prevn_actio_deft
 ,indic_cle
 ,indic_boutn
 ,condt_prise_charg
)
as
  select seqnc
        ,code
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,afw_19_fonct_pkg.obten_nom_lang (seqnc)              nom_formt
        ,afw_19_fonct_pkg.obten_descr_lang (seqnc)            descr_formt
        ,titre_atrib1
        ,titre_atrib2
        ,titre_atrib3
        ,titre_atrib4
        ,titre_atrib5
        ,ref_dv_type_atrib1
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib1) ref_dv_type_atrib1_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_atrib1) ref_code_type_atrib1_formt
        ,ref_dv_type_atrib2
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib2) ref_dv_type_atrib2_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_atrib2) ref_code_type_atrib2_formt
        ,ref_dv_type_atrib3
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib3) ref_dv_type_atrib3_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_atrib3) ref_code_type_atrib3_formt
        ,ref_dv_type_atrib4
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib4) ref_dv_type_atrib4_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_atrib4) ref_code_type_atrib4_formt
        ,ref_dv_type_atrib5
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib5) ref_dv_type_atrib5_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_atrib5) ref_code_type_atrib5_formt
        ,valr_deft_atrib1
        ,valr_deft_atrib2
        ,valr_deft_atrib3
        ,valr_deft_atrib4
        ,valr_deft_atrib5
        ,ref_dv_type_actio
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_actio)  ref_dv_type_actio_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_actio)  ref_code_type_actio_formt
        ,expre_actio
        ,ref_dv_type_expre
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_expre)  ref_dv_type_expre_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_expre)  ref_code_type_expre_formt
        ,indic_afect_input_html
        ,indic_prevn_actio_deft
        ,indic_cle
        ,indic_boutn
        ,condt_prise_charg
    from vd_i_afw_19_fonct
/
