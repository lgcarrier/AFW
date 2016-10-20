SET DEFINE OFF;
create or replace force view vs_afw_12_pa_utils_aprob
(
  sourc
 ,seqnc_domn
 ,seqnc_utils
 ,seqnc_group_stat
 ,seqnc_aprob
 ,seqnc_group_aprob
 ,seqnc_role_aprob
 ,seqnc_insta_procs_aprob
)
as
  with aprob
       as (select gs.ref_domn seqnc_domn
                 ,u.seqnc     seqnc_utils
                 ,gs.seqnc    seqnc_group_stat
                 ,a.seqnc     seqnc_aprob
             from vd_i_afw_12_utils      u
                 ,vd_i_afw_12_aprob      a
                 ,vd_i_afw_12_group_stat gs
            where     u.seqnc = a.ref_utils
                  and gs.seqnc = a.ref_group_stat
           union all
           select gs.ref_domn seqnc_domn
                 ,u.seqnc     seqnc_utils
                 ,gs.seqnc    seqnc_group_stat
                 ,a.seqnc     seqnc_aprob
             from vd_i_afw_12_group_utils      gu
                 ,vd_i_afw_12_utils            u
                 ,vd_i_afw_12_lien_group_utils lgu
                 ,vd_i_afw_12_aprob            a
                 ,vd_i_afw_12_group_stat       gs
            where     gu.indic_systm = 'O'
                  and gu.seqnc = lgu.ref_group
                  and u.seqnc = lgu.ref_utils
                  and lgu.ref_domn is not null
                  and lgu.date_debut_efect <= sysdate
                  and (   lgu.date_fin_efect >= sysdate
                       or lgu.date_fin_efect is null)
                  and gu.seqnc = a.ref_group_utils
                  and gs.seqnc = a.ref_group_stat)
  select 'APROB'                    sourc
        ,a.seqnc_domn
        ,a.seqnc_utils
        ,a.seqnc_group_stat
        ,a.seqnc_aprob              seqnc_aprob
        ,cast (null as number (10)) seqnc_group_aprob
        ,cast (null as number (10)) seqnc_role_aprob
        ,cast (null as number (10)) seqnc_insta_procs_aprob
    from aprob a
  union all
  select 'GROUP_APROB'     sourc
        ,ga.dnr_ref_domn   seqnc_domn
        ,a.seqnc_utils
        ,ga.ref_group_stat seqnc_group_stat
        ,null              seqnc_aprob
        ,ga.seqnc          seqnc_group_aprob
        ,null              seqnc_role_aprob
        ,null              seqnc_insta_procs_aprob
    from aprob                        a
        ,vd_i_afw_12_lien_group_aprob lga
        ,vd_i_afw_12_group_aprob      ga
   where     a.seqnc_group_stat = ga.ref_group_stat
         and a.seqnc_aprob = lga.ref_aprob
         and ga.seqnc = lga.ref_group_aprob
  union all
  select 'ROLE_APROB'               sourc
        ,ra.dnr_ref_domn            seqnc_domn
        ,a.seqnc_utils
        ,ra.ref_group_stat          seqnc_group_stat
        ,null                       seqnc_aprob
        ,null                       seqnc_group_aprob
        ,ra.seqnc                   seqnc_role_aprob
        ,ipar.ref_insta_procs_aprob seqnc_insta_procs_aprob
    from aprob                  a
        ,vd_i_afw_12_ipa_role   ipar
        ,vd_i_afw_12_role_aprob ra
   where     a.seqnc_group_stat = ra.ref_group_stat
         and ra.seqnc = ipar.ref_role_aprob
         and a.seqnc_aprob = ipar.ref_aprob
/
