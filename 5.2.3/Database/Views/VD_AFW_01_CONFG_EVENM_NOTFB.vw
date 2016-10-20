SET DEFINE OFF;
create or replace force view vd_afw_01_confg_evenm_notfb
(
  seqnc
 ,ref_type_comnc
 ,ref_type_comnc_code_formt
 ,ref_type_comnc_formt
 ,ref_evenm_notfb
 ,ref_evenm_notfb_code_formt
 ,ref_evenm_notfb_formt
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
  select cen.seqnc
        ,cen.ref_type_comnc
        , (select tc.code
             from vd_i_afw_01_type_comnc tc
            where tc.seqnc = cen.ref_type_comnc)
        , (select tc.nom
             from vd_i_afw_01_type_comnc tc
            where tc.seqnc = cen.ref_type_comnc)
        ,cen.ref_evenm_notfb
        , (select en.code
             from vd_i_afw_01_evenm_notfb en
            where en.seqnc = cen.ref_evenm_notfb)
        , (select en.nom
             from vd_i_afw_01_evenm_notfb en
            where en.seqnc = cen.ref_evenm_notfb)
        ,cen.nom
        ,cen.descr
        ,cen.ref_domn
        ,cen.ref_compt_twili
        ,cen.ref_profl_courl
        ,cen.indic_deft
        ,cen.indic_envoi_difr
        ,cen.date_creat
        ,cen.utils_creat
        ,cen.date_modfc
        ,cen.utils_modfc
    from vd_i_afw_01_confg_evenm_notfb cen
/
