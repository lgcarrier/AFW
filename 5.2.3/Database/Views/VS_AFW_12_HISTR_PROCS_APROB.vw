SET DEFINE OFF;
create or replace force view vs_afw_12_histr_procs_aprob
(
  ref_group_stat
 ,ref_group_stat_formt
 ,ref_struc_aplic
 ,ref_struc_aplic_code
 ,ref_seqnc_struc_aplic
 ,ref_insta_procs_aprob_stat
 ,ref_stat_formt
 ,date_debut_efect
 ,date_fin_efect
 ,duree_formt
 ,duree_prevu_formt
 ,duree_style
 ,aprob
 ,indic_comnt
)
as
  with aprob
       as (select distinct ipas.seqnc
                          ,ipas.ref_insta_procs_aprob
                          ,nvl2 (ira.ref_regle_aprob, ra.ref_group_aprob_formt, null)                                                       ref_group_aprob_formt
                          ,nvl2 (ira.ref_regle_aprob, ra.ref_role_aprob_formt, null)                                                        ref_role_aprob_formt
                          ,nvl2 (ira.ref_regle_aprob, ra.ref_aprob_formt, afw_12_utils_pkg.obten_nom_formt_de_code_utils (ira.utils_creat)) ref_aprob_formt
             from vd_i_afw_12_ip_aprob_stat     ipas
                 ,vd_i_afw_12_insta_regle_aprob ira
                 ,vd_afw_12_regle_aprob         ra
            where     ira.ref_insta_procs_aprob_stat = ipas.seqnc
                  and ira.ref_regle_aprob = ra.seqnc(+))
    select ref_group_stat
          ,ref_group_stat_formt
          ,ref_struc_aplic
          ,ref_struc_aplic_code
          ,ref_seqnc_struc_aplic
          ,cast (null as number (10)) ref_insta_procs_aprob_stat
          ,ref_stat_formt
          ,date_debut_efect
          ,date_fin_efect
          ,duree_formt
          ,duree_prevu_formt
          ,case
             when     duree_numbr >= duree_prevu_numbr
                  and duree_prevu_numbr != 0
             then
               'color:#FF0000;'
             else
               null
           end
             duree_style
          ,listagg (coalesce (ref_group_aprob_formt
                             ,ref_role_aprob_formt
                             ,ref_aprob_formt)
                   ,', ')
           within group (order by
                           ref_group_aprob_formt
                          ,ref_role_aprob_formt
                          ,ref_aprob_formt)
             aprob
          ,nvl ( (select 'O'
                    from vd_i_afw_12_insta_regle_aprob ira
                   where     ira.ref_insta_procs_aprob = pa.seqnc
                         and ira.ref_insta_procs_aprob_stat is null
                         and ira.comnt_aprob is not null
                         and rownum = 1)
               ,'N')
             indic_comnt
      from (select distinct ipa.seqnc
                           ,ipa.ref_group_stat
                           ,ipa.ref_group_stat_formt
                           ,ipa.ref_struc_aplic
                           ,ipa.ref_struc_aplic_code
                           ,ipa.ref_seqnc_struc_aplic
                           ,ipas.ref_stat_formt
                           ,ipas.date_debut_efect
                           ,ipas.date_fin_efect
                           ,ipas.duree_formt
                           ,ipas.duree_prevu_formt
                           ,ipas.duree_numbr
                           ,ipas.duree_prevu_numbr
                           ,ra.ref_group_aprob_formt
                           ,ra.ref_aprob_formt
                           ,ra.ref_role_aprob_formt
              from vd_afw_12_insta_procs_aprob ipa
                  ,vs_afw_12_ip_aprob_stat_temps ipas
                  ,vd_i_afw_12_evolt_stat      es
                  ,vd_afw_12_regle_aprob       ra
             where     ipas.ref_insta_procs_aprob = ipa.seqnc
                   and ipas.date_fin_efect is null
                   and es.ref_stat(+) = ipas.ref_stat
                   and ra.ref_evolt_stat(+) = es.seqnc) pa
  group by pa.seqnc
          ,ref_group_stat
          ,ref_group_stat_formt
          ,ref_struc_aplic
          ,ref_struc_aplic_code
          ,ref_seqnc_struc_aplic
          ,ref_stat_formt
          ,date_debut_efect
          ,date_fin_efect
          ,duree_formt
          ,duree_prevu_formt
          ,duree_numbr
          ,duree_prevu_numbr
  union all
    select ipa.ref_group_stat
          ,ipa.ref_group_stat_formt
          ,ipa.ref_struc_aplic
          ,ipa.ref_struc_aplic_code
          ,ipa.ref_seqnc_struc_aplic
          ,ipas.seqnc ref_insta_procs_aprob_stat
          ,ipas.ref_stat_formt
          ,ipas.date_debut_efect
          ,ipas.date_fin_efect
          ,ipas.duree_formt
          ,ipas.duree_prevu_formt
          ,case
             when     ipas.duree_numbr >= ipas.duree_prevu_numbr
                  and duree_prevu_numbr != 0
             then
               'color:#FF0000;'
             else
               null
           end
             duree_style
          ,listagg (coalesce (a.ref_group_aprob_formt
                             ,a.ref_role_aprob_formt
                             ,a.ref_aprob_formt)
                   ,', ')
           within group (order by
                           a.ref_group_aprob_formt
                          ,a.ref_role_aprob_formt
                          ,a.ref_aprob_formt)
             aprob
          ,nvl ( (select 'O'
                    from vd_i_afw_12_insta_regle_aprob ira
                   where     ira.ref_insta_procs_aprob_stat = ipas.seqnc
                         and ira.comnt_aprob is not null
                         and rownum = 1)
               ,'N')
             indic_comnt
      from vd_afw_12_insta_procs_aprob ipa
          ,vs_afw_12_ip_aprob_stat_temps ipas
          ,aprob                       a
     where     ipas.ref_insta_procs_aprob = ipa.seqnc
           and ipas.date_fin_efect is not null
           and a.seqnc(+) = ipas.seqnc
  group by ipa.ref_group_stat
          ,ipa.ref_group_stat_formt
          ,ipa.ref_struc_aplic
          ,ipa.ref_struc_aplic_code
          ,ipa.ref_seqnc_struc_aplic
          ,ipas.seqnc
          ,ipas.ref_stat_formt
          ,ipas.date_debut_efect
          ,ipas.date_fin_efect
          ,ipas.duree_formt
          ,ipas.duree_prevu_formt
          ,ipas.duree_numbr
          ,ipas.duree_prevu_numbr
/
