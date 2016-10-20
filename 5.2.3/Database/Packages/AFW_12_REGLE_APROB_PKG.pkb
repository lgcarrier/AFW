SET DEFINE OFF;
create or replace package body afw_12_regle_aprob_pkg
as
  procedure creer_regle_aprob (pnu_evolt_stat    in number
                              ,pnu_aprob         in number
                              ,pnu_group_aprob   in number
                              ,pnu_role_aprob    in number default null)
  is
  begin
    insert into vd_i_afw_12_regle_aprob (ref_evolt_stat
                                        ,ref_aprob
                                        ,ref_group_aprob
                                        ,ref_role_aprob)
         values (pnu_evolt_stat
                ,pnu_aprob
                ,pnu_group_aprob
                ,pnu_role_aprob);
  end creer_regle_aprob;

  procedure maj_regle_aprob (pnu_evolt_stat    in number
                            ,pva_aprob         in varchar2
                            ,pva_group_aprob   in varchar2
                            ,pva_role_aprob    in varchar2
                            ,pnu_domn          in number default null)
  is
  begin
    delete from vd_i_afw_12_regle_aprob
          where ref_evolt_stat = pnu_evolt_stat;

    insert into vd_i_afw_12_regle_aprob (ref_evolt_stat
                                        ,ref_aprob
                                        ,dnr_ref_domn)
      select pnu_evolt_stat
            ,column_value
            ,pnu_domn
        from table (afw_07_util_pkg.strin_to_table_nu (pva_aprob));

    insert into vd_i_afw_12_regle_aprob (ref_evolt_stat
                                        ,ref_group_aprob
                                        ,dnr_ref_domn)
      select pnu_evolt_stat
            ,column_value
            ,pnu_domn
        from table (afw_07_util_pkg.strin_to_table_nu (pva_group_aprob));

    insert into vd_i_afw_12_regle_aprob (ref_evolt_stat
                                        ,ref_role_aprob
                                        ,dnr_ref_domn)
      select pnu_evolt_stat
            ,column_value
            ,pnu_domn
        from table (afw_07_util_pkg.strin_to_table_nu (pva_role_aprob));
  end maj_regle_aprob;

  function obten_regle_aprob_evolt_stat (pnu_evolt_stat          in number
                                        ,pva_indic_aprob         in varchar default 'O'
                                        ,pva_indic_group_aprob   in varchar2 default 'O'
                                        ,pva_indic_role_aprob    in varchar2 default 'O'
                                        ,pva_seprt               in varchar2 default ':')
    return varchar2
  is
    vva_regle_aprob   varchar2 (4000);
  begin
    select listagg (coalesce (ra.ref_aprob
                             ,ra.ref_group_aprob
                             ,ra.ref_role_aprob)
                   ,pva_seprt)
           within group (order by
                           ra.ref_aprob_formt
                          ,ra.ref_group_aprob_formt
                          ,ra.ref_role_aprob_formt)
      into vva_regle_aprob
      from vd_afw_12_regle_aprob ra
     where     ra.ref_evolt_stat = pnu_evolt_stat
           and (   (    pva_indic_aprob = 'O'
                    and ra.ref_aprob is not null)
                or (    pva_indic_group_aprob = 'O'
                    and ra.ref_group_aprob is not null)
                or (    pva_indic_role_aprob = 'O'
                    and ra.ref_role_aprob is not null));

    return vva_regle_aprob;
  exception
    when no_data_found
    then
      return vva_regle_aprob;
  end obten_regle_aprob_evolt_stat;

  function obten_aprob_evolt_stat (pnu_evolt_stat   in number
                                  ,pva_seprt        in varchar2 default ':')
    return varchar2
  is
  begin
    return obten_regle_aprob_evolt_stat (pnu_evolt_stat
                                        ,'O'
                                        ,'N'
                                        ,'N'
                                        ,pva_seprt);
  end obten_aprob_evolt_stat;

  function obten_group_aprob_evolt_stat (pnu_evolt_stat   in number
                                        ,pva_seprt        in varchar2 default ':')
    return varchar2
  is
  begin
    return obten_regle_aprob_evolt_stat (pnu_evolt_stat
                                        ,'N'
                                        ,'O'
                                        ,'N'
                                        ,pva_seprt);
  end obten_group_aprob_evolt_stat;

  function obten_role_aprob_evolt_stat (pnu_evolt_stat   in number
                                       ,pva_seprt        in varchar2 default ':')
    return varchar2
  is
  begin
    return obten_regle_aprob_evolt_stat (pnu_evolt_stat
                                        ,'N'
                                        ,'N'
                                        ,'O'
                                        ,pva_seprt);
  end obten_role_aprob_evolt_stat;

  function obten_stat (pnu_regle_aprob in number)
    return number
  is
    vnu_stat   vd_i_afw_12_evolt_stat.ref_stat%type;
  begin
    select ref_stat
      into vnu_stat
      from vd_i_afw_12_evolt_stat  es
          ,vd_i_afw_12_regle_aprob ra
     where     es.seqnc = ra.ref_evolt_stat
           and ra.seqnc = pnu_regle_aprob;

    return vnu_stat;
  end obten_stat;

  function verfr_presn_regle (pnu_insta_procs_aprob   in number
                             ,pnu_evolt_stat          in number)
    return varchar2
  is
    vnu_presn   pls_integer default 0;
  begin
    -- S'il existe une r¿e sans approbation, on ne peut pas ¿luer le statut (retour N)
    select count (1)
      into vnu_presn
      from vd_i_afw_12_regle_aprob ra
     where     ra.ref_evolt_stat = pnu_evolt_stat
           and not exists
                 (select 1
                    from vd_i_afw_12_insta_regle_aprob ira
                   where     ira.ref_insta_procs_aprob = pnu_insta_procs_aprob
                         and ira.ref_regle_aprob = ra.seqnc
                         and ira.ref_insta_procs_aprob_stat is null)
           and rownum < 2;

    return case vnu_presn when 0 then 'O' else 'N' end;
  end verfr_presn_regle;

  procedure exect_evolt_stat (pnu_insta_procs_aprob   in number
                             ,pnu_evolt_stat          in number)
  is
  begin
    if verfr_presn_regle (pnu_insta_procs_aprob
                         ,pnu_evolt_stat) = 'O'
    then
      if afw_12_insta_procs_aprob_pkg.verfr_evolt_posbl_etat_evolt (pnu_insta_procs_aprob
                                                                   ,pnu_evolt_stat) = 'N'
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('APB.000003'
                                                ,pva_code_prodt   => 'AFW');
      end if;

      --Obtenir le prochain statut et Evoluer vers celui-ci
      afw_12_insta_procs_aprob_pkg.evolt_insta_procs_aprob (pnu_insta_procs_aprob
                                                           ,afw_12_evolt_stat_pkg.obten_stat_evolt (pnu_evolt_stat));
    end if;
  end exect_evolt_stat;
end afw_12_regle_aprob_pkg;
/
