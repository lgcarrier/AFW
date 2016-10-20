SET DEFINE OFF;
create or replace package body afw_12_struc_aplic_cu_pkg
as
  function exect_sql_reslt_elemn_varch (pva_sql         in varchar2
                                       ,pnu_cle_initl   in number)
    return varchar2
  is
    vva_valr_formt   varchar2 (32767);
  begin
    execute immediate pva_sql into vva_valr_formt using pnu_cle_initl;

    return vva_valr_formt;
  exception
    when no_data_found
    then
      return null;
    when others
    then
      op (pva_sql);
      raise;
  end exect_sql_reslt_elemn_varch;

  --LG trouve que cest jobeur pas mal... alors obsolete!
  function exect_sql_reslt_elemn_tabl_var (pva_sql          in varchar2
                                          ,pnu_cle_initl    in number
                                          ,pta_liste_coln   in apex_application_global.vc_arr2)
    return apex_plugin_util.t_column_value_list
  is
    vta_coln_liste         apex_plugin_util.t_column_value_list;
    --    vty_bind             apex_plugin_util.t_bind;
    --    vta_bind_list        apex_plugin_util.t_bind_list
    --                           default apex_plugin_util.c_empty_bind_list;

    --    vva_apex_item_name   varchar2 (30) default 'PX_DUMMY';

    vva_asign_liste_coln   varchar2 (4000);

    vva_progr_a_lancr      varchar2 (32767)
                             default    'declare '
                                     || '  vta_liste_coln apex_application_global.vc_arr2;'
                                     || '  cursor cur_reqt is'
                                     || '    %ENONC_SQL%;'
                                     || 'begin '
                                     || '  for rec_reqt in cur_reqt loop'
                                     || '    %BIND%'
                                     || '  end loop;'
                                     || '  exception when others then ete();'
                                     || 'end;';
  --    gta_liste_coln         (vnu_index) :=


  begin
    --    vty_bind.name       := 'cle';
    --    vty_bind.value      := pnu_cle_initl;
    --    vta_bind_list (1)   := vty_bind;
    --
    --    ete ('vty_bind.name', vty_bind.name);
    --    ete ('vty_bind.value', vty_bind.value);
    --    ete ('vta_bind_list.count', vta_bind_list.count);
    --
    --    vta_coln_liste      :=
    --      apex_plugin_util.get_data (p_sql_statement     => pva_sql
    --                                ,p_min_columns       => 1
    --                                ,p_max_columns       => pta_liste_coln.count
    --                                ,p_component_name    => vva_apex_item_name
    --                                --       ,p_search_type        => apex_plugin_util.c_search_lookup
    --                                --       ,p_search_column_no   => 1
    --                                --       ,p_search_string      => pnu_cle_initl
    --                                ,p_max_rows          => 500
    --                                ,p_auto_bind_items   => true
    --                                ,p_bind_list         => vta_bind_list);
    --
    --    ete ('vta_coln_liste.count', vta_coln_liste.count);

    for i in 1 .. pta_liste_coln.count
    loop
      vva_asign_liste_coln      :=
           vva_asign_liste_coln
        || 'vta_liste_coln(i) := rec_reqt.'
        || pta_liste_coln (i);
    end loop;

    vva_progr_a_lancr      :=
      replace (vva_progr_a_lancr
              ,'%ENONC_SQL%'
              ,pva_sql);

    vva_progr_a_lancr      :=
      replace (vva_progr_a_lancr
              ,'%BIND%'
              ,vva_asign_liste_coln);

    execute immediate vva_progr_a_lancr using pnu_cle_initl;

    return vta_coln_liste;
  exception
    when no_data_found
    then
      return vta_coln_liste;
    when others
    then
      op (pva_sql);
      raise;
  end exect_sql_reslt_elemn_tabl_var;

  function obten_enonc_sql (pnu_struc_aplic   in number
                           ,pva_chemn_reslt   in varchar2
                           ,pta_liste_coln    in apex_application_global.vc_arr2)
    return varchar2
  is
    type typ_rec_ocurn_table_reslt is record
    (
      nom_reslt_formt    varchar2 (100)
     ,nom_table          varchar2 (30)
     ,nom_alias          varchar2 (1)
     ,code_struc_aplic   varchar2 (23)
     ,nom_coln           varchar2 (30)
     ,cle_primr          varchar2 (30)
    );

    type type_tab_rec_ocurn_tabl_reslt is table of typ_rec_ocurn_table_reslt
      index by pls_integer;

    vva_chemn_reslt        varchar2 (32767);
    vta_reslt              type_tab_rec_ocurn_tabl_reslt;
    vva_code_struc_aplic   varchar2 (30);
    vva_coln_selct         varchar2 (30);
    vva_coln               varchar2 (30);
    vva_valr_chemn_travl   varchar2 (2000);
    vnu_dernr_point        pls_integer;
    vnu_debut_croch        pls_integer;
    vnu_prodt              number (10);
    vva_sql                varchar2 (32767);
    vva_struc_acces_don    varchar2 (30);
    vnu_i                  pls_integer;
    vnu_fk                 pls_integer;
  begin
    if pta_liste_coln.count > 0
    then
      vva_chemn_reslt      :=
           pva_chemn_reslt
        || '.'
        || pta_liste_coln (1);
    else
      vva_chemn_reslt   := pva_chemn_reslt;
    end if;

    vnu_dernr_point      :=
      instr (vva_chemn_reslt
            ,'.'
            ,-1);

    if vnu_dernr_point = 0
    then
      --On demeure sur la même structure applicative donc facile
      vva_sql   := 'select ';

      if pta_liste_coln.count > 0
      then
        for i in 1 .. pta_liste_coln.count
        loop
          vva_sql      :=
               vva_sql
            || pva_chemn_reslt
            || '.'
            || pta_liste_coln (i)
            || ', '
            || chr (10);
        end loop;

        vva_sql      :=
             rtrim (vva_sql
                   ,   ','
                    || chr (10))
          || chr (10);
      else
        vva_sql      :=
             vva_sql
          || vva_chemn_reslt
          || chr (10);
      end if;

      select sa.nom_struc_acces_don
            ,asa.nom_coln
        into vva_struc_acces_don
            ,vva_coln
        from vd_afw_12_struc_aplic       sa
            ,vd_afw_12_atrib_struc_aplic asa
       where     sa.seqnc = pnu_struc_aplic
             and asa.ref_struc_aplic = sa.seqnc
             and asa.ref_dv_natr_infor_code = 'CLE_PRIMR';

      vva_sql      :=
           vva_sql
        || 'from '
        || vva_struc_acces_don
        || chr (10);

      vva_sql      :=
           vva_sql
        || 'where '
        || vva_coln
        || ' = to_number(:cle)'
        || chr (10);
    else
      vva_coln_selct                                        :=
        substr (vva_chemn_reslt
               ,vnu_dernr_point + 1);
      vva_valr_chemn_travl                                  :=
        substr (vva_chemn_reslt
               ,1
               ,vnu_dernr_point - 1);

      vnu_dernr_point                                       :=
        instr (vva_valr_chemn_travl
              ,'.'
              ,-1);

      while vnu_dernr_point != 0
      loop
        vta_reslt (-1 - vta_reslt.count).nom_reslt_formt      :=
          substr (vva_valr_chemn_travl
                 ,vnu_dernr_point + 1);
        vva_valr_chemn_travl      :=
          substr (vva_valr_chemn_travl
                 ,1
                 ,vnu_dernr_point - 1);
        vnu_dernr_point      :=
          instr (vva_valr_chemn_travl
                ,'.'
                ,-1);
      end loop;

      --traiter les dernier
      vta_reslt (-1 - vta_reslt.count ()).nom_reslt_formt   := vva_valr_chemn_travl;

      --Décortiquer les occurences
      for i in vta_reslt.first () .. vta_reslt.last ()
      loop
        vnu_debut_croch      :=
          instr (vta_reslt (i).nom_reslt_formt
                ,'[');
        vta_reslt (i).code_struc_aplic      :=
          substr (vta_reslt (i).nom_reslt_formt
                 ,1
                 ,vnu_debut_croch - 1);
        vta_reslt (i).nom_coln      :=
          substr (vta_reslt (i).nom_reslt_formt
                 ,vnu_debut_croch + 1);
        vta_reslt (i).nom_coln      :=
          substr (vta_reslt (i).nom_coln
                 ,1
                 ,length (vta_reslt (i).nom_coln) - 1);
      end loop;

      --trouver le produit lié à la première structure et chercher une structure pour ce produit
      select ref_prodt
        into vnu_prodt
        from vd_afw_12_struc_aplic
       where seqnc = pnu_struc_aplic;

      vva_coln                                              := vta_reslt (vta_reslt.last ()).nom_coln;
      vva_code_struc_aplic                                  := vta_reslt (vta_reslt.last ()).code_struc_aplic;

      --Exécuter si la dernière colonne est une FK seulement
      vnu_i                                                 := vta_reslt.last;

      if vnu_i is not null
      then
        select count (1)
          into vnu_fk
          from vd_afw_12_struc_aplic       sa
              ,vd_afw_12_atrib_struc_aplic asa
         where     sa.code = vta_reslt (vnu_i).code_struc_aplic
               and asa.nom_coln = vta_reslt (vnu_i).nom_coln
               and sa.seqnc = asa.ref_struc_aplic
               and sa.ref_prodt = vnu_prodt
               and asa.ref_dv_natr_infor_code = 'CLE_ETRAN'
               and rownum = 1;
      end if;

      if vnu_fk = 1
      then
        select sac.code
              ,asac.nom_coln
          into vta_reslt (vta_reslt.last + 1).code_struc_aplic
              ,vta_reslt (vta_reslt.last + 1).nom_coln
          from vd_afw_12_struc_aplic       sac
              ,vd_afw_12_struc_aplic       sas
              ,vd_afw_12_atrib_struc_aplic asas
              ,vd_afw_12_atrib_struc_aplic asac
         where     sas.ref_prodt = vnu_prodt
               and sas.code = vva_code_struc_aplic
               and sas.seqnc = asas.ref_struc_aplic
               and asas.nom_coln = vva_coln
               and asas.ref_atrib_struc_aplic = asac.seqnc
               and asac.ref_struc_aplic = sac.seqnc;
      end if;

      --Alimenter les alias de tables et le nom des tables et les clés primaires
      begin
        for i in vta_reslt.first () .. vta_reslt.last ()
        loop
          vva_code_struc_aplic      := vta_reslt (i).code_struc_aplic;

          select nom_struc_acces_don
            into vta_reslt (i).nom_table
            from vd_afw_12_struc_aplic
           where     ref_prodt = vnu_prodt
                 and code = vva_code_struc_aplic;

          vta_reslt (i).nom_alias   := chr (i * -1 + 65);

          select nom_coln
            into vta_reslt (i).cle_primr
            from vd_afw_12_atrib_struc_aplic asa
                ,vd_afw_12_struc_aplic       sa
           where     asa.ref_struc_aplic = sa.seqnc
                 and sa.code = vva_code_struc_aplic
                 and sa.ref_prodt = vnu_prodt
                 and ref_dv_natr_infor_code = 'CLE_PRIMR';
        end loop;
      exception
        when others
        then
          afw_03_journ_pkg.ecrir_journ ('Alimenter alias');
          raise;
      end;

      vva_sql                                               := 'select ';

      if pta_liste_coln.count > 0
      then
        for i in 1 .. pta_liste_coln.count
        loop
          vva_sql      :=
               vva_sql
            || vta_reslt (vta_reslt.last ()).nom_alias
            || '.'
            || pta_liste_coln (i)
            || ','
            || chr (10);
        end loop;

        vva_sql      :=
             rtrim (vva_sql
                   ,   ','
                    || chr (10))
          || chr (10);
      else
        vva_sql      :=
             vva_sql
          || vta_reslt (vta_reslt.last ()).nom_alias
          || '.'
          || vva_coln_selct
          || chr (10);
      end if;

      vva_sql                                               :=
           vva_sql
        || 'from ';

      for i in vta_reslt.first () .. vta_reslt.last ()
      loop
        vva_sql      :=
             vva_sql
          || vta_reslt (i).nom_table
          || ' '
          || vta_reslt (i).nom_alias
          || ', '
          || chr (10);
      end loop;

      vva_sql                                               :=
           substr (vva_sql
                  ,1
                  ,length (vva_sql) - 3)
        || chr (10)
        || 'where '
        || vta_reslt (vta_reslt.first ()).nom_alias
        || '.'
        || vta_reslt (vta_reslt.first ()).cle_primr
        || ' = :cle'
        || chr (10);

      if vta_reslt.count () > 1
      then
        vva_sql      :=
             vva_sql
          || 'and '
          || vta_reslt (vta_reslt.first ()).nom_alias
          || '.'
          || vta_reslt (vta_reslt.first ()).nom_coln
          || ' = ';

        for i in vta_reslt.first () + 1 .. vta_reslt.last ()
        loop
          vva_sql      :=
               vva_sql
            || vta_reslt (i).nom_alias
            || '.'
            || vta_reslt (i).cle_primr;

          if i < vta_reslt.last ()
          then
            vva_sql      :=
                 vva_sql
              || chr (10)
              || 'and '
              || vta_reslt (i).nom_alias
              || '.'
              || vta_reslt (i).nom_coln
              || ' = ';
          end if;
        end loop;
      end if;
    end if;

    --ete ('vva_sql', vva_sql);

    return vva_sql;
  exception
    when others
    then
      afw_03_journ_pkg.ecrir_journ ('resdr_elemn');
      raise;
  end obten_enonc_sql;

  function resdr_elemn (pnu_struc_aplic         in number
                       ,pnu_seqnc_struc_aplic      number
                       ,pva_chemn_reslt         in varchar2)
    return varchar2
  is
    vva_sql          varchar2 (32767);
    vta_liste_coln   apex_application_global.vc_arr2;
  begin
    vva_sql      :=
      obten_enonc_sql (pnu_struc_aplic
                      ,pva_chemn_reslt
                      ,vta_liste_coln);

    --ete ('vva_sql', vva_sql);
    return exect_sql_reslt_elemn_varch (vva_sql
                                       ,pnu_seqnc_struc_aplic);
  exception
    when others
    then
      afw_03_journ_pkg.ecrir_journ ('resdr_elemn');
      raise;
  end resdr_elemn;

  function resdr_tabl_elemn (pnu_struc_aplic         in number
                            ,pnu_seqnc_struc_aplic      number
                            ,pva_chemn_reslt         in varchar2
                            ,pta_liste_coln          in apex_application_global.vc_arr2
                            ,pta_liste_subst         in afw_07_sql_pkg.typ_liste_subst default afw_07_sql_pkg.c_liste_subst_vide)
    return afw_07_sql_pkg.typ_coln_valr
  is
    vva_sql               varchar2 (32767);
    --    vta_liste_coln   apex_plugin_util.t_column_value_list;
    vta_liste_coln_valr   afw_07_sql_pkg.typ_coln_valr;
  begin
    op (   'pnu_struc_aplic='
        || pnu_struc_aplic);
    op (   'pva_chemn_reslt='
        || pva_chemn_reslt);

    vva_sql      :=
      obten_enonc_sql (pnu_struc_aplic
                      ,pva_chemn_reslt
                      ,pta_liste_coln);

    vta_liste_coln_valr      :=
      afw_07_sql_pkg.obten_don (vva_sql
                               ,pta_liste_subst);

    --    vta_liste_coln                   :=
    --      (vva_sql, pnu_seqnc_struc_aplic, pta_liste_coln);

    return vta_liste_coln_valr;
  exception
    when others
    then
      ete ();
      afw_03_journ_pkg.ecrir_journ ('resdr_tabl_elemn');
      raise;
  end resdr_tabl_elemn;

  function obten_valr_formt (pnu_struc_aplic         in number
                            ,pnu_seqnc_struc_aplic   in number
                            ,pnu_elemn_desr          in number default kva_elemn_titre)
    return varchar2
  is
    vva_nom_coln          varchar2 (50);
    vva_nom_struc_acces   varchar2 (50);
    vva_valr_formt        varchar2 (4000);
  begin
    select nom_coln
      into vva_nom_coln
      from vd_afw_12_atrib_struc_aplic
     where     ref_dv_natr_infor = afw_14_domn_valr_pkg.obten_seqnc (
                                     'NATR_INFOR_STRUC_APLIC'
                                    ,decode (pnu_elemn_desr
                                            ,kva_elemn_titre, 'NOM_FORMT'
                                            ,kva_elemn_titre_court, 'TITRE_COURT'
                                            ,kva_elemn_descr, 'DESCR_LONG')
                                    ,'AFW')
           and ref_struc_aplic = pnu_struc_aplic;

    select nom_struc_acces_don
      into vva_nom_struc_acces
      from vd_afw_12_struc_aplic
     where seqnc = pnu_struc_aplic;

    execute immediate
         'select '
      || vva_nom_coln
      || ' from '
      || vva_nom_struc_acces
      || ' where seqnc = '
      || pnu_seqnc_struc_aplic
      || ' '
      into vva_valr_formt;

    return vva_valr_formt;
  exception
    when others
    then
      return null;
  end obten_valr_formt;

  function obten_valr_atrib_formt (pnu_seqnc_atrib         in number
                                  ,pnu_seqnc_struc_aplic   in number
                                  ,pva_formt               in varchar2 default null)
    return varchar2
  is
    vva_nom_coln          varchar2 (50);
    vva_nom_struc_acces   varchar2 (50);
    vva_valr_formt        varchar2 (4000);
  begin
    select nom_coln
      into vva_nom_coln
      from vd_afw_12_atrib_struc_aplic
     where seqnc = pnu_seqnc_atrib;

    select nom_struc_acces_don
      into vva_nom_struc_acces
      from vd_afw_12_struc_aplic
     where seqnc = (select ref_struc_aplic
                      from vd_afw_12_atrib_struc_aplic
                     where seqnc = pnu_seqnc_atrib);

    execute immediate
         'select '
      || case pva_formt
           when null
           then
                'to_char('
             || vva_nom_coln
             || ', '
             || pva_formt
             || ')'
           else
             vva_nom_coln
         end
      || ' from '
      || vva_nom_struc_acces
      || ' where seqnc = '
      || pnu_seqnc_struc_aplic
      || ' '
      into vva_valr_formt;

    return vva_valr_formt;
  exception
    when others
    then
      return null;
  end obten_valr_atrib_formt;
end afw_12_struc_aplic_cu_pkg;
/
