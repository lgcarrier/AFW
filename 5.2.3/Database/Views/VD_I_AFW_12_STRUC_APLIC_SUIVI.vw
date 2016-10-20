SET DEFINE OFF;
create or replace force view vd_i_afw_12_struc_aplic_suivi
(
  seqnc
 ,ref_struc_aplic
 ,ref_suivi
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom_persn
 ,indic_creat_initl
 ,seqnc_presn
 ,ref_sucrs_impla
)
as
  select seqnc
        ,ref_struc_aplic
        ,ref_suivi
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,nom_persn
        ,indic_creat_initl
        ,seqnc_presn
        ,ref_sucrs_impla
    from afw_12_struc_aplic_suivi
/
