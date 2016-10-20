SET DEFINE OFF;
create or replace package body afw_36_filtr_pkg
as
  function obten_iden_opert_filtr_ctx (pva_code_opert_filtr   in varchar2
                                      ,pva_nom_sql_atrib      in varchar2
                                      ,pva_code_type_don      in varchar2
                                      ,pnu_valr               in number default 1)
    return varchar2
  is
  begin
    return lower (   pva_nom_sql_atrib
                  || '-'
                  || pva_code_opert_filtr
                  || '-'
                  || pnu_valr);
  end obten_iden_opert_filtr_ctx;

  function obten_filtr_ctx (pva_code_opert_filtr   in varchar2
                           ,pva_nom_sql_atrib      in varchar2
                           ,pva_code_type_don      in varchar2
                           ,pnu_valr               in number default 1)
    return varchar2
  is
    vva_varbl   varchar2 (4000);
  begin
    if pva_code_type_don = 'DATE'
    then
      vva_varbl      :=
        replace (replace (replace (' to_date(sys_context(''afw_36_filtr'', ''$1$-$2$-$3$''), ''yyyy-mm-dd'') '
                                  ,'$1$'
                                  ,pva_nom_sql_atrib)
                         ,'$2$'
                         ,pva_code_opert_filtr)
                ,'$3$'
                ,pnu_valr);
    else
      vva_varbl      :=
        replace (replace (replace (' sys_context(''afw_36_filtr'', ''$1$-$2$-$3$'') '
                                  ,'$1$'
                                  ,pva_nom_sql_atrib)
                         ,'$2$'
                         ,pva_code_opert_filtr)
                ,'$3$'
                ,pnu_valr);
    end if;

    return lower (vva_varbl);
  end obten_filtr_ctx;

  procedure initl_contx
  is
    vva_code_champ_vue   varchar2 (100)
                           default    'SEM_'
                                   || afw_08_url_pkg.knu_app_page_id
                                   || '_AFW_36_VUE_AFICH';
    vnu_vue              number (10);
    vva_code_vue         varchar2 (23) default afw_07_util_pkg.v (vva_code_champ_vue);
  begin
    --    ete ('vva_code_champ_vue', vva_code_champ_vue);
    --    ete ('vva_code_vue', vva_code_vue);

    if vva_code_vue is not null
    then
      select seqnc
        into vnu_vue
        from vd_i_afw_36_vue v
       where     code = vva_code_vue
             and ref_page = afw_13_page_pkg.obten_page_sesn;

      --      ete ('numero vue', vnu_vue);
      --      ete ('Page session', afw_13_page_pkg.obten_page_sesn);
      dbms_session.clear_context ('afw_36_filtr'
                                 ,null);
      --      ete ('apres clear');
      dbms_session.set_context ('afw_36_filtr'
                               ,'ref_vue'
                               ,vnu_vue);
      dbms_session.set_context ('afw_36_filtr'
                               ,'ref_page'
                               ,afw_13_page_pkg.obten_page_sesn);
    --      ete ('après');
    end if;
  end initl_contx;

  procedure initl_tri
  is
    vva_code_champ_tri   varchar2 (100)
                           default    'SEM_'
                                   || afw_08_url_pkg.knu_app_page_id
                                   || '_AFW_36_TRI';
    vva_tri_sql          varchar2 (500);

    vnu_sesn             number default afw_08_url_pkg.knu_sesn;
    vnu_page             number (10) default afw_13_page_pkg.obten_page_sesn;
    vva_code_champ_vue   varchar2 (100)
                           default    'SEM_'
                                   || afw_08_url_pkg.knu_app_page_id
                                   || '_AFW_36_VUE_AFICH';
    vva_code_vue         varchar2 (23) default afw_07_util_pkg.v (vva_code_champ_vue);

    cursor cur_tri
    is
      select case when postn_filtr_bris is not null then 1 else 2 end ordre
            ,nvl (va.postn_filtr_bris, postn_filtr_deft)
            ,ad.nom_sql
            ,nvl (nvl (va.sens_filtr_bris, sens_filtr_deft), 'ASC')   sens
        from vd_i_afw_36_vue_atrib   va
            ,vd_i_afw_36_atrib_dispn ad
            ,vd_i_afw_36_vue         v
       where     ad.seqnc = va.ref_atrib_dispn
             and va.ref_vue = v.seqnc
             and v.code = vva_code_vue
             and v.ref_page = vnu_page
             and (   postn_filtr_bris is not null
                  or postn_filtr_deft is not null)
      union all
      select 3
            ,1
            ,ad.nom_sql
            ,sens_filtr sens
        from vd_i_afw_36_atrib_dispn   ad
            ,vd_i_afw_36_vue_tri_secnd vts
            ,vd_i_afw_36_vue           v
       where     ad.seqnc = vts.ref_atrib
             and vts.ref_vue = v.seqnc
             and vts.ref_sesn = vnu_sesn
             and v.code = vva_code_vue
             and v.ref_page = vnu_page
      order by 1
              ,2;
  begin
    --ete('vva_code_vue', vva_code_vue);
    --ete('vnu_page', vnu_page);
    --ete('session', vnu_sesn);
    for rec_tri in cur_tri
    loop
      --ete('tri', rec_tri.nom_sql || ' ' || rec_tri.sens);
      vva_tri_sql      :=
           vva_tri_sql
        || ', '
        || rec_tri.nom_sql
        || ' '
        || rec_tri.sens;
    end loop;

    --ete('vva_tri_sql', vva_tri_sql);
    if vva_tri_sql is not null
    then
      afw_07_util_pkg.defnr_etat_sesn (vva_code_champ_tri
                                      ,   ' order by '
                                       || substr (vva_tri_sql
                                                 ,3));
    else
      afw_07_util_pkg.defnr_etat_sesn (vva_code_champ_tri
                                      ,null);
    end if;
  --ete('item app', v(vva_code_champ_tri));
  exception
    when others
    then
      ete ();
  end initl_tri;

  procedure initl_sql
  is
    vnu_sesn               number default afw_08_url_pkg.knu_sesn;
    vnu_page               number (10) default afw_13_page_pkg.obten_page_sesn;

    cursor cur_filtr
    is
      select dnr_condt_sql
            ,valr_varch1
            ,valr_varch2
            ,ofi.indic_valr2
            ,ofi.code code_opert_filtr
            ,ad.nom_sql
            ,td.code  code_type_don
        from vd_i_afw_36_filtr_sesn  fs
            ,vd_i_afw_36_opert_filtr ofi
            ,vd_i_afw_36_atrib_dispn ad
            ,vd_i_afw_36_type_don    td
       where     fs.ref_sesn = vnu_sesn
             and fs.ref_page = vnu_page
             and ofi.seqnc = fs.ref_opert_filtr
             and ad.seqnc = fs.ref_atrib_dispn
             and td.seqnc = ad.ref_type_don;

    vva_filtr_sql          varchar2 (32767);

    vva_code_champ_filtr   varchar2 (100)
                             default    'SEM_'
                                     || afw_08_url_pkg.knu_app_page_id
                                     || '_AFW_36_FILTR';
  begin
    initl_contx;

    for rec_filtr in cur_filtr
    loop
      /*
        ete (
          'obten_iden_opert_filtr_ctx (rec_filtr.code_opert_filtr,
                                      rec_filtr.nom_sql,
                                      rec_filtr.code_type_don)',
          obten_iden_opert_filtr_ctx (rec_filtr.code_opert_filtr,
                                      rec_filtr.nom_sql,
                                      rec_filtr.code_type_don));
  */
      dbms_session.set_context ('afw_36_filtr'
                               ,obten_iden_opert_filtr_ctx (rec_filtr.code_opert_filtr
                                                           ,rec_filtr.nom_sql
                                                           ,rec_filtr.code_type_don)
                               ,rec_filtr.valr_varch1);


      if rec_filtr.indic_valr2 = 'O'
      then
        dbms_session.set_context ('afw_36_filtr'
                                 ,obten_iden_opert_filtr_ctx (rec_filtr.code_opert_filtr
                                                             ,rec_filtr.nom_sql
                                                             ,rec_filtr.code_type_don
                                                             ,2)
                                 ,rec_filtr.valr_varch2);
      end if;

      vva_filtr_sql      :=
           vva_filtr_sql
        || ' and '
        || rec_filtr.dnr_condt_sql;
    end loop;

    afw_07_util_pkg.defnr_etat_sesn (vva_code_champ_filtr
                                    ,vva_filtr_sql);

    initl_tri;
  exception
    when others
    then
      ete ();
  end initl_sql;

  procedure obten_dnr_condt_sql (pnu_opert             in     number
                                ,pnu_atrib             in     number
                                ,pva_valr1_base        in     varchar2
                                ,pva_valr2_base        in     varchar2
                                ,pva_dnr_condt_afich      out varchar2
                                ,pva_dnr_condt_sql        out varchar2
                                ,pva_valr1                out varchar2
                                ,pnu_valr1                out number
                                ,pda_valr1                out date
                                ,pva_valr2                out varchar2
                                ,pnu_valr2                out number
                                ,pda_valr2                out date)
  is
    cursor cur_atrib
    is
      select ofi.texte_afich
            ,ofi.condt_sql
            ,td.code  code_type_don
            ,ofi.code code_opert_filtr
            ,ofi.indic_valr2
            ,ad.nom_afich
            ,ad.nom_sql
        from vd_i_afw_36_opert_filtr ofi
            ,vd_i_afw_36_atrib_dispn ad
            ,vd_i_afw_36_type_don    td
       where     ofi.seqnc = pnu_opert
             and ad.seqnc = pnu_atrib
             and td.seqnc = ad.ref_type_don;

    rec_atrib   cur_atrib%rowtype;

    procedure valdr_parmt (pva_valr_base   in     varchar2
                          ,pva_valr           out varchar2
                          ,pnu_valr           out number
                          ,pda_valr           out date)
    is
    begin
      case rec_atrib.code_type_don
        when 'DATE'
        then
          pva_valr   := pva_valr1;
          pda_valr      :=
            to_date (pva_valr_base
                    ,'yyyy-mm-dd');
        when 'NUMBR'
        then
          pva_valr   := pva_valr1;

          begin
            pnu_valr      :=
              to_number (replace (pva_valr_base
                                 ,' '
                                 ,null));
          exception
            when others
            then
              pnu_valr      :=
                to_number (replace (replace (pva_valr_base
                                            ,' '
                                            ,null)
                                   ,','
                                   ,'.'));
          end;

          pva_valr      :=
            to_char (pnu_valr
                    ,'fm999g999g999g999g990d99');
        else
          pva_valr   := pva_valr_base;
      end case;
    end valdr_parmt;
  begin
    --    ete (0.9999, pnu_opert);
    --    ete (0.9999, pnu_atrib);

    open cur_atrib;

    fetch cur_atrib
      into rec_atrib;

    close cur_atrib;

    --    ete('rec_atrib.indic_valr2', rec_atrib.indic_valr2);

    valdr_parmt (pva_valr1_base
                ,pva_valr1
                ,pnu_valr1
                ,pda_valr1);


    if rec_atrib.indic_valr2 = 'O'
    then
      valdr_parmt (pva_valr2_base
                  ,pva_valr2
                  ,pnu_valr2
                  ,pda_valr2);
    end if;


    pva_dnr_condt_afich      :=
      replace (rec_atrib.texte_afich
              ,'#atrib#'
              ,rec_atrib.nom_afich);
    pva_dnr_condt_afich      :=
      replace (pva_dnr_condt_afich
              ,'#valr#'
              ,pva_valr1);

    pva_dnr_condt_sql      :=
      replace (rec_atrib.condt_sql
              ,'#atrib#'
              ,rec_atrib.nom_sql);
    pva_dnr_condt_sql      :=
      replace (pva_dnr_condt_sql
              ,'#valr#'
              ,obten_filtr_ctx (rec_atrib.code_opert_filtr
                               ,rec_atrib.nom_sql
                               ,rec_atrib.code_type_don));

    if rec_atrib.indic_valr2 = 'O'
    then
      pva_dnr_condt_afich      :=
        replace (pva_dnr_condt_afich
                ,'#valr2#'
                ,pva_valr2);
      pva_dnr_condt_sql      :=
        replace (pva_dnr_condt_sql
                ,'#valr2#'
                ,obten_filtr_ctx (rec_atrib.code_opert_filtr
                                 ,rec_atrib.nom_sql
                                 ,rec_atrib.code_type_don
                                 ,2));
    end if;
  end obten_dnr_condt_sql;

  procedure ajout_filtr (pnu_atrib   in number
                        ,pnu_opert   in number
                        ,pva_valr1      varchar2
                        ,pva_valr2      varchar2)
  is
    --vnu_sesn number default ;
    vva_dnr_condt_afich   varchar2 (4000);
    vva_dnr_condt_sql     varchar2 (4000);

    vva_valr1             varchar2 (4000);
    vnu_valr1             number;
    vda_valr1             date;
    vva_valr2             varchar2 (4000);
    vnu_valr2             number;
    vda_valr2             date;



    pragma autonomous_transaction;
  begin
    obten_dnr_condt_sql (pnu_opert
                        ,pnu_atrib
                        ,pva_valr1
                        ,pva_valr2
                        ,vva_dnr_condt_afich
                        ,vva_dnr_condt_sql
                        ,vva_valr1
                        ,vnu_valr1
                        ,vda_valr1
                        ,vva_valr2
                        ,vnu_valr2
                        ,vda_valr2);

    --Vérifier si le filtre n'existe pas déjà, si oui, le remplacer
    merge into vd_i_afw_36_filtr_sesn c
         using (select afw_08_url_pkg.knu_sesn         ref_sesn
                      ,afw_13_page_pkg.obten_page_sesn ref_page
                      ,pnu_atrib                       ref_atrib_dispn
                      ,pnu_opert                       ref_opert_filtr
                  from dual) s
            on (    c.ref_page = s.ref_page
                and c.ref_sesn = s.ref_sesn
                and c.ref_atrib_dispn = s.ref_atrib_dispn
                and c.ref_opert_filtr = s.ref_opert_filtr)
    when matched
    then
      update set dnr_condt_sql     = vva_dnr_condt_sql
                ,dnr_condt_afich   = vva_dnr_condt_afich
                ,valr_varch1       = vva_valr1
                ,valr_numbr1       = vnu_valr1
                ,valr_date1        = vda_valr1
                ,valr_varch2       = vva_valr2
                ,valr_numbr2       = vnu_valr2
                ,valr_date2        = vda_valr2
    when not matched
    then
      insert     (ref_sesn
                 ,ref_opert_filtr
                 ,ref_atrib_dispn
                 ,ref_page
                 ,dnr_condt_sql
                 ,dnr_condt_afich
                 ,valr_varch1
                 ,valr_numbr1
                 ,valr_date1
                 ,valr_varch2
                 ,valr_numbr2
                 ,valr_date2)
          values (s.ref_sesn
                 ,s.ref_opert_filtr
                 ,s.ref_atrib_dispn
                 ,s.ref_page
                 ,vva_dnr_condt_sql
                 ,vva_dnr_condt_afich
                 ,vva_valr1
                 ,vnu_valr1
                 ,vda_valr1
                 ,vva_valr2
                 ,vnu_valr2
                 ,vda_valr2);

    initl_sql;
    commit;
  exception
    when others
    then
      ete;
      rollback;
  end ajout_filtr;

  procedure suprm_filtr (pnu_seqnc in number)
  is
    pragma autonomous_transaction;
    vnu_sesn   number default afw_08_url_pkg.knu_sesn;
  begin
    delete vd_i_afw_36_filtr_sesn
     where     ref_sesn = vnu_sesn
           and seqnc = pnu_seqnc;

    initl_sql;
    commit;
  end suprm_filtr;

  procedure specf_tri (pnu_atrib in number)
  is
    vnu_sesn             number default afw_08_url_pkg.knu_sesn;
    vnu_page             number (10) default afw_13_page_pkg.obten_page_sesn;

    vva_code_champ_vue   varchar2 (100)
                           default    'SEM_'
                                   || afw_08_url_pkg.knu_app_page_id
                                   || '_AFW_36_VUE_AFICH';
    vva_code_vue         varchar2 (23) default afw_07_util_pkg.v (vva_code_champ_vue);
    vnu_seqnc_vue        number (10);
    pragma autonomous_transaction;
  begin
    select seqnc
      into vnu_seqnc_vue
      from vd_i_afw_36_vue v
     where     v.code = vva_code_vue
           and ref_page = vnu_page;

    merge into vd_i_afw_36_vue_tri_secnd c
         using (select vnu_sesn  ref_sesn
                      ,v.seqnc   ref_vue
                      ,pnu_atrib ref_atrib
                  from vd_i_afw_36_vue_atrib   va
                      ,vd_i_afw_36_atrib_dispn ad
                      ,afw_36_vue              v
                 where     ad.seqnc = pnu_atrib
                       and va.ref_atrib_dispn = va.seqnc
                       and va.ref_vue = vnu_seqnc_vue
                       and v.seqnc = vnu_seqnc_vue
                       and v.seqnc = va.ref_vue) s
            on (    s.ref_sesn = c.ref_sesn
                and s.ref_vue = c.ref_vue
                and s.ref_atrib = c.ref_atrib)
    when not matched
    then
      insert     (ref_vue
                 ,ref_sesn
                 ,ref_atrib
                 ,sens_filtr)
          values (s.ref_vue
                 ,s.ref_sesn
                 ,s.ref_atrib
                 ,'ASC')
    when matched
    then
      update set sens_filtr   = decode (sens_filtr, 'ASC', 'DESC', 'ASC');

    delete vd_i_afw_36_vue_tri_secnd c
     where     c.ref_sesn = vnu_sesn
           and c.ref_vue = vnu_seqnc_vue
           and c.ref_atrib != pnu_atrib;

    initl_tri;
    commit;
  exception
    when others
    then
      ete ();
      rollback;
  end specf_tri;
end afw_36_filtr_pkg;
/
