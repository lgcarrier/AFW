SET DEFINE OFF;
create or replace force view vd_afw_12_defnt_acces
(
  seqnc
 ,ref_group_utils
 ,ref_group_utils_formt
 ,ref_utils
 ,ref_utils_formt
 ,indic_acces
 ,indic_acces_formt
 ,indic_modfc
 ,indic_modfc_formt
 ,indic_suprs
 ,indic_suprs_formt
 ,indic_creat
 ,indic_creat_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_opert
 ,ref_opert_formt
 ,ref_code_opert
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,ref_code_struc_aplic
)
as
  select seqnc
        ,ref_group_utils
        , (select nom
             from vd_i_afw_12_group_utils
            where seqnc = dac.ref_group_utils)
           ref_group_utils_formt
        ,ref_utils
        ,null ref_utils_formt
        ,indic_acces
        ,afw_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES'
                                         ,indic_acces)
           indic_acces_formt
        ,indic_modfc
        ,afw_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES'
                                         ,indic_modfc)
           indic_modfc_formt
        ,indic_suprs
        ,afw_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES'
                                         ,indic_suprs)
           indic_suprs_formt
        ,indic_creat
        ,afw_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES'
                                         ,indic_creat)
           indic_creat_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_opert
        , (select nom
             from vd_i_afw_13_opert
            where seqnc = dac.ref_opert)
           ref_opert_formt
        , (select code
             from vd_i_afw_13_opert
            where seqnc = dac.ref_opert)
           ref_code_opert
        ,ref_struc_aplic
        , (select nom
             from vd_i_afw_12_struc_aplic
            where seqnc = dac.ref_struc_aplic)
           ref_struc_aplic_formt
        , (select code
             from vd_i_afw_12_struc_aplic
            where seqnc = dac.ref_struc_aplic)
           ref_code_struc_aplic
    from vd_i_afw_12_defnt_acces dac
/
