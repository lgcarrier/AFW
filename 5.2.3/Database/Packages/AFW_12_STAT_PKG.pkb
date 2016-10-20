SET DEFINE OFF;
create or replace package body afw_12_stat_pkg
as
  function obten_stat (pva_code_struc_aplic   in varchar2
                      ,pva_code_stat          in varchar2
                      ,pva_code_prodt         in varchar2 default afw_11_prodt_pkg.obten_code_prodt)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_seqnc   number;
  begin
    select seqnc
      into vnu_seqnc
      from vd_afw_12_stat
     where     ref_struc_aplic_formt = pva_code_struc_aplic
           and code = pva_code_stat
           and ref_struc_aplic = (select seqnc
                                    from vd_afw_12_struc_aplic
                                   where     code = pva_code_struc_aplic
                                         and ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt));

    return vnu_seqnc;
  exception
    when no_data_found
    then
      return null;
  end obten_stat;

  function obten_stat_group_stat (pva_code_group_stat   in varchar2
                                 ,pva_code_stat         in varchar2
                                 ,pva_code_prodt        in varchar2 default afw_11_prodt_pkg.obten_code_prodt)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_seqnc   number;
  begin
    select seqnc
      into vnu_seqnc
      from vd_afw_12_stat
     where     ref_group_stat_formt = pva_code_group_stat
           and code = pva_code_stat
           and ref_group_stat = (select seqnc
                                   from vd_i_afw_12_group_stat
                                  where     code = pva_code_group_stat
                                        and ref_prodt = nvl (afw_11_prodt_pkg.obten_prodt (pva_code_prodt), afw_11_prodt_pkg.obten_prodt_sesn));

    return vnu_seqnc;
  exception
    when no_data_found
    then
      return null;
  end obten_stat_group_stat;

  function obten_code_stat (pnu_seqnc_stat in number)
    return varchar2
    result_cache relies_on (afw_12_stat)
  is
    vva_code_stat   varchar2 (20);
  begin
    select code
      into vva_code_stat
      from vd_afw_12_stat
     where seqnc = pnu_seqnc_stat;

    return vva_code_stat;
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_stat_initl_struc_aplic (pva_code_struc_aplic   in varchar2
                                        ,pva_code_prodt         in varchar2 default null)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_seqnc   number (10);
  begin
    select seqnc
      into vnu_seqnc
      from vd_afw_12_stat s
     where     s.indic_initl = 'O'
           and s.ref_struc_aplic = (select seqnc
                                      from vd_afw_12_struc_aplic sa
                                     where     sa.code = pva_code_struc_aplic
                                           and ref_prodt = nvl (afw_11_prodt_pkg.obten_prodt (pva_code_prodt), afw_11_prodt_pkg.obten_prodt_sesn));

    return vnu_seqnc;
  end obten_stat_initl_struc_aplic;

  function obten_stat_initl_struc_aplic (pnu_struc_aplic in number)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_seqnc   number (10);
  begin
    select seqnc
      into vnu_seqnc
      from vd_afw_12_stat s
     where     s.indic_initl = 'O'
           and s.ref_struc_aplic = pnu_struc_aplic;

    return vnu_seqnc;
  end obten_stat_initl_struc_aplic;

  function obten_stat_initl_group_stat (pva_code_group_stat   in varchar2
                                       ,pva_code_prodt        in varchar2 default null)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_seqnc   number (10);
  begin
    select seqnc
      into vnu_seqnc
      from vd_afw_12_stat s
     where     s.indic_initl = 'O'
           and s.ref_group_stat = (select seqnc
                                     from vd_afw_12_group_stat gs
                                    where     gs.code = pva_code_group_stat
                                          and ref_prodt = nvl (afw_11_prodt_pkg.obten_prodt (pva_code_prodt), afw_11_prodt_pkg.obten_prodt_sesn));

    return vnu_seqnc;
  end obten_stat_initl_group_stat;

  function obten_stat_initl_group_stat (pnu_group_stat in number)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_seqnc   number (10);
  begin
    select seqnc
      into vnu_seqnc
      from vd_afw_12_stat s
     where     s.indic_initl = 'O'
           and s.ref_group_stat = pnu_group_stat;

    return vnu_seqnc;
  end obten_stat_initl_group_stat;

  function obten_code_stat_initl_struc_ap (pva_code_struc_aplic   in varchar2
                                          ,pva_code_prodt         in varchar2 default null)
    return varchar2
    result_cache relies_on (afw_12_stat)
  is
    vva_seqnc   varchar2 (23);
  begin
    select code
      into vva_seqnc
      from vd_afw_12_stat s
     where     s.indic_initl = 'O'
           and s.ref_struc_aplic = (select seqnc
                                      from vd_afw_12_struc_aplic sa
                                     where     sa.code = pva_code_struc_aplic
                                           and ref_prodt = nvl (afw_11_prodt_pkg.obten_prodt (pva_code_prodt), afw_11_prodt_pkg.obten_prodt_sesn ()));

    return vva_seqnc;
  end obten_code_stat_initl_struc_ap;

  function obten_code_stat_initl_struc_ap (pnu_struc_aplic in number)
    return varchar2
    result_cache relies_on (afw_12_stat)
  is
    vva_seqnc   varchar2 (23);
  begin
    select code
      into vva_seqnc
      from vd_afw_12_stat s
     where     s.indic_initl = 'O'
           and s.ref_struc_aplic = pnu_struc_aplic;

    return vva_seqnc;
  end obten_code_stat_initl_struc_ap;

  function obten_code_stat_initl_group_st (pva_code_group_stat   in varchar2
                                          ,pva_code_prodt        in varchar2 default null)
    return varchar2
    result_cache relies_on (afw_12_stat)
  is
    vva_seqnc   varchar2 (23);
  begin
    select code
      into vva_seqnc
      from vd_afw_12_stat s
     where     s.indic_initl = 'O'
           and s.ref_group_stat = (select seqnc
                                     from vd_afw_12_group_stat gs
                                    where     gs.code = pva_code_group_stat
                                          and ref_prodt = nvl (afw_11_prodt_pkg.obten_prodt (pva_code_prodt), afw_11_prodt_pkg.obten_prodt_sesn ()));

    return vva_seqnc;
  end obten_code_stat_initl_group_st;

  function obten_code_stat_initl_group_st (pnu_group_stat in number)
    return varchar2
    result_cache relies_on (afw_12_stat)
  is
    vva_seqnc   varchar2 (23);
  begin
    select code
      into vva_seqnc
      from vd_afw_12_stat s
     where     s.indic_initl = 'O'
           and s.ref_group_stat = pnu_group_stat;

    return vva_seqnc;
  end obten_code_stat_initl_group_st;

  function obten_stat_formt (pva_code_struc_aplic   in varchar2
                            ,pva_code_stat          in varchar2
                            ,pva_code_prodt         in varchar2 default afw_11_prodt_pkg.obten_code_prodt)
    return varchar2
    result_cache relies_on (afw_12_stat)
  is
    vva_stat   vd_afw_12_stat.nom%type;
  begin
    select nom
      into vva_stat
      from vd_afw_12_stat
     where     ref_struc_aplic_formt = pva_code_struc_aplic
           and code = pva_code_stat
           and ref_struc_aplic = (select seqnc
                                    from vd_afw_12_struc_aplic
                                   where     code = pva_code_struc_aplic
                                         and ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt));

    return vva_stat;
  exception
    when no_data_found
    then
      return null;
  end obten_stat_formt;

  function obten_stat_formt (pnu_seqnc in number)
    return varchar2
    result_cache relies_on (afw_12_stat)
  is
    vva_stat   vd_afw_12_stat.nom%type;
  begin
    select nom
      into vva_stat
      from vd_afw_12_stat
     where seqnc = pnu_seqnc;

    return vva_stat;
  exception
    when no_data_found
    then
      return null;
  end obten_stat_formt;

  function obten_stat_group_stat_formt (pva_code_group_stat   in varchar2
                                       ,pva_code_stat         in varchar2
                                       ,pva_code_prodt        in varchar2 default afw_11_prodt_pkg.obten_code_prodt)
    return varchar2
    result_cache relies_on (afw_12_stat)
  is
    vva_stat   vd_afw_12_stat.nom%type;
  begin
    select nom
      into vva_stat
      from vd_afw_12_stat
     where     ref_group_stat_formt = pva_code_group_stat
           and code = pva_code_stat
           and ref_group_stat = (select seqnc
                                   from vd_i_afw_12_group_stat
                                  where     code = pva_code_group_stat
                                        and ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt));

    return vva_stat;
  exception
    when no_data_found
    then
      return null;
  end obten_stat_group_stat_formt;

  function valdr_evolt_stat (pnu_stat_ancie   in number
                            ,pnu_stat_nouv    in number)
    return boolean
    result_cache relies_on (afw_12_stat)
  is
    vnu_exist   number;
  begin
    --Si la variable est settee, on valide a partir de la liste de disponibilite du code
    --et non de l'interface
    if gbo_indic_evolt_stat_code
    then
      select 1
        into vnu_exist
        from vd_afw_12_evolt_stat
       where     ref_stat = pnu_stat_ancie
             and ref_stat_evolt = pnu_stat_nouv
             and indic_code = 'O';
    else
      select 1
        into vnu_exist
        from vd_afw_12_evolt_stat
       where     ref_stat = pnu_stat_ancie
             and ref_stat_evolt = pnu_stat_nouv
             and indic_code = 'N';
    end if;

    return true;
  exception
    when no_data_found
    then
      return false;
  end;

  function difrn_ordre (pnu_ref_stat_1   in number
                       ,pnu_ref_stat_2   in number)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_diff   number;
  begin
    -- Signification de la valeur retournee:
    -- Negatif: Le premier statut vient avant le second
    -- Zero   : Les statuts ont le meme ordre (meme statut ou non)
    -- Positif: Le premier statut vient apres le second
    -- Null   : L'un des statut specifie est null ou n'existe pas
    select   (select ordre
                from vd_afw_12_stat
               where seqnc = pnu_ref_stat_1)
           - (select ordre
                from vd_afw_12_stat
               where seqnc = pnu_ref_stat_2)
      into vnu_diff
      from dual;

    return vnu_diff;
  end;

  function obten_liste_formt (pnu_stat   in number
                             ,pva_code   in varchar2)
    return varchar2
    result_cache relies_on (afw_12_stat)
  is
    vva_retr   varchar2 (200);

    cursor cur_code
    is
        select s.nom
          from vd_afw_12_evolt_stat es
              ,vd_afw_12_stat     s
         where     es.ref_stat = pnu_stat
               and s.seqnc = es.ref_stat_evolt
               and indic_code = pva_code
      order by s.ordre;
  begin
    for rec_code in cur_code
    loop
      vva_retr      :=
           vva_retr
        || ', '
        || rec_code.nom;
    end loop;

    return substr (vva_retr
                  ,3);
  end obten_liste_formt;

  function obten_postn_reltv (pva_struc_aplic       in varchar2
                             ,pva_code_stat_base    in varchar2
                             ,pva_code_stat_cible   in varchar2
                             ,pva_code_prodt        in varchar2 default null)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_ordre_base    number (10);
    vnu_ordre_cible   number (10);
  begin
    select max (decode (code, pva_code_stat_base, ordre, null))
          ,max (decode (code, pva_code_stat_cible, ordre, null))
      into vnu_ordre_base
          ,vnu_ordre_cible
      from vd_afw_12_stat s
     where     s.ref_struc_aplic_formt = pva_struc_aplic
           and code in (pva_code_stat_base
                       ,pva_code_stat_cible)
           and s.ref_struc_aplic = (select seqnc
                                      from vd_afw_12_struc_aplic
                                     where     code = pva_struc_aplic
                                           and ref_prodt = nvl (afw_11_prodt_pkg.obten_prodt (pva_code_prodt), afw_11_prodt_pkg.obten_prodt_sesn));

    if    vnu_ordre_base is null
       or vnu_ordre_cible is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('STA.000002'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    return vnu_ordre_base - vnu_ordre_cible;
  end obten_postn_reltv;

  function obten_postn_reltv (pva_struc_aplic       in varchar2
                             ,pnu_code_stat_base    in number
                             ,pnu_code_stat_cible   in number)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_ordre_base    number (10);
    vnu_ordre_cible   number (10);
  begin
    select max (decode (seqnc, pnu_code_stat_base, ordre, null))
          ,max (decode (seqnc, pnu_code_stat_cible, ordre, null))
      into vnu_ordre_base
          ,vnu_ordre_cible
      from vd_afw_12_stat s
     where     s.ref_struc_aplic_formt = pva_struc_aplic
           and seqnc in (pnu_code_stat_base
                        ,pnu_code_stat_cible);

    if    vnu_ordre_base is null
       or vnu_ordre_cible is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('STA.000002'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    return vnu_ordre_base - vnu_ordre_cible;
  end obten_postn_reltv;

  function obten_postn_reltv_group_stat (pva_group_stat        in varchar2
                                        ,pva_code_stat_base    in varchar2
                                        ,pva_code_stat_cible   in varchar2
                                        ,pva_code_prodt        in varchar2 default null)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_ordre_base    number (10);
    vnu_ordre_cible   number (10);
  begin
    select max (decode (code, pva_code_stat_base, ordre, null))
          ,max (decode (code, pva_code_stat_cible, ordre, null))
      into vnu_ordre_base
          ,vnu_ordre_cible
      from vd_afw_12_stat s
     where     s.ref_group_stat_formt = pva_group_stat
           and code in (pva_code_stat_base
                       ,pva_code_stat_cible)
           and s.ref_group_stat = (select seqnc
                                     from vd_afw_12_group_stat
                                    where     code = pva_group_stat
                                          and ref_prodt = nvl (afw_11_prodt_pkg.obten_prodt (pva_code_prodt), afw_11_prodt_pkg.obten_prodt_sesn));

    if    vnu_ordre_base is null
       or vnu_ordre_cible is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('STA.000002'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    return vnu_ordre_base - vnu_ordre_cible;
  end obten_postn_reltv_group_stat;

  function obten_postn_reltv_group_stat (pva_group_stat        in varchar2
                                        ,pnu_code_stat_base    in number
                                        ,pnu_code_stat_cible   in number)
    return number
    result_cache relies_on (afw_12_stat)
  is
    vnu_ordre_base    number (10);
    vnu_ordre_cible   number (10);
  begin
    select max (decode (seqnc, pnu_code_stat_base, ordre, null))
          ,max (decode (seqnc, pnu_code_stat_cible, ordre, null))
      into vnu_ordre_base
          ,vnu_ordre_cible
      from vd_afw_12_stat s
     where     s.ref_group_stat_formt = pva_group_stat
           and seqnc in (pnu_code_stat_base
                        ,pnu_code_stat_cible);

    if    vnu_ordre_base is null
       or vnu_ordre_cible is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('STA.000002'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    return vnu_ordre_base - vnu_ordre_cible;
  end obten_postn_reltv_group_stat;

  procedure creer_stat (pnu_ref_struc_aplic   in number
                       ,pva_code              in varchar2
                       ,pva_nom               in varchar2)
  is
  begin
    insert into vd_afw_12_stat (ref_struc_aplic
                               ,code
                               ,nom)
         values (pnu_ref_struc_aplic
                ,pva_code
                ,pva_nom);
  end creer_stat;

  procedure creer_stat_group_stat (pnu_group_stat   in number
                                  ,pva_code         in varchar2
                                  ,pva_nom          in varchar2
                                  ,pva_descr        in varchar2)
  is
    vnu_seqnc   number (10);
  begin
    vnu_seqnc      :=
      creer_stat_group_stat (pnu_group_stat
                            ,pva_code
                            ,pva_nom
                            ,pva_descr);
  end creer_stat_group_stat;

  function creer_stat_group_stat (pnu_group_stat   in number
                                 ,pva_code         in varchar2
                                 ,pva_nom          in varchar2
                                 ,pva_descr        in varchar2)
    return number
  is
    vnu_seqnc   number (10);
  begin
    insert into vd_afw_12_stat (ref_group_stat
                               ,code
                               ,nom
                               ,descr)
         values (pnu_group_stat
                ,pva_code
                ,pva_nom
                ,pva_descr)
      returning seqnc
           into vnu_seqnc;

    return vnu_seqnc;
  end creer_stat_group_stat;

  procedure maj_stat_group_stat (pnu_stat    in number
                                ,pva_code    in varchar2
                                ,pva_nom     in varchar2
                                ,pva_descr   in varchar2)
  is
  begin
    update vd_afw_12_stat
       set code    = pva_code
          ,nom     = pva_nom
          ,descr   = pva_descr
     where seqnc = pnu_stat;
  end maj_stat_group_stat;

  procedure suprm_stat_group_stat (pnu_stat in number)
  is
  begin
    delete from vd_afw_12_stat
          where seqnc = pnu_stat;
  end suprm_stat_group_stat;

  procedure valdr_stat_initl_uniq (pnu_group_stat    in number default null
                                  ,pnu_struc_aplic   in number default null)
  is
    vnu_stat_initl   number;
  begin
    select count (*)
      into vnu_stat_initl
      from vd_i_afw_12_stat
     where     (   (    ref_group_stat = pnu_group_stat
                    and pnu_group_stat is not null)
                or (    ref_struc_aplic = pnu_struc_aplic
                    and pnu_struc_aplic is not null))
           and indic_initl = 'O';

    if vnu_stat_initl > 1
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('APB.000008'
                                              ,pva_code_prodt   => 'AFW');
    end if;
  end valdr_stat_initl_uniq;

  function obten_indic_insta_procs_aprob (pnu_stat in number)
    return varchar2
  is
    vva_indic   varchar2 (1);
  begin
    select indic_insta_procs_aprob
      into vva_indic
      from vd_i_afw_12_stat
     where seqnc = pnu_stat;

    return vva_indic;
  exception
    when no_data_found
    then
      return null;
  end obten_indic_insta_procs_aprob;
end afw_12_stat_pkg;
/
