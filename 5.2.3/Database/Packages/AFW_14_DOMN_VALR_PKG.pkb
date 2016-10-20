SET DEFINE OFF;
create or replace package body afw_14_domn_valr_pkg
as
  function obten_valr (pnu_seqnc_valr in number)
    return varchar2
    result_cache relies_on (afw_14_detl_domn_valr)
  is
    vva_valr   vd_i_afw_14_ddv_lang.valr%type;
  begin
    select ddvl.valr
      into vva_valr
      from vd_i_afw_14_detl_domn_valr ddv
          ,vd_i_afw_14_ddv_lang       ddvl
     where     ddv.seqnc = pnu_seqnc_valr
           and ddvl.ref_detl_domn_valr = ddv.seqnc
           and ddvl.ref_lang = nvl (sys_context ('ctx_infor_sesn'
                                                ,'vnu_seqnc_lang')
                                   ,afw_11_prodt_pkg.obten_lang_deft (ddv.dnr_ref_prodt));

    return vva_valr;
  exception
    when others
    then
      return null;
  end obten_valr;

  function obten_valr_court (pnu_seqnc_valr in number)
    return varchar2
    result_cache relies_on (afw_14_detl_domn_valr)
  is
    vva_valr_court   vd_i_afw_14_ddv_lang.valr_court%type;
  begin
    select ddvl.valr_court
      into vva_valr_court
      from vd_i_afw_14_detl_domn_valr ddv
          ,vd_i_afw_14_ddv_lang       ddvl
     where     ddv.seqnc = pnu_seqnc_valr
           and ddvl.ref_detl_domn_valr = ddv.seqnc
           and ddvl.ref_lang = nvl (sys_context ('ctx_infor_sesn'
                                                ,'vnu_seqnc_lang')
                                   ,afw_11_prodt_pkg.obten_lang_deft (ddv.dnr_ref_prodt));

    return vva_valr_court;
  exception
    when others
    then
      return null;
  end obten_valr_court;

  function obten_code (pnu_seqnc_valr in number)
    return varchar2
    result_cache relies_on (afw_14_detl_domn_valr)
  is
    vva_code_valr   vd_afw_14_detl_domn_valr.code_valr%type;
  begin
    select ddv.code_valr
      into vva_code_valr
      from vd_i_afw_14_detl_domn_valr ddv
     where ddv.seqnc = pnu_seqnc_valr;

    return vva_code_valr;
  exception
    when others
    then
      return null;
  end obten_code;

  function obten_code_parnt (pnu_seqnc_valr in number)
    return varchar2
    result_cache relies_on (afw_14_detl_domn_valr)
  is
    vva_code_valr_parnt   vd_afw_14_detl_domn_valr.ref_code_domn_valr_formt%type;
  begin
    select ref_code_domn_valr_formt
      into vva_code_valr_parnt
      from vd_afw_14_detl_domn_valr
     where seqnc = pnu_seqnc_valr;

    return vva_code_valr_parnt;
  exception
    when others
    then
      return null;
  end obten_code_parnt;

  function obten_seqnc_domn (pva_code_domn    in varchar2
                            ,pva_code_prodt   in varchar2 default afw_11_prodt_pkg.obten_code_prodt (afw_11_prodt_pkg.obten_prodt_sesn ()))
    return number
  is
    vnu_seqnc   vd_afw_14_detl_domn_valr.seqnc%type;
  begin
    select dv.seqnc
      into vnu_seqnc
      from vd_i_afw_14_domn_valr dv
     where     dv.ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt)
           and dv.code = pva_code_domn;

    return vnu_seqnc;
  exception
    when others
    then
      return null;
  end;

  function obten_seqnc (pva_code_domn    in varchar2
                       ,pva_code_valr    in varchar2
                       ,pva_code_prodt   in varchar2 default afw_11_prodt_pkg.obten_code_prodt (afw_11_prodt_pkg.obten_prodt_sesn ()))
    return number
  is
    vnu_seqnc   vd_afw_14_detl_domn_valr.seqnc%type;
  begin
    select ddv.seqnc
      into vnu_seqnc
      from vd_i_afw_14_detl_domn_valr ddv
          ,vd_i_afw_14_domn_valr      dv
     where     ddv.code_valr = pva_code_valr
           and dv.code = pva_code_domn
           and dv.seqnc = ddv.ref_domn_valr
           and (       pva_code_prodt is null
                   and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
                or     pva_code_prodt is not null
                   and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt));

    return vnu_seqnc;
  exception
    when others
    then
      return null;
  end obten_seqnc;

  function obten_valr (pva_code_domn    in varchar2
                      ,pva_code_valr    in varchar2
                      ,pva_code_prodt   in varchar2 default afw_11_prodt_pkg.obten_code_prodt (afw_11_prodt_pkg.obten_prodt_sesn ()))
    return varchar2
    result_cache
  is
    vva_valr                   vd_i_afw_14_ddv_lang.valr%type;
    vva_enonc_sql              varchar2 (4000);
    vva_ref_code_formt_formt   varchar2 (30);
    vva_type_don               varchar2 (1);
  begin
    select enonc_sourc
          ,ref_code_formt_formt
          ,type_don
      into vva_enonc_sql
          ,vva_ref_code_formt_formt
          ,vva_type_don
      from vd_afw_14_domn_valr dv
     where     dv.code = pva_code_domn
           and (       pva_code_prodt is null
                   and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
                or     pva_code_prodt is not null
                   and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt));

    if vva_enonc_sql is not null
    then
      begin
        execute immediate
             'select d from  ('
          || vva_enonc_sql
          || ') where r = :1'
          into vva_valr
          using in pva_code_valr;
      exception
        when no_data_found
        then
          null;
      end;
    else
      select ddvl.valr
        into vva_valr
        from vd_i_afw_14_detl_domn_valr ddv
            ,vd_i_afw_14_domn_valr      dv
            ,vd_i_afw_14_ddv_lang       ddvl
       where     ddv.code_valr = pva_code_valr
             and dv.code = pva_code_domn
             and dv.seqnc = ddv.ref_domn_valr
             and (       pva_code_prodt is null
                     and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
                  or     pva_code_prodt is not null
                     and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt))
             and ddvl.ref_detl_domn_valr = ddv.seqnc
             and ddvl.ref_lang = nvl (sys_context ('ctx_infor_sesn'
                                                  ,'vnu_seqnc_lang')
                                     ,afw_11_prodt_pkg.obten_lang_deft (dv.ref_prodt));
    end if;

    return vva_valr;
  exception
    when others
    then
      return null;
  end obten_valr;

  function obten_valr_organ (pnu_seqnc_valr in number)
    return varchar2
    result_cache relies_on (afw_14_detl_domn_valr)
  is
    vva_valr_organ   vd_i_afw_14_ddv_lang.valr_organ%type;
  begin
    select ddvl.valr_organ
      into vva_valr_organ
      from vd_i_afw_14_detl_domn_valr ddv
          ,vd_i_afw_14_ddv_lang       ddvl
     where     ddv.seqnc = pnu_seqnc_valr
           and ddvl.ref_detl_domn_valr = ddv.seqnc
           and ddvl.ref_lang = nvl (sys_context ('ctx_infor_sesn'
                                                ,'vnu_seqnc_lang')
                                   ,afw_11_prodt_pkg.obten_lang_deft (ddv.dnr_ref_prodt));

    return vva_valr_organ;
  exception
    when others
    then
      return null;
  end obten_valr_organ;

  function copr_domn_valr (pnu_domn_a_copr   in number
                          ,pnu_prodt_sourc   in number default null
                          ,pnu_prodt_destn   in number default null)
    return number
  is
    vnu_type_domn_valr   number (10);
    vnu_nouv_type        number (10);
    vnu_nouv_domn_valr   number (10);
    vnu_formt            number (10);
    vnu_nouv_formt       number (10);
  begin
    select ref_type_domn_valr
          ,ref_formt
      into vnu_type_domn_valr
          ,vnu_formt
      from vd_i_afw_14_domn_valr
     where seqnc = pnu_domn_a_copr;

    gbo_copie_domn       := true;

    --Copier le type du domaine de valeur et le format s'ils sont présent
    if vnu_type_domn_valr is not null
    then
      begin
        select seqnc
          into vnu_nouv_type
          from vd_i_afw_14_type_domn_valr
         where     code = (select code
                             from vd_i_afw_14_type_domn_valr f
                            where f.seqnc = vnu_type_domn_valr)
               and ref_prodt = pnu_prodt_destn;
      exception
        when no_data_found
        then
          vnu_nouv_type   := afw_14_type_domn_valr_seq.nextval;

          insert into vd_i_afw_14_type_domn_valr (seqnc
                                                 ,code
                                                 ,nom
                                                 ,descr
                                                 ,ref_prodt
                                                 ,dnr_ref_prodt)
            select vnu_nouv_type
                  ,code
                  ,nom
                  ,descr
                  ,pnu_prodt_destn
                  ,pnu_prodt_destn
              from vd_i_afw_14_type_domn_valr tdv
             where tdv.seqnc = vnu_type_domn_valr;
      end;
    end if;

    if     vnu_formt is not null
       and pnu_prodt_destn is not null
       and pnu_prodt_sourc is not null
    then
      begin
        select seqnc
          into vnu_nouv_formt
          from vd_i_afw_14_formt
         where     defnt = (select defnt
                              from vd_i_afw_14_formt f
                             where f.seqnc = vnu_type_domn_valr)
               and ref_prodt = pnu_prodt_sourc;
      exception
        when no_data_found
        then
          vnu_nouv_formt   := afw_14_formt_seq.nextval;

          insert into vd_i_afw_14_formt (seqnc
                                        ,libl
                                        ,defnt
                                        ,type_don
                                        ,indic_formt_orcl
                                        ,indic_unite_inclu
                                        ,ref_prodt)
            select vnu_nouv_formt
                  ,libl
                  ,defnt
                  ,type_don
                  ,indic_formt_orcl
                  ,indic_unite_inclu
                  ,pnu_prodt_destn
              from vd_i_afw_14_formt f
             where f.seqnc = vnu_formt;
      end;
    end if;

    vnu_nouv_domn_valr   := afw_14_domn_valr_seq.nextval;

    insert into vd_i_afw_14_domn_valr (seqnc
                                      ,code
                                      ,nom
                                      ,descr
                                      ,enonc_sourc
                                      ,type_don
                                      ,ref_formt
                                      ,ref_prodt
                                      ,ref_type_domn_valr
                                      ,indic_systm
                                      ,dnr_ref_prodt)
      select vnu_nouv_domn_valr
            ,code
            ,nom
            ,descr
            ,enonc_sourc
            ,type_don
            ,vnu_nouv_formt
            ,pnu_prodt_destn
            ,vnu_nouv_type
            ,indic_systm
            ,pnu_prodt_destn
        from vd_i_afw_14_domn_valr dv
       where dv.seqnc = pnu_domn_a_copr;

    insert into vd_i_afw_14_detl_domn_valr (code_valr
                                           ,ref_domn_valr
                                           ,seqnc_presn
                                           ,date_debut_efect
                                           ,date_fin_efect
                                           ,dnr_ref_prodt)
      select code_valr
            ,vnu_nouv_domn_valr
            ,seqnc_presn
            ,date_debut_efect
            ,date_fin_efect
            ,pnu_prodt_destn
        from vd_i_afw_14_detl_domn_valr ddv
       where ddv.ref_domn_valr = pnu_domn_a_copr;

    insert into vd_i_afw_14_ddv_lang (ref_detl_domn_valr
                                     ,ref_lang
                                     ,valr
                                     ,valr_court
                                     ,valr_organ
                                     ,dnr_ref_prodt)
      select ddv.seqnc
            ,ddvl.ref_lang
            ,ddvl.valr
            ,ddvl.valr_court
            ,ddvl.valr_organ
            ,ddvl.dnr_ref_prodt
        from vd_i_afw_14_detl_domn_valr ddv
            ,vd_i_afw_14_ddv_lang       ddvl
       where     ddv.ref_domn_valr = pnu_domn_a_copr
             and ddvl.ref_detl_domn_valr = ddv.seqnc;

    gbo_copie_domn       := false;

    return vnu_nouv_domn_valr;
  end copr_domn_valr;

  function obten_enonc_sql (pnu_seqnc_domn_valr in number)
    return varchar2
  is
    vva_enonc_sql     varchar2 (4000);
    vva_enonc_sourc   vd_i_afw_14_domn_valr.enonc_sourc%type;
  begin
    select enonc_sourc
      into vva_enonc_sourc
      from vd_afw_14_domn_valr dv
     where seqnc = pnu_seqnc_domn_valr;

    if vva_enonc_sourc is not null
    then
      vva_enonc_sql      :=
           'select d, r from  ('
        || vva_enonc_sourc
        || ') order by d';
    else
      vva_enonc_sql      :=
           'select valr d, seqnc r from vd_afw_14_detl_domn_valr where ref_domn_valr = '
        || pnu_seqnc_domn_valr
        || ' order by seqnc_presn';
    end if;

    return vva_enonc_sql;
  end obten_enonc_sql;


  function obten_table_valr (pnu_seqnc_domn_valr   in number
                            ,pva_valr_code         in varchar2 default 'N')
    return table_rec_valr
    pipelined
  is
    vta_table_rec_valr    table_rec_valr;
    vre_rec_valr          rec_valr;
    vva_enonc_sourc       vd_i_afw_14_domn_valr.enonc_sourc%type;
    cur_domn_valr_enonc   sys_refcursor;

    cursor cur_domn_valr_valr
    is
        select valr
              ,seqnc
              ,code_valr
          from vd_afw_14_detl_domn_valr
         where ref_domn_valr = pnu_seqnc_domn_valr
      order by seqnc_presn;
  begin
    select enonc_sourc
      into vva_enonc_sourc
      from vd_afw_14_domn_valr dv
     where seqnc = pnu_seqnc_domn_valr;

    if vva_enonc_sourc is not null
    then
      open cur_domn_valr_enonc for
           'select d, r from  ('
        || vva_enonc_sourc
        || ') order by d';

      fetch cur_domn_valr_enonc
        bulk collect into vta_table_rec_valr;

      close cur_domn_valr_enonc;

      if vta_table_rec_valr.count > 0
      then
        for i in vta_table_rec_valr.first .. vta_table_rec_valr.last
        loop
          pipe row (vta_table_rec_valr (i));
        end loop;
      end if;
    else
      for rec_domn_valr_valr in cur_domn_valr_valr
      loop
        vre_rec_valr.r   := case when pva_valr_code = 'N' then to_char (rec_domn_valr_valr.seqnc) else rec_domn_valr_valr.code_valr end;
        vre_rec_valr.d   := rec_domn_valr_valr.valr;
        pipe row (vre_rec_valr);
      end loop;
    end if;

    return;
  end obten_table_valr;
end afw_14_domn_valr_pkg;
/
