SET DEFINE OFF;
create or replace package body afw_07_sql_pkg
as
  c_lf                     constant varchar2 (1) := chr (10);
  c_cr                     constant varchar2 (1) := chr (13);

  knu_type_vc2             constant number := 1;
  knu_type_numbr           constant number := 2;
  knu_type_long            constant number := 8;
  knu_type_vc              constant number := 9;
  knu_type_date            constant number := 12;
  knu_type_raw             constant number := 23;
  knu_type_long_raw        constant number := 24;
  knu_type_rowid           constant number := 69;
  knu_type_char            constant number := 96;
  knu_type_binr_float      constant number := 100;
  knu_type_binr_doubl      constant number := 101;
  knu_type_clob            constant number := 112;
  knu_type_blob            constant number := 113;
  knu_type_bfile           constant number := 114;
  knu_type_cfile           constant number := 115;
  knu_type_time            constant number := 178;
  knu_type_timst           constant number := 180;
  knu_type_timst_with_tz   constant number := 181;
  knu_type_inter_y2m       constant number := 182;
  knu_type_inter_d2s       constant number := 183;
  knu_type_u_rowid         constant number := 208;

  gnu_nombr_fetch                   number;

  function rempl_br (pva_chaine     in varchar2
                    ,pva_rempl_br   in varchar2)
    return varchar2
  is
  begin
    return afw_07_util_pkg.multi_replc (pva_chaine
                                       ,'<br>'
                                       ,pva_rempl_br
                                       ,'<br/>'
                                       ,pva_rempl_br
                                       ,'<BR>'
                                       ,pva_rempl_br
                                       ,'<BR/>'
                                       ,pva_rempl_br
                                       ,'<br >'
                                       ,pva_rempl_br
                                       ,'<br />'
                                       ,pva_rempl_br
                                       ,'<BR >'
                                       ,pva_rempl_br
                                       ,'<BR />'
                                       ,pva_rempl_br);
  end rempl_br;

  function obten_type_valr (pnu_type_don in number)
    return varchar2
  is
  begin
    return case pnu_type_don
             when knu_type_vc2 then 'VARCH'
             when knu_type_vc then 'VARCH'
             when knu_type_char then 'VARCH'
             when knu_type_clob then 'VARCH'
             when knu_type_numbr then 'NUMBR'
             when knu_type_binr_float then 'NUMBR'
             when knu_type_binr_doubl then 'NUMBR'
             when knu_type_date then 'DATE'
             when knu_type_time then 'DATE'
             when knu_type_timst then 'TIMST'
             when knu_type_timst_with_tz then 'TIMST'
             else 'INVAL'
           end;
  end obten_type_valr;

  function obten_infor_coln (pnu_ref_ir     in number
                            ,pnu_rpts_id    in number
                            ,prd_coln       in dbms_sql.desc_rec2
                            ,pva_rempl_br   in varchar2)
    return typ_rec_infor_coln
  is
    vic_infor   typ_rec_infor_coln;
  begin
    vic_infor.va_nom         := prd_coln.col_name;
    vic_infor.nu_type_don    := prd_coln.col_type;

    -- Obtenir les infos de la colonne depuis le rapport interactif
    afw_07_sql_noyau_pkg.obten_infor_coln_ir (pnu_ref_ir
                                             ,pnu_rpts_id
                                             ,vic_infor);

    vic_infor.va_libl        := apex_application.do_substitutions (vic_infor.va_libl);
    vic_infor.va_libl        :=
      rempl_br (vic_infor.va_libl
               ,pva_rempl_br);
    vic_infor.va_formt       := aa.do_substitutions (vic_infor.va_formt);

    if    vic_infor.nu_largr is null
       or vic_infor.va_type_largr is null
    then
      vic_infor.nu_largr        := 0;
      vic_infor.va_type_largr   := 'INDET';
    end if;

    vic_infor.va_type_valr   := obten_type_valr (vic_infor.nu_type_don);

    if vic_infor.va_align_entet is null
    then
      if vic_infor.va_align_coln is not null
      then
        vic_infor.va_align_entet   := vic_infor.va_align_coln;
      else
        -- Alignement par défaut
        vic_infor.va_align_entet      :=
          case vic_infor.nu_type_don
            when knu_type_numbr then 'RIGHT'
            when knu_type_binr_float then 'RIGHT'
            when knu_type_binr_doubl then 'RIGHT'
            when knu_type_date then 'CENTER'
            when knu_type_time then 'CENTER'
            when knu_type_timst then 'CENTER'
            else 'LEFT'
          end;
      end if;
    end if;

    if vic_infor.va_align_coln is null
    then
      vic_infor.va_align_coln   := vic_infor.va_align_entet;
    end if;

    return vic_infor;
  end obten_infor_coln;

  function anals_sql (pva_sql in varchar2)
    return number
  is
    vnu_cursr         number;
    vnu_pos           number;
    vnu_longr_sql     number default length (pva_sql);
    vva_nom_varbl     varchar2 (50);
    var_varbl_liees   typ_arr_ndx_vc30;
    vva_carct         varchar2 (2);
  begin
    -- Ouvrir un curseur
    vnu_cursr         := dbms_sql.open_cursor ();
    gnu_nombr_fetch   := 0;

    -- Analyser le SQL
    dbms_sql.parse (vnu_cursr
                   ,pva_sql
                   ,dbms_sql.native);

    -- Trouver et lier les variables (liées)
    vnu_pos           := 1;

    -- Parcourir le select caractere par caractere
    while vnu_pos <= vnu_longr_sql
    loop
      vva_carct      :=
        substr (pva_sql
               ,vnu_pos
               ,1);

      -- Début d'une chaine
      if substr (pva_sql
                ,vnu_pos
                ,1) = ''''
      then
        -- Passer la chaine, on ne veut pas se préoccuper des ":" dans les chaines
        vnu_pos   := vnu_pos + 1;

        while vnu_pos <= vnu_longr_sql
        loop
          if substr (pva_sql
                    ,vnu_pos
                    ,1) = ''''
          then
            if substr (pva_sql
                      ,vnu_pos
                      ,2) = ''''''
            then
              vnu_pos   := vnu_pos + 1;
            else
              exit;
            end if;
          end if;

          vnu_pos   := vnu_pos + 1;
        end loop;
      -- Début d'un commentaire de fin de ligne
      elsif substr (pva_sql
                   ,vnu_pos
                   ,2) = '--'
      then
        -- Passer le commentaire, on ne veut pas se préoccuper des ":" dans les commentaires
        vnu_pos   := vnu_pos + 1;

        while vnu_pos <= vnu_longr_sql
        loop
          if substr (pva_sql
                    ,vnu_pos
                    ,1) = chr (10)
          then
            exit;
          end if;

          vnu_pos   := vnu_pos + 1;
        end loop;
      -- Début d'un bloc de commentaire
      elsif substr (pva_sql
                   ,vnu_pos
                   ,2) = '/*'
      then
        -- Passer le commentaire, on ne veut pas se préoccuper des ":" dans les commentaires
        vnu_pos   := vnu_pos + 1;

        while vnu_pos <= vnu_longr_sql
        loop
          if substr (pva_sql
                    ,vnu_pos
                    ,2) = '*/'
          then
            vnu_pos   := vnu_pos + 1;
            exit;
          end if;

          vnu_pos   := vnu_pos + 1;
        end loop;
      -- Début d'une variable liée
      elsif substr (pva_sql
                   ,vnu_pos
                   ,1) = ':'
      then
        -- Trouver le nom
        vva_nom_varbl   := null;
        vnu_pos         := vnu_pos + 1;

        while     vnu_pos <= vnu_longr_sql
              and nvl (length (vva_nom_varbl), 0) < 30
        loop
          vva_carct      :=
            substr (pva_sql
                   ,vnu_pos
                   ,1);

          if instr ('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'
                   ,upper (substr (pva_sql
                                  ,vnu_pos
                                  ,1))
                   ,1
                   ,1) = 0
          then
            exit;
          end if;

          vva_nom_varbl      :=
               vva_nom_varbl
            || upper (substr (pva_sql
                             ,vnu_pos
                             ,1));

          vnu_pos   := vnu_pos + 1;
        end loop;

        if not var_varbl_liees.exists (vva_nom_varbl)
        then
          -- Créer l'index
          var_varbl_liees (vva_nom_varbl)   := null;
          --ete('sql.vva_nom_varbl',vva_nom_varbl);
          --ete('sql.vva_nom_varbl.value',afw_07_util_pkg.v(vva_nom_varbl));
          -- Lier la variable au curseur
          dbms_sql.bind_variable (vnu_cursr
                                 ,vva_nom_varbl
                                 ,afw_07_util_pkg.v (vva_nom_varbl));
        end if;

        -- Se repositionner sur le dernier caractère du nom avant que la
        -- boucle principale ne repasser au prochain
        vnu_pos         := vnu_pos - 1;
      end if;

      vnu_pos   := vnu_pos + 1;
    end loop;

    return vnu_cursr;
  exception
    when others
    then
      ete ();
      ete ('pva_sql'
          ,null
          ,pva_sql);
      raise;
  end anals_sql;

  function ouvri_selct (pnu_ref_ir       in            number
                       ,pnu_rpts_id      in            number
                       ,pva_sql          in            varchar2
                       ,par_infor_coln   in out nocopy typ_arr_infor_coln
                       ,pva_rempl_br     in            varchar2)
    return number
  is
    vnu_cursr         number;
    vnu_nombr_colns   number;
    vdt_descr_table   dbms_sql.desc_tab2;
  begin
    -- Analyser le Select
    vnu_cursr   := anals_sql (pva_sql);

    -- Récupérer le describe du select
    dbms_sql.describe_columns2 (vnu_cursr
                               ,vnu_nombr_colns
                               ,vdt_descr_table);

    -- Alimenter la structure de retour
    par_infor_coln.delete ();

    if vdt_descr_table.first () is not null
    then
      for i in vdt_descr_table.first () .. vdt_descr_table.last ()
      loop
        par_infor_coln (i)      :=
          obten_infor_coln (pnu_ref_ir
                           ,pnu_rpts_id
                           ,vdt_descr_table (i)
                           ,pva_rempl_br);

        -- Selon le type, faire correspondre au bon element du record
        case par_infor_coln (i).va_type_valr
          when 'VARCH'
          then
            dbms_sql.define_column (vnu_cursr
                                   ,i
                                   ,par_infor_coln (i).va_valr_varch
                                   ,4000);
          when 'NUMBR'
          then
            dbms_sql.define_column (vnu_cursr
                                   ,i
                                   ,par_infor_coln (i).nu_valr_numbr);
          when 'DATE'
          then
            dbms_sql.define_column (vnu_cursr
                                   ,i
                                   ,par_infor_coln (i).da_valr_date);
          when 'TIMST'
          then
            dbms_sql.define_column (vnu_cursr
                                   ,i
                                   ,par_infor_coln (i).ts_valr_timst);
          else
            null;
        end case;
      end loop;
    end if;

    -- Exécuter le sélect, et fetcher la premiere ligne
    gnu_nombr_fetch      :=
      dbms_sql.execute_and_fetch (vnu_cursr
                                 ,false);

    return vnu_cursr;
  end ouvri_selct;

  function lire_ligne_selct (pnu_cursr        in out        number
                            ,par_infor_coln   in out nocopy typ_arr_infor_coln)
    return boolean
  is
  begin
    if gnu_nombr_fetch > 0
    then
      for i in par_infor_coln.first () .. par_infor_coln.last ()
      loop
        -- Charger les colonnes dans les bonnes valeurs, selon le type
        case par_infor_coln (i).va_type_valr
          when 'VARCH'
          then
            dbms_sql.column_value (pnu_cursr
                                  ,i
                                  ,par_infor_coln (i).va_valr_varch);
          when 'NUMBR'
          then
            dbms_sql.column_value (pnu_cursr
                                  ,i
                                  ,par_infor_coln (i).nu_valr_numbr);
          when 'DATE'
          then
            dbms_sql.column_value (pnu_cursr
                                  ,i
                                  ,par_infor_coln (i).da_valr_date);
          when 'TIMST'
          then
            dbms_sql.column_value (pnu_cursr
                                  ,i
                                  ,par_infor_coln (i).ts_valr_timst);
          else
            par_infor_coln (i).va_valr_varch   := '#####';
        end case;
      end loop;

      -- Refetcher une ligne
      gnu_nombr_fetch   := dbms_sql.fetch_rows (pnu_cursr);

      -- Indiquer qu'on vient de lire une ligne
      return true;
    else
      -- Plus de lignes dispo
      return false;
    end if;
  end lire_ligne_selct;

  procedure fermr_selct (pnu_cursr in out number)
  is
  begin
    if dbms_sql.is_open (pnu_cursr)
    then
      dbms_sql.close_cursor (pnu_cursr);
    end if;
  end fermr_selct;

  procedure fermr_gestn_sql (pty_gestn_sql in out nocopy typ_gestn_sql)
  is
  begin
    if dbms_sql.is_open (pty_gestn_sql.vnu_cursr)
    then
      dbms_sql.close_cursor (pty_gestn_sql.vnu_cursr);
    end if;
  end fermr_gestn_sql;

  function obten_nom_varbl_subst (pty_liste_subst in typ_liste_subst)
    return apex_application_global.vc_arr2
  is
    l_result   apex_application_global.vc_arr2;
  begin
    for i in 1 .. pty_liste_subst.count
    loop
      l_result (i)   := pty_liste_subst (i).vva_nom;
    end loop;

    return l_result;
  end obten_nom_varbl_subst;

  function obten_valr_varbl_subst (pty_liste_subst in typ_liste_subst)
    return apex_application_global.vc_arr2
  is
    l_result   apex_application_global.vc_arr2;
  begin
    for i in 1 .. pty_liste_subst.count
    loop
      l_result (i)   := pty_liste_subst (i).vva_valr;
    end loop;

    return l_result;
  end obten_valr_varbl_subst;

  procedure prepr_enonc (pva_enonc               in out nocopy varchar2
                        ,pty_liste_varbl_subst   in out nocopy typ_liste_varbl_subst)
  is
    vva_enonc                    varchar2 (32767) := pva_enonc;
    l_block_comment_start_pos    pls_integer;
    l_line_comment_start_pos     pls_integer;
    l_string_literal_start_pos   pls_integer;
    l_q_quote_char               varchar2 (1 char);
    l_closing_token              varchar2 (2 char);
    l_token_start_pos            pls_integer;
    l_token_end_pos              pls_integer;
    l_start_search_pos           pls_integer;
    l_bind_start_pos             pls_integer;
    l_is_quoted                  boolean;
    vva_nom                      varchar2 (255 char);
    l_length                     pls_integer;
    l_char                       varchar2 (1 char);
    l_added_binds                varchar2 (32767) := ':';
    l_bind_idx                   pls_integer;
    l_quoted_bind_count          pls_integer := 0;
  begin
    pva_enonc            :=
      replace (pva_enonc
              ,c_cr
              ,' ');

    --wwv_flow_debug.info ('...Execute Statement: %s', pva_enonc);

    if    vva_enonc is null
       or instr (vva_enonc
                ,':') = 0
    then
      return;
    end if;

    l_start_search_pos   := 1;

    loop
      l_block_comment_start_pos      :=
        instr (vva_enonc
              ,'/*'
              ,l_start_search_pos);
      l_line_comment_start_pos      :=
        instr (vva_enonc
              ,'--'
              ,l_start_search_pos);
      l_string_literal_start_pos      :=
        instr (vva_enonc
              ,''''
              ,l_start_search_pos);

      if l_block_comment_start_pos = 0
      then
        l_block_comment_start_pos   := 999999999;
      end if;

      if l_line_comment_start_pos = 0
      then
        l_line_comment_start_pos   := 999999999;
      end if;

      if l_string_literal_start_pos = 0
      then
        l_string_literal_start_pos   := 999999999;
      end if;

      if     l_string_literal_start_pos < l_block_comment_start_pos
         and l_string_literal_start_pos < l_line_comment_start_pos
      then
        l_token_start_pos   := l_string_literal_start_pos;

        if upper (substr (vva_enonc
                         ,l_token_start_pos - 1
                         ,1)) = 'Q'
        then
          l_q_quote_char       :=
            substr (vva_enonc
                   ,l_token_start_pos + 1
                   ,1);
          l_closing_token      :=
               case l_q_quote_char when '[' then ']' when '{' then '}' when '<' then '>' when '(' then ')' else l_q_quote_char end
            || '''';
          l_token_start_pos    := l_token_start_pos - 1;
          l_start_search_pos   := l_token_start_pos + 3;
        else
          l_closing_token      := '''';
          l_start_search_pos   := l_token_start_pos + 1;
        end if;
      elsif     l_block_comment_start_pos < l_line_comment_start_pos
            and l_block_comment_start_pos < l_string_literal_start_pos
      then
        l_token_start_pos    := l_block_comment_start_pos;
        l_start_search_pos   := l_token_start_pos + 2;
        l_closing_token      := '*/';
      elsif     l_line_comment_start_pos < l_block_comment_start_pos
            and l_line_comment_start_pos < l_string_literal_start_pos
      then
        l_token_start_pos    := l_line_comment_start_pos;
        l_start_search_pos   := l_token_start_pos + 2;
        l_closing_token      := c_lf;
      else
        l_token_start_pos   := null;
      end if;


      exit when l_token_start_pos is null;


      loop
        l_token_end_pos      :=
          instr (vva_enonc
                ,l_closing_token
                ,l_start_search_pos);


        if     l_token_end_pos = 0
           and l_closing_token = c_lf
        then
          l_token_end_pos   := length (vva_enonc);
          exit;
        elsif l_token_end_pos = 0
        then
          exit;
        elsif     l_closing_token = ''''
              and substr (vva_enonc
                         ,l_token_end_pos + 1
                         ,1) = ''''
        then
          l_start_search_pos   := l_token_end_pos + 2;
        else
          exit;
        end if;
      end loop;

      if l_token_end_pos > 0
      then
        vva_enonc            :=
             substr (vva_enonc
                    ,1
                    ,l_token_start_pos - 1)
          || substr (vva_enonc
                    ,l_token_end_pos + length (l_closing_token));

        l_start_search_pos   := l_token_start_pos;
      else
        exit;
      end if;
    end loop;

    loop
      l_bind_start_pos      :=
        nvl (instr (vva_enonc
                   ,':')
            ,0);
      exit when (l_bind_start_pos = 0);

      if substr (vva_enonc
                ,l_bind_start_pos + 1
                ,1) <> '"'
      then
        l_is_quoted   := false;

        vva_nom       :=
          upper (substr (vva_enonc
                        ,l_bind_start_pos + 1
                        ,30));

        l_length      := nvl (length (vva_nom), 0);

        for j in 1 .. l_length
        loop
          l_char      :=
            substr (vva_nom
                   ,j
                   ,1);

          if (    l_char not between 'A' and 'Z'
              and l_char not between '0' and '9'
              and l_char not in ('_'
                                ,'$'
                                ,'#'))
          then
            vva_nom      :=
              substr (vva_nom
                     ,1
                     ,j - 1);
            exit;
          end if;
        end loop;
      else
        l_is_quoted   := true;
        vva_nom       :=
          substr (vva_enonc
                 ,l_bind_start_pos + 2
                 ,31);
        vva_nom       :=
          upper (substr (vva_nom
                        ,1
                        ,  instr (vva_nom
                                 ,'"')
                         - 1));

        if     vva_nom is not null
           and (   instr (vva_nom
                         ,c_lf) > 0
                or instr (vva_nom
                         ,c_cr) > 0
                or instr (vva_nom
                         ,':') > 0)
        then
          vva_nom   := null;
        else
          vva_nom      :=
               '"'
            || vva_nom
            || '"';
        end if;
      end if;

      if     vva_nom is not null
         and instr (l_added_binds
                   ,   ':'
                    || vva_nom
                    || ':') = 0
      then
        l_added_binds      :=
             ':'
          || vva_nom
          || l_added_binds;
        l_bind_idx   := pty_liste_varbl_subst.count + 1;

        if l_is_quoted
        then
          l_quoted_bind_count                                := l_quoted_bind_count + 1;
          pty_liste_varbl_subst (l_bind_idx).vva_nom_orign   := trim (both '"' from vva_nom);
          pty_liste_varbl_subst (l_bind_idx).vva_nom         :=
               'p$_quoted_bind_'
            || l_quoted_bind_count;

          declare
            l_bind_name     varchar2 (256 char)
                              := upper (   ':'
                                        || vva_nom);
            l_bind_length   binary_integer := length (l_bind_name);
            l_new_name      varchar2 (256 char)
                              :=    ':'
                                 || pty_liste_varbl_subst (l_bind_idx).vva_nom;
            l_pos           binary_integer;
          begin
            pva_enonc      :=
              replace (pva_enonc
                      ,   ':'
                       || vva_nom
                      ,l_new_name);

            loop
              l_pos      :=
                instr (upper (pva_enonc)
                      ,l_bind_name);

              if l_pos > 0
              then
                pva_enonc      :=
                  replace (pva_enonc
                          ,substr (pva_enonc
                                  ,l_pos
                                  ,l_bind_length)
                          ,l_new_name);
              else
                exit;
              end if;
            end loop;
          end;
        --          wwv_flow_debug.info ('Rename quoted bind %s to "%s"'
        --                              ,vva_nom
        --                              ,pty_liste_varbl_subst (l_bind_idx).vva_nom);
        else
          pty_liste_varbl_subst (l_bind_idx).vva_nom_orign   := vva_nom;
          pty_liste_varbl_subst (l_bind_idx).vva_nom         := vva_nom;
        end if;
      end if;

      vva_enonc      :=
        substr (vva_enonc
               ,l_bind_start_pos + 1);
    end loop;
  end prepr_enonc;

  procedure anals_enonc_sql (pnu_cursr              in integer
                            ,pva_enonc_sql          in varchar2
                            ,p_auto_bind_items      in boolean default true
                            ,pta_nom_varbl_subst    in apex_application_global.vc_arr2 default c_liste_nom_vide
                            ,pta_valr_varbl_subst   in apex_application_global.vc_arr2 default c_liste_valr_vide --   ,p_parse_as_schema      in varchar2 default wwv_flow_security.g_parse_as_schema
                                                                                                                )
  is
    vva_enonc_sql           varchar2 (32767) := pva_enonc_sql;
    vta_liste_varbl_subst   typ_liste_varbl_subst;
    l_rowid_idx             pls_integer := 0;
  begin
    --    vva_enonc_sql      :=
    --      wwv_flow.trim_sql (p_sql                 => pva_enonc_sql
    --                        ,p_ends_in_semicolon   => false
    --                        ,p_do_substitutions    => true
    --                        ,p_owner               => p_parse_as_schema);
    prepr_enonc (pva_enonc               => vva_enonc_sql
                ,pty_liste_varbl_subst   => vta_liste_varbl_subst);

    --    wwv_dbms_sql.parse_as_user (
    --      pnu_cursr    => pnu_cursr
    --     ,p_query      => wwv_flow_assert.sql_query_start (vva_enonc_sql)
    --     ,p_username   => p_parse_as_schema);

    dbms_sql.parse (pnu_cursr
                   ,vva_enonc_sql
                   ,dbms_sql.native);

    for i in 1 .. pta_nom_varbl_subst.count
    loop
      begin
        dbms_sql.bind_variable (pnu_cursr
                               ,pta_nom_varbl_subst (i)
                               ,pta_valr_varbl_subst (i)
                               ,32767);
      exception
        when others
        then
          --          wwv_flow_error.raise_internal_error (
          --            p_error_code   => 'wwv_dbms_sql.unable_to_bind_err'
          --           ,p0             => pta_nom_varbl_subst (i));
          ete ();
          null;
      end;
    end loop;
  end anals_enonc_sql;

  procedure prepr_reqt (pty_gestn_sql     in out nocopy typ_gestn_sql
                       ,pty_liste_subst   in            typ_liste_subst default c_liste_subst_vide)
  is
    vva_enonc_sql                    varchar2 (32767);
    l_search_where_clause            varchar2 (32767);
    vta_liste_nom                    apex_application_global.vc_arr2;
    vta_liste_valr                   apex_application_global.vc_arr2;
    l_column_count                   number;
    vnu_nombr_ligne_trait_nombr_co   integer;
    vnu_nombr_ligne_trait_liste_co   dbms_sql.desc_tab2;
  begin
    vta_liste_nom    := obten_nom_varbl_subst (pty_liste_subst);
    vta_liste_valr   := obten_valr_varbl_subst (pty_liste_subst);

    anals_enonc_sql (pnu_cursr              => pty_gestn_sql.vnu_cursr
                    ,pva_enonc_sql          => pty_gestn_sql.vva_enonc_sql
                    ,pta_nom_varbl_subst    => vta_liste_nom
                    ,pta_valr_varbl_subst   => vta_liste_valr);

    dbms_sql.describe_columns2 (pty_gestn_sql.vnu_cursr
                               ,vnu_nombr_ligne_trait_nombr_co
                               ,pty_gestn_sql.vta_liste_coln);
  end prepr_reqt;

  --  function get_data_type (p_col_type in number)
  --    return varchar2
  --  is
  --  begin
  --    return case
  --             when p_col_type in (sys.dbms_types.typecode_number, 100, 101)
  --             then
  --               c_data_type_number
  --             when p_col_type = sys.dbms_types.typecode_date
  --             then
  --               c_data_type_date
  --             when p_col_type = 180
  --             then
  --               c_data_type_timestamp
  --             when p_col_type = 181
  --             then
  --               c_data_type_timestamp_tz
  --             when p_col_type = 231
  --             then
  --               c_data_type_timestamp_ltz
  --             when p_col_type = 182
  --             then
  --               c_data_type_interval_y2m
  --             when p_col_type = 183
  --             then
  --               c_data_type_interval_d2s
  --             when p_col_type = sys.dbms_types.typecode_blob
  --             then
  --               c_data_type_blob
  --             when p_col_type = 114
  --             then
  --               c_data_type_bfile
  --             when p_col_type = sys.dbms_types.typecode_clob
  --             then
  --               c_data_type_clob
  --             when p_col_type = 11
  --             then
  --               c_data_type_rowid
  --             else
  --               c_data_type_varchar2
  --           end;
  --  end get_data_type;

  function obten_gestn_sql (pva_enonc_sql        in varchar2
                           ,pta_liste_type_don   in apex_application_global.vc_arr2 default c_liste_type_don_vide
                           ,pty_liste_subst      in typ_liste_subst default c_liste_subst_vide)
    return typ_gestn_sql
  is
    vty_gestn_sql    typ_gestn_sql;
    l_column_count   number;
    l_data_type      varchar2 (20);
  begin
    if ltrim (pva_enonc_sql) is null
    then
      --      raise exc_enonc_sql_exist;
      null;
    end if;

    --    if    p_min_columns > nvl (p_max_columns, p_min_columns)
    --       or p_min_columns > 999
    --    then
    --      --      raise exc_bad_min_max;
    --      null;
    --    end if;

    --    vty_gestn_sql.vva_enonc_sql      :=
    --      wwv_flow_assert.sql_query_start (
    --        wwv_flow.trim_sql (p_sql                 => pva_enonc_sql
    --                          ,p_ends_in_semicolon   => false
    --                          ,p_do_substitutions    => true));

    vty_gestn_sql.vnu_cursr       := dbms_sql.open_cursor;
    vty_gestn_sql.vva_enonc_sql   := pva_enonc_sql;

    --    anals_enonc_sql (
    --      pnu_cursr              => vty_gestn_sql.vnu_cursr
    --     ,pva_enonc_sql          => vty_gestn_sql.vva_enonc_sql
    --     ,pta_nom_varbl_subst    => obten_nom_varbl_subst (pty_liste_subst)
    --     ,pta_valr_varbl_subst   => obten_valr_varbl_subst (pty_liste_subst));
    --
    --    dbms_sql.describe_columns2 (vty_gestn_sql.vnu_cursr
    --                               ,l_column_count
    --                               ,vty_gestn_sql.vta_liste_coln);

    --    if    l_column_count < p_min_columns
    --       or l_column_count > coalesce (p_max_columns, l_column_count)
    --    then
    --      --      raise exc_wrong_column_count;
    --      null;
    --    end if;

    --    if pta_liste_type_don.count > 0
    --    then
    --      for i in 1 .. l_column_count
    --      loop
    --        --        l_data_type      :=
    --        --          obten_don_type (vty_gestn_sql.vta_liste_coln (i).col_type);
    --
    --        if pta_liste_type_don.exists (i)
    --           and l_data_type <> pta_liste_type_don (i)
    --        then
    --          --          wwv_flow_error.raise_internal_error (
    --          --            p_error_code   => 'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
    --          --           ,p0             => p_component_name
    --          --           ,p1             => i
    --          --           ,p2             => l_data_type
    --          --           ,p3             => pta_liste_type_don (i));
    --          --          raise exc_wrong_data_type;
    --          null;
    --        end if;
    --      end loop;
    --    end if;

    return vty_gestn_sql;
  exception
    when others
    then
      ete ();
      fermr_gestn_sql (vty_gestn_sql);
      raise;
  end obten_gestn_sql;

  procedure exect_reqt_sql (pty_gestn_sql         in     typ_gestn_sql
                           ,pty_liste_coln_valr      out typ_liste_coln_valr
                           ,pnu_nombr_ligne          out pls_integer)
  is
    vta_liste_vide                   apex_application_global.vc_arr2;

    vnu_nombr_ligne_trait_varchar2   varchar2 (32767);
    vnu_nombr_ligne_trait            number;
    vnu_index                        binary_integer := 0;
    vty_liste_coln_valr              typ_liste_coln_valr;
  begin
    for i in 1 .. pty_gestn_sql.vta_liste_coln.count
    loop
      vty_liste_coln_valr (i)   := vta_liste_vide;

      dbms_sql.define_column (pty_gestn_sql.vnu_cursr
                             ,i
                             ,vnu_nombr_ligne_trait_varchar2
                             ,32767);
    end loop;

    vnu_nombr_ligne_trait   := dbms_sql.execute (pty_gestn_sql.vnu_cursr);

    while dbms_sql.fetch_rows (pty_gestn_sql.vnu_cursr) > 0
    loop
      vnu_index   := vnu_index + 1;

      for i in 1 .. pty_gestn_sql.vta_liste_coln.count
      loop
        dbms_sql.column_value (pty_gestn_sql.vnu_cursr
                              ,i
                              ,vty_liste_coln_valr (i) (vnu_index));
      end loop;
    end loop;

    pty_liste_coln_valr     := vty_liste_coln_valr;
    pnu_nombr_ligne         := vnu_index;
  end exect_reqt_sql;

  function obten_don (pva_enonc_sql     in varchar2
                     ,pty_liste_subst   in typ_liste_subst default c_liste_subst_vide)
    return typ_coln_valr
  is
    vty_gestn_sql         typ_gestn_sql;
    vty_liste_coln_valr   typ_liste_coln_valr;
    vnu_nombr_ligne       pls_integer;
    vty_coln_valr         typ_coln_valr;
  begin
    vty_gestn_sql                       :=
      obten_gestn_sql (pva_enonc_sql     => pva_enonc_sql
                      ,pty_liste_subst   => pty_liste_subst);

    prepr_reqt (pty_gestn_sql     => vty_gestn_sql
               ,pty_liste_subst   => pty_liste_subst);

    exect_reqt_sql (vty_gestn_sql
                   ,vty_liste_coln_valr
                   ,vnu_nombr_ligne);

    fermr_gestn_sql (vty_gestn_sql);

    vty_coln_valr.vnu_nombr_ligne       := vnu_nombr_ligne;
    vty_coln_valr.vta_liste_coln_valr   := vty_liste_coln_valr;

    return vty_coln_valr;
  exception
    when others
    then
      ete ();
      fermr_gestn_sql (vty_gestn_sql);
      raise;
  end obten_don;
end afw_07_sql_pkg;
/
