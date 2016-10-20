SET DEFINE OFF;
create or replace force view vd_afw_17_courl
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
 ,indic_formt_html_formt
 ,authe_methd
 ,authe_usagr
 ,authe_mdp
 ,corps
 ,nombr_tentv
 ,nombr_tentv_max
 ,sens
 ,stat_soums
 ,stat_soums_formt
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
        ,case indic_formt_html when 'O' then 'Oui' when 'N' then 'Non' end                indic_formt_html_formt
        ,authe_methd
        ,authe_usagr
        ,authe_mdp
        ,corps
        ,nombr_tentv
        ,nombr_tentv_max
        ,sens
        ,stat_soums
        ,case stat_soums when 'ENVOY' then 'Envoyé' when 'A_ENVOY' then 'À envoyé' end stat_soums_formt
    from vd_i_afw_17_courl
/
