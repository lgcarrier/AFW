SET DEFINE OFF;
create or replace package body afw_14_domn_valr_cu_pkg
as
  function obten_valr (pva_code_domn    in varchar2
                      ,pva_code_valr    in varchar2
                      ,pva_code_prodt   in varchar2 default null)
    return varchar2
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
end afw_14_domn_valr_cu_pkg;
/
