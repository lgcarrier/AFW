SET DEFINE OFF;
create or replace force view vd_i_afw_01_confg_evenm_notfb
(
  seqnc
 ,ref_type_comnc
 ,ref_evenm_notfb
 ,nom
 ,descr
 ,ref_domn
 ,ref_compt_twili
 ,ref_profl_courl
 ,indic_deft
 ,indic_envoi_difr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_type_comnc
        ,ref_evenm_notfb
        ,nom
        ,descr
        ,ref_domn
        ,ref_compt_twili
        ,ref_profl_courl
        ,indic_deft
        ,indic_envoi_difr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_01_confg_evenm_notfb
/
