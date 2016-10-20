SET DEFINE OFF;
create or replace force view vd_afw_12_insta_procs_aprob
(
  seqnc
 ,ref_group_stat
 ,ref_group_stat_formt
 ,ref_struc_aplic
 ,ref_struc_aplic_code
 ,ref_struc_aplic_formt
 ,ref_seqnc_struc_aplic
 ,ref_stat_formt
 ,ref_insta_procs_aprob_suivn
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_group_stat
        , (select gs.nom
             from vd_i_afw_12_group_stat gs
            where gs.seqnc = ipa.ref_group_stat)
           ref_group_stat_formt
        ,ref_struc_aplic
        , (select sa.code
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = ipa.ref_struc_aplic)
           ref_struc_aplic_code
        , (select sa.nom
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = ipa.ref_struc_aplic)
           ref_struc_aplic_code
        ,ref_seqnc_struc_aplic
        , (select ipas.ref_stat_formt
             from vd_afw_12_ip_aprob_stat ipas
            where     ipas.ref_insta_procs_aprob = ipa.seqnc
                  and ipas.date_fin_efect is null)
           ref_stat_formt
        ,ref_insta_procs_aprob_suivn
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_domn
    from vd_i_afw_12_insta_procs_aprob ipa
/
