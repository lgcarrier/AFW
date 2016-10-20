SET DEFINE OFF;
create or replace force view vd_i_afw_01_destn_confg_en
(
  seqnc
 ,ref_dv_natr_destn
 ,ref_confg_evenm_notfb
 ,ref_destn
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,date_creat
 ,ref_reslt_destn
 ,ref_atrib_sa_nom_formt
 ,ref_atrib_sa_adres_destn
)
as
  select seqnc
        ,ref_dv_natr_destn
        ,ref_confg_evenm_notfb
        ,ref_destn
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,date_creat
        ,ref_reslt_destn
        ,ref_atrib_sa_nom_formt
        ,ref_atrib_sa_adres_destn
    from afw_01_destn_confg_evenm_notfb
/
