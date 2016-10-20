SET DEFINE OFF;
create or replace force view vd_afw_20_modl
(
  seqnc
 ,ref_dv_type_modl
 ,ref_dv_type_modl_formt
 ,ref_dv_type_modl_code
 ,ref_versn
 ,ref_modl
 ,ref_modl_formt
 ,nom_organ
 ,numr_surch
 ,indic_agreg
 ,indic_agreg_formt
 ,indic_pipln
 ,indic_pipln_formt
 ,indic_detrm
 ,indic_detrm_formt
 ,indic_authid_curnt_utils
 ,indic_authid_curnt_utils_formt
 ,indic_publc
 ,indic_publc_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,versn_bd_aplic
)
as
  select seqnc
        ,ref_dv_type_modl
        ,afw_14_domn_valr_pkg.obten_valr (m.ref_dv_type_modl)
        ,afw_14_domn_valr_pkg.obten_code (m.ref_dv_type_modl)
        ,ref_versn
        ,ref_modl
        , (select nom_organ
             from vd_i_afw_20_modl n
            where n.seqnc = m.ref_modl)
           ref_modl_formt
        ,nom_organ
        ,numr_surch
        ,indic_agreg
        ,case indic_agreg when 'O' then 'Oui' else 'Non' end              indic_agreg_formt
        ,indic_pipln
        ,case indic_pipln when 'O' then 'Oui' else 'Non' end              indic_pipln_formt
        ,indic_detrm
        ,case indic_detrm when 'O' then 'Oui' else 'Non' end              indic_detrm_formt
        ,indic_authid_curnt_utils
        ,case indic_authid_curnt_utils when 'O' then 'Oui' else 'Non' end indic_authid_curnt_utils_formt
        ,indic_publc
        ,case indic_publc when 'O' then 'Oui' else 'Non' end              indic_publc_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,versn_bd_aplic
    from vd_i_afw_20_modl m
/
