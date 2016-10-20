SET DEFINE OFF;
create or replace package body afw_10_dba_pkg
as
  procedure index_foreign_key (pva_schem in varchar2)
  is
    vva_sql_comnd          varchar2 (32767);

    cursor cur_fk_non_index
    is
      select *
        from (select decode (b.table_name, null, '****', null) status
                    ,a.table_name
                    ,a.columns                                 columnsa
                    ,b.columns                                 columnsb
                    ,constraint_name
                from (  select substr (a.table_name
                                      ,1
                                      ,30)
                                 table_name
                              ,substr (a.constraint_name
                                      ,1
                                      ,30)
                                 constraint_name
                              ,   max (decode (position
                                              ,1, substr (column_name
                                                         ,1
                                                         ,30)
                                              ,null))
                               || max (decode (position
                                              ,2,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (position
                                              ,3,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (position
                                              ,4,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (position
                                              ,5,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (position
                                              ,6,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (position
                                              ,7,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (position
                                              ,8,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (position
                                              ,9,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (position
                                              ,10,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (position
                                              ,11,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (position
                                              ,12,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (position
                                              ,13,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (position
                                              ,14,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (position
                                              ,15,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (position
                                              ,16,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                                 columns
                          from dba_cons_columns a
                              ,dba_constraints b
                         where     a.constraint_name = b.constraint_name
                               and a.owner = pva_schem
                               and b.constraint_type = 'R'
                      group by substr (a.table_name
                                      ,1
                                      ,30)
                              ,substr (a.constraint_name
                                      ,1
                                      ,30)) a
                    ,(  select substr (table_name
                                      ,1
                                      ,30)
                                 table_name
                              ,substr (index_name
                                      ,1
                                      ,30)
                                 index_name
                              ,   max (decode (column_position
                                              ,1, substr (column_name
                                                         ,1
                                                         ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,2,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,3,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,4,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,5,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,6,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,7,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,8,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,9,    ', '
                                                  || substr (column_name
                                                            ,1
                                                            ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,10,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,11,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,12,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,13,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,14,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,15,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                               || max (decode (column_position
                                              ,16,    ', '
                                                   || substr (column_name
                                                             ,1
                                                             ,30)
                                              ,null))
                                 columns
                          from dba_ind_columns
                      group by substr (table_name
                                      ,1
                                      ,30)
                              ,substr (index_name
                                      ,1
                                      ,30)) b
               where     a.table_name = b.table_name(+)
                     and b.columns(+) like
                              a.columns
                           || '%')
       where status is not null;

    vnu_nombr_index_cree   pls_integer default 0;
  begin
    for i in cur_fk_non_index
    loop
      begin
        begin
          vva_sql_comnd      :=
               'create index '
            || pva_schem
            || '.'
            || i.constraint_name
            || ' on '
            || pva_schem
            || '.'
            || i.table_name
            || '('
            || i.columnsa
            || ')';

          execute immediate vva_sql_comnd;
        exception
          when others
          then
            if sqlcode = -942
            then
              null;
            else
              raise;
            end if;
        end;

        vnu_nombr_index_cree   := vnu_nombr_index_cree + 1;
      exception
        when others
        then
          afw_03_journ_pkg.ecrir_journ (   'create index '
                                        || pva_schem
                                        || '.'
                                        || i.constraint_name
                                        || ' on '
                                        || pva_schem
                                        || '.'
                                        || i.table_name
                                        || '('
                                        || i.columnsa
                                        || ')');
      end;
    end loop;
  --afw_01_err_apex_pkg.ajout_mesg_infor_sesn_mesg (vnu_nombr_index_cree || ' indexes ont été créés');
  end;

  procedure creer_trigr_audit (pva_schem               in varchar2
                              ,pva_nom_table           in varchar2
                              ,pbo_alimt_seqnc         in boolean default true
                              ,pbo_creat_seqnc         in boolean default false
                              ,pbo_audit_colmn         in boolean default true
                              ,pbo_creat_audit_colmn   in boolean default false)
  is
    vva_trg   varchar2 (32767);
  begin
    if pbo_creat_seqnc
    then
      begin
        execute immediate
             'create sequence '
          || pva_schem
          || '.'
          || pva_nom_table
          || '_seq';

        dbms_output.put_line (   'Séquence '
                              || pva_nom_table
                              || '_seq'
                              || ' créée.');
      exception
        when others
        then
          dbms_output.put_line (   'Séquence '
                                || pva_nom_table
                                || '_seq'
                                || ' non créée.('
                                || sqlerrm
                                || ')');
          dbms_output.put_line (   'create sequence '
                                || pva_schem
                                || '.'
                                || pva_nom_table
                                || '_seq');
      end;
    end if;

    vva_trg      :=
         'create or replace trigger '
      || pva_schem
      || '.'
      || pva_nom_table
      || '_biu_01_trg '
      || 'before insert or update on '
      || pva_schem
      || '.'
      || pva_nom_table
      || ' '
      || 'for each row '
      || 'begin ';

    if pbo_alimt_seqnc
    then
      vva_trg      :=
           vva_trg
        || '   if inserting and :new.seqnc is null then '
        || '     select '
        || pva_nom_table
        || '_seq.nextval '
        || '       into :new.seqnc '
        || '       from dual; '
        || '   end if; ';
    end if;

    if pbo_creat_audit_colmn
    then
      begin
        execute immediate
             'alter table '
          || pva_schem
          || '.'
          || pva_nom_table
          || ' add date_creat date';

        dbms_output.put_line (   'Table '
                              || pva_nom_table
                              || ', colonne date_creat créée.');
      exception
        when others
        then
          dbms_output.put_line (   'Table '
                                || pva_nom_table
                                || ', colonne date_creat non créée.('
                                || sqlerrm
                                || ')');
          dbms_output.put_line (   'alter table '
                                || pva_schem
                                || '.'
                                || pva_nom_table
                                || ' add date_creat date');
      end;

      begin
        execute immediate
             'alter table '
          || pva_schem
          || '.'
          || pva_nom_table
          || ' add utils_creat varchar2(30)';

        dbms_output.put_line (   'Table '
                              || pva_nom_table
                              || ', colonne utils_creat créée.');
      exception
        when others
        then
          dbms_output.put_line (   'Table '
                                || pva_nom_table
                                || ', colonne utils_creat non créée.('
                                || sqlerrm
                                || ')');
          dbms_output.put_line (   'alter table '
                                || pva_schem
                                || '.'
                                || pva_nom_table
                                || ' add utils_creat varchar2(30)');
      end;

      begin
        execute immediate
             'alter table '
          || pva_schem
          || '.'
          || pva_nom_table
          || ' add date_modfc date';

        dbms_output.put_line (   'Table '
                              || pva_nom_table
                              || ', colonne date_modfc créée.');
      exception
        when others
        then
          dbms_output.put_line (   'Table '
                                || pva_nom_table
                                || ', colonne date_modfc non créée.('
                                || sqlerrm
                                || ')');
          dbms_output.put_line (   'alter table '
                                || pva_schem
                                || '.'
                                || pva_nom_table
                                || ' add date_modfc date');
      end;

      begin
        execute immediate
             'alter table '
          || pva_schem
          || '.'
          || pva_nom_table
          || ' add utils_modfc varchar2(30)';

        dbms_output.put_line (   'Table '
                              || pva_nom_table
                              || ', colonne utils_modfc créée.');
      exception
        when others
        then
          dbms_output.put_line (   'Table '
                                || pva_nom_table
                                || ', colonne utils_modfc non créée.('
                                || sqlerrm
                                || ')');
          dbms_output.put_line (   'alter table '
                                || pva_schem
                                || '.'
                                || pva_nom_table
                                || ' add utils_modfc varchar2(30)');
      end;
    end if;

    if pbo_audit_colmn
    then
      vva_trg      :=
           vva_trg
        || 'pws_util.genr_valr_audit(inserting,
                                 updating,
                                 :new.utils_creat,
                                 :new.date_creat,
                                 :new.utils_modfc,
                                 :new.date_modfc);';
    end if;

    vva_trg      :=
         vva_trg
      || ' end '
      || pva_nom_table
      || '_biu_01_trg;';

    begin
      execute immediate vva_trg;

      dbms_output.put_line (   'Trigger '
                            || pva_nom_table
                            || '_biu_01_trg créée.');
    exception
      when others
      then
        dbms_output.put_line (   'Trigger '
                              || pva_nom_table
                              || '_biu_01_trg non créée.('
                              || sqlerrm
                              || ')');
        dbms_output.put_line (vva_trg);
    end;
  end creer_trigr_audit;

  procedure creer_vue (pva_schem       in varchar2
                      ,pva_nom_table   in varchar2)
  is
  begin
    execute immediate
         'create or replace view '
      || pva_schem
      || '.vd_'
      || pva_nom_table
      || ' as select * from '
      || pva_nom_table;

    dbms_output.put_line (   'Vue vd_'
                          || pva_nom_table
                          || ' créée.');
  exception
    when others
    then
      dbms_output.put_line (   'Vue vd_'
                            || pva_nom_table
                            || ' non créée.('
                            || sqlerrm
                            || ')');
      dbms_output.put_line (   'create or replace view '
                            || pva_schem
                            || '.vd_'
                            || pva_nom_table
                            || ' as select * from '
                            || pva_nom_table);
  end creer_vue;

  function creer_trg_pile_table (pva_schema        in varchar2
                                ,pva_table         in varchar2
                                ,pva_table_abreg   in varchar2
                                ,pbo_creat_bd      in boolean default true)
    return varchar2
  is
    vva_code        varchar2 (32000);
    vva_code_tous   varchar2 (32000);
  begin
    if     length (pva_table) > 20
       and pva_table_abreg is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000007');
    end if;

    --before statement
    vva_code      :=
         '
create trigger '
      || lower (nvl (pva_table_abreg, pva_table))
      || '_bsiud_trg
  before insert or update or delete
  on '
      || pva_schema
      || '.'
      || pva_table
      || '
declare
begin
  afw_09_pile_pkg.init_pile (''NOM_PILE'');
exception
when others then
  afw_09_pile_pkg.vider_pile ();
  raise;
end '
      || lower (nvl (pva_table_abreg, pva_table))
      || '_bsiud_trg;';

    if pbo_creat_bd
    then
      execute immediate vva_code;
    end if;

    vva_code_tous      :=
         vva_code_tous
      || vva_code
      || chr (13)
      || chr (13);

    --after row
    vva_code      :=
         '
create trigger '
      || lower (nvl (pva_table_abreg, pva_table))
      || '_aiud_trg
  after insert or update or delete
  on '
      || pva_schema
      || '.'
      || pva_table
      || '
  for each row
declare
begin
  afw_09_pile_pkg.empil_rowid (''NOM_PILE'', :new.rowid);
exception
when others then
  afw_09_pile_pkg.vider_pile ();
  raise;
end '
      || lower (nvl (pva_table_abreg, pva_table))
      || '_aiud_trg;';

    if pbo_creat_bd
    then
      execute immediate vva_code;
    end if;

    vva_code_tous      :=
         vva_code_tous
      || vva_code
      || chr (13)
      || chr (13);

    --After statement
    vva_code      :=
         '
create trigger '
      || lower (nvl (pva_table_abreg, pva_table))
      || '_asiud_trg
  after insert or update or delete
  on '
      || pva_schema
      || '.'
      || pva_table
      || '
declare
  vro_rowid       rowid;
begin
  afw_09_pile_pkg.mode_depil (''NOM_PILE'');
  vro_rowid := afw_09_pile_pkg.depil_rowid (''NOM_PILE'');

  while vro_rowid is not null loop
    --traitement ici


    vro_rowid := afw_09_pile_pkg.depil_rowid (''NOM_PILE'');
  end loop;

  afw_09_pile_pkg.termn_utils_pile (''NOM_PILE'');

exception
when others then
  afw_09_pile_pkg.vider_pile ();
  raise;
end '
      || lower (nvl (pva_table_abreg, pva_table))
      || '_asiud_trg;';

    if pbo_creat_bd
    then
      execute immediate vva_code;
    end if;

    vva_code_tous      :=
         vva_code_tous
      || vva_code
      || chr (13)
      || chr (13);

    --afw_01_err_apex_pkg.ajout_mesg_infor_sesn_mesg ('Les déclencheurs ont été créés avec succès');

    return vva_code_tous;
  end creer_trg_pile_table;

  procedure creer_trg_pile_table (pva_schema        in varchar2
                                 ,pva_table         in varchar2
                                 ,pva_table_abreg   in varchar2
                                 ,pbo_creat_bd      in boolean default true)
  is
    vva_code   varchar2 (32000);
  begin
    vva_code      :=
      creer_trg_pile_table (pva_schema
                           ,pva_table
                           ,pva_table_abreg
                           ,pbo_creat_bd);
  end;

  function creer_fk (pva_cle in varchar2)
    return boolean
  is
    vva_nom_table_base     varchar2 (30);
    vva_coln_base          varchar2 (30);
    vva_nom_table_cible    varchar2 (30);
    vva_coln_cible         varchar2 (30) default 'seqnc';
    vva_cle_travl          varchar2 (200) default pva_cle;
    vnu_count_fk           pls_integer;
    vva_nom_schema_cible   varchar2 (30);
    vva_sql_comnd          varchar2 (32767);
  begin
    --on recoit la clé sous cette forme
    --COMPT|REF_COMPT|COMPT_PK
    vva_nom_table_base      :=
      substr (vva_cle_travl
             ,1
             ,  instr (vva_cle_travl
                      ,'|')
              - 1);
    vva_cle_travl      :=
      substr (vva_cle_travl
             ,  instr (vva_cle_travl
                      ,'|')
              + 1);
    vva_coln_base      :=
      substr (vva_cle_travl
             ,1
             ,  instr (vva_cle_travl
                      ,'|')
              - 1);
    vva_cle_travl      :=
      substr (vva_cle_travl
             ,  instr (vva_cle_travl
                      ,'|')
              + 1);

    select table_name
          ,owner
      into vva_nom_table_cible
          ,vva_nom_schema_cible
      from dba_constraints ac
     where     ac.constraint_name = vva_cle_travl
           and owner = 'APEXFRAMEWORK';

    select count (1) + 1
      into vnu_count_fk
      from dba_constraints
     where     table_name = vva_nom_table_base
           and constraint_type = 'R'
           and owner = 'APEXFRAMEWORK'
           and constraint_name not like '%FK99';

    begin
      vva_sql_comnd      :=
           'alter table '
        || vva_nom_table_base
        || ' add constraint '
        || vva_nom_table_base
        || '_fk'
        || vnu_count_fk
        || ' foreign key ('
        || vva_coln_base
        || ')
        references '
        || vva_nom_schema_cible
        || '.'
        || vva_nom_table_cible
        || '('
        || vva_coln_cible
        || ')';

      execute immediate vva_sql_comnd;
    exception
      when others
      then
        if sqlcode = -942
        then
          null;
        else
          raise;
        end if;
    end;

    return true;
  exception
    when others
    then
      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_mesg (sqlerrm);
      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_mesg (   'Erreur : alter table '
                                                      || vva_nom_table_base
                                                      || ' add constraint '
                                                      || vva_nom_table_base
                                                      || '_fk'
                                                      || vnu_count_fk
                                                      || ' foreign key ('
                                                      || vva_coln_base
                                                      || ')
      references '
                                                      || vva_nom_schema_cible
                                                      || '.'
                                                      || vva_nom_table_cible
                                                      || '('
                                                      || vva_coln_cible
                                                      || ')');
      return false;
  end creer_fk;

  function obten_seqnc_max_table (pva_table varchar2)
    return number
  is
    cur_max   sys_refcursor;
    vnu_max   number;
  begin
    open cur_max for
         'select max(seqnc) from '
      || pva_table;

    fetch cur_max
      into vnu_max;

    close cur_max;

    return nvl (vnu_max, 0);
  exception
    when others
    then
      return null;
  end obten_seqnc_max_table;

  procedure corgr_seqnc_trop_petit (pbo_mode_debug boolean default true)
  is
    vnu_nb_seqnc_corg   number default 0;
    vva_drop_scrip      varchar2 (2000);
    vva_creat_scrip     varchar2 (2000);

    cursor cur_seqnc
    is
      select *
        from (select seq.sequence_name
                    ,seq.last_number
                    ,trg.table_name
                    ,obten_seqnc_max_table (trg.table_name) seqnc_max
                    ,seq.max_value
                    ,seq.min_value
                    ,cycle_flag
                    ,cache_size
                    ,order_flag
                from user_source    src
                    ,user_sequences seq
                    ,user_triggers  trg
               where     src.type = 'TRIGGER'
                     and upper (src.text) like
                              '% '
                           || seq.sequence_name
                           || '.NEXTVAL%'
                     and trg.trigger_name = src.name)
       where     seqnc_max >= last_number
             and seqnc_max is not null;
  begin
    for rec_seqnc in cur_seqnc
    loop
      vnu_nb_seqnc_corg   := vnu_nb_seqnc_corg + 1;
      vva_drop_scrip      :=
           'drop sequence '
        || rec_seqnc.sequence_name;

      vva_creat_scrip      :=
           'create sequence '
        || rec_seqnc.sequence_name
        || ' start with '
        || (rec_seqnc.seqnc_max + 1)
        || case
             when rec_seqnc.max_value is not null
             then
                  ' maxvalue '
               || rec_seqnc.max_value
             else
               ' nomaxvalue'
           end
        || case
             when rec_seqnc.min_value is not null
             then
                  ' minvalue '
               || rec_seqnc.min_value
             else
               ' nominvalue'
           end
        || case rec_seqnc.cycle_flag when 'Y' then ' cycle' else ' nocycle' end
        || case
             when nvl (rec_seqnc.cache_size, 0) > 0
             then
                  ' cache '
               || rec_seqnc.cache_size
             else
               ' nocache'
           end
        || case rec_seqnc.order_flag when 'Y' then ' order' else ' noorder' end;

      if pbo_mode_debug = false
      then
        dbms_output.put_line (   '#'
                              || vnu_nb_seqnc_corg);
        dbms_output.put_line (   'Correction de la séquence: '
                              || rec_seqnc.sequence_name);
        dbms_output.put_line (   'Valeur: '
                              || rec_seqnc.last_number
                              || ' -> '
                              || (rec_seqnc.seqnc_max + 1));

        -- Détruire la séquence
        execute immediate vva_drop_scrip;

        -- La recréer avec la bonne valeur
        execute immediate vva_creat_scrip;
      else
        dbms_output.put_line (   '#'
                              || vnu_nb_seqnc_corg);
        dbms_output.put_line (   'Séquence: '
                              || rec_seqnc.sequence_name);
        dbms_output.put_line (   'Valr. seq: '
                              || rec_seqnc.last_number);
        dbms_output.put_line (   'Table: '
                              || rec_seqnc.table_name);
        dbms_output.put_line (   'Seqnc table: '
                              || rec_seqnc.seqnc_max);
        dbms_output.put_line (   'Script drop: '
                              || vva_drop_scrip);
        dbms_output.put_line (   'Script création: '
                              || vva_creat_scrip);
      end if;

      dbms_output.put_line (' ');
    end loop;

    if pbo_mode_debug
    then
      dbms_output.put_line (   'Nombre de séquences à corriger: '
                            || vnu_nb_seqnc_corg);
      dbms_output.put_line (' ');
      dbms_output.put_line ('*** MODE DEBUG ***');
      dbms_output.put_line ('*** AUCUNE ACTION EFFECTUÉE ***');
    else
      dbms_output.put_line (   'Nombre de séquences corrigées: '
                            || vnu_nb_seqnc_corg);
    end if;
  end corgr_seqnc_trop_petit;

  function audit_touts_table (pva_utils       in varchar2 default null
                             ,pda_date_minm   in date default null
                             ,pda_date_maxm   in date default null)
    return typ_arr_audit
    pipelined
  is
    cursor cur_table
    is
        select table_name
          from user_tables
      order by 1;

    cur_enreg   sys_refcursor;
    rec_enreg   typ_audit;
  begin
    -- Looper les tables
    for rec_table in cur_table
    loop
      begin
        begin
          open cur_enreg for
               'select :1 nom_table, seqnc, date_creat, utils_creat, date_modfc, utils_modfc'
            || ' from '
            || rec_table.table_name
            || ' where (   (:2 is null or utils_creat = :2)'
            || '       and (:3 is null or date_creat >= :3)'
            || '       and (:4 is null or date_creat <= :4) )'
            || '    or (   (:2 is null or utils_modfc = :2)'
            || '       and (:3 is null or date_modfc >= :3)'
            || '       and (:4 is null or date_modfc <= :4) )'
            using rec_table.table_name
                 ,pva_utils
                 ,pva_utils
                 ,pda_date_minm
                 ,pda_date_minm
                 ,pda_date_maxm
                 ,pda_date_maxm
                 ,pva_utils
                 ,pva_utils
                 ,pda_date_minm
                 ,pda_date_minm
                 ,pda_date_maxm
                 ,pda_date_maxm;
        exception
          when others
          then
            open cur_enreg for
                 'select :1 nom_table, seqnc, date_creat, utils_creat, null date_modfc, null utils_modfc'
              || ' from '
              || rec_table.table_name
              || ' where (   (:2 is null or utils_creat = :2)'
              || '       and (:3 is null or date_creat >= :3)'
              || '       and (:4 is null or date_creat <= :4) )'
              using rec_table.table_name
                   ,pva_utils
                   ,pva_utils
                   ,pda_date_minm
                   ,pda_date_minm
                   ,pda_date_maxm
                   ,pda_date_maxm;
        end;

        fetch cur_enreg
          into rec_enreg;

        while cur_enreg%found
        loop
          pipe row (rec_enreg);

          fetch cur_enreg
            into rec_enreg;
        end loop;

        close cur_enreg;
      exception
        when others
        then
          null;
      end;
    end loop;

    return;
  end;
end afw_10_dba_pkg;
/
