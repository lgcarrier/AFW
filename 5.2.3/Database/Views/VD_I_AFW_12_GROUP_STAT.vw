SET DEFINE OFF;
create or replace force view vd_i_afw_12_group_stat
(
  seqnc
 ,ref_prodt
 ,ref_domn
 ,ref_struc_aplic
 ,code
 ,nom
 ,descr
 ,indic_dispn
 ,date_debut_efect
 ,date_fin_efect
 ,ref_evenm_notfb
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_prodt
        ,ref_domn
        ,ref_struc_aplic
        ,code
        ,nom
        ,descr
        ,indic_dispn
        ,date_debut_efect
        ,date_fin_efect
        ,ref_evenm_notfb
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
        ,dnr_ref_domn
    from afw_12_group_stat
/
