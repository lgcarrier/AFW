SET DEFINE OFF;
create or replace package body afw_13_raprt_inter_pkg
is
  function obten_ir_page (pnu_numr_page       number default null
                         ,pva_code         in varchar2 default null
                         ,pnu_numr_aplic      number default null)
    return number
  is
    vnu_ref_aplic   number default nvl (pnu_numr_aplic, afw_07_util_pkg.nv ('APP_ID'));
    vnu_numr_page   number default nvl (pnu_numr_page, afw_07_util_pkg.nv ('APP_PAGE_ID'));
    vnu_ref_ir      number;
  begin
    select pir.seqnc
      into vnu_ref_ir
      from vd_afw_13_page_ir pir
          ,vd_afw_13_page    p
     where     p.numr_apex = vnu_numr_page
           and p.app_id_formt = pnu_numr_aplic
           and p.seqnc = pir.ref_page
           and (   pir.code = pva_code
                or pva_code is null);

    return vnu_ref_ir;
  exception
    when too_many_rows
    then
      afw_01_err_apex_pkg.lever_err_apex_code (pva_code          => 'STA.000002'
                                              ,pva_valr_subst1   => 'Il existe plus d''un état interactif pour cette page.'
                                              ,pva_code_prodt    => 'AFW');
  end obten_ir_page;

  function obten_rpts_de_base_id_sesn (pnu_base_rpts_id in number)
    return number
  is
    vnu_rpts   number;
    vnu_sesn   number default afw_07_util_pkg.nv ('APP_SESSION');
  begin
    select id
      into vnu_rpts
      from apex_ir_rpts rpts
     where     rpts.base_report_id = pnu_base_rpts_id
           and rpts.session_id = vnu_sesn;

    return vnu_rpts;
  exception
    when others
    then
      return null;
  end obten_rpts_de_base_id_sesn;

  function obten_selct_ir (pnu_ir_id in number)
    return clob
  is
    vcl_sql   clob;
  begin
    select rtrim (sql_query
                 ,   ' ;'
                  || chr (10)
                  || chr (13))
      into vcl_sql
      from apex_ir
     where id = pnu_ir_id;

    return vcl_sql;
  end obten_selct_ir;

  function obten_selct_rpts (pnu_rpts_id          in number
                            ,pbo_inclu_order_by   in boolean default true
                            ,pva_coln_selct       in varchar2 default null)
    return clob
  is
    cursor cur_rpts
    is
      select rpts.report_columns
            ,rpts.sort_column_1
            ,rpts.sort_direction_1
            ,rpts.sort_column_2
            ,rpts.sort_direction_2
            ,rpts.sort_column_3
            ,rpts.sort_direction_3
            ,rpts.sort_column_4
            ,rpts.sort_direction_4
            ,rpts.sort_column_5
            ,rpts.sort_direction_5
            ,rpts.sort_column_6
            ,rpts.sort_direction_6
            ,rpts.worksheet_id
        from apex_ir_rpts rpts
       where rpts.id = pnu_rpts_id;

    rec_rpts               cur_rpts%rowtype;

    cursor cur_coln_exist (pnu_works_id     in number
                          ,pva_liste_coln   in varchar2)
    is
        select irc.expr
              ,irc.db_column_name
              ,irc.display_condition_type
              ,irc.display_condition
              ,irc.display_condition2
          from (select    '"'
                       || column_identifier
                       || '"'
                         expr
                      ,db_column_name
                      ,display_condition_type
                      ,display_condition
                      ,display_condition2
                  from apex_ir_coln
                 where worksheet_id = pnu_works_id
                union all
                select    '('
                       || computation_expr
                       || ')'
                         expr
                      ,db_column_name
                      ,null
                      ,null
                      ,null
                  from apex_ir_compt
                 where report_id = pnu_rpts_id) irc
              ,(  select column_value
                        ,max (rownum) rn
                    from table (afw_07_util_pkg.strin_to_table_va (upper (pva_liste_coln)))
                group by column_value) coln
         where coln.column_value = irc.db_column_name
      order by coln.rn;

    cursor cur_ident_colns (pnu_works_id in number)
    is
      select db_column_name
            ,column_identifier
        from apex_ir_coln
       where worksheet_id = pnu_works_id;

    cursor cur_condt
    is
      select condition_type
            ,replace (expr
                     ,''''
                     ,'''''')
               expr
            ,replace (replace (condition_sql
                              ,'#APXWS_EXPR#'
                              ,   ''''
                               || replace (expr
                                          ,''''
                                          ,'''''')
                               || '''')
                     ,'#APXWS_EXPR2#'
                     ,   ''''
                      || replace (expr2
                                 ,''''
                                 ,'''''')
                      || '''')
               condt
        from apex_ir_condt irc
       where     irc.report_id = pnu_rpts_id
             and irc.enabled = 'Y';

    cursor cur_compt
    is
      select c.db_column_name
            ,c.column_identifier
            ,computation_expr
            ,format_mask
            ,column_type
        from apex_ir_compt c
       where c.report_id = pnu_rpts_id;

    cursor cur_coln_tri_group
    is
      select break_on.coln coln
            ,break_on.dirct
        from (select column_value coln
                    ,'asc'        dirct
                from table (afw_07_util_pkg.strin_to_table_va ( (select break_on
                                                                   from apex_ir_rpts
                                                                  where id = pnu_rpts_id)))) break_on;

    cursor cur_coln_tri_exist (pnu_works_id in number)
    is
        select coln.nom
              ,coln.dirct
          from (select db_column_name
                      ,display_condition_type
                      ,display_condition
                      ,display_condition2
                  from apex_ir_coln
                 where worksheet_id = pnu_works_id
                union all
                select db_column_name
                      ,null
                      ,null
                      ,null
                  from apex_ir_compt
                 where report_id = pnu_rpts_id) irc
              ,(select rec_rpts.sort_column_1               nom
                      ,nvl (rec_rpts.sort_direction_1, 'asc') dirct
                      ,1                                    rn
                  from dual
                union all
                select rec_rpts.sort_column_2               nom
                      ,nvl (rec_rpts.sort_direction_2, 'asc') dirct
                      ,2                                    rn
                  from dual
                union all
                select rec_rpts.sort_column_3               nom
                      ,nvl (rec_rpts.sort_direction_3, 'asc') dirct
                      ,3                                    rn
                  from dual
                union all
                select rec_rpts.sort_column_4               nom
                      ,nvl (rec_rpts.sort_direction_4, 'asc') dirct
                      ,4                                    rn
                  from dual
                union all
                select rec_rpts.sort_column_5               nom
                      ,nvl (rec_rpts.sort_direction_5, 'asc') dirct
                      ,5                                    rn
                  from dual
                union all
                select rec_rpts.sort_column_6               nom
                      ,nvl (rec_rpts.sort_direction_6, 'asc') dirct
                      ,6                                    rn
                  from dual) coln
         where coln.nom = irc.db_column_name
      order by coln.rn;

    vbo_premr_condt        boolean default true;
    vcl_sql                clob;
    vbo_clob_ouvrt         boolean default false;
    vva_sql_order_by       varchar2 (4000);
    vva_colmn_list         varchar2 (4000);
    vva_colmn_list_condt   varchar2 (4000);

    procedure ajout_ligne_clob (pcl_clob    in out nocopy clob
                               ,pva_contn   in            varchar2)
    is
    begin
      if not vbo_clob_ouvrt
      then
        dbms_lob.createtemporary (pcl_clob
                                 ,true);
        vbo_clob_ouvrt   := true;
      end if;

      dbms_lob.writeappend (pcl_clob
                           ,length (pva_contn)
                           ,pva_contn);
    end ajout_ligne_clob;
  begin
    open cur_rpts;

    fetch cur_rpts
      into rec_rpts;

    close cur_rpts;

    if rec_rpts.worksheet_id is not null
    then
      -- Certaines colonnes peuvent ne plus exister au niveau du worksheet
      vva_colmn_list   := null;

      for rec_coln_exist in cur_coln_exist (rec_rpts.worksheet_id
                                           ,nvl (pva_coln_selct, rec_rpts.report_columns))
      loop
        if apex_condt.standard_condition (rec_coln_exist.display_condition_type
                                         ,rec_coln_exist.display_condition
                                         ,rec_coln_exist.display_condition2)
        then
          vva_colmn_list      :=
               vva_colmn_list
            || ','
            || rec_coln_exist.expr
            || ' "'
            || rec_coln_exist.db_column_name
            || '"';
        end if;
      end loop;

      -- Supprimer la virgule initiale de trop
      vva_colmn_list      :=
        substr (vva_colmn_list
               ,2);

      -- Faire un select des colonnes retenues
      ajout_ligne_clob (vcl_sql
                       ,   'select '
                        || vva_colmn_list
                        || chr (10));

      -- Récupérer les identifiants de colonnes
      vva_colmn_list   := null;

      for rec_ident_colns in cur_ident_colns (rec_rpts.worksheet_id)
      loop
        vva_colmn_list      :=
             vva_colmn_list
          || ',"'
          || rec_ident_colns.db_column_name
          || '" "'
          || rec_ident_colns.column_identifier
          || '"';
      end loop;

      -- Supprimer la virgule initiale de trop
      vva_colmn_list      :=
        substr (vva_colmn_list
               ,2);

      -- Inscrire le select de base, encapsulé dans un select qui
      -- renomme les noms de colonnes avec leur identifiant
      ajout_ligne_clob (vcl_sql
                       ,   '  from (select '
                        || vva_colmn_list
                        || '  from ('
                        || obten_selct_ir (rec_rpts.worksheet_id)
                        || ')');

      -- Ajouter les conditions avant de refermer le dernier sous select
      for rec_condt in cur_condt
      loop
        if rec_condt.condition_type in ('FILTER'
                                       ,'SEARCH')
        then
          if vbo_premr_condt
          then
            if rec_condt.condt is not null
            then
              ajout_ligne_clob (vcl_sql
                               ,   ' where '
                                || rec_condt.condt
                                || chr (10));
            else
              for rec_coln_exist in cur_coln_exist (rec_rpts.worksheet_id
                                                   ,rec_rpts.report_columns)
              loop
                if apex_condt.standard_condition (rec_coln_exist.display_condition_type
                                                 ,rec_coln_exist.display_condition
                                                 ,rec_coln_exist.display_condition2)
                then
                  vva_colmn_list_condt      :=
                       vva_colmn_list_condt
                    || '||'
                    || rec_coln_exist.db_column_name;
                end if;
              end loop;

              vva_colmn_list_condt      :=
                substr (vva_colmn_list_condt
                       ,3);
              ajout_ligne_clob (vcl_sql
                               ,   ' where upper(afw_07_util_pkg.purgr_html('
                                || vva_colmn_list_condt
                                || ')) like ''%'
                                || upper (rec_condt.expr)
                                || '%'''
                                || chr (10));
            end if;

            vbo_premr_condt   := false;
          else
            if rec_condt.condt is not null
            then
              ajout_ligne_clob (vcl_sql
                               ,   '   and '
                                || rec_condt.condt
                                || chr (10));
            else
              ajout_ligne_clob (vcl_sql
                               ,   '   and upper(afw_07_util_pkg.purgr_html('
                                || rtrim (replace (rec_rpts.report_columns
                                                  ,':'
                                                  ,'||')
                                         ,'||')
                                || ')) like ''%'
                                || upper (rec_condt.expr)
                                || '%'''
                                || chr (10));
            end if;
          end if;
        end if;
      end loop;

      -- Ajouter la clause "order by" si demandée
      if pbo_inclu_order_by
      then
        vva_sql_order_by   := null;

        /* AJOUT CONAL */
        for rec_coln_tri_group in cur_coln_tri_group
        loop
          if rec_coln_tri_group.coln <> '0'
          then
            vva_sql_order_by      :=
                 vva_sql_order_by
              || rec_coln_tri_group.coln
              || ' '
              || rec_coln_tri_group.dirct
              || ',';
          end if;
        end loop;

        /*FIN AJOUT CONAL */

        for rec_coln_tri_exist in cur_coln_tri_exist (rec_rpts.worksheet_id)
        loop
          vva_sql_order_by      :=
               vva_sql_order_by
            || rec_coln_tri_exist.nom
            || ' '
            || rec_coln_tri_exist.dirct
            || ',';
        end loop;

        if vva_sql_order_by is not null
        then
          ajout_ligne_clob (vcl_sql
                           ,   'order by '
                            || substr (vva_sql_order_by
                                      ,1
                                      ,length (vva_sql_order_by) - 1));
        end if;
      end if;

      ajout_ligne_clob (vcl_sql
                       ,')');
    end if;

    return vcl_sql;
  end obten_selct_rpts;

  function obten_selct_rpts_base_id (pnu_base_report_id in number)
    return clob
  is
  begin
    return obten_selct_rpts (obten_rpts_de_base_id_sesn (pnu_base_report_id));
  end obten_selct_rpts_base_id;

  function obten_repts_courn (pnu_numr_page_apex    in number default null
                             ,pva_code              in varchar2 default null
                             ,pnu_numr_aplic_apex   in number default null)
    return number
  is
    vnu_app_id          number default nvl (pnu_numr_aplic_apex, afw_07_util_pkg.nv ('APP_ID'));
    vnu_page_id         number default nvl (pnu_numr_page_apex, afw_07_util_pkg.nv ('APP_PAGE_ID'));
    vnu_ws_id           number;
    vva_nom_prefr       varchar2 (500);
    vva_valr_prefr      varchar2 (500);
    vnu_repts_base_id   number default null;
  begin
    begin
      select id_apex
        into vnu_ws_id
        from vd_afw_13_page_ir
       where     app_id_formt = vnu_app_id
             and app_page_id_formt = vnu_page_id
             and (   code = pva_code
                  or pva_code is null);
    exception
      when no_data_found
      then
        return null;
      when too_many_rows
      then
        afw_01_err_apex_pkg.lever_err_apex_code (pva_code          => 'STA.000002'
                                                ,pva_valr_subst1   => 'Il existe plus d''un état interactif pour cette page.'
                                                ,pva_code_prodt    => 'AFW');
    end;

    vva_nom_prefr      :=
         'FSP_IR_'
      || vnu_app_id
      || '_P'
      || vnu_page_id
      || '_W'
      || vnu_ws_id;

    vva_valr_prefr   := afw_07_util_pkg.obten_prefr (vva_nom_prefr);

    if instr (vva_valr_prefr
             ,'_') > 0
    then
      vnu_repts_base_id      :=
        substr (vva_valr_prefr
               ,1
               ,  instr (vva_valr_prefr
                        ,'_')
                - 1);
    else
      return null;
    end if;

    return obten_rpts_de_base_id_sesn (vnu_repts_base_id);
  end obten_repts_courn;

  function obten_works_id (pnu_app_id        in number default afw_07_util_pkg.nv ('APP_ID')
                          ,pnu_app_page_id   in number default afw_07_util_pkg.nv ('APP_PAGE_ID')
                          ,pva_code          in varchar2 default null)
    return number
  is
    vnu_id   number;
  begin
    select id
      into vnu_id
      from apex_ir           air
          ,vd_afw_13_page_ir pir
     where     air.flow_id = pnu_app_id
           and air.page_id = pnu_app_page_id
           and pir.id_apex = air.id
           and (   code = pva_code
                or pva_code is null);

    return vnu_id;
  exception
    when no_data_found
    then
      return null;
    when too_many_rows
    then
      afw_01_err_apex_pkg.lever_err_apex_code (pva_code          => 'STA.000002'
                                              ,pva_valr_subst1   => 'Il existe plus d''un état interactif pour cette page.'
                                              ,pva_code_prodt    => 'AFW');
  end obten_works_id;

  function obten_seqnc_raprt_courn (pnu_numr_page_apex    in number default null
                                   ,pva_code              in varchar2 default null
                                   ,pnu_numr_aplic_apex   in number default null)
    return typ_seqnc_reprt_courn
    pipelined
  is
    vnu_aplic        number default nvl (pnu_numr_aplic_apex, afw_07_util_pkg.v ('APP_ID'));
    vnu_page         number default nvl (pnu_numr_page_apex, afw_07_util_pkg.v ('APP_PAGE_ID'));
    vnu_ref_ir       number;
    vva_selct        varchar2 (32767);
    vnu_cursr        number;
    var_infor_coln   afw_07_sql_pkg.typ_arr_infor_coln;
    vnu_rpts_id      number;
  begin
    begin
      -- Chercher le rapport interactif sur la page
      select pir.seqnc
        into vnu_ref_ir
        from vd_afw_13_page    pag
            ,vd_afw_13_page_ir pir
       where     pag.app_id_formt = vnu_aplic
             and pag.numr_apex = vnu_page
             and pir.ref_page = pag.seqnc
             and (   pir.code = pva_code
                  or pva_code is null);

      -- Récupérer le select
      vnu_rpts_id      :=
        afw_13_raprt_inter_pkg.obten_repts_courn (vnu_page
                                                 ,null
                                                 ,vnu_aplic);
      vva_selct      :=
        afw_13_raprt_inter_pkg.obten_selct_rpts (vnu_rpts_id
                                                ,false
                                                ,'SEQNC');
    exception
      when no_data_found
      then
        vva_selct   := null;
      when too_many_rows
      then
        afw_01_err_apex_pkg.lever_err_apex_code (pva_code          => 'STA.000002'
                                                ,pva_valr_subst1   => 'Il existe plus d''un état interactif pour cette page.'
                                                ,pva_code_prodt    => 'AFW');
    end;

    if vva_selct is not null
    then
      vnu_cursr      :=
        afw_07_sql_pkg.ouvri_selct (vnu_ref_ir
                                   ,vnu_rpts_id
                                   ,vva_selct
                                   ,var_infor_coln
                                   ,chr (10));

      if var_infor_coln.first () is not null
      then
        -- Extraire la valeur de la séquence pour chaque rangée
        while afw_07_sql_pkg.lire_ligne_selct (vnu_cursr
                                              ,var_infor_coln)
        loop
          pipe row (var_infor_coln (1).nu_valr_numbr);
        end loop;
      end if;

      -- Fermer le curseur
      afw_07_sql_pkg.fermr_selct (vnu_cursr);
    end if;

    return;
  exception
    when others
    then
      raise;
  end obten_seqnc_raprt_courn;

  function genr_url_filtr (pnu_page_ir         in vd_afw_13_page_ir.seqnc%type
                          ,pty_page_ir_filtr   in typ_page_ir_filtr
                          ,pnu_page_ir_sauvg   in number default null)
    return varchar2
  is
    vva_url          varchar2 (2000);
    vnu_numr_page    number;
    vnu_numr_aplic   number;
  begin
    select pr.numr_aplic_apex
          ,p.numr_apex
      into vnu_numr_aplic
          ,vnu_numr_page
      from vd_afw_13_page_ir pi
          ,vd_afw_13_page    p
          ,vd_afw_11_aplic   pr
     where     pi.seqnc = pnu_page_ir
           and p.seqnc = pi.ref_page
           and pr.seqnc = p.ref_aplic;

    vva_url      :=
         'f?p='
      || vnu_numr_aplic
      || ':'
      || vnu_numr_page
      || ':#SESSION#:IR_REPORT_#REPORT_ID#:'
      || afw_07_util_pkg.v ('DEBUG')
      || ':'
      || 'RIR,CIR:';

    return vva_url;
  end genr_url_filtr;
end afw_13_raprt_inter_pkg;
/
