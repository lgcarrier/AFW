SET DEFINE OFF;
create or replace package body afw_12_group_stat_pkg
as
  procedure creer_group_stat (pva_code         in varchar2
                             ,pva_nom          in varchar2
                             ,pva_descr        in varchar2
                             ,pva_code_prodt   in varchar2)
  is
    vnu_seqnc   number (10);
  begin
    vnu_seqnc      :=
      creer_group_stat (pva_code
                       ,pva_nom
                       ,pva_descr
                       ,pva_code_prodt);
  end creer_group_stat;

  function creer_group_stat (pva_code         in varchar2
                            ,pva_nom          in varchar2
                            ,pva_descr        in varchar2
                            ,pva_code_prodt   in varchar2)
    return number
  is
    vnu_seqnc   number (10);
  begin
    insert into vd_i_afw_12_group_stat (nom
                                       ,descr
                                       ,ref_prodt
                                       ,code
                                       ,dnr_ref_prodt)
         values (pva_nom
                ,pva_descr
                ,afw_11_prodt_pkg.obten_prodt (pva_code_prodt)
                ,pva_code
                ,afw_11_prodt_pkg.obten_prodt (pva_code_prodt))
      returning seqnc
           into vnu_seqnc;

    return vnu_seqnc;
  end creer_group_stat;

  procedure creer_stat (pnu_ref_group_stat   in number
                       ,pva_code             in varchar2
                       ,pva_nom              in varchar2)
  is
  begin
    insert into vd_i_afw_12_stat (ref_group_stat
                                 ,code
                                 ,nom)
         values (pnu_ref_group_stat
                ,pva_code
                ,pva_nom);
  end creer_stat;

  procedure suprm_group (pnu_seqnc in number)
  is
  begin
    delete from vd_i_afw_12_group_stat
          where seqnc = pnu_seqnc;
  end suprm_group;

  function obten_group_stat (pva_code         in vd_i_afw_12_group_stat.code%type
                            ,pva_code_prodt   in vd_i_afw_11_prodt.code%type)
    return vd_i_afw_12_group_stat.seqnc%type
  is
    vnu_group_stat   vd_i_afw_12_group_stat.seqnc%type;
  begin
    select gs.seqnc
      into vnu_group_stat
      from vd_i_afw_11_prodt      p
          ,vd_i_afw_12_group_stat gs
     where     gs.code = pva_code
           and gs.ref_prodt = p.seqnc
           and p.code = pva_code_prodt;

    return vnu_group_stat;
  end obten_group_stat;

  function obten_group_stat (pva_code    in varchar2
                            ,pnu_prodt   in number
                            ,pnu_domn    in number)
    return number
  is
    vnu_group_stat   number;
  begin
    if    pnu_prodt is not null
       or pnu_domn is not null
    then
      select gs.seqnc
        into vnu_group_stat
        from vd_i_afw_12_group_stat gs
       where     gs.code = pva_code
             and (   gs.ref_prodt = pnu_prodt
                  or pnu_prodt is null)
             and (   gs.ref_domn = pnu_domn
                  or pnu_domn is null);
    end if;

    return vnu_group_stat;
  exception
    when no_data_found
    then
      return vnu_group_stat;
  end obten_group_stat;

  function verfr_procs_aprob_insta (pnu_group_stat in vd_i_afw_12_group_stat.seqnc%type)
    return varchar2
  is
    vva_insta   varchar2 (1) := 'N';
  begin
    select 'O'
      into vva_insta
      from vd_i_afw_12_insta_procs_aprob
     where     ref_group_stat = pnu_group_stat
           and rownum = 1;

    return vva_insta;
  exception
    when no_data_found
    then
      return vva_insta;
  end verfr_procs_aprob_insta;

  procedure insta_procs_aprob_stat_initl (pnu_seqnc   in number
                                         ,pnu_insta   in number
                                         ,pnu_domn    in number)
  is
  begin
    afw_12_insta_procs_aprob_pkg.creer_insta_procs_aprob_stat (pnu_insta
                                                              ,afw_12_stat_pkg.obten_stat_initl_group_stat (pnu_seqnc)
                                                              ,pnu_domn);
  exception
    when no_data_found
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('APB.000009'
                                              ,pva_code_prodt   => 'AFW');
  end insta_procs_aprob_stat_initl;

  procedure insta_procs_aprob (pnu_seqnc               in number
                              ,pnu_struc_aplic         in number
                              ,pnu_seqnc_struc_aplic   in number
                              ,pnu_stat_initl          in number default null
                              ,pva_role_aprob          in varchar2 default null
                              ,pnu_domn                in number default afw_12_domn_pkg.obten_domn_sesn)
  is
    var_role_aprob   apex_application_global.vc_arr2;
    vnu_insta        number;
  begin
    --Créer instance
    vnu_insta      :=
      afw_12_insta_procs_aprob_pkg.creer_insta_procs_aprob (pnu_seqnc
                                                           ,pnu_struc_aplic
                                                           ,pnu_seqnc_struc_aplic
                                                           ,pnu_domn);

    --Générer le statut initial pour l'historique
    --Suppose qu'il n'y a qu'un seul statut initial par processus d'approbation
    if pnu_stat_initl is null
    then
      insta_procs_aprob_stat_initl (pnu_seqnc
                                   ,vnu_insta
                                   ,pnu_domn);
    else
      afw_12_insta_procs_aprob_pkg.creer_insta_procs_aprob_stat (vnu_insta
                                                                ,pnu_stat_initl
                                                                ,pnu_domn);
    end if;

    -- Définir les rôles
    if pva_role_aprob is not null
    then
      var_role_aprob   := afw_07_util_pkg.string_to_table (pva_role_aprob);

      for i in 1 .. var_role_aprob.count
      loop
        afw_12_aprob_pkg.creer_insta_role_aprob (substr (var_role_aprob (i)
                                                        ,1
                                                        ,  instr (var_role_aprob (i)
                                                                 ,',')
                                                         - 1)
                                                ,vnu_insta
                                                ,substr (var_role_aprob (i)
                                                        ,  instr (var_role_aprob (i)
                                                                 ,',')
                                                         + 1));
      end loop;
    end if;
  end insta_procs_aprob;

  procedure initl_a_partr_struc_aplic (pnu_group_stat    in number
                                      ,pnu_struc_aplic   in number
                                      ,pnu_domn          in number default afw_12_domn_pkg.obten_domn_sesn)
  is
  begin
    insert into vd_i_afw_12_stat (ordre
                                 ,code
                                 ,nom
                                 ,descr
                                 ,indic_initl
                                 ,indic_stat_utils
                                 ,ref_group_stat
                                 ,libl_actio
                                 ,catgr_stat
                                 ,indic_final
                                 ,dnr_ref_domn)
      select ordre
            ,code
            ,nom
            ,descr
            ,indic_initl
            ,indic_stat_utils
            ,pnu_group_stat
            ,libl_actio
            ,catgr_stat
            ,indic_final
            ,pnu_domn
        from vd_i_afw_12_stat s
       where s.ref_struc_aplic = pnu_struc_aplic;

    --Creer les evolutions
    insert into vd_i_afw_12_evolt_stat (ref_stat
                                       ,ref_stat_evolt
                                       ,dnr_ref_domn
                                       ,indic_code)
      select s3.seqnc
            ,s4.seqnc
            ,s4.dnr_ref_domn
            ,stat_sa.indic_code
        from vd_i_afw_12_stat s3
            ,vd_i_afw_12_stat s4
            ,(select s.code  code_parnt
                    ,s2.code code_enfan
                    ,es.indic_code
                from vd_i_afw_12_stat       s
                    ,vd_i_afw_12_evolt_stat es
                    ,vd_i_afw_12_stat       s2
               where     s.ref_struc_aplic = pnu_struc_aplic
                     and es.ref_stat = s.seqnc
                     and es.ref_stat_evolt = s2.seqnc
                     and es.indic_code = 'N') stat_sa
       where     s3.ref_group_stat = pnu_group_stat
             and s4.ref_group_stat = pnu_group_stat
             and s3.code = stat_sa.code_parnt
             and s4.code = stat_sa.code_enfan;
  end initl_a_partr_struc_aplic;

  procedure duplq_group_stat_stats (pnu_group_stat_sourc   in number
                                   ,pnu_group_stat_cible   in number)
  is
  begin
    insert into vd_i_afw_12_stat (ordre
                                 ,code
                                 ,nom
                                 ,descr
                                 ,indic_initl
                                 ,indic_stat_utils
                                 ,ref_group_stat
                                 ,libl_actio
                                 ,catgr_stat
                                 ,indic_final
                                 ,dnr_ref_domn)
      select ordre
            ,code
            ,nom
            ,descr
            ,indic_initl
            ,indic_stat_utils
            ,pnu_group_stat_cible
            ,libl_actio
            ,catgr_stat
            ,indic_final
            ,dnr_ref_domn
        from vd_i_afw_12_stat s
       where s.ref_group_stat = pnu_group_stat_sourc;
  end duplq_group_stat_stats;

  procedure duplq_group_stat_evolt_stat (pnu_group_stat_sourc   in number
                                        ,pnu_group_stat_cible   in number)
  is
  begin
    insert into vd_i_afw_12_evolt_stat (ref_stat
                                       ,ref_stat_evolt
                                       ,dnr_ref_domn
                                       ,indic_code)
      select s3.seqnc
            ,s4.seqnc
            ,s4.dnr_ref_domn
            ,stat_sa.indic_code
        from vd_i_afw_12_stat s3
            ,vd_i_afw_12_stat s4
            ,(select s.code  code_parnt
                    ,s2.code code_enfan
                    ,es.indic_code
                from vd_i_afw_12_stat       s
                    ,vd_i_afw_12_evolt_stat es
                    ,vd_i_afw_12_stat       s2
               where     s.ref_group_stat = pnu_group_stat_sourc
                     and es.ref_stat = s.seqnc
                     and es.ref_stat_evolt = s2.seqnc
                     and es.indic_code = 'N') stat_sa
       where     s3.ref_group_stat = pnu_group_stat_cible
             and s4.ref_group_stat = pnu_group_stat_cible
             and s3.code = stat_sa.code_parnt
             and s4.code = stat_sa.code_enfan;
  end duplq_group_stat_evolt_stat;

  procedure duplq_gs_aprob (pnu_group_stat_sourc   in number
                           ,pnu_group_stat_cible   in number)
  is
    cursor cur_aprob
    is
      select a.seqnc
        from vd_i_afw_12_aprob a
       where a.ref_group_stat = pnu_group_stat_sourc;
  begin
    for rec_aprob in cur_aprob
    loop
      afw_12_aprob_pkg.duplq_aprob (rec_aprob.seqnc
                                   ,pnu_group_stat_cible);
    end loop;
  end duplq_gs_aprob;

  procedure duplq_gs_group_aprob (pnu_group_stat_sourc   in number
                                 ,pnu_group_stat_cible   in number)
  is
    cursor cur_group_aprob
    is
      select ga.seqnc
        from vd_i_afw_12_group_aprob ga
       where ga.ref_group_stat = pnu_group_stat_sourc;
  begin
    for rec_group_aprob in cur_group_aprob
    loop
      afw_12_group_aprob_pkg.duplq_group_aprob (rec_group_aprob.seqnc
                                               ,pnu_group_stat_cible);
    end loop;
  end duplq_gs_group_aprob;

  procedure duplq_gs_role_aprob (pnu_group_stat_sourc   in number
                                ,pnu_group_stat_cible   in number)
  is
    cursor cur_role_aprob
    is
      select ra.seqnc
        from vd_i_afw_12_role_aprob ra
       where ra.ref_group_stat = pnu_group_stat_sourc;
  begin
    for rec_role_aprob in cur_role_aprob
    loop
      afw_12_aprob_pkg.duplq_role_aprob (rec_role_aprob.seqnc
                                        ,pnu_group_stat_cible);
    end loop;
  end duplq_gs_role_aprob;

  procedure duplq_gs_regle_aprob (pnu_group_stat_sourc   in number
                                 ,pnu_group_stat_cible   in number)
  is
  begin
    insert into vd_i_afw_12_regle_aprob (ref_evolt_stat
                                        ,ref_aprob
                                        ,ref_group_aprob
                                        ,ref_role_aprob
                                        ,dnr_ref_domn)
      select stat.ref_evolt_stat_cible
            ,case
               when stat.ref_aprob is not null
               then
                 (select a2.seqnc
                    from vd_i_afw_12_aprob a1
                        ,vd_i_afw_12_aprob a2
                   where     a1.seqnc = stat.ref_aprob
                         and (       a1.ref_utils = a2.ref_utils
                                 and a1.ref_group_utils is null
                                 and a2.ref_group_utils is null
                              or     a1.ref_utils is null
                                 and a2.ref_utils is null
                                 and a1.ref_group_utils = a2.ref_group_utils)
                         and a2.ref_group_stat = pnu_group_stat_cible)
               else
                 null
             end
            ,case
               when stat.ref_group_aprob is not null
               then
                 (select a2.seqnc
                    from vd_i_afw_12_group_aprob a1
                        ,vd_i_afw_12_group_aprob a2
                   where     a1.seqnc = stat.ref_group_aprob
                         and a1.code = a2.code
                         and a2.ref_group_stat = pnu_group_stat_cible)
               else
                 null
             end
            ,case
               when stat.ref_role_aprob is not null
               then
                 (select a2.seqnc
                    from vd_i_afw_12_role_aprob a1
                        ,vd_i_afw_12_role_aprob a2
                   where     a1.seqnc = stat.ref_role_aprob
                         and a1.code = a2.code
                         and a2.ref_group_stat = pnu_group_stat_cible)
               else
                 null
             end
            ,dnr_ref_domn
        from (select s3.seqnc
                    ,s4.seqnc
                    ,s4.dnr_ref_domn
                    ,stat_sa.es_sourc ref_evolt_stat_sourc
                    ,es2.seqnc        ref_evolt_stat_cible
                    ,stat_sa.ra_sourc seqnc_regle_aprob
                    ,stat_sa.ref_aprob
                    ,stat_sa.ref_group_aprob
                    ,stat_sa.ref_role_aprob
                from vd_i_afw_12_stat       s3
                    ,vd_i_afw_12_evolt_stat es2
                    ,vd_i_afw_12_stat       s4
                    ,(select s.code   code_parnt
                            ,s2.code  code_enfan
                            ,es.indic_code
                            ,es.seqnc es_sourc
                            ,ra.seqnc ra_sourc
                            ,ra.ref_aprob
                            ,ra.ref_group_aprob
                            ,ra.ref_role_aprob
                        from vd_i_afw_12_stat        s
                            ,vd_i_afw_12_evolt_stat  es
                            ,vd_i_afw_12_stat        s2
                            ,vd_i_afw_12_regle_aprob ra
                       where     s.ref_group_stat = pnu_group_stat_sourc
                             and es.ref_stat = s.seqnc
                             and es.ref_stat_evolt = s2.seqnc
                             and es.indic_code = 'N'
                             and ra.ref_evolt_stat = es.seqnc) stat_sa
               where     s3.ref_group_stat = pnu_group_stat_cible
                     and s4.ref_group_stat = pnu_group_stat_cible
                     and s3.code = stat_sa.code_parnt
                     and s4.code = stat_sa.code_enfan
                     and es2.ref_stat_evolt = s4.seqnc
                     and es2.ref_stat = s3.seqnc) stat;
  end duplq_gs_regle_aprob;

  function duplq_procs (pnu_group_stat in number)
    return vd_i_afw_12_group_stat.seqnc%type
  is
    vnu_group_stat_cible   vd_i_afw_12_group_stat.seqnc%type;
  begin
    vnu_group_stat_cible   := afw_12_group_stat_seq.nextval;

    insert into vd_i_afw_12_group_stat (seqnc
                                       ,ref_domn
                                       ,code
                                       ,nom
                                       ,descr
                                       ,indic_dispn
                                       ,date_debut_efect
                                       ,date_fin_efect
                                       ,ref_evenm_notfb
                                       ,dnr_ref_domn)
      select vnu_group_stat_cible
            ,ref_domn
            ,vnu_group_stat_cible
            ,   nom
             || ' '
             || afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('APB.000011'
                                                          ,'AFW')
            ,descr
            ,'N'
            ,date_debut_efect
            ,date_fin_efect
            ,ref_evenm_notfb
            ,dnr_ref_domn
        from vd_i_afw_12_group_stat gs
       where gs.seqnc = pnu_group_stat;

    duplq_group_stat_stats (pnu_group_stat
                           ,vnu_group_stat_cible);
    duplq_group_stat_evolt_stat (pnu_group_stat
                                ,vnu_group_stat_cible);
    duplq_gs_aprob (pnu_group_stat
                   ,vnu_group_stat_cible);
    duplq_gs_group_aprob (pnu_group_stat
                         ,vnu_group_stat_cible);
    duplq_gs_role_aprob (pnu_group_stat
                        ,vnu_group_stat_cible);
    duplq_gs_regle_aprob (pnu_group_stat
                         ,vnu_group_stat_cible);

    return vnu_group_stat_cible;
  end duplq_procs;

  procedure duplq_procs (pnu_group_stat in number)
  is
    vnu_group_stat   number (10);
  begin
    vnu_group_stat   := duplq_procs (pnu_group_stat);
  end duplq_procs;

  function obten_role_aprob_json (pnu_group_stat in number)
    return varchar2
  is
    cursor cur_role_aprob
    is
        select ra.seqnc
              ,ra.nom
          from vd_i_afw_12_role_aprob ra
         where     ra.ref_group_stat = pnu_group_stat
               and exists
                     (select 1
                        from vd_i_afw_12_lien_role_aprob lra
                       where lra.ref_role_aprob = ra.seqnc)
      order by ra.nom;

    cursor cur_aprob (pnu_role_aprob in number)
    is
        select a.seqnc
              ,nvl (a.ref_utils_formt, a.ref_group_utils_formt) nom
          from vd_afw_12_aprob           a
              ,vd_i_afw_12_lien_role_aprob lra
         where     lra.ref_role_aprob = pnu_role_aprob
               and lra.ref_aprob = a.seqnc
      order by a.ref_group_utils_formt
              ,a.ref_utils_formt;

    vnu_vald   number (1);
    vva_json   varchar2 (32767);
  begin
    select 1
      into vnu_vald
      from vd_i_afw_12_role_aprob
     where     ref_group_stat = pnu_group_stat
           and rownum = 1;

    vva_json   := '{"role":[';

    for rec_role_aprob in cur_role_aprob
    loop
      vva_json      :=
           vva_json
        || '{"seqnc":"'
        || rec_role_aprob.seqnc
        || '", "nom":"'
        || rec_role_aprob.nom
        || '", "aprob":[';

      for rec_aprob in cur_aprob (rec_role_aprob.seqnc)
      loop
        vva_json      :=
             vva_json
          || '{"seqnc":"'
          || rec_aprob.seqnc
          || '", "nom":"'
          || rec_aprob.nom
          || '"},';
      end loop;

      vva_json      :=
        rtrim (vva_json
              ,',');
      vva_json      :=
           vva_json
        || ']},';
    end loop;

    vva_json      :=
      rtrim (vva_json
            ,',');
    vva_json      :=
         vva_json
      || ']}';

    return vva_json;
  exception
    when no_data_found
    then
      return vva_json;
  end obten_role_aprob_json;
end afw_12_group_stat_pkg;
/
