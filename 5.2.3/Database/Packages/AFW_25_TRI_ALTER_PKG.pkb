SET DEFINE OFF;
create or replace package body afw_25_tri_alter_pkg
as
  kva_chemn_image_tri_asc    varchar2 (100) := '/i/ws/dup.gif';
  kva_chemn_image_tri_desc   varchar2 (100) := '/i/ws/ddown.gif';

  procedure afich_info_tri_alter
  is
    vnu_rpts_id           number;

    cursor cur_tri_alter
    is
      select s.nom
            ,nvl (upper (t.dirct), 'ASC') dirct
            ,t.ordre
        from (select sort_column_1    nom
                    ,sort_direction_1 dirct
                    ,1                ordre
                from apex_ir_rpts
               where id = vnu_rpts_id
              union all
              select sort_column_2    nom
                    ,sort_direction_2 dirct
                    ,2                ordre
                from apex_ir_rpts
               where id = vnu_rpts_id
              union all
              select sort_column_3    nom
                    ,sort_direction_3 dirct
                    ,3                ordre
                from apex_ir_rpts
               where id = vnu_rpts_id
              union all
              select sort_column_4    nom
                    ,sort_direction_4 dirct
                    ,4                ordre
                from apex_ir_rpts
               where id = vnu_rpts_id
              union all
              select sort_column_5    nom
                    ,sort_direction_5 dirct
                    ,5                ordre
                from apex_ir_rpts
               where id = vnu_rpts_id
              union all
              select sort_column_6    nom
                    ,sort_direction_6 dirct
                    ,6                ordre
                from apex_ir_rpts
               where id = vnu_rpts_id) t
            ,(select cs.column_value nom
                from apex_ir_rpts                                                 r
                    ,table (afw_07_util_pkg.strin_to_table_va (r.report_columns)) cs
               where r.id = vnu_rpts_id) s
       where     t.nom like '%$TRI'
             and s.nom =    substr (t.nom
                                   ,1
                                   ,length (t.nom) - 4)
                         || '$AFF';

    vva_chemn_image_tri   varchar2 (100);
    vnu_nb_coln           number default 0;
  begin
    -- Construire un objet du type: [{coln:'COLONNE$AFF',img:'<img src="/..." />'},{}]
    -- OU
    -- Générer du JS: $('#apexir_COLONNE$AFF').append('<img src="/..." />');
    vnu_rpts_id   := afw_13_raprt_inter_pkg.obten_repts_courn ();

    htp.prn ('[');

    for rec_tri_alter in cur_tri_alter
    loop
      vnu_nb_coln   := vnu_nb_coln + 1;

      if vnu_nb_coln <> 1
      then
        htp.prn (',');
      end if;

      if rec_tri_alter.dirct = 'ASC'
      then
        vva_chemn_image_tri   := kva_chemn_image_tri_asc;
      else
        vva_chemn_image_tri   := kva_chemn_image_tri_desc;
      end if;

      htp.prn (   '{nom:'''
               || rec_tri_alter.nom
               || ''','
               || 'img:''<img align="absmiddle" alt="" src="'
               || vva_chemn_image_tri
               || '" />'','
               || 'ordre:'
               || rec_tri_alter.ordre
               || '}');
    end loop;

    htp.prn (']');
  end afich_info_tri_alter;
end afw_25_tri_alter_pkg;
/
