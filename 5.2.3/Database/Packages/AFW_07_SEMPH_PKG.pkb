SET DEFINE OFF;
create or replace package body afw_07_semph_pkg
is
  function verfr_semph (pva_code          in varchar2
                       ,pva_varbl1        in varchar2
                       ,pva_varbl2        in varchar2
                       ,pva_varbl3        in varchar2
                       ,pva_indic_exclu   in varchar2 default 'N')
    return boolean
  is
    vnu_exist   number;
  begin
    select 1
      into vnu_exist
      from afw_07_semph       s
          ,afw_07_insta_semph ins
     where     ins.id_sesn = afw_07_util_pkg.nv ('APP_SESSION')
           and s.seqnc = ins.ref_semph
           and s.code = pva_code
           and (   s.varbl1 = pva_varbl1
                or (    pva_varbl1 is null
                    and s.varbl1 is null))
           and (   s.varbl2 = pva_varbl2
                or (    pva_varbl2 is null
                    and s.varbl2 is null))
           and (   s.varbl3 = pva_varbl3
                or (    pva_varbl3 is null
                    and s.varbl3 is null))
           and (   pva_indic_exclu != 'O'
                or s.indic_exclu = 'O')
           and rownum = 1;

    return true;
  exception
    when no_data_found
    then
      return false;
  end;

  function obten_propr_semph_exclu (pva_code     in varchar2
                                   ,pva_varbl1   in varchar2
                                   ,pva_varbl2   in varchar2
                                   ,pva_varbl3   in varchar2)
    return varchar2
  is
    vva_propr   afw_12_sesn.app_user%type;
  begin
    select sn.app_user
      into vva_propr
      from afw_07_semph       s
          ,afw_07_insta_semph ins
          ,afw_12_sesn        sn
     where     s.seqnc = ins.ref_semph
           and sn.id_sesn = ins.id_sesn
           and s.code = pva_code
           and (   s.varbl1 = pva_varbl1
                or (    pva_varbl1 is null
                    and s.varbl1 is null))
           and (   s.varbl2 = pva_varbl2
                or (    pva_varbl2 is null
                    and s.varbl2 is null))
           and (   s.varbl3 = pva_varbl3
                or (    pva_varbl3 is null
                    and s.varbl3 is null))
           and s.indic_exclu = 'O'
           and rownum = 1;

    return vva_propr;
  exception
    when no_data_found
    then
      return null;
  end;

  function creer_ou_obten_semph (pva_code          in varchar2
                                ,pva_varbl1        in varchar2
                                ,pva_varbl2        in varchar2
                                ,pva_varbl3        in varchar2
                                ,pva_indic_exclu   in varchar2
                                ,pnu_temps_atent   in number
                                ,pva_indic_seqnc   in varchar2
                                ,pva_page_perst    in varchar2)
    return number
  is
    pragma autonomous_transaction;
    wait_expir        exception;
    pragma exception_init (wait_expir
                          ,-51);
    vda_date_max      date
                        default   sysdate
                                +   greatest (pnu_temps_atent
                                             ,1)
                                  / 86400;
    vnu_intrv         number default 10;
    --vnu_tempt_atent                         integer;
    vbo_trouv         boolean default false;
    vnu_seqnc         number (10);
    vva_code          afw_07_semph.code%type default upper (pva_code);
    vva_varbl1        afw_07_semph.varbl1%type default upper (pva_varbl1);
    vva_varbl2        afw_07_semph.varbl2%type default upper (pva_varbl2);
    vva_varbl3        afw_07_semph.varbl3%type default upper (pva_varbl3);
    vnu_seqnc_semph   number;
    vva_indic_exclu   varchar2 (1);
  begin
    while     sysdate < vda_date_max
          and not vbo_trouv
    loop
      begin
            select seqnc
                  ,indic_exclu
              into vnu_seqnc_semph
                  ,vva_indic_exclu
              from afw_07_semph
             where     code = pva_code
                   and (   varbl1 = pva_varbl1
                        or (    pva_varbl1 is null
                            and varbl1 is null))
                   and (   varbl2 = pva_varbl2
                        or (    pva_varbl2 is null
                            and varbl2 is null))
                   and (   varbl3 = pva_varbl3
                        or (    pva_varbl3 is null
                            and varbl3 is null))
        for update wait 1;

        if     pva_indic_exclu = 'N'
           and vva_indic_exclu = 'N'
        then
          vbo_trouv   := true;
        else
          -- Attendre un peu avant de réessayer
          dbms_lock.sleep (vnu_intrv / 100);
        end if;
      exception
        when wait_expir
        then
          null; -- Ne rien faire de plus, on continue la boucle
        when no_data_found
        then
          begin
            insert into afw_07_semph (code
                                     ,varbl1
                                     ,varbl2
                                     ,varbl3
                                     ,indic_exclu)
                 values (vva_code
                        ,vva_varbl1
                        ,vva_varbl2
                        ,vva_varbl3
                        ,pva_indic_exclu)
              returning seqnc
                   into vnu_seqnc_semph;

            vbo_trouv   := true;
          exception
            when dup_val_on_index
            then
              -- Attendre un peu avant de réessayer
              dbms_lock.sleep (vnu_intrv / 100);
          end;
      end;
    end loop;

    if vbo_trouv
    then
      insert into afw_07_insta_semph (ref_semph
                                     ,indic_seqnc
                                     ,page_perst)
           values (vnu_seqnc_semph
                  ,pva_indic_seqnc
                  ,pva_page_perst)
        returning seqnc
             into vnu_seqnc;

      commit;
    else
      commit;
      raise semph_non_dispn;
    end if;

    return vnu_seqnc;
  end creer_ou_obten_semph;

  procedure obten_semph (pva_code          in varchar2
                        ,pva_varbl1        in varchar2
                        ,pva_varbl2        in varchar2
                        ,pva_varbl3        in varchar2
                        ,pva_indic_exclu   in varchar2 default 'N'
                        ,pnu_temps_atent   in number default 5
                        ,pva_page_perst    in varchar2 default null)
  is
    vnu_seqnc   number (10);
  begin
    vnu_seqnc      :=
      creer_ou_obten_semph (pva_code
                           ,pva_varbl1
                           ,pva_varbl2
                           ,pva_varbl3
                           ,pva_indic_exclu
                           ,pnu_temps_atent
                           ,'N'
                           ,pva_page_perst);
  end obten_semph;

  function obten_semph (pva_code          in varchar2
                       ,pva_varbl1        in varchar2
                       ,pva_varbl2        in varchar2
                       ,pva_varbl3        in varchar2
                       ,pva_indic_exclu   in varchar2 default 'N'
                       ,pnu_temps_atent   in number default 5
                       ,pva_page_perst    in varchar2 default null)
    return number
  is
  begin
    return creer_ou_obten_semph (pva_code
                                ,pva_varbl1
                                ,pva_varbl2
                                ,pva_varbl3
                                ,pva_indic_exclu
                                ,pnu_temps_atent
                                ,'O'
                                ,pva_page_perst);
  end obten_semph;

  procedure suprm_semph (pva_code     in varchar2
                        ,pva_varbl1   in varchar2
                        ,pva_varbl2   in varchar2
                        ,pva_varbl3   in varchar2)
  is
    pragma autonomous_transaction;
    vnu_seqnc   number;
  begin
    begin
      select seqnc
        into vnu_seqnc
        from afw_07_semph
       where     code = pva_code
             and (   varbl1 = pva_varbl1
                  or (    pva_varbl1 is null
                      and varbl1 is null))
             and (   varbl2 = pva_varbl2
                  or (    pva_varbl2 is null
                      and varbl2 is null))
             and (   varbl3 = pva_varbl3
                  or (    pva_varbl3 is null
                      and varbl3 is null));

      delete afw_07_insta_semph
       where     ref_semph = vnu_seqnc
             and (   id_sesn = afw_07_util_pkg.nvd ('APP_SESSION')
                  or (    id_sesn is null
                      and afw_07_util_pkg.nvd ('APP_SESSION') is null))
             and indic_seqnc = 'N'
             and rownum = 1;
    exception
      when no_data_found
      then
        null;
    end;

    commit;
  end suprm_semph;

  procedure suprm_semph (pnu_seqnc in number)
  is
    pragma autonomous_transaction;
  begin
    delete afw_07_insta_semph
     where     seqnc = pnu_seqnc
           and (   id_sesn = afw_07_util_pkg.nvd ('APP_SESSION')
                or (    id_sesn is null
                    and afw_07_util_pkg.nvd ('APP_SESSION') is null))
           and indic_seqnc = 'O';

    commit;
  end suprm_semph;

  procedure libr_semph_perst_page
  is
    vnu_page   number default afw_07_util_pkg.nv ('APP_PAGE_ID');
  begin
    delete afw_07_insta_semph
     where     id_sesn = afw_07_util_pkg.nvd ('APP_SESSION')
           and page_perst is not null
           and instr (   ':'
                      || page_perst
                      || ':'
                     ,   ':'
                      || vnu_page
                      || ':') = 0;
  end libr_semph_perst_page;
end afw_07_semph_pkg;
/
