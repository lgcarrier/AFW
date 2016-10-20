SET DEFINE OFF;
create or replace force view vd_afw_17_profl_courl
(
  seqnc
 ,code
 ,servr_sortn
 ,port_sortn
 ,authe_mdp_sortn
 ,authe_methd_sortn
 ,authe_usagr_sortn
 ,indic_ssl_sortn
 ,servr_entra
 ,port_entra
 ,authe_mdp_entra
 ,authe_methd_entra
 ,authe_usagr_entra
 ,indic_ssl_entra
 ,domn
 ,nom_envoy
 ,adres_envoy
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_domn_formt
 ,nom
 ,descr
 ,protc_entra
 ,adres_suprt
 ,nom_suprt
 ,indic_ajout_suprt_cci
 ,indic_envir_sujet
)
as
  select seqnc
        ,code
        ,servr_sortn
        ,port_sortn
        ,authe_mdp_sortn
        ,authe_methd_sortn
        ,authe_usagr_sortn
        ,indic_ssl_sortn
        ,servr_entra
        ,port_entra
        ,authe_mdp_entra
        ,authe_methd_entra
        ,authe_usagr_entra
        ,indic_ssl_entra
        ,domn
        ,nom_envoy
        ,adres_envoy
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        , (select d.nom
             from vd_afw_12_domn d
            where d.seqnc = pc.ref_domn)
           ref_domn_formt
        ,nom
        ,descr
        ,protc_entra
        ,adres_suprt
        ,nom_suprt
        ,indic_ajout_suprt_cci
        ,indic_envir_sujet
    from vd_i_afw_17_profl_courl pc
/
