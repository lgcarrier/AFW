SET DEFINE OFF;
create or replace force view vd_afw_01_destn_confg_en
(
  seqnc
 ,ref_dv_natr_destn
 ,ref_dv_natr_destn_code
 ,ref_dv_natr_destn_valr
 ,ref_confg_evenm_notfb
 ,ref_destn
 ,ref_reslt_destn
 ,ref_reslt_destn_formt
 ,ref_atrib_sa_nom_formt
 ,ref_atrib_sa_nom_formt_code
 ,ref_atrib_sa_adres_destn
 ,ref_atrib_sa_adres_destn_code
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,date_creat
)
as
  select seqnc
        ,ref_dv_natr_destn
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_natr_destn) as ref_dv_natr_destn_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_natr_destn) as ref_dv_natr_destn_valr
        ,ref_confg_evenm_notfb
        ,ref_destn
        ,ref_reslt_destn
        , (select rd.nom
             from vd_afw_01_reslt_destn rd
            where rd.seqnc = dc.ref_reslt_destn)
           ref_reslt_destn_formt
        ,ref_atrib_sa_nom_formt
        , (select asa.nom_coln
             from vd_afw_12_atrib_struc_aplic asa
            where asa.seqnc = dc.ref_atrib_sa_nom_formt)
           ref_atrib_sa_nom_formt_code
        ,ref_atrib_sa_adres_destn
        , (select asa.nom_coln
             from vd_afw_12_atrib_struc_aplic asa
            where asa.seqnc = dc.ref_atrib_sa_adres_destn)
           ref_atrib_sa_adres_destn_code
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,date_creat
    from vd_i_afw_01_destn_confg_en dc
/
