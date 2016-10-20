SET DEFINE OFF;
create or replace force view vs_afw_12_procs_aprob_regle
(
  ref_stat
 ,ref_evolt_stat
 ,ref_group_stat
 ,ligne_formt
 ,ref_stat_ordre
 ,ref_stat_formt
 ,ref_stat_evolt_ordre
 ,ref_stat_evolt_formt
 ,niv
 ,qmark
)
as
  with mesg
       as (select afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('APB.000005'
                                                            ,pva_code_prodt   => 'AFW')
                    et
                 ,afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('APB.000006'
                                                            ,pva_code_prodt   => 'AFW')
                    ou
             from dual)
  select s.seqnc                      ref_stat
        ,cast (null as number (10))   ref_evolt_stat
        ,s.ref_group_stat
        ,s.nom                        ligne_formt
        ,s.ordre                      ref_stat_ordre
        ,s.nom                        ref_stat_formt
        ,-1                           ref_stat_evolt_ordre
        ,cast (null as varchar2 (60)) ref_stat_evolt_formt
        ,1                            niv
        ,0                            qmark
    from vd_afw_12_stat s
   where s.ref_group_stat is not null
  union all
  select null                    ref_stat
        ,es.seqnc                ref_evolt_stat
        ,es.ref_group_stat
        ,es.ref_stat_evolt_formt ligne_formt
        ,es.ref_stat_ordre
        ,es.ref_stat_formt
        ,es.ref_stat_evolt_ordre
        ,es.ref_stat_evolt_formt
        ,2                       niv
        ,1                       qmark
    from vd_afw_12_evolt_stat es
        ,mesg                 m
   where es.ref_group_stat is not null
  union all
    select null ref_stat
          ,null ref_evolt_stat
          ,es.ref_group_stat
          ,listagg (coalesce (ra.ref_aprob_formt
                             ,ra.ref_group_aprob_formt
                             ,ra.ref_role_aprob_formt)
                   ,   ' '
                    || m.et
                    || ' ')
           within group (order by
                           ra.ref_aprob_formt nulls last
                          ,ra.ref_role_aprob_formt nulls last
                          ,ra.ref_group_aprob_formt)
             ligne_formt
          ,es.ref_stat_ordre
          ,es.ref_stat_formt
          ,es.ref_stat_evolt_ordre
          ,es.ref_stat_evolt_formt
          ,3  niv
          ,2  qmark
      from vd_afw_12_evolt_stat es
          ,vd_afw_12_regle_aprob ra
          ,mesg                m
     where     es.ref_group_stat is not null
           and ra.ref_evolt_stat = es.seqnc
  group by es.seqnc
          ,es.ref_group_stat
          ,es.ref_stat_ordre
          ,es.ref_stat_formt
          ,es.ref_stat_evolt_ordre
          ,es.ref_stat_evolt_formt
          ,m.et
  union all
    select null ref_stat
          ,null ref_evolt_stat
          ,es.ref_group_stat
          ,listagg (coalesce (ra.ref_aprob_formt
                             ,ra.ref_role_aprob_formt
                             ,   '('
                              || ga.aprob_formt
                              || ')')
                   ,   ' '
                    || m.et
                    || ' ')
           within group (order by
                           ra.ref_aprob_formt nulls last
                          ,ra.ref_role_aprob_formt nulls last
                          ,ra.ref_group_aprob_formt)
             ligne_formt
          ,es.ref_stat_ordre
          ,es.ref_stat_formt
          ,es.ref_stat_evolt_ordre
          ,es.ref_stat_evolt_formt
          ,3  niv
          ,3  qmark
      from vd_afw_12_evolt_stat es
          ,vd_afw_12_regle_aprob ra
          ,(  select ga.seqnc
                    ,listagg (nvl (ref_utils_formt, ref_group_utils_formt)
                             ,   ' '
                              || m.ou
                              || ' ')
                     within group (order by
                                     ref_utils_formt nulls last
                                    ,ref_group_utils_formt)
                       aprob_formt
                from vd_afw_12_group_aprob  ga
                    ,vd_afw_12_lien_group_aprob lga
                    ,vd_afw_12_aprob        a
                    ,mesg                   m
               where     lga.ref_group_aprob = ga.seqnc
                     and lga.ref_aprob = a.seqnc
            group by ga.seqnc
                    ,m.ou) ga
          ,mesg                m
     where     es.ref_group_stat is not null
           and ra.ref_evolt_stat = es.seqnc
           and ga.seqnc(+) = ra.ref_group_aprob
           and exists
                 (select 1
                    from vd_i_afw_12_regle_aprob ira
                   where     ira.ref_evolt_stat = es.seqnc
                         and ira.ref_group_aprob is not null)
  group by es.seqnc
          ,es.ref_group_stat
          ,es.ref_stat_ordre
          ,es.ref_stat_formt
          ,es.ref_stat_evolt_ordre
          ,es.ref_stat_evolt_formt
          ,m.et
  order by ref_group_stat
          ,ref_stat_ordre
          ,ref_stat_formt
          ,ref_stat_evolt_ordre
          ,ref_stat_evolt_formt
          ,qmark
/
