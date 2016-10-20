SET DEFINE OFF;
create or replace package body afw_25_plpdf_expor_ir_pkg
as
  knu_marge_gauch    constant number default 0.5;
  knu_marge_droit    constant number default 0.5;
  kva_apex_expr      constant varchar2 (30) default '#APXWS_EXPR#';
  kva_apex_expr2     constant varchar2 (30) default '#APXWS_EXPR2#';
  kva_apex_hl_id     constant varchar2 (30) default '#APXWS_HL_ID#';
  kva_apex_cc_expr   constant varchar2 (30) default '#APXWS_CC_EXPR#';
  kva_varbl_cc       constant varchar2 (30) default 'APXWS_CC%';

  type typ_rec_page is record
  (
    nu_largr        number default 0
   ,nu_dernr_coln   binary_integer default 0
  );

  type typ_arr_page is table of typ_rec_page
    index by binary_integer;

  type typ_rec_surlg is record
  (
    vva_indic_afich         varchar2 (1) default 'N'
   ,vva_type_surlg          varchar2 (23)
   ,vva_coulr_polc_ligne    apex_ir_condt.row_font_color%type
   ,vva_coulr_backg_ligne   apex_ir_condt.row_bg_color%type
   ,vva_coulr_polc_cel      apex_ir_condt.column_font_color%type
   ,vva_coulr_backg_cel     apex_ir_condt.column_bg_color%type
   ,vva_condt_surlg         apex_ir_condt.condition_sql%type
   ,vva_nom_coln            apex_ir_condt.column_name%type
   ,vva_opert               apex_ir_condt.operator%type
   ,vva_expr                apex_ir_condt.expr%type
   ,vva_expr2               apex_ir_condt.expr2%type
   ,vnu_seqnc               apex_ir_condt.highlight_sequence%type
   ,vnu_max_seqnc           apex_ir_condt.highlight_sequence%type
   ,vva_expr_type           apex_ir_condt.expr_type%type
  );

  type typ_tab_surlg is table of typ_rec_surlg
    index by pls_integer;

  type typ_rec_coln_surlg is record
  (
    vva_type_surlg    varchar2 (30) default 'LIGNE'
   ,vre_coulr_backg   plpdf_type.t_color
   ,vre_coulr_polc    plpdf_type.t_color
  );

  type typ_tab_coln_surlg is table of typ_rec_coln_surlg
    index by varchar2 (30);

  type typ_rec_ligne_surlg is record
  (
    vre_coulr_backg   plpdf_type.t_color
   ,vre_coulr_polc    plpdf_type.t_color
   ,vta_coln_surlg    typ_tab_coln_surlg
  );

  type typ_rec_group_entet is record
  (
    vva_group              apex_ir_rpts.break_on%type
   ,vva_group_sur          apex_ir_rpts.break_enabled_on%type
   ,vva_coln_somme         apex_ir_rpts.sum_columns_on_break%type
   ,vva_coln_moyen         apex_ir_rpts.avg_columns_on_break%type
   ,vva_coln_max           apex_ir_rpts.max_columns_on_break%type
   ,vva_coln_min           apex_ir_rpts.min_columns_on_break%type
   ,vva_coln_medn          apex_ir_rpts.median_columns_on_break%type
   ,vva_coln_mode          apex_ir_rpts.mode_columns_on_break%type
   ,vva_coln_compt         apex_ir_rpts.count_columns_on_break%type
   ,vva_coln_compt_distn   apex_ir_rpts.count_distnt_col_on_break%type
  );

  type typ_tab_compt_distn is table of pls_integer
    index by varchar2 (4000);

  type typ_tab_medn is table of number;

  type typ_rec_parmt_group_coln is record
  (
    vva_indic_afich         varchar2 (1)
   ,vva_nom_coln            varchar2 (30)
   ,vnu_numr_group          pls_integer
   ,vva_indic_somme         varchar2 (1)
   ,vnu_somme               number
   ,vva_indic_moyen         varchar2 (1)
   ,vnu_moyen               number
   ,vva_indic_max           varchar2 (1)
   ,vnu_max                 number
   ,vva_indic_min           varchar2 (1)
   ,vnu_min                 number
   ,vva_indic_medn          varchar2 (1)
   ,vnu_medn                number
   ,vta_tabl_medn           typ_tab_medn
   ,vva_indic_mode          varchar2 (1)
   , --Prévoir donnée (probablement un type) pour gérer le mode
    vva_indic_compt         varchar2 (1)
   ,vnu_compt               number
   ,vva_indic_compt_distn   varchar2 (1)
   ,vnu_compt_distn         number
   ,vta_tabl_compt          typ_tab_compt_distn
  );

  type typ_tab_parmt_group_coln is table of typ_rec_parmt_group_coln
    index by pls_integer;

  type typ_rec_parmt_group is record
  (
    vva_nom_coln_1    varchar2 (30)
   ,vva_nom_coln_2    varchar2 (30)
   ,vva_nom_coln_3    varchar2 (30)
   ,vva_nom_coln_4    varchar2 (30)
   ,vva_nom_coln_5    varchar2 (30)
   ,vva_nom_coln_6    varchar2 (30)
   ,vva_valr_coln_1   varchar2 (4000)
   ,vva_valr_coln_2   varchar2 (4000)
   ,vva_valr_coln_3   varchar2 (4000)
   ,vva_valr_coln_4   varchar2 (4000)
   ,vva_valr_coln_5   varchar2 (4000)
   ,vva_valr_coln_6   varchar2 (4000)
   ,vva_libl_coln_1   varchar2 (4000)
   ,vva_libl_coln_2   varchar2 (4000)
   ,vva_libl_coln_3   varchar2 (4000)
   ,vva_libl_coln_4   varchar2 (4000)
   ,vva_libl_coln_5   varchar2 (4000)
   ,vva_libl_coln_6   varchar2 (4000)
  );

  type typ_rec_parmt_group_plugn is record
  (
    vva_ligne_1            varchar2 (4000)
   ,vva_ligne_2            varchar2 (4000)
   ,vva_ligne_3            varchar2 (4000)
   ,vva_trans_libl         varchar2 (4000)
   ,vva_indic_ventl        varchar2 (1)
   ,vnu_nombr_coln_ventl   number default 1
  );

  type typ_rec_coln_plugn is record
  (
    vva_valr          varchar2 (4000)
   ,vnu_colsp         number
   ,vnu_rowsp         number
   ,vva_indic_ventl   varchar2 (1)
  );

  type typ_tab_coln_plugn is table of typ_rec_coln_plugn
    index by pls_integer;

  type typ_tab_trans_libl is table of varchar2 (4000)
    index by varchar2 (100);

  gar_tail_papr               afw_07_sql_pkg.typ_arr_ndx_vc30;
  --Gestion du highlight
  gre_ligne_a_surlg           typ_rec_ligne_surlg;
  gnu_max_seqnc               number;
  gre_style_ligne             afw_25_formt_ir_pkg.typ_formt;
  --Gestion des groupes
  gre_group                   typ_rec_parmt_group;
  --Gestion des fonctions
  gta_fonct_coln              typ_tab_parmt_group_coln;
  --Gestion des groupements d'entêtes (plugin)
  gre_parmt_group_plugn       typ_rec_parmt_group_plugn;
  gta_trans_libl              typ_tab_trans_libl;

  gva_valr_nul                varchar2 (4000);
  gbo_presn_group             boolean default false;

  function formt_chain_br (pva_elemn in varchar2)
    return varchar2
  is
    vva_elemn   varchar2 (4000);
  begin
    vva_elemn      :=
      afw_07_sql_pkg.rempl_br (pva_elemn
                              ,   chr (10)
                               || chr (13));
    return replace (vva_elemn
                   ,'&nbsp;'
                   ,' ');
  end formt_chain_br;

  function formt_nom_fichr (pva_nom in varchar2)
    return varchar2
  is
    vva_nom   varchar2 (1000) default lower (pva_nom);
  begin
    vva_nom      :=
      afw_07_sql_pkg.rempl_br (vva_nom
                              ,'_');

    vva_nom      :=
      replace (vva_nom
              ,   chr (10)
               || chr (13)
              ,'_');
    vva_nom      :=
      replace (vva_nom
              ,chr (10)
              ,'_');
    vva_nom      :=
      substr (translate (vva_nom
                        ,'çàâéèêöùû /\?'
                        ,'caaeeeouu____')
             ,1
             ,120);

    while instr (vva_nom
                ,'__') > 0
    loop
      vva_nom      :=
        replace (vva_nom
                ,'__'
                ,'_');
    end loop;

    vva_nom      :=
      replace (vva_nom
              ,'_.'
              ,'.');

    return vva_nom;
  end;

  function formt_date (pda_date in date default sysdate)
    return varchar2
  is
  begin
    return    'Le '
           || trim (to_char (pda_date
                            ,'day'))
           || ' '
           || extract (day from pda_date)
           || ' '
           || trim (to_char (pda_date
                            ,'month'))
           || ' '
           || extract (year from pda_date);
  end;

  function convr_parmt_align (pva_parmt   in varchar2
                             ,pva_deft    in varchar2)
    return varchar2
  is
  begin
    return case upper (pva_parmt) when 'LEFT' then 'L' when 'RIGHT' then 'R' when 'CENTER' then 'C' else pva_deft end;
  end;

  function convr_parmt_faml (pva_parmt in varchar2)
    return varchar2
  is
  begin
    return case lower (pva_parmt) when 'times' then 'Times new roman' when 'courier' then 'Courier' else 'Arial' -- Défaut
                                                                                                                end;
  end;

  function convr_parmt_poids (pva_parmt   in varchar2
                             ,pva_deft    in varchar2)
    return varchar2
  is
  begin
    return case lower (pva_parmt) when 'bold' then 'B' when 'normal' then null else pva_deft end;
  end;

  procedure init_hautr_cel (pva_faml_polc in varchar2 default 'Arial')
  is
  begin
    --En points
    case pva_faml_polc
      when 'Arial'
      then
        gta_hautr_cel ('Arial').vta_hautr_minml ('5')      := 10;
        gta_hautr_cel ('Arial').vta_hautr_minml ('5.5')    := 10;
        gta_hautr_cel ('Arial').vta_hautr_minml ('6')      := 10;
        gta_hautr_cel ('Arial').vta_hautr_minml ('6.5')    := 11.5;
        gta_hautr_cel ('Arial').vta_hautr_minml ('7')      := 11.5;
        gta_hautr_cel ('Arial').vta_hautr_minml ('7.5')    := 12.8;
        gta_hautr_cel ('Arial').vta_hautr_minml ('8')      := 12.8;
        gta_hautr_cel ('Arial').vta_hautr_minml ('8.5')    := 12.8;
        gta_hautr_cel ('Arial').vta_hautr_minml ('9')      := 14.2;
        gta_hautr_cel ('Arial').vta_hautr_minml ('9.5')    := 14.2;
        gta_hautr_cel ('Arial').vta_hautr_minml ('10')     := 15.6;
        gta_hautr_cel ('Arial').vta_hautr_minml ('10.5')   := 15.6;
        gta_hautr_cel ('Arial').vta_hautr_minml ('11')     := 15.6;
        gta_hautr_cel ('Arial').vta_hautr_minml ('11.5')   := 17.05;
        gta_hautr_cel ('Arial').vta_hautr_minml ('12')     := 18.5;
        gta_hautr_cel ('Arial').vta_hautr_minml ('12.5')   := 18.5;
        gta_hautr_cel ('Arial').vta_hautr_minml ('13')     := 18.5;
        gta_hautr_cel ('Arial').vta_hautr_minml ('13.5')   := 18.5;
        gta_hautr_cel ('Arial').vta_hautr_minml ('14')     := 19.9;
      else
        null;
    end case;
  end init_hautr_cel;

  function obten_hautr_cel (pva_faml_polc   in varchar2 default 'Arial'
                           ,pnu_tail_polc   in number default 8)
    return number
  is
    vva_tail_polc   varchar2 (4000)
                      default replace (pnu_tail_polc
                                      ,','
                                      ,'.');
  begin
    --if gta_hautr_cel.exists (/*case pva_faml_polc when 'Helvetica' then 'Arial' else */pva_faml_polc /*end*/) then
    if gta_hautr_cel ('Arial').vta_hautr_minml.exists (vva_tail_polc)
    then
      return gta_hautr_cel ('Arial').vta_hautr_minml (vva_tail_polc);
    end if;

    --end if;

    return 19.9;
  end obten_hautr_cel;

  function obten_parmt_impre_raprt (pnu_ref_ir in number)
    return typ_rec_parmt_impre
  is
    vpi_deft         typ_rec_parmt_impre;
    gpi_parmt_impr   typ_rec_parmt_impre;
  begin
    begin
      select 'O'
            ,reg.prn_content_disposition
            ,reg.prn_paper_size
            ,reg.prn_orientation
            ,reg.prn_units
            ,reg.prn_width
            ,reg.prn_height
            ,reg.prn_border_width
            ,reg.prn_border_color
            ,reg.prn_page_header_font_family
            ,reg.prn_page_header_font_weight
            ,reg.prn_page_header_font_size
            ,reg.prn_page_header_font_color
            ,reg.prn_page_header_alignment
            ,reg.prn_page_header
            ,reg.prn_header_font_family
            ,reg.prn_header_font_weight
            ,reg.prn_header_font_size
            ,reg.prn_header_font_color
            ,reg.prn_header_bg_color
            ,reg.prn_body_font_family
            ,reg.prn_body_font_weight
            ,reg.prn_body_font_size
            ,reg.prn_body_font_color
            ,reg.prn_body_bg_color
            ,reg.prn_page_footer_font_family
            ,reg.prn_page_footer_font_weight
            ,reg.prn_page_footer_font_size
            ,reg.prn_page_footer_font_color
            ,reg.prn_page_footer_alignment
            ,reg.prn_page_footer
        into gpi_parmt_impr
        from vd_afw_13_page_ir pir
            ,apex_ir           air
            ,apex_regn         reg
       where     pir.seqnc = pnu_ref_ir
             and air.id = pir.id_apex
             and reg.id = air.region_id;
    exception
      when no_data_found
      then
        gpi_parmt_impr.va_indic_trouv   := 'N';
    end;

    return gpi_parmt_impr;
  end;

  function detrm_type_surlg (pva_coulr_polc_ligne     apex_ir_condt.row_font_color%type
                            ,pva_coulr_backg_ligne    apex_ir_condt.row_bg_color%type)
    return varchar2
  is
    vva_type_surlg   varchar2 (23);
  begin
    if    pva_coulr_polc_ligne is not null
       or pva_coulr_backg_ligne is not null
    then
      vva_type_surlg   := 'LIGNE';
    else
      vva_type_surlg   := 'CEL';
    end if;

    return vva_type_surlg;
  end detrm_type_surlg;

  function obten_parmt_surlg_raprt (pnu_rpts_id in number)
    return typ_tab_surlg
  is
    vta_parmt_surlg   typ_tab_surlg;
    vre_parmt_surlg   typ_rec_surlg;
    vnu_compt         pls_integer default 1;

    cursor cur_surlg
    is
        select 'O'              indic_afich
              ,detrm_type_surlg (airc.row_font_color
                                ,airc.row_bg_color)
                 type_surlg
              ,row_font_color   coulr_polc_ligne
              ,row_bg_color     coulr_backg_ligne
              ,column_font_color coulr_polc_cel
              ,column_bg_color  coulr_backg_cel
              ,condition_sql    condt_surlg
              ,column_name      nom_coln
              ,expr             expr
              ,expr2            expr2
              ,operator         opert
              ,highlight_sequence seqnc
              ,expr_type        expr_type
          from apex_ir_rpts airr
              ,apex_ir_condt airc
         where     airr.id = pnu_rpts_id
               and airr.id = airc.report_id
               and airc.condition_type = 'HIGHLIGHT'
               and airc.enabled = 'Y'
      order by airc.highlight_sequence;
  begin
    for rec_surlg in cur_surlg
    loop
      vre_parmt_surlg.vva_indic_afich         := rec_surlg.indic_afich;
      vre_parmt_surlg.vva_type_surlg          := rec_surlg.type_surlg;
      vre_parmt_surlg.vva_coulr_polc_ligne    := rec_surlg.coulr_polc_ligne;
      vre_parmt_surlg.vva_coulr_backg_ligne   := rec_surlg.coulr_backg_ligne;
      vre_parmt_surlg.vva_coulr_polc_cel      := rec_surlg.coulr_polc_cel;
      vre_parmt_surlg.vva_coulr_backg_cel     := rec_surlg.coulr_backg_cel;
      vre_parmt_surlg.vva_condt_surlg         := rec_surlg.condt_surlg;
      vre_parmt_surlg.vva_nom_coln            := rec_surlg.nom_coln;
      vre_parmt_surlg.vva_expr                := rec_surlg.expr;
      vre_parmt_surlg.vva_expr2               := rec_surlg.expr2;
      vre_parmt_surlg.vva_opert               := rec_surlg.opert;
      vre_parmt_surlg.vnu_seqnc               := rec_surlg.seqnc;
      vre_parmt_surlg.vva_expr_type           := rec_surlg.expr_type;

      vta_parmt_surlg (vnu_compt)             := vre_parmt_surlg;
      vnu_compt                               := vnu_compt + 1;
    end loop;

    return vta_parmt_surlg;
  end obten_parmt_surlg_raprt;

  function obten_parmt_group_raprt (pnu_rpts_id in number)
    return typ_rec_group_entet
  is
    vre_parmt_group   typ_rec_group_entet;
  begin
    select break_on
          ,break_enabled_on
          ,sum_columns_on_break
          ,avg_columns_on_break
          ,max_columns_on_break
          ,min_columns_on_break
          ,median_columns_on_break
          ,mode_columns_on_break
          ,count_columns_on_break
          ,count_distnt_col_on_break
      into vre_parmt_group
      from apex_ir_rpts airr
     where airr.id = pnu_rpts_id;

    return vre_parmt_group;
  end obten_parmt_group_raprt;

  function obten_parmt_group_plugn (pnu_reprt_id in number)
    return typ_rec_parmt_group_plugn
  is
    vre_parmt_group_plugn   typ_rec_parmt_group_plugn;
  begin
    select apex_application.do_substitutions (attribute_01)
          ,apex_application.do_substitutions (attribute_02)
          ,apex_application.do_substitutions (attribute_03)
          ,apex_application.do_substitutions (attribute_04)
          ,attribute_05
          ,attribute_10
      into vre_parmt_group_plugn
      from apex_actio_dynmq_actio
     where     affected_elements_type = 'REGION'
           and affected_region_id = pnu_reprt_id
           and action = 'PLUGIN_IO_AFW_21_GROUP_ENTET_RAPRT'
           and rownum <= 1;

    return vre_parmt_group_plugn;
  exception
    when no_data_found
    then
      return null;
  end obten_parmt_group_plugn;

  procedure defnr_coulr_pdf (pva_nom_procd in varchar2)
  is
    vva_progr_a_lancr   varchar2 (4000)
                          default    'begin '
                                  || '  afw_25_plpdf_expor_ir_pkg.gre_coulr_pdf := %PROCD_PERSN%; '
                                  || '  exception when others then 
                        ete();'
                                  || 'end;';
    vre_coulr_deft      typ_rec_coulr_pdf;
  begin
    vva_progr_a_lancr      :=
      replace (vva_progr_a_lancr
              ,'%PROCD_PERSN%'
              ,pva_nom_procd);

    execute immediate vva_progr_a_lancr;
  exception
    when others
    then
      gre_coulr_pdf.vva_coulr_polc_entet    := '#FFFFFF';
      gre_coulr_pdf.vva_coulr_backg_entet   := '#E0E0E0';
  end defnr_coulr_pdf;

  function obten_coulr_a_partr_hex (pva_valr_hex in varchar2)
    return plpdf_type.t_color
  is
    vre_coulr        plpdf_type.t_color;
    vre_coulr_deft   plpdf_type.t_color;

    function obten_rgb_de_hex (pva_part_hex in varchar2)
      return number
    is
    begin
      return plpdf_util.to_dec (pva_part_hex);
    end obten_rgb_de_hex;
  begin
    --Vérifier si la longueur du hex est bien de 7 (# + 6 * {0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F})
    if     length (pva_valr_hex) = 7
       and pva_valr_hex is not null
    then
      vre_coulr.r      :=
        obten_rgb_de_hex (substr (pva_valr_hex
                                 ,2
                                 ,2));
      vre_coulr.g      :=
        obten_rgb_de_hex (substr (pva_valr_hex
                                 ,4
                                 ,2));
      vre_coulr.b      :=
        obten_rgb_de_hex (substr (pva_valr_hex
                                 ,6
                                 ,2));

      return vre_coulr;
    end if;

    vre_coulr_deft.r   := 255;
    vre_coulr_deft.g   := 255;
    vre_coulr_deft.b   := 255;

    return vre_coulr_deft;
  end obten_coulr_a_partr_hex;

  procedure init_surlg_ligne
  is
  begin
    gnu_max_seqnc                       := 0;
    gre_ligne_a_surlg.vre_coulr_polc    := null;
    gre_ligne_a_surlg.vre_coulr_backg   := null;
  end init_surlg_ligne;

  procedure init_surlg_coln (pva_nom_coln in varchar2)
  is
  begin
    gre_ligne_a_surlg.vta_coln_surlg (pva_nom_coln).vva_type_surlg    := null;
    gre_ligne_a_surlg.vta_coln_surlg (pva_nom_coln).vre_coulr_polc    := null;
    gre_ligne_a_surlg.vta_coln_surlg (pva_nom_coln).vre_coulr_backg   := null;
  end init_surlg_coln;

  procedure gerer_surlg (pta_parmt_surlg    in     typ_tab_surlg
                        ,pva_valr_a_compr   in out varchar2
                        ,pva_nom_coln       in     varchar2
                        ,pva_type_coln      in     varchar2
                        ,pva_formt_coln     in     varchar2)
  is
    vva_condt_sql     apex_ir_condt.condition_sql%type;
    vbo_presn_expr    boolean;
    vbo_presn_expr2   boolean;
    vva_valr_retr     varchar2 (1);
    vre_coulr_polc    plpdf_type.t_color;
    vre_coulr_fond    plpdf_type.t_color;
  begin
    if pta_parmt_surlg.exists (1)
    then
      for i in pta_parmt_surlg.first () .. pta_parmt_surlg.last ()
      loop
        --Valider si le nom de la colonne est présente dans la condition ou verifier si c'est un champ calculé
        if    instr (pta_parmt_surlg (i).vva_condt_surlg
                    ,   '"'
                     || pva_nom_coln
                     || '"') > 0
           or (    pva_nom_coln like kva_varbl_cc
               and instr (pta_parmt_surlg (i).vva_condt_surlg
                         ,kva_apex_cc_expr) > 0)
        then
          vva_condt_sql      :=
            replace (pta_parmt_surlg (i).vva_condt_surlg
                    ,   '"'
                     || pta_parmt_surlg (i).vva_nom_coln
                     || '"'
                    ,kva_apex_cc_expr);

          --Dans un cas où la valeur a comparer est égale à la valeur nullable du IR, ikl faut la remplacer par null
          if pva_valr_a_compr = formt_chain_br (gva_valr_nul)
          then
            vva_condt_sql      :=
              replace (vva_condt_sql
                      ,kva_apex_cc_expr
                      ,'null');
          else
            --Remplace le nom de colonne et expr
            case pva_type_coln
              when 'VARCH'
              then
                vva_condt_sql      :=
                  replace (vva_condt_sql
                          ,kva_apex_cc_expr
                          ,   ''''
                           || replace (pva_valr_a_compr
                                      ,''''
                                      ,'''''')
                           || '''');
              when 'NUMBR'
              then
                vva_condt_sql      :=
                  replace (vva_condt_sql
                          ,kva_apex_cc_expr
                          ,replace (to_number (pva_valr_a_compr
                                              ,pva_formt_coln)
                                   ,','
                                   ,'.'));
              when 'DATE'
              then
                vva_condt_sql      :=
                  replace (vva_condt_sql
                          ,kva_apex_cc_expr
                          ,to_date (pva_valr_a_compr
                                   ,pva_formt_coln));
              when 'TIMST'
              then
                vva_condt_sql      :=
                  replace (vva_condt_sql
                          ,kva_apex_cc_expr
                          ,to_timestamp (pva_valr_a_compr
                                        ,pva_formt_coln));
              else
                vva_condt_sql      :=
                  replace (vva_condt_sql
                          ,kva_apex_cc_expr
                          ,   ''''
                           || replace (pva_valr_a_compr
                                      ,''''
                                      ,'''''')
                           || '''');
            end case;
          end if;

          vva_condt_sql      :=
            replace (vva_condt_sql
                    ,kva_apex_hl_id
                    ,'''O''');

          if instr (vva_condt_sql
                   ,kva_apex_expr) > 0
          then
            vbo_presn_expr   := true;
            vva_condt_sql      :=
              replace (vva_condt_sql
                      ,kva_apex_expr
                      ,':valr_expr');
          else
            vbo_presn_expr   := false;
          end if;

          if instr (vva_condt_sql
                   ,kva_apex_expr2) > 0
          then
            vbo_presn_expr2   := true;
            vva_condt_sql      :=
              replace (vva_condt_sql
                      ,kva_apex_expr2
                      ,':valr_expr2');
          else
            vbo_presn_expr2   := false;
          end if;

          --Valider si la condition pour le surlignage est respectée
          --Afficher ensuite la couleur selon le type
          if vbo_presn_expr2
          then
            execute immediate
                 'select '
              || vva_condt_sql
              || ' from dual'
              into vva_valr_retr
              using pta_parmt_surlg (i).vva_expr
                   ,pta_parmt_surlg (i).vva_expr2;
          elsif vbo_presn_expr
          then
            execute immediate
                 'select '
              || vva_condt_sql
              || ' from dual'
              into vva_valr_retr
              using pta_parmt_surlg (i).vva_expr;
          else
            execute immediate
                 'select '
              || vva_condt_sql
              || ' from dual'
              into vva_valr_retr;
          end if;

          --Il faut ajouter les paramètres de highlight à la colonne courante
          if vva_valr_retr is not null
          then
            if     pta_parmt_surlg (i).vva_type_surlg = 'LIGNE'
               and pta_parmt_surlg (i).vnu_seqnc >= gnu_max_seqnc
            then
              gnu_max_seqnc                       := pta_parmt_surlg (i).vnu_seqnc;
              gre_ligne_a_surlg.vre_coulr_backg   := obten_coulr_a_partr_hex (pta_parmt_surlg (i).vva_coulr_backg_ligne);
              gre_ligne_a_surlg.vre_coulr_polc    := obten_coulr_a_partr_hex (pta_parmt_surlg (i).vva_coulr_polc_ligne);
            end if;

            if pta_parmt_surlg (i).vva_type_surlg <> 'LIGNE'
            then
              gre_ligne_a_surlg.vta_coln_surlg (pva_nom_coln).vva_type_surlg   := 'COL';
              gre_ligne_a_surlg.vta_coln_surlg (pva_nom_coln).vre_coulr_backg      :=
                obten_coulr_a_partr_hex (nvl (pta_parmt_surlg (i).vva_coulr_backg_cel, pta_parmt_surlg (i).vva_coulr_backg_ligne));
              gre_ligne_a_surlg.vta_coln_surlg (pva_nom_coln).vre_coulr_polc      :=
                obten_coulr_a_partr_hex (nvl (pta_parmt_surlg (i).vva_coulr_polc_cel, pta_parmt_surlg (i).vva_coulr_polc_ligne));
            end if;
          end if;
        end if;
      end loop;
    end if;
  end gerer_surlg;

  procedure afich_pdf (pnu_aplic   in number default afw_07_util_pkg.v ('APP_ID')
                      ,pnu_page    in number default afw_07_util_pkg.v ('APP_PAGE_ID'))
  is
    vta_parmt_surlg              typ_tab_surlg;
    vre_parmt_group              typ_rec_group_entet;
    vre_parmt_group_plugn        typ_rec_parmt_group_plugn;
    vnu_ref_ir                   number;
    vva_nom_raprt                varchar2 (4000);
    vva_mesg_aucun_don           varchar2 (32767);
    vnu_largr_deft               number;
    vnu_id_plugn                 number;
    vva_procd_coulr              varchar2 (200);
    vva_procd_entet              varchar2 (200);
    vva_procd_pied_page          varchar2 (200);
    vbo_presn_fonct              boolean default false;
    vva_indic_forcr_ajust_page   varchar2 (1);
    --vnu_unite_mesr_largr_deft number(10);

    vva_selct                    varchar2 (32767);
    vnu_cursr                    number;
    var_infor_coln               afw_07_sql_pkg.typ_arr_infor_coln;
    vnu_largr_dispo              number;
    var_pages                    typ_arr_page;
    vnu_index_page               binary_integer;
    vnu_somme_largr              number;
    vnu_dernr_coln_ajout         number;
    vnu_rpts_id                  number;
    vnu_hautr_ligne              number;
    --variable pour afficher fonctions
    vnu_tail_group               pls_integer default 0;
    -- variables plpdf
    vnu_elmnt_lign               number := 0;
    vnu_elmnt_tabl               number := 0;
    vnu_elmnt_restn              number := 0;
    vnu_tail_polc_ent            number := 0;
    vnu_tail_polc_corps          number := 0;
    vnu_tail_polc_pied           number := 0;
    vnu_largr_restn              number := 0;
    vva_elmnt                    varchar2 (300);
    vbo_type_indtr               boolean := false;
    v_blob                       blob;
    --variable des paramètres du tableau
    v_bordr_cell                 plpdf_type.t_row_borders;
    v_data_cell                  plpdf_type.t_row_datas;
    v_data_row_ent               plpdf_type.t_row_datas;
    v_tail_cell                  plpdf_type.t_row_widths;
    v_tail_intr_cell             plpdf_type.t_row_widths;
    v_algnm_cell                 plpdf_type.t_row_aligns;
    v_algnm_entet                plpdf_type.t_row_aligns;
    v_style_cell                 plpdf_type.t_row_styles;
    v_lign_max                   plpdf_type.t_row_maxlines;
    v_coulr_cell                 plpdf_type.t_row_filles;

    procedure init_pdf
    is
      vva_progr_a_lancr   varchar2 (4000)
                            default    'begin '
                                    || '  %PROCD_PERSN%(:a); '
                                    || '  exception when others then ete();'
                                    || 'end;';
    begin
      --compter le nombre d'éléments
      for i in var_infor_coln.first () .. var_infor_coln.last ()
      loop
        if     var_infor_coln (i).va_indic_expor = 'O'
           and gta_fonct_coln (i).vva_indic_afich = 'O'
        then
          vnu_elmnt_lign   := vnu_elmnt_lign + 1;
        end if;
      end loop;

      --initialiser le pdf
      if gpi_parmt_impr.va_orien_papr = 'VERTICAL'
      then
        plpdf.init1 (
          'P'
         ,plpdf_const.point
         ,case gpi_parmt_impr.va_formt_papr
            when 'LEGAL' then plpdf_const.legal
            when 'LETTER' then plpdf_const.letter
            when 'A3' then plpdf_const.a3
            when 'A4' then plpdf_const.a4
            else plpdf_const.letter
          end);
      else
        plpdf.init1 (
          'L'
         ,plpdf_const.point
         ,case gpi_parmt_impr.va_formt_papr
            when 'LEGAL' then plpdf_const.legal
            when 'LETTER' then plpdf_const.letter
            when 'A3' then plpdf_const.a3
            when 'A4' then plpdf_const.a4
            else plpdf_const.letter
          end);
      end if;

      plpdf.nopalias;
      plpdf.setdoctitle (   formt_nom_fichr (vva_nom_raprt)
                         || '.pdf');
      plpdf.setallmargin (knu_marge_droit * 72
                         ,0.5 * 72
                         ,knu_marge_gauch * 72);
      plpdf.newpage;
      plpdf.setcellmargin (knu_marge_cel);

      if not gta_hautr_cel.exists (convr_parmt_faml (gpi_parmt_impr.va_entet_polc_faml))
      then
        init_hautr_cel (convr_parmt_faml (gpi_parmt_impr.va_entet_polc_faml));
      end if;

      if not gta_hautr_cel.exists (convr_parmt_faml (gpi_parmt_impr.va_coln_polc_faml))
      then
        init_hautr_cel (convr_parmt_faml (gpi_parmt_impr.va_coln_polc_faml));
      end if;

      if not gta_hautr_cel.exists (convr_parmt_faml (gpi_parmt_impr.va_corps_polc_faml))
      then
        init_hautr_cel (convr_parmt_faml (gpi_parmt_impr.va_corps_polc_faml));
      end if;

      if not gta_hautr_cel.exists (convr_parmt_faml (gpi_parmt_impr.va_pied_polc_faml))
      then
        init_hautr_cel (convr_parmt_faml (gpi_parmt_impr.va_pied_polc_faml));
      end if;

      if vva_procd_entet is not null
      then
        vva_progr_a_lancr      :=
          replace (vva_progr_a_lancr
                  ,'%PROCD_PERSN%'
                  ,vva_procd_entet);

        execute immediate vva_progr_a_lancr using vva_nom_raprt;
      else
        plpdf.setprintfont (convr_parmt_faml (gpi_parmt_impr.va_entet_polc_faml)
                           ,convr_parmt_poids (gpi_parmt_impr.va_entet_polc_poids
                                              ,'B')
                           ,gpi_parmt_impr.nu_entet_polc_tail);
        plpdf.printcell (0
                        ,obten_hautr_cel (gpi_parmt_impr.va_entet_polc_faml
                                         ,gpi_parmt_impr.nu_entet_polc_tail)
                        ,vva_nom_raprt
                        ,0
                        ,0
                        ,convr_parmt_align (gpi_parmt_impr.va_entet_align
                                           ,'C'));
        plpdf.linebreak (56.7);
      end if;
    end init_pdf;

    procedure calcl_largr_raprt
    is
      vnu_total_reltf         number default 0;
      vbo_activ_fit_to_page   boolean default false;
      vnu_largr_total_reel    number default 0;
    begin
      -- Créer les différents set d'entêtes (tableau)
      vnu_dernr_coln_ajout   := 0;
      vnu_largr_restn        := plpdf.getpageavailablewidth;
      vnu_elmnt_restn        := vnu_elmnt_lign;

      for i in var_infor_coln.first () .. var_infor_coln.last ()
      loop
        if     var_infor_coln (i).va_indic_expor = 'O'
           and gta_fonct_coln (i).vva_indic_afich = 'O'
        then
          case var_infor_coln (i).va_type_largr
            when 'POUCE'
            then
              vnu_largr_restn   := vnu_largr_restn - (var_infor_coln (i).nu_largr * 72);
            when 'INDET'
            then
              var_infor_coln (i).nu_largr   := vnu_largr_deft;
              vnu_largr_restn               := vnu_largr_restn - (var_infor_coln (i).nu_largr * 72);
            when 'RELTF'
            then
              vnu_total_reltf   := vnu_total_reltf + var_infor_coln (i).nu_largr;
            else
              --Ne devrait pas arriver
              null;
          end case;

          if var_infor_coln (i).va_type_largr in ('POUCE'
                                                 ,'INDET')
          then
            vnu_largr_total_reel   := vnu_largr_total_reel + (var_infor_coln (i).nu_largr * 72);
          end if;
        end if;
      end loop;

      if    vnu_largr_restn <= 0
         or     vnu_total_reltf = 0
            and vnu_largr_total_reel < plpdf.getpageavailablewidth
            and vva_indic_forcr_ajust_page = 'O'
      then
        vbo_activ_fit_to_page   := true;
      end if;

      for j in var_pages.first () .. var_pages.last ()
      loop
        for i in vnu_dernr_coln_ajout + 1 .. var_pages (j).nu_dernr_coln
        loop
          if     vbo_activ_fit_to_page
             and var_infor_coln (i).va_type_largr = 'RELTF'
          then
            var_infor_coln (i).va_indic_expor    := 'N';
            gta_fonct_coln (i).vva_indic_afich   := 'N';
          end if;

          if     var_infor_coln (i).va_indic_expor = 'O'
             and gta_fonct_coln (i).vva_indic_afich = 'O'
          then
            --Taille selon la largeur du champ
            case var_infor_coln (i).va_type_largr
              when 'RELTF'
              then
                var_infor_coln (i).nu_largr_reltv   := var_infor_coln (i).nu_largr / vnu_total_reltf;
                v_tail_intr_cell (i)                := vnu_largr_restn * var_infor_coln (i).nu_largr_reltv;
              else
                if not vbo_activ_fit_to_page
                then
                  v_tail_intr_cell (i)   := (var_infor_coln (i).nu_largr * 72);
                else
                  v_tail_intr_cell (i)   := plpdf.getpageavailablewidth * ( (var_infor_coln (i).nu_largr * 72) / vnu_largr_total_reel);
                end if;
            end case;

            vnu_elmnt_tabl                    := vnu_elmnt_tabl + 1;

            if gta_trans_libl.exists (var_infor_coln (i).va_nom)
            then
              vva_elmnt   := gta_trans_libl (var_infor_coln (i).va_nom);
            else
              vva_elmnt   := var_infor_coln (i).va_libl;
            end if;

            vva_elmnt                         := formt_chain_br (vva_elmnt);

            v_bordr_cell (vnu_elmnt_tabl)     := '1';
            v_tail_cell (vnu_elmnt_tabl)      := v_tail_intr_cell (i);

            vnu_elmnt_restn                   := vnu_elmnt_lign - vnu_elmnt_tabl;

            v_algnm_entet (vnu_elmnt_tabl)      :=
              convr_parmt_align (var_infor_coln (i).va_align_entet
                                ,'C');
            v_data_row_ent (vnu_elmnt_tabl)   := vva_elmnt;
            vbo_type_indtr                    := false;
          end if;
        end loop;

        vnu_dernr_coln_ajout   := var_pages (j).nu_dernr_coln;
      end loop;

      vnu_elmnt_tabl         := 0;
    end calcl_largr_raprt;

    procedure impri_entet
    is
    begin
      if gpi_parmt_impr.nu_coln_polc_tail is not null
      then
        vnu_tail_polc_ent   := gpi_parmt_impr.nu_coln_polc_tail;
      else
        vnu_tail_polc_ent   := 11;
      end if;

      plpdf.setcolor4filling (obten_coulr_a_partr_hex (gre_coulr_pdf.vva_coulr_backg_entet));
      plpdf.setprintfont (convr_parmt_faml (gpi_parmt_impr.va_coln_polc_faml)
                         ,convr_parmt_poids (gpi_parmt_impr.va_coln_polc_poids
                                            ,'B')
                         ,vnu_tail_polc_ent);

      plpdf.row_print2 (v_data_row_ent
                       ,v_bordr_cell
                       ,v_tail_cell
                       ,v_algnm_entet
                       ,v_style_cell
                       ,v_lign_max
                       ,obten_hautr_cel (gpi_parmt_impr.va_coln_polc_faml
                                        ,vnu_tail_polc_ent)
                       ,1
                       ,0
                       ,0);
    end impri_entet;

    procedure impri_corps
    is
    begin
      if gpi_parmt_impr.nu_corps_polc_tail is not null
      then
        vnu_tail_polc_corps   := gpi_parmt_impr.nu_corps_polc_tail;
      else
        vnu_tail_polc_corps   := 8;
      end if;

      plpdf.setprintfont (convr_parmt_faml (gpi_parmt_impr.va_corps_polc_faml)
                         ,convr_parmt_poids (gpi_parmt_impr.va_corps_polc_poids
                                            ,null)
                         ,vnu_tail_polc_corps);

      plpdf.row_print2 (v_data_cell
                       ,v_bordr_cell
                       ,v_tail_cell
                       ,v_algnm_cell
                       ,v_style_cell
                       ,v_lign_max
                       ,obten_hautr_cel (gpi_parmt_impr.va_corps_polc_faml
                                        ,vnu_tail_polc_corps)
                       ,v_coulr_cell);
      vnu_elmnt_tabl   := 0;
    end impri_corps;

    procedure defnr_ligne
    is
      vbo_presn_ligne_bold   boolean default false;
    begin
      gre_style_ligne.indic_ligne   := false;
      gre_style_ligne.indic_gras    := false;

      for i in var_infor_coln.first () .. var_infor_coln.last ()
      loop
        if var_infor_coln (i).va_indic_expor = 'O'
        then
          if gta_fonct_coln (i).vva_indic_afich = 'O'
          then
            vnu_elmnt_tabl                  := vnu_elmnt_tabl + 1;

            v_bordr_cell (vnu_elmnt_tabl)   := '1';

            v_tail_cell (vnu_elmnt_tabl)    := v_tail_intr_cell (i);

            --Aligner selon le type de données
            case var_infor_coln (i).va_type_valr
              when 'VARCH'
              then
                vva_elmnt   := var_infor_coln (i).va_valr_varch;

                if vva_elmnt is null
                then
                  vva_elmnt   := gva_valr_nul;
                end if;
              when 'NUMBR'
              then
                if var_infor_coln (i).nu_valr_numbr is null
                then
                  vva_elmnt   := gva_valr_nul;
                else
                  if var_infor_coln (i).va_formt is null
                  then
                    vva_elmnt   := to_char (var_infor_coln (i).nu_valr_numbr);
                  else
                    vva_elmnt      :=
                      (ltrim (to_char (var_infor_coln (i).nu_valr_numbr
                                      ,var_infor_coln (i).va_formt)));
                  end if;
                end if;
              when 'DATE'
              then
                if var_infor_coln (i).da_valr_date is null
                then
                  vva_elmnt   := gva_valr_nul;
                else
                  if var_infor_coln (i).va_formt is null
                  then
                    vva_elmnt   := to_char (var_infor_coln (i).da_valr_date);
                  else
                    vva_elmnt      :=
                      (to_char (var_infor_coln (i).da_valr_date
                               ,var_infor_coln (i).va_formt));
                  end if;
                end if;
              when 'TIMST'
              then
                if var_infor_coln (i).ts_valr_timst is null
                then
                  vva_elmnt   := gva_valr_nul;
                else
                  if var_infor_coln (i).va_formt is null
                  then
                    vva_elmnt   := to_char (var_infor_coln (i).ts_valr_timst);
                  else
                    vva_elmnt      :=
                      (to_char (var_infor_coln (i).ts_valr_timst
                               ,var_infor_coln (i).va_formt));
                  end if;
                end if;
              else
                vva_elmnt   := var_infor_coln (i).va_valr_varch;
            end case;

            vva_elmnt                       := apex_application.do_substitutions (vva_elmnt);

            if vva_elmnt like '<span style="%"></span>%'
            then
              declare
                vnu_postn   number;
              begin
                vnu_postn      :=
                    instr (vva_elmnt
                          ,'</span>')
                  + length ('</span>')
                  - 1;
                gre_style_ligne      :=
                  afw_25_formt_ir_pkg.digr_bals_formt (substr (vva_elmnt
                                                              ,1
                                                              ,vnu_postn));
                vva_elmnt      :=
                  substr (vva_elmnt
                         ,vnu_postn + 1);

                if     gre_style_ligne.indic_ligne
                   and gre_style_ligne.indic_gras
                then
                  vbo_presn_ligne_bold   := true;
                end if;
              end;
            end if;

            v_style_cell (vnu_elmnt_tabl)   := null;
            vva_elmnt                       := formt_chain_br (vva_elmnt);
            v_algnm_cell (vnu_elmnt_tabl)      :=
              convr_parmt_align (var_infor_coln (i).va_align_coln
                                ,'C');
            v_data_cell (vnu_elmnt_tabl)    := vva_elmnt;
          end if;

          --Alimenter le highlight pour les colonnes
          init_surlg_coln (var_infor_coln (i).va_nom);
          gerer_surlg (vta_parmt_surlg
                      ,vva_elmnt
                      ,var_infor_coln (i).va_nom
                      ,var_infor_coln (i).va_type_valr
                      ,var_infor_coln (i).va_formt);
        end if;
      end loop;

      if vbo_presn_ligne_bold
      then
        for c in v_style_cell.first () .. v_style_cell.last ()
        loop
          if    v_style_cell (c) not like '%B%'
             or v_style_cell (c) is null
          then
            v_style_cell (c)      :=
                 v_style_cell (c)
              || 'B';
          end if;
        end loop;
      end if;

      vnu_elmnt_tabl                := 0;
    end defnr_ligne;

    procedure impri_pied_page
    is
      vva_progr_a_lancr   varchar2 (4000)
                            default    'begin '
                                    || '  %PROCD_PERSN%; '
                                    || '  exception when others then ete();'
                                    || 'end;';
    begin
      if vva_procd_pied_page is not null
      then
        vva_progr_a_lancr      :=
          replace (vva_progr_a_lancr
                  ,'%PROCD_PERSN%'
                  ,vva_procd_pied_page);

        execute immediate vva_progr_a_lancr;
      else
        if gpi_parmt_impr.nu_pied_polc_tail is not null
        then
          vnu_tail_polc_pied   := gpi_parmt_impr.nu_pied_polc_tail;
        else
          vnu_tail_polc_pied   := 8;
        end if;

        plpdf.setcurrenty (round (plpdf.getpageavailableheight + 14.2
                                 ,0));
        plpdf.setprintfont (convr_parmt_faml (gpi_parmt_impr.va_pied_polc_faml)
                           ,convr_parmt_poids (gpi_parmt_impr.va_pied_polc_poids
                                              ,null)
                           ,vnu_tail_polc_pied);

        if gpi_parmt_impr.va_pied_texte is not null
        then
          plpdf.printcell (0
                          ,obten_hautr_cel (gpi_parmt_impr.va_pied_polc_faml
                                           ,vnu_tail_polc_pied)
                          ,apex_application.do_substitutions (gpi_parmt_impr.va_pied_texte)
                          ,0
                          ,0
                          ,'C');
        end if;

        plpdf.printcell (0
                        ,obten_hautr_cel (gpi_parmt_impr.va_pied_polc_faml
                                         ,vnu_tail_polc_pied)
                        ,to_char (plpdf.currentpagenumber)
                        ,0
                        ,0
                        ,'C');
      end if;
    end impri_pied_page;

    --Gestion du surlignement
    procedure defnr_surlg
    is
    begin
      for i in var_infor_coln.first () .. var_infor_coln.last ()
      loop
        if var_infor_coln (i).va_indic_expor = 'O'
        then
          if gta_fonct_coln (i).vva_indic_afich = 'O'
          then
            vnu_elmnt_tabl                  := vnu_elmnt_tabl + 1;

            v_coulr_cell (vnu_elmnt_tabl)   := gre_ligne_a_surlg.vre_coulr_backg;

            if gre_ligne_a_surlg.vta_coln_surlg (var_infor_coln (i).va_nom).vva_type_surlg <> 'LIGNE'
            then
              v_coulr_cell (vnu_elmnt_tabl)   := gre_ligne_a_surlg.vta_coln_surlg (var_infor_coln (i).va_nom).vre_coulr_backg;
            end if;
          end if;
        end if;
      end loop;
    end defnr_surlg;

    --Gestion des regroupements
    function obten_valr_fonct (pva_nom_coln   in varchar2
                              ,pva_fonct      in varchar2 default 'SOMME')
      return number
    is
      vnu_fonct   number;
    begin
      case pva_fonct
        when 'SOMME'
        then
          vnu_fonct      :=
            instr (vre_parmt_group.vva_coln_somme
                  ,pva_nom_coln);
        when 'MOYEN'
        then
          vnu_fonct      :=
            instr (vre_parmt_group.vva_coln_moyen
                  ,pva_nom_coln);
        when 'MAX'
        then
          vnu_fonct      :=
            instr (vre_parmt_group.vva_coln_max
                  ,pva_nom_coln);
        when 'MIN'
        then
          vnu_fonct      :=
            instr (vre_parmt_group.vva_coln_min
                  ,pva_nom_coln);
        when 'MEDN'
        then
          vnu_fonct      :=
            instr (vre_parmt_group.vva_coln_medn
                  ,pva_nom_coln);
        when 'MODE'
        then
          vnu_fonct      :=
            instr (vre_parmt_group.vva_coln_mode
                  ,pva_nom_coln);
        when 'COMPT'
        then
          vnu_fonct      :=
            instr (vre_parmt_group.vva_coln_compt
                  ,pva_nom_coln);
        when 'DISTN'
        then
          vnu_fonct      :=
            instr (vre_parmt_group.vva_coln_compt_distn
                  ,pva_nom_coln);
        else
          null;
      end case;

      return vnu_fonct;
    end obten_valr_fonct;

    function afich_fonct (pnu_valr    in number
                         ,pva_formt   in varchar2
                         ,pva_fonct   in varchar2 default 'SOMME')
      return varchar2
    is
      vva_fonct   varchar2 (4000);
    begin
      case pva_fonct
        when 'SOMME'
        then
          vva_fonct   := null;
        when 'MOYEN'
        then
          vva_fonct   := 'Moyenne';
        when 'MAX'
        then
          vva_fonct   := 'Maximum';
        when 'MIN'
        then
          vva_fonct   := 'Minimum';
        when 'MEDN'
        then
          vva_fonct   := 'Médiane';
        when 'MODE'
        then
          vva_fonct   := 'Mode';
        when 'COMPT'
        then
          vva_fonct   := 'Calculer';
        when 'DISTN'
        then
          vva_fonct   := 'Nombre de valeurs distinctes';
        else
          null;
      end case;

      if pva_fonct <> 'SOMME'
      then
        vva_fonct      :=
             vva_fonct
          || ': ';
      end if;

      if pva_fonct in ('COMPT'
                      ,'DISTN')
      then
        return    vva_fonct
               || to_char (pnu_valr);
      else
        return    vva_fonct
               || to_char (pnu_valr
                          ,pva_formt);
      end if;
    end afich_fonct;

    function obten_group_actif (pva_nom_coln in varchar2)
      return boolean
    is
    begin
      return instr (   ':'
                    || vre_parmt_group.vva_group_sur
                    || ':'
                   ,   ':'
                    || pva_nom_coln
                    || ':') > 0;
    end obten_group_actif;

    function obten_fonct_activ (pva_nom_coln   in varchar2
                               ,pva_mode       in varchar2 default 'SOMME')
      return boolean
    is
      vbo_activ   boolean default false;
    begin
      case pva_mode
        when 'SOMME'
        then
          vbo_activ      :=
            instr (   ':'
                   || vre_parmt_group.vva_coln_somme
                   || ':'
                  ,   ':'
                   || pva_nom_coln
                   || ':') > 0;
        when 'MOYEN'
        then
          vbo_activ      :=
            instr (   ':'
                   || vre_parmt_group.vva_coln_moyen
                   || ':'
                  ,   ':'
                   || pva_nom_coln
                   || ':') > 0;
        when 'MAX'
        then
          vbo_activ      :=
            instr (   ':'
                   || vre_parmt_group.vva_coln_max
                   || ':'
                  ,   ':'
                   || pva_nom_coln
                   || ':') > 0;
        when 'MIN'
        then
          vbo_activ      :=
            instr (   ':'
                   || vre_parmt_group.vva_coln_min
                   || ':'
                  ,   ':'
                   || pva_nom_coln
                   || ':') > 0;
        when 'MEDN'
        then
          vbo_activ      :=
            instr (   ':'
                   || vre_parmt_group.vva_coln_medn
                   || ':'
                  ,   ':'
                   || pva_nom_coln
                   || ':') > 0;
        when 'MODE'
        then
          vbo_activ      :=
            instr (   vre_parmt_group.vva_coln_mode
                   || ':'
                  ,   ':'
                   || pva_nom_coln
                   || ':') > 0;
        when 'COMPT'
        then
          vbo_activ      :=
            instr (   ':'
                   || vre_parmt_group.vva_coln_compt
                   || ':'
                  ,   ':'
                   || pva_nom_coln
                   || ':') > 0;
        when 'DISTN'
        then
          vbo_activ      :=
            instr (   ':'
                   || vre_parmt_group.vva_coln_compt_distn
                   || ':'
                  ,   ':'
                   || pva_nom_coln
                   || ':') > 0;
        else
          null;
      end case;

      return vbo_activ;
    end obten_fonct_activ;

    /*Création des métadonnées*/
    procedure init_group_entet
    is
      vbo_presn_group   boolean default false;
      vnu_compt         pls_integer default 0;
      vnu_compt_group   pls_integer default 0;
      vbo_presn_fonct   boolean default false;

      function detrm_postn_coln_group (pva_nom_coln   in varchar2
                                      ,pva_break_on   in varchar2)
        return pls_integer
      is
        vva_chain   varchar2 (4000);
        vnu_postn   pls_integer default 0;
      begin
        vva_chain      :=
          substr (pva_break_on
                 ,1
                 ,instr (pva_break_on
                        ,pva_nom_coln));

        select   length (vva_chain)
               - length (replace (vva_chain
                                 ,':'
                                 ,''))
               + 1
          into vnu_postn
          from dual;

        return vnu_postn;
      end detrm_postn_coln_group;
    begin
      --Déterminer les colonnes qui font partie du break ainsi que les fonctions par colonnes,
      --les ajouter au tableau des groupes globaux
      --Ne pas oublier le format number pour la colonne
      for i in var_infor_coln.first () .. var_infor_coln.last ()
      loop
        if var_infor_coln (i).va_indic_expor = 'O'
        then
          if obten_group_actif (var_infor_coln (i).va_nom)
          then
            vbo_presn_group                     := true;
            gbo_presn_group                     := vbo_presn_group;
            vnu_compt_group                     :=
              detrm_postn_coln_group (var_infor_coln (i).va_nom
                                     ,vre_parmt_group.vva_group);

            --Alimenter les colonnes qui font parties du groupe
            case vnu_compt_group
              when 1
              then
                gre_group.vva_nom_coln_1   := var_infor_coln (i).va_nom;
              when 2
              then
                gre_group.vva_nom_coln_2   := var_infor_coln (i).va_nom;
              when 3
              then
                gre_group.vva_nom_coln_3   := var_infor_coln (i).va_nom;
              when 4
              then
                gre_group.vva_nom_coln_4   := var_infor_coln (i).va_nom;
              when 5
              then
                gre_group.vva_nom_coln_5   := var_infor_coln (i).va_nom;
              when 6
              then
                gre_group.vva_nom_coln_6   := var_infor_coln (i).va_nom;
              else
                null;
            end case;

            gta_fonct_coln (i).vnu_numr_group   := vnu_compt_group;
          end if;

          gta_fonct_coln (i).vva_nom_coln   := var_infor_coln (i).va_nom;

          if vbo_presn_group
          then
            gta_fonct_coln (i).vva_indic_afich   := 'N';
          else
            gta_fonct_coln (i).vva_indic_afich   := 'O';


            if obten_fonct_activ (var_infor_coln (i).va_nom
                                 ,'SOMME')
            then
              gta_fonct_coln (i).vva_indic_somme   := 'O';
            end if;

            if obten_fonct_activ (var_infor_coln (i).va_nom
                                 ,'MOYEN')
            then
              gta_fonct_coln (i).vva_indic_moyen   := 'O';
            end if;

            if obten_fonct_activ (var_infor_coln (i).va_nom
                                 ,'MAX')
            then
              gta_fonct_coln (i).vva_indic_max   := 'O';
            end if;

            if obten_fonct_activ (var_infor_coln (i).va_nom
                                 ,'MIN')
            then
              gta_fonct_coln (i).vva_indic_min   := 'O';
            end if;

            if obten_fonct_activ (var_infor_coln (i).va_nom
                                 ,'MEDN')
            then
              gta_fonct_coln (i).vva_indic_medn   := 'O';
            end if;

            if obten_fonct_activ (var_infor_coln (i).va_nom
                                 ,'MODE')
            then
              gta_fonct_coln (i).vva_indic_mode   := 'O';
            end if;

            if obten_fonct_activ (var_infor_coln (i).va_nom
                                 ,'COMPT')
            then
              gta_fonct_coln (i).vva_indic_compt   := 'O';
            end if;

            if obten_fonct_activ (var_infor_coln (i).va_nom
                                 ,'DISTN')
            then
              gta_fonct_coln (i).vva_indic_compt_distn   := 'O';
            end if;
          end if;

          vbo_presn_group                   := false;
        end if;
      end loop;

      vnu_elmnt_tabl   := 0;
    end init_group_entet;

    function verfr_chang_group
      return boolean
    is
      vbo_chang   boolean default false;
      vva_elemn   varchar2 (32767);
    begin
      for i in var_infor_coln.first () .. var_infor_coln.last ()
      loop
        if     var_infor_coln (i).va_indic_expor = 'O'
           and gta_fonct_coln (i).vva_indic_afich = 'N'
        then
          --Déterminer s'il y a eu changement de groupe
          case var_infor_coln (i).va_type_valr
            when 'VARCH'
            then
              vva_elemn   := var_infor_coln (i).va_valr_varch;
            when 'NUMBR'
            then
              vva_elemn      :=
                (ltrim (to_char (var_infor_coln (i).nu_valr_numbr
                                ,var_infor_coln (i).va_formt)));
            when 'DATE'
            then
              vva_elemn      :=
                (to_char (var_infor_coln (i).da_valr_date
                         ,var_infor_coln (i).va_formt));
            when 'TIMST'
            then
              vva_elemn      :=
                (to_char (var_infor_coln (i).ts_valr_timst
                         ,var_infor_coln (i).va_formt));
            else
              vva_elemn   := var_infor_coln (i).va_valr_varch;
          end case;

          case gta_fonct_coln (i).vnu_numr_group
            when 1
            then
              vbo_chang      :=
                   gre_group.vva_valr_coln_1 <> vva_elemn
                or gre_group.vva_valr_coln_1 is null;
            when 2
            then
              vbo_chang      :=
                   gre_group.vva_valr_coln_2 <> vva_elemn
                or gre_group.vva_valr_coln_2 is null;
            when 3
            then
              vbo_chang      :=
                   gre_group.vva_valr_coln_3 <> vva_elemn
                or gre_group.vva_valr_coln_3 is null;
            when 4
            then
              vbo_chang      :=
                   gre_group.vva_valr_coln_4 <> vva_elemn
                or gre_group.vva_valr_coln_4 is null;
            when 5
            then
              vbo_chang      :=
                   gre_group.vva_valr_coln_5 <> vva_elemn
                or gre_group.vva_valr_coln_5 is null;
            when 6
            then
              vbo_chang      :=
                   gre_group.vva_valr_coln_6 <> vva_elemn
                or gre_group.vva_valr_coln_6 is null;
            else
              null;
          end case;
        end if;

        if vbo_chang
        then
          exit;
        end if;
      end loop;

      return vbo_chang;
    end verfr_chang_group;

    /*Print à chaque groupe*/
    procedure gerer_group_entet
    is
      vbo_presn_entet   boolean default false;
      vva_elemn         varchar2 (4000);
      vva_valr_coln     varchar2 (200);
    begin
      for i in var_infor_coln.first () .. var_infor_coln.last ()
      loop
        if     var_infor_coln (i).va_indic_expor = 'O'
           and gta_fonct_coln (i).vva_indic_afich = 'N'
        then
          --Construire la cellule à imprimer
          vbo_presn_entet   := true;

          case var_infor_coln (i).va_type_valr
            when 'VARCH'
            then
              vva_valr_coln   := var_infor_coln (i).va_valr_varch;
            when 'NUMBR'
            then
              vva_valr_coln      :=
                (ltrim (to_char (var_infor_coln (i).nu_valr_numbr
                                ,var_infor_coln (i).va_formt)));
            when 'DATE'
            then
              vva_valr_coln      :=
                (to_char (var_infor_coln (i).da_valr_date
                         ,var_infor_coln (i).va_formt));
            when 'TIMST'
            then
              vva_valr_coln      :=
                (to_char (var_infor_coln (i).ts_valr_timst
                         ,var_infor_coln (i).va_formt));
            else
              vva_valr_coln   := var_infor_coln (i).va_valr_varch;
          end case;

          case gta_fonct_coln (i).vnu_numr_group
            when 1
            then
              gre_group.vva_libl_coln_1   := var_infor_coln (i).va_libl;
              gre_group.vva_valr_coln_1   := vva_valr_coln;
            when 2
            then
              gre_group.vva_libl_coln_2   := var_infor_coln (i).va_libl;
              gre_group.vva_valr_coln_2   := vva_valr_coln;
            when 3
            then
              gre_group.vva_libl_coln_3   := var_infor_coln (i).va_libl;
              gre_group.vva_valr_coln_3   := vva_valr_coln;
            when 4
            then
              gre_group.vva_libl_coln_4   := var_infor_coln (i).va_libl;
              gre_group.vva_valr_coln_4   := vva_valr_coln;
            when 5
            then
              gre_group.vva_libl_coln_5   := var_infor_coln (i).va_libl;
              gre_group.vva_valr_coln_5   := vva_valr_coln;
            when 6
            then
              gre_group.vva_libl_coln_6   := var_infor_coln (i).va_libl;
              gre_group.vva_valr_coln_6   := vva_valr_coln;
            else
              null;
          end case;
        end if;
      end loop;

      if gre_group.vva_nom_coln_1 is not null
      then
        vva_elemn      :=
             vva_elemn
          || ', '
          || gre_group.vva_libl_coln_1
          || ' : '
          || gre_group.vva_valr_coln_1;
      end if;

      if gre_group.vva_nom_coln_2 is not null
      then
        vva_elemn      :=
             vva_elemn
          || ', '
          || gre_group.vva_libl_coln_2
          || ' : '
          || gre_group.vva_valr_coln_2;
      end if;

      if gre_group.vva_nom_coln_3 is not null
      then
        vva_elemn      :=
             vva_elemn
          || ', '
          || gre_group.vva_libl_coln_3
          || ' : '
          || gre_group.vva_valr_coln_3;
      end if;

      if gre_group.vva_nom_coln_4 is not null
      then
        vva_elemn      :=
             vva_elemn
          || ', '
          || gre_group.vva_libl_coln_4
          || ' : '
          || gre_group.vva_valr_coln_4;
      end if;

      if gre_group.vva_nom_coln_5 is not null
      then
        vva_elemn      :=
             vva_elemn
          || ', '
          || gre_group.vva_libl_coln_5
          || ' : '
          || gre_group.vva_valr_coln_5;
      end if;

      if gre_group.vva_nom_coln_6 is not null
      then
        vva_elemn      :=
             vva_elemn
          || ', '
          || gre_group.vva_libl_coln_6
          || ' : '
          || gre_group.vva_valr_coln_6;
      end if;

      if vbo_presn_entet
      then
        if gpi_parmt_impr.nu_coln_polc_tail is not null
        then
          vnu_tail_polc_ent   := gpi_parmt_impr.nu_coln_polc_tail;
        else
          vnu_tail_polc_ent   := 11;
        end if;

        plpdf.setcolor4filling (obten_coulr_a_partr_hex (gre_coulr_pdf.vva_coulr_backg_entet));
        plpdf.setprintfont (convr_parmt_faml (gpi_parmt_impr.va_coln_polc_faml)
                           ,convr_parmt_poids (gpi_parmt_impr.va_coln_polc_poids
                                              ,'B')
                           ,vnu_tail_polc_ent);

        plpdf.printmultilinecell (0
                                 ,obten_hautr_cel (gpi_parmt_impr.va_coln_polc_faml
                                                  ,vnu_tail_polc_ent)
                                 ,substr (vva_elemn
                                         ,3)
                                 ,'1'
                                 ,'L'
                                 ,1
                                 ,p_ln   => 1);
      end if;
    end gerer_group_entet;

    /* Fin print à chaque groupe*/
    procedure termn_group_entet
    is
      vva_elemn          varchar2 (4000);
      vnu_compt_termn    pls_integer default 0;
      v_data_row_fonct   plpdf_type.t_row_datas;
      v_algnm_fonct      plpdf_type.t_row_aligns;
      vbo_retrn          boolean default false;

      function obten_medn
        return number
      is
        vta_medn   typ_tab_medn;
      begin /*
       select cast(multiset(
                 select * from table(gta_fonct_coln(c).vta_tabl_medn)
                 order by 1) as typ_tab_medn)
   into vta_medn from dual;

 --Médianne est la valeur
 if mod (vta_medn.count(), 2) = 1 then
   null;
 else --Sinon, il faut calculer la position avant et après
   null;
 end if;*/
        return null;
      end obten_medn;

      function nouvl_ligne
        return varchar2
      is
      begin
        return    chr (13)
               || chr (10);
      end nouvl_ligne;
    begin
      for c in gta_fonct_coln.first () .. gta_fonct_coln.last ()
      loop
        if gta_fonct_coln (c).vva_indic_afich = 'O'
        then
          vnu_compt_termn                      := vnu_compt_termn + 1;

          if gta_fonct_coln (c).vva_indic_somme = 'O'
          then
            vbo_retrn   := true;
            vva_elemn      :=
              afich_fonct (gta_fonct_coln (c).vnu_somme
                          ,var_infor_coln (c).va_formt
                          ,'SOMME');
          end if;

          if gta_fonct_coln (c).vva_indic_moyen = 'O'
          then
            if vbo_retrn
            then
              vva_elemn      :=
                   vva_elemn
                || nouvl_ligne;
            end if;

            vbo_retrn   := true;
            vva_elemn      :=
                 vva_elemn
              || afich_fonct ( (gta_fonct_coln (c).vnu_moyen / gta_fonct_coln (c).vnu_compt)
                             ,nvl (var_infor_coln (c).va_formt, kva_formt_nombr)
                             ,'MOYEN');
          end if;

          if gta_fonct_coln (c).vva_indic_max = 'O'
          then
            if vbo_retrn
            then
              vva_elemn      :=
                   vva_elemn
                || nouvl_ligne;
            end if;

            vbo_retrn   := true;
            vva_elemn      :=
                 vva_elemn
              || afich_fonct (gta_fonct_coln (c).vnu_max
                             ,var_infor_coln (c).va_formt
                             ,'MAX');
          end if;

          if gta_fonct_coln (c).vva_indic_min = 'O'
          then
            if vbo_retrn
            then
              vva_elemn      :=
                   vva_elemn
                || nouvl_ligne;
            end if;

            vbo_retrn   := true;
            vva_elemn      :=
                 vva_elemn
              || afich_fonct (gta_fonct_coln (c).vnu_min
                             ,var_infor_coln (c).va_formt
                             ,'MIN');
          end if;

          /*
                               if gta_fonct_coln (c).vva_indic_medn = 'O' then
                                if vbo_retrn then
                                  vva_elemn := vva_elemn || nouvl_ligne;
                                end if;
                                vbo_retrn := true;
                              vva_elemn := vva_elemn || afich_fonct(obten_medn, var_infor_coln(c).va_formt, 'MEDN');
                    end if;
          */

          if gta_fonct_coln (c).vva_indic_compt = 'O'
          then
            if vbo_retrn
            then
              vva_elemn      :=
                   vva_elemn
                || nouvl_ligne;
            end if;

            vbo_retrn   := true;
            vva_elemn      :=
                 vva_elemn
              || afich_fonct (gta_fonct_coln (c).vnu_compt
                             ,null
                             ,'COMPT');
          end if;

          if gta_fonct_coln (c).vva_indic_compt_distn = 'O'
          then
            if vbo_retrn
            then
              vva_elemn      :=
                   vva_elemn
                || nouvl_ligne;
            end if;

            vbo_retrn   := true;
            vva_elemn      :=
                 vva_elemn
              || afich_fonct (gta_fonct_coln (c).vnu_compt_distn
                             ,null
                             ,'DISTN');
          end if;

          v_algnm_fonct (vnu_compt_termn)      := 'R';
          v_data_row_fonct (vnu_compt_termn)   := vva_elemn;
          vva_elemn                            := null;
          vbo_retrn                            := false;
        end if;
      end loop;

      if gpi_parmt_impr.nu_coln_polc_tail is not null
      then
        vnu_tail_polc_ent   := gpi_parmt_impr.nu_coln_polc_tail;
      else
        vnu_tail_polc_ent   := 11;
      end if;

      plpdf.setcolor4filling (obten_coulr_a_partr_hex (gre_coulr_pdf.vva_coulr_backg_entet));
      plpdf.setprintfont (convr_parmt_faml (gpi_parmt_impr.va_coln_polc_faml)
                         ,convr_parmt_poids (gpi_parmt_impr.va_coln_polc_poids
                                            ,'B')
                         ,vnu_tail_polc_ent);

      plpdf.row_print2 (v_data_row_fonct
                       ,v_bordr_cell
                       ,v_tail_cell
                       ,v_algnm_fonct
                       ,v_style_cell
                       ,v_lign_max
                       ,obten_hautr_cel (gpi_parmt_impr.va_coln_polc_faml
                                        ,vnu_tail_polc_ent)
                       ,1);
    end termn_group_entet;

    procedure init_calcl_fonct
    is
    begin
      vnu_tail_group   := 0;

      for i in gta_fonct_coln.first () .. gta_fonct_coln.last ()
      loop
        if gta_fonct_coln (i).vva_indic_afich = 'O'
        then
          if gta_fonct_coln (i).vva_indic_somme = 'O'
          then
            vbo_presn_fonct                := true;
            gta_fonct_coln (i).vnu_somme   := 0;
          end if;

          if gta_fonct_coln (i).vva_indic_min = 'O'
          then
            vbo_presn_fonct              := true;
            gta_fonct_coln (i).vnu_min   := null;
          end if;

          if gta_fonct_coln (i).vva_indic_max = 'O'
          then
            vbo_presn_fonct              := true;
            gta_fonct_coln (i).vnu_max   := null;
          end if;

          if gta_fonct_coln (i).vva_indic_moyen = 'O'
          then
            vbo_presn_fonct                := true;
            gta_fonct_coln (i).vnu_moyen   := 0;
          end if;

          if    gta_fonct_coln (i).vva_indic_compt = 'O'
             or gta_fonct_coln (i).vva_indic_moyen = 'O'
          then
            vbo_presn_fonct                := true;
            gta_fonct_coln (i).vnu_compt   := 0;
          end if;

          if gta_fonct_coln (i).vva_indic_compt_distn = 'O'
          then
            vbo_presn_fonct                      := true;
            gta_fonct_coln (i).vnu_compt_distn   := 0;
            gta_fonct_coln (i).vta_tabl_compt.delete ();
          end if;

          if gta_fonct_coln (i).vva_indic_medn = 'O'
          then
            vbo_presn_fonct               := true;
            gta_fonct_coln (i).vnu_medn   := 0;
          --gta_fonct_coln (i).vta_tabl_medn.delete ();
          end if;
        end if;
      end loop;
    end init_calcl_fonct;

    procedure calcl_fonct
    is
      vbo_elemn_exist   boolean default false;
      i                 pls_integer;
    begin
      vnu_tail_group   := vnu_tail_group + 1;

      for i in gta_fonct_coln.first () .. gta_fonct_coln.last ()
      loop
        if gta_fonct_coln (i).vva_indic_afich = 'O'
        then
          if gta_fonct_coln (i).vva_indic_somme = 'O'
          then
            gta_fonct_coln (i).vnu_somme   := gta_fonct_coln (i).vnu_somme + nvl (var_infor_coln (i).nu_valr_numbr, 0);
          end if;

          if     gta_fonct_coln (i).vva_indic_min = 'O'
             and (   gta_fonct_coln (i).vnu_min is null
                  or gta_fonct_coln (i).vnu_min > var_infor_coln (i).nu_valr_numbr)
          then
            gta_fonct_coln (i).vnu_min   := var_infor_coln (i).nu_valr_numbr;
          end if;

          if     gta_fonct_coln (i).vva_indic_max = 'O'
             and (   gta_fonct_coln (i).vnu_max is null
                  or gta_fonct_coln (i).vnu_max < var_infor_coln (i).nu_valr_numbr)
          then
            gta_fonct_coln (i).vnu_max   := var_infor_coln (i).nu_valr_numbr;
          end if;

          if gta_fonct_coln (i).vva_indic_moyen = 'O'
          then
            gta_fonct_coln (i).vnu_moyen   := gta_fonct_coln (i).vnu_moyen + nvl (var_infor_coln (i).nu_valr_numbr, 0);
          end if;

          if    gta_fonct_coln (i).vva_indic_compt = 'O'
             or gta_fonct_coln (i).vva_indic_moyen = 'O'
          then
            if    var_infor_coln (i).nu_valr_numbr is not null
               or var_infor_coln (i).va_valr_varch is not null
               or var_infor_coln (i).da_valr_date is not null
               or var_infor_coln (i).ts_valr_timst is not null
            then
              gta_fonct_coln (i).vnu_compt   := gta_fonct_coln (i).vnu_compt + 1;
            end if;
          end if;

          if gta_fonct_coln (i).vva_indic_compt_distn = 'O'
          then
            case var_infor_coln (i).va_type_valr
              when 'VARCH'
              then
                if not gta_fonct_coln (i).vta_tabl_compt.exists (var_infor_coln (i).va_valr_varch)
                then
                  gta_fonct_coln (i).vta_tabl_compt (var_infor_coln (i).va_valr_varch)   := 1;
                  gta_fonct_coln (i).vnu_compt_distn                                     := gta_fonct_coln (i).vnu_compt_distn + 1;
                end if;
              when 'NUMBR'
              then
                if not gta_fonct_coln (i).vta_tabl_compt.exists (to_char (var_infor_coln (i).nu_valr_numbr))
                then
                  gta_fonct_coln (i).vta_tabl_compt (to_char (var_infor_coln (i).nu_valr_numbr))   := 1;
                  gta_fonct_coln (i).vnu_compt_distn                                               := gta_fonct_coln (i).vnu_compt_distn + 1;
                end if;
              when 'DATE'
              then
                if not gta_fonct_coln (i).vta_tabl_compt.exists (to_char (var_infor_coln (i).da_valr_date))
                then
                  gta_fonct_coln (i).vta_tabl_compt (to_char (var_infor_coln (i).da_valr_date))   := 1;
                  gta_fonct_coln (i).vnu_compt_distn                                              := gta_fonct_coln (i).vnu_compt_distn + 1;
                end if;
              when 'TIMST'
              then
                if not gta_fonct_coln (i).vta_tabl_compt.exists (to_char (var_infor_coln (i).ts_valr_timst))
                then
                  gta_fonct_coln (i).vta_tabl_compt (to_char (var_infor_coln (i).ts_valr_timst))   := 1;
                  gta_fonct_coln (i).vnu_compt_distn                                               := gta_fonct_coln (i).vnu_compt_distn + 1;
                end if;
              else
                if not gta_fonct_coln (i).vta_tabl_compt.exists (var_infor_coln (i).va_valr_varch)
                then
                  gta_fonct_coln (i).vta_tabl_compt (var_infor_coln (i).va_valr_varch)   := 1;
                  gta_fonct_coln (i).vnu_compt_distn                                     := gta_fonct_coln (i).vnu_compt_distn + 1;
                end if;
            end case;
          end if;
        /*
                  if gta_fonct_coln (i).vva_indic_medn = 'O' then
          if var_infor_coln (i).nu_valr_numbr is not null then
            gta_fonct_coln (i).vta_tabl_medn(vnu_tail_group) := var_infor_coln (i).nu_valr_numbr;
          end if;
        end if;*/
        end if;
      end loop;
    end calcl_fonct;

    procedure trans_libl
    is
      vva_tabl_javsc      varchar2 (4000);
      vvc_liste_a_trans   apex_application_global.vc_arr2;
      vvc_liste_coupl     apex_application_global.vc_arr2;
    begin
      vvc_liste_a_trans      :=
        afw_07_util_pkg.string_to_table (vre_parmt_group_plugn.vva_trans_libl
                                        ,',');

      if vvc_liste_a_trans.count > 0
      then
        for v in vvc_liste_a_trans.first .. vvc_liste_a_trans.last
        loop
          vvc_liste_coupl                        :=
            afw_07_util_pkg.string_to_table (vvc_liste_a_trans (v)
                                            ,';');

          gta_trans_libl (vvc_liste_coupl (1))   := vvc_liste_coupl (2);
        end loop;
      end if;
    end trans_libl;

    procedure impri_entet_plugn
    is
      vta_ligne_1   typ_tab_coln_plugn;
      vta_ligne_2   typ_tab_coln_plugn;
      vta_ligne_3   typ_tab_coln_plugn;

      function analz_ligne_entet (pva_ligne in varchar2)
        return typ_tab_coln_plugn
      is
        vta_coln_plugn         typ_tab_coln_plugn;
        vvc_liste_group        apex_application_global.vc_arr2;
        vvc_liste_sous_group   apex_application_global.vc_arr2;
        vnu_compt              pls_integer default 0;
      begin
        vvc_liste_group      :=
          afw_07_util_pkg.string_to_table (pva_ligne
                                          ,',');

        if vvc_liste_group.count > 0
        then
          for v in vvc_liste_group.first .. vvc_liste_group.last
          loop
            vnu_compt                              := vnu_compt + 1;
            vvc_liste_sous_group                   :=
              afw_07_util_pkg.string_to_table (vvc_liste_group (v)
                                              ,';');
            vta_coln_plugn (vnu_compt).vva_valr    := trim (vvc_liste_sous_group (1));
            vta_coln_plugn (vnu_compt).vnu_colsp   := vvc_liste_sous_group (2);
            vta_coln_plugn (vnu_compt).vnu_rowsp   := vvc_liste_sous_group (3);
          end loop;
        end if;

        return vta_coln_plugn;
      end analz_ligne_entet;

      procedure impri_ligne (pta_ligne in typ_tab_coln_plugn)
      is
        v_data_row_plugn   plpdf_type.t_row_datas;
        v_algnm_plugn      plpdf_type.t_row_aligns;
        v_tail_plugn       plpdf_type.t_row_widths;
        vnu_compt          pls_integer default 0;
        vnu_tail_ventl     number default 0;
        vnu_coln_courn     pls_integer default 1;
        vnu_coln_max       pls_integer default 0;
      begin
        if pta_ligne.count > 0
        then
          for v in pta_ligne.first () .. pta_ligne.last ()
          loop
            vnu_compt                      := vnu_compt + 1;
            v_data_row_plugn (vnu_compt)   := formt_chain_br (pta_ligne (v).vva_valr);

            if     v = pta_ligne.first ()
               and vre_parmt_group_plugn.vva_indic_ventl = 'Y'
            then
              for c in v .. vre_parmt_group_plugn.vnu_nombr_coln_ventl
              loop
                vnu_tail_ventl   := vnu_tail_ventl + v_tail_cell (c);
              end loop;

              v_tail_plugn (vnu_compt)   := vnu_tail_ventl;
              vnu_coln_courn             := vnu_coln_courn + vre_parmt_group_plugn.vnu_nombr_coln_ventl - 1;
            else
              vnu_coln_max               := vnu_coln_courn + pta_ligne (v).vnu_colsp - 1;
              v_tail_plugn (vnu_compt)   := 0;

              for b in vnu_coln_courn .. vnu_coln_max
              loop
                v_tail_plugn (vnu_compt)   := v_tail_plugn (vnu_compt) + v_tail_cell (b);
              end loop;

              vnu_coln_courn             := vnu_coln_max;
            end if;

            vnu_coln_courn                 := vnu_coln_courn + 1;
            v_algnm_plugn (vnu_compt)      := 'C';
          end loop;

          plpdf.row_print2 (v_data_row_plugn
                           ,v_bordr_cell
                           ,v_tail_plugn
                           ,v_algnm_plugn
                           ,v_style_cell
                           ,v_lign_max
                           ,obten_hautr_cel (gpi_parmt_impr.va_coln_polc_faml
                                            ,vnu_tail_polc_ent)
                           ,1);
        end if;
      end impri_ligne;
    begin
      vta_ligne_1   := analz_ligne_entet (vre_parmt_group_plugn.vva_ligne_1);
      vta_ligne_2   := analz_ligne_entet (vre_parmt_group_plugn.vva_ligne_2);
      vta_ligne_3   := analz_ligne_entet (vre_parmt_group_plugn.vva_ligne_3);


      if gpi_parmt_impr.nu_coln_polc_tail is not null
      then
        vnu_tail_polc_ent   := gpi_parmt_impr.nu_coln_polc_tail;
      else
        vnu_tail_polc_ent   := 11;
      end if;

      plpdf.setcolor4filling (obten_coulr_a_partr_hex (gre_coulr_pdf.vva_coulr_backg_entet));
      plpdf.setprintfont (convr_parmt_faml (gpi_parmt_impr.va_coln_polc_faml)
                         ,convr_parmt_poids (gpi_parmt_impr.va_coln_polc_poids
                                            ,'B')
                         ,vnu_tail_polc_ent);

      impri_ligne (vta_ligne_1);
      impri_ligne (vta_ligne_2);
      impri_ligne (vta_ligne_3);
    end impri_entet_plugn;
  begin
    begin
      -- Chercher le rapport interactif sur la page
      select apex_application.do_substitutions (pir.libl_regn)
            ,air.region_id id_plug
            ,air.no_data_found_message
            ,pir.seqnc
            ,pir.largr_deft
            ,apex_application.do_substitutions (air.show_nulls_as)
        --pir.unite_mesr_largr_deft
        into vva_nom_raprt
            ,vnu_id_plugn
            ,vva_mesg_aucun_don
            ,vnu_ref_ir
            ,vnu_largr_deft
            ,gva_valr_nul
        --vnu_unite_mesr_largr_deft
        from vd_afw_13_page_ir pir
            ,apex_ir           air
       where     pir.app_id_formt = pnu_aplic
             and pir.app_page_id_formt = pnu_page
             and air.id = pir.id_apex;

      -- Récupérer le select
      vnu_rpts_id   := afw_13_raprt_inter_pkg.obten_repts_courn ();
      vva_selct     := afw_13_raprt_inter_pkg.obten_selct_rpts (vnu_rpts_id);
    exception
      when no_data_found
      then
        vva_selct   := null;
    end;

    if vva_selct is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SPX.000001'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    vnu_largr_deft          := nvl (vnu_largr_deft, 0);

    if vnu_largr_deft <= 0
    then
      vnu_largr_deft   := 1.5;
    end if;

    -- Récupérer les paramètres du raport
    gpi_parmt_impr          := obten_parmt_impre_raprt (vnu_ref_ir);
    -- Obtenir les paramètres pour le surlignement
    vta_parmt_surlg         := obten_parmt_surlg_raprt (vnu_rpts_id);
    vre_parmt_group         := obten_parmt_group_raprt (vnu_rpts_id);
    vre_parmt_group_plugn   := obten_parmt_group_plugn (vnu_id_plugn);

    vva_nom_raprt           :=
      nvl (replace (gpi_parmt_impr.va_entet_texte
                   ,'#TITLE#'
                   ,vva_nom_raprt)
          ,vva_nom_raprt);
    vva_nom_raprt           := apex_application.do_substitutions (vva_nom_raprt);
    vva_nom_raprt           := formt_chain_br (vva_nom_raprt);

    --Obtenir la procédure de couleur
    vva_procd_coulr         := afw_11_prodt_pkg.obten_procd_coulr_plpdf (afw_11_aplic_pkg.obten_prodt (afw_11_aplic_pkg.obten_aplic (pnu_aplic)));

    if vva_procd_coulr is not null
    then
      defnr_coulr_pdf (vva_procd_coulr);
    end if;

    vva_procd_entet         := afw_11_prodt_pkg.obten_procd_entet_plpdf (afw_11_aplic_pkg.obten_prodt (afw_11_aplic_pkg.obten_aplic (pnu_aplic)));
    vva_procd_pied_page     := afw_11_prodt_pkg.obten_procd_pied_page_plpdf (afw_11_aplic_pkg.obten_prodt (afw_11_aplic_pkg.obten_aplic (pnu_aplic)));

    vnu_cursr               :=
      afw_07_sql_pkg.ouvri_selct (vnu_ref_ir
                                 ,vnu_rpts_id
                                 ,apex_application.do_substitutions (vva_selct)
                                 ,var_infor_coln
                                 ,   chr (10)
                                  || chr (13));

    declare
      vbo_aucun_afich   boolean default true;
    begin
      if var_infor_coln.first () is not null
      then
        for i in var_infor_coln.first () .. var_infor_coln.last ()
        loop
          if var_infor_coln (i).va_indic_expor = 'O'
          then
            vbo_aucun_afich   := false;
            exit;
          end if;
        end loop;
      end if;

      if vbo_aucun_afich
      then
        var_infor_coln.delete ();
      end if;
    end;

    if var_infor_coln.first () is not null
    then
      -- vnu_largr_dispo                            := obten_largr_dispo_page (gpi_parmt_impr);

      -- Transformer toutes les valeurs en pouces
      vnu_index_page                             := 1;
      -- Créer la premiere page
      var_pages (vnu_index_page).nu_dernr_coln   := 0;

      for i in var_infor_coln.first () .. var_infor_coln.last ()
      loop
        if var_infor_coln (i).va_indic_expor = 'O'
        then
          -- La page sera créée si elle n'existe pas
          var_pages (vnu_index_page).nu_dernr_coln   := i;
          var_pages (vnu_index_page).nu_largr        := var_pages (vnu_index_page).nu_largr + var_infor_coln (i).nu_largr_reltv;
        end if;
      end loop;

      begin
        init_group_entet;
        init_calcl_fonct;

        init_pdf;

        trans_libl;
        calcl_largr_raprt;

        impri_entet_plugn;

        if not gbo_presn_group
        then
          impri_entet;
        end if;

        -- Écrire les données
        while afw_07_sql_pkg.lire_ligne_selct (vnu_cursr
                                              ,var_infor_coln)
        loop
          --Créer une nouvelle entête de tableau sur une nouvelle page s'il reste des données
          if round ( (plpdf.getpageavailableheight - 34.05)
                   ,0) < round (plpdf.getcurrenty
                               ,0)
          then
            impri_pied_page;
            plpdf.newpage;
            gerer_group_entet;
            impri_entet;
          end if;

          if verfr_chang_group
          then
            if     vnu_tail_group <> 0
               and vbo_presn_fonct
            then
              termn_group_entet;
              init_calcl_fonct;
            end if;

            --Ajouter code pour saut de page si indicateur saut page groupe est à oui

            if round ( (plpdf.getpageavailableheight - 34.05)
                     ,0) < round (plpdf.getcurrenty
                                 ,0)
            then
              impri_pied_page;
              plpdf.newpage;
              gerer_group_entet;
              impri_entet;
            end if;

            gerer_group_entet;
            impri_entet;
          end if;

          init_surlg_ligne;
          calcl_fonct;

          --Remplir le tableau
          defnr_ligne;

          --Définir le highlight pour la ligne courante.
          defnr_surlg;

          if round ( (plpdf.getpageavailableheight - 34.05)
                   ,0) < round (plpdf.getcurrenty
                               ,0)
          then
            impri_pied_page;
            plpdf.newpage;
            gerer_group_entet;
            impri_entet;
          end if;

          --imprimer la ligne
          impri_corps;
        end loop;

        --pied de page
        if vbo_presn_fonct
        then
          termn_group_entet;
        end if;

        impri_pied_page;

        --Envoyer les données au fichier blob
        plpdf.senddoc (v_blob);
      end;

      --téléverser pdf
      owa_util.mime_header ('application/pdf'
                           ,false);
      htp.p (   'Content-length: '
             || dbms_lob.getlength (v_blob));
      htp.p (   'Content-Disposition: attachment; filename="'
             || replace (   formt_nom_fichr (vva_nom_raprt)
                         || '.pdf'
                        ,chr (13)
                        ,'_'));
      owa_util.http_header_close ();
      wpg_docload.download_file (v_blob);
    else
      null;
      -- On a un problème... afficher une erreur dans le PDF ou lever une erreur...
      htp.p ('<h1>Aucune colonne affichable n''a été trouvée.</h1>');
    end if;

    -- Fermer le curseur
    afw_07_sql_pkg.fermr_selct (vnu_cursr);

    -- Arrêter tous les autres traitements d'APEX
    afw_07_util_pkg.aret_trait_page_apex;
  exception
    when others
    then
      ete ();
  end;

  procedure afich_csv (pnu_aplic        in number default afw_07_util_pkg.v ('APP_ID')
                      ,pnu_page         in number default afw_07_util_pkg.v ('APP_PAGE_ID')
                      ,pva_seprt_coln   in varchar2 default kva_seprt_coln)
  is
    vbo_dirct            boolean default false;
    vnu_ref_ir           number;
    vva_nom_raprt        varchar2 (200);
    vva_mesg_aucun_don   varchar2 (32767);
    vnu_largr_deft       number;
    --vnu_unite_mesr_largr_deft number(10);

    vva_selct            varchar2 (32767);
    vnu_cursr            number;
    var_infor_coln       afw_07_sql_pkg.typ_arr_infor_coln;
    vcl_corps            clob;
    vva_seprt_coln       varchar2 (1);
    vnu_compt_ligne      number;
    vnu_rpts_id          number;

    procedure ajouter (pva_pre      in varchar2
                      ,pva_chaine   in varchar2)
    is
    begin
      if    pva_pre is not null
         or pva_chaine is not null
      then
        if vbo_dirct
        then
          --htp.putraw (utl_raw.cast_to_raw(pva_pre || pva_chaine));
          htp.prn (   pva_pre
                   || pva_chaine);
        --dbms_output.put (pva_pre || pva_chaine);
        else
          dbms_lob.writeappend (vcl_corps
                               ,length (   pva_pre
                                        || pva_chaine)
                               ,   pva_pre
                                || pva_chaine);
        end if;
      end if;
    end;

    procedure ajouter_chaine (pva_pre      in varchar2
                             ,pva_chaine   in varchar2)
    is
    begin
      ajouter (pva_pre
              ,   '"'
               || replace (pva_chaine
                          ,'"'
                          ,'""')
               || '"');
    end;
  begin
    begin
      -- Chercher le rapport interactif sur la page
      select pir.libl_regn
            ,air.no_data_found_message
            ,pir.seqnc
            ,pir.largr_deft
        --pir.unite_mesr_largr_deft
        into vva_nom_raprt
            ,vva_mesg_aucun_don
            ,vnu_ref_ir
            ,vnu_largr_deft
        --vnu_unite_mesr_largr_deft
        from vd_afw_13_page    pag
            ,vd_afw_13_page_ir pir
            ,apex_ir           air
       where     pag.ref_aplic = afw_11_aplic_pkg.obten_aplic_numr_apex (pnu_aplic)
             and pag.numr_apex = pnu_page
             and pir.ref_page = pag.seqnc
             and air.id = pir.id_apex;

      -- Récupérer le select
      vnu_rpts_id   := afw_13_raprt_inter_pkg.obten_repts_courn ();
      vva_selct     := afw_13_raprt_inter_pkg.obten_selct_rpts (vnu_rpts_id);
    exception
      when no_data_found
      then
        vva_selct   := null;
    end;

    if vva_selct is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SPX.000001'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    vnu_cursr      :=
      afw_07_sql_pkg.ouvri_selct (vnu_ref_ir
                                 ,vnu_rpts_id
                                 ,vva_selct
                                 ,var_infor_coln
                                 ,chr (10));

    declare
      vbo_aucun_afich   boolean default true;
    begin
      if var_infor_coln.first () is not null
      then
        for i in var_infor_coln.first () .. var_infor_coln.last ()
        loop
          if var_infor_coln (i).va_indic_expor = 'O'
          then
            vbo_aucun_afich   := false;
            exit;
          end if;
        end loop;
      end if;

      if vbo_aucun_afich
      then
        var_infor_coln.delete ();
      end if;
    end;

    if var_infor_coln.first () is not null
    then
      if vbo_dirct
      then
        owa_util.mime_header ('text/csv'
                             ,false);
        htp.p (   'Content-Disposition: attachment; filename="'
               || formt_nom_fichr (vva_nom_raprt)
               || '.csv'
               || '"');
        --dbms_output.put_line ('HTTP/1.x 200 OK');
        --dbms_output.put_line ('Content-Type: text/csv; charset=UTF-8');
        --dbms_output.put_line ('Content-Disposition: attachment; filename="' || formt_nom_fichr(vva_nom_raprt) || '.csv' || '"');
        owa_util.http_header_close;
      --dbms_output.put_line (null);
      else
        dbms_lob.createtemporary (vcl_corps
                                 ,true);
      end if;

      -- Créer la ligne d'entête
      vva_seprt_coln    := null;

      for i in var_infor_coln.first () .. var_infor_coln.last ()
      loop
        if var_infor_coln (i).va_indic_expor = 'O'
        then
          ajouter_chaine (vva_seprt_coln
                         ,var_infor_coln (i).va_libl);
          vva_seprt_coln   := pva_seprt_coln;
        end if;
      end loop;

      -- Saut de ligne
      ajouter (null
              ,chr (10));

      -- Écrire les données
      vnu_compt_ligne   := 0;

      while afw_07_sql_pkg.lire_ligne_selct (vnu_cursr
                                            ,var_infor_coln)
      loop
        vnu_compt_ligne   := vnu_compt_ligne + 1;

        vva_seprt_coln    := null;

        for i in var_infor_coln.first () .. var_infor_coln.last ()
        loop
          if var_infor_coln (i).va_indic_expor = 'O'
          then
            case var_infor_coln (i).va_type_valr
              when 'VARCH'
              then
                ajouter_chaine (vva_seprt_coln
                               ,var_infor_coln (i).va_valr_varch);
              when 'NUMBR'
              then
                ajouter_chaine (vva_seprt_coln
                               ,var_infor_coln (i).nu_valr_numbr);
              when 'DATE'
              then
                ajouter_chaine (vva_seprt_coln
                               ,to_char (var_infor_coln (i).da_valr_date
                                        ,'YYYY-MM-DD'));
              when 'TIMST'
              then
                ajouter_chaine (vva_seprt_coln
                               ,var_infor_coln (i).ts_valr_timst);
              else
                ajouter_chaine (vva_seprt_coln
                               ,var_infor_coln (i).va_valr_varch);
            end case;

            vva_seprt_coln   := pva_seprt_coln;
          end if;
        end loop;

        -- Saut de ligne
        ajouter (null
                ,chr (10));
      end loop;

      if vnu_compt_ligne = 0
      then
        ajouter_chaine (null
                       ,vva_mesg_aucun_don);
        ajouter (null
                ,chr (10));
      end if;

      if vbo_dirct
      then
        null;
      else
        afw_11_prodt_pkg.telvs_fichr (vcl_corps
                                     ,   formt_nom_fichr (vva_nom_raprt)
                                      || '.csv'
                                     ,true
                                     ,'texte/csv');

        dbms_lob.freetemporary (vcl_corps);
      end if;
    else
      null;
      -- On a un problème... afficher une erreur dans le PDF ou lever une erreur...
      htp.p ('<h1>Aucune colonne affichable n''a été trouvée.</h1>');
    end if;

    -- Fermer le curseur
    afw_07_sql_pkg.fermr_selct (vnu_cursr);

    -- Arrêter tous les autres traitements d'APEX
    afw_07_util_pkg.aret_trait_page_apex;
  /*exception
                                                                                                                                                                                                                                                                                    when others then
    htp.p (sqlerrm);*/
  end;
end afw_25_plpdf_expor_ir_pkg;
/
