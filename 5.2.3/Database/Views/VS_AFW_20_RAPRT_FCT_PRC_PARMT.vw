SET DEFINE OFF;
create or replace force view vs_afw_20_raprt_fct_prc_parmt
(
  seqnc
 ,ref_modl
 ,nom_organ
 ,ref_dv_type_don
 ,ref_dv_type_don_formt
 ,postn
 ,valr_deft
 ,sens
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_publc
 ,indic_publc_formt
 ,indic_retr
)
as
  select seqnc
        ,ref_modl
        ,nom_organ
        ,ref_dv_type_don
        ,afw_14_domn_valr_pkg.obten_valr (m.ref_dv_type_don)
        ,postn
        ,valr_deft
        ,sens
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_publc
        ,case indic_publc when 'O' then 'Oui' else 'Non' end indic_publc_formt
        ,indic_retr
    from vd_i_afw_20_modl_parmt m
/
