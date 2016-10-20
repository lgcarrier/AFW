SET DEFINE OFF;
create or replace force view vs_afw_12_comnt_procs_aprob
(
  ref_struc_aplic
 ,ref_struc_aplic_code
 ,ref_seqnc_struc_aplic
 ,ref_insta_procs_aprob_stat
 ,ref_stat_orign_formt
 ,ref_stat_destn_formt
 ,ref_aprob_formt
 ,date_aprob
 ,comnt_aprob
)
as
  select ipa.ref_struc_aplic
        ,ipa.ref_struc_aplic_code
        ,ipa.ref_seqnc_struc_aplic
        ,ira.ref_insta_procs_aprob_stat
        ,es.ref_stat_formt
        ,es.ref_stat_evolt_formt
        ,nvl (nvl2 (ra.ref_group_aprob_formt
                   ,   ra.ref_group_aprob_formt
                    || ' ('
                    || afw_12_utils_pkg.obten_nom_formt_de_code_utils (ira.utils_creat)
                    || ')'
                   ,nvl2 (ra.ref_role_aprob_formt
                         ,   ra.ref_role_aprob_formt
                          || ' ('
                          || afw_12_utils_pkg.obten_nom_formt_de_code_utils (ira.utils_creat)
                          || ')'
                         ,ra.ref_aprob_formt))
             ,afw_12_utils_pkg.obten_nom_formt_de_code_utils (ira.utils_creat))
           ref_aprob_formt
        ,ira.date_aprob
        ,ira.comnt_aprob
    from vd_afw_12_insta_regle_aprob ira
        ,vd_afw_12_insta_procs_aprob ipa
        ,vd_afw_12_regle_aprob       ra
        ,vd_afw_12_evolt_stat        es
   where     ipa.seqnc = ira.ref_insta_procs_aprob
         and ra.seqnc(+) = ira.ref_regle_aprob
         and es.seqnc = nvl (ra.ref_evolt_stat, ira.ref_evolt_stat)
         and ira.comnt_aprob is not null
/
