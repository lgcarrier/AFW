SET DEFINE OFF;
create or replace force view vd_i_afw_17_courl
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,servr
 ,port
 ,domn
 ,nom_envoy
 ,adres_envoy
 ,sujet
 ,indic_formt_html
 ,authe_methd
 ,authe_usagr
 ,authe_mdp
 ,corps
 ,nombr_tentv
 ,nombr_tentv_max
 ,sens
 ,stat_soums
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,servr
        ,port
        ,domn
        ,nom_envoy
        ,adres_envoy
        ,sujet
        ,indic_formt_html
        ,authe_methd
        ,authe_usagr
        ,authe_mdp
        ,corps
        ,nombr_tentv
        ,nombr_tentv_max
        ,sens
        ,stat_soums
    from afw_17_courl
/
