SET DEFINE OFF;
create or replace force view vs_afw_12_pa_regle_utils
(
  sourc
 ,indic_choix_termn
 ,indic_choix_exist
 ,seqnc_group_stat
 ,seqnc_struc_aplic
 ,code_struc_aplic
 ,seqnc_concp_struc_aplic
 ,seqnc_stat
 ,ordre_presn
 ,seqnc_stat_evolt
 ,seqnc_evolt
 ,libl_evolt
 ,stat_sourc
 ,stat_cible
 ,date_debut_efect
 ,duree_restn_formt
)
as
  with regle_aprob
       as (select ra.seqnc
                 ,ra.ref_evolt_stat
                 ,paua.seqnc_group_stat
                 ,paua.seqnc_utils
                 ,paua.seqnc_insta_procs_aprob
             from vd_i_afw_12_regle_aprob  ra
                 ,vs_afw_12_pa_utils_aprob paua
            where (   ra.ref_group_aprob = paua.seqnc_group_aprob
                   or ra.ref_aprob = paua.seqnc_aprob
                   or ra.ref_role_aprob = paua.seqnc_role_aprob))
  select 'EVOLT_UTILS'                sourc
        ,nvl ( (select 'O'
                  from vd_i_afw_12_insta_regle_aprob ira
                      ,regle_aprob                   ra
                 where     ira.ref_regle_aprob = ra.seqnc
                       and ira.ref_insta_procs_aprob = ipa.seqnc
                       and ira.ref_insta_procs_aprob_stat is null
                       and ra.ref_evolt_stat = es.seqnc
                       and ra.seqnc_group_stat = ipa.ref_group_stat
                       and ra.seqnc_utils = utils.seqnc_user
                       and (   ra.seqnc_insta_procs_aprob = ipa.seqnc
                            or ra.seqnc_insta_procs_aprob is null)
                       and not exists
                             (select 1
                                from regle_aprob ra2
                               where     ra2.seqnc != ra.seqnc
                                     and ra2.ref_evolt_stat = es.seqnc
                                     and ra2.seqnc_group_stat = ipa.ref_group_stat
                                     and ra2.seqnc_utils = utils.seqnc_user
                                     and (   ra2.seqnc_insta_procs_aprob = ipa.seqnc
                                          or ra2.seqnc_insta_procs_aprob is null)
                                     and not exists
                                           (select 1
                                              from vd_i_afw_12_insta_regle_aprob ira2
                                             where     ira2.ref_regle_aprob = ra2.seqnc
                                                   and ira2.ref_insta_procs_aprob = ipa.seqnc
                                                   and ira2.ref_insta_procs_aprob_stat is null))
                       and rownum = 1)
             ,'N')
           indic_choix_termn
        ,nvl ( (select 'O'
                  from vd_i_afw_12_insta_regle_aprob ira
                      ,regle_aprob                   ra
                 where     ira.ref_regle_aprob = ra.seqnc
                       and ira.ref_insta_procs_aprob = ipa.seqnc
                       and ira.ref_insta_procs_aprob_stat is null
                       and ra.ref_evolt_stat = es.seqnc
                       and ra.seqnc_group_stat = ipa.ref_group_stat
                       and rownum = 1)
             ,'N')
           indic_choix_exist
        ,ipa.ref_group_stat           seqnc_group_stat
        ,ipa.ref_struc_aplic          seqnc_struc_aplic
        ,ipa.ref_struc_aplic_code     code_struc_aplic
        ,ipa.ref_seqnc_struc_aplic    seqnc_concp_struc_aplic
        ,s.seqnc                      seqnc_stat
        ,es.ref_stat_evolt_ordre      ordre_presn
        ,es.ref_stat_evolt            seqnc_stat_evolt
        ,es.seqnc                     seqnc_evolt
        ,es.ref_stat_evolt_libl_actio libl_evolt
        ,es.ref_stat_formt            stat_sourc
        ,es.ref_stat_evolt_formt      stat_cible
        ,ipas.date_debut_efect
        ,ipas.duree_restn_formt
    from vd_afw_12_insta_procs_aprob   ipa
        ,vs_afw_12_ip_aprob_stat_temps ipas
        ,vd_i_afw_12_stat              s
        ,vd_afw_12_evolt_stat          es
        ,(select afw_12_utils_pkg.obten_usagr_conct () seqnc_user
            from dual) utils
   where     ipa.seqnc = ipas.ref_insta_procs_aprob
         and ipa.ref_insta_procs_aprob_suivn is null
         and ipas.date_fin_efect is null
         and s.seqnc = ipas.ref_stat
         and s.seqnc = es.ref_stat
         and exists
               (select 1
                  from regle_aprob ra
                 where     ra.ref_evolt_stat = es.seqnc
                       and ra.seqnc_group_stat = ipa.ref_group_stat
                       and ra.seqnc_utils = utils.seqnc_user
                       and (   ra.seqnc_insta_procs_aprob = ipa.seqnc
                            or ra.seqnc_insta_procs_aprob is null))
  union all
  select 'EVOLT_PUBLC'                sourc
        ,'N'                          indic_choix_termn
        ,'N'                          indic_choix_exist
        ,ipa.ref_group_stat           seqnc_group_stat
        ,ipa.ref_struc_aplic          seqnc_struc_aplic
        ,ipa.ref_struc_aplic_code     code_struc_aplic
        ,ipa.ref_seqnc_struc_aplic    seqnc_concp_struc_aplic
        ,s.seqnc                      seqnc_stat
        ,es.ref_stat_evolt_ordre      ordre_presn
        ,es.ref_stat_evolt            seqnc_stat_evolt
        ,es.seqnc                     seqnc_evolt
        ,es.ref_stat_evolt_libl_actio libl_evolt
        ,es.ref_stat_formt            stat_sourc
        ,es.ref_stat_evolt_formt      stat_cible
        ,ipas.date_debut_efect
        ,ipas.duree_restn_formt
    from vd_afw_12_insta_procs_aprob   ipa
        ,vs_afw_12_ip_aprob_stat_temps ipas
        ,vd_i_afw_12_stat              s
        ,vd_afw_12_evolt_stat          es
   where     ipa.seqnc = ipas.ref_insta_procs_aprob
         and ipa.ref_insta_procs_aprob_suivn is null
         and ipas.date_fin_efect is null
         and s.seqnc = ipas.ref_stat
         and s.seqnc = es.ref_stat
         and not exists
               (select 1
                  from vd_i_afw_12_regle_aprob ra
                 where ra.ref_evolt_stat = es.seqnc)
/
