SET DEFINE OFF;
create or replace force view vd_afw_12_group_stat
(
  seqnc
 ,ref_prodt
 ,ref_prodt_formt
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_struc_aplic
 ,ref_struc_aplic_code
 ,ref_struc_aplic_formt
 ,indic_dispn
 ,date_debut_efect
 ,date_fin_efect
 ,ref_evenm_notfb
 ,ref_evenm_notfb_code
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_prodt
        , (select nom
             from vd_i_afw_11_prodt p
            where p.seqnc = gs.ref_prodt)
           ref_prodt_formt
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        ,ref_struc_aplic
        , (select sa.code
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = gs.ref_struc_aplic)
           ref_struc_aplic_code
        , (select sa.nom
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = gs.ref_struc_aplic)
           ref_struc_aplic_formt
        ,indic_dispn
        ,date_debut_efect
        ,date_fin_efect
        ,ref_evenm_notfb
        , (select en.code
             from vd_i_afw_01_evenm_notfb en
            where en.seqnc = gs.ref_evenm_notfb)
           ref_evenm_notfb_code
        ,dnr_ref_domn
    from vd_i_afw_12_group_stat gs
/
