SET DEFINE OFF;
create or replace package body afw_25_raprt_inter_expor_pkg
as
  knu_marge_gauch   constant number default 0.5;
  knu_marge_droit   constant number default 0.5;

  type typ_rec_parmt_impre is record
  (
    va_indic_trouv        varchar2 (1) default 'N'
   ,va_contn_disps        apex_regn.prn_content_disposition%type default 'ATTACHMENT'
   ,va_formt_papr         apex_regn.prn_paper_size%type default 'LETTER'
   ,va_orien_papr         apex_regn.prn_orientation%type default 'VERTICAL'
   ,va_unite_mesr         apex_regn.prn_units%type default 'INCHES'
   ,nu_largr_papr         apex_regn.prn_width%type default 8.5
   ,nu_hautr_papr         apex_regn.prn_height%type default 11
   ,nu_bordr_tail         apex_regn.prn_border_width%type default 0.5
   ,va_bordr_coulr        apex_regn.prn_border_color%type
   ,va_entet_polc_faml    apex_regn.prn_page_header_font_family%type default 'Helvetica'
   ,va_entet_polc_poids   apex_regn.prn_page_header_font_weight%type default 'normal'
   ,nu_entet_polc_tail    apex_regn.prn_page_header_font_size%type default 12
   ,va_entet_polc_coulr   apex_regn.prn_page_header_font_color%type
   ,va_entet_align        apex_regn.prn_page_header_alignment%type default 'LEFT'
   ,va_entet_texte        apex_regn.prn_page_header%type
   ,va_coln_polc_faml     apex_regn.prn_header_font_family%type default 'Helvetica'
   ,va_coln_polc_poids    apex_regn.prn_header_font_weight%type default 'bold'
   ,nu_coln_polc_tail     apex_regn.prn_header_font_size%type default 8
   ,va_coln_polc_coulr    apex_regn.prn_header_font_color%type
   ,va_coln_fond_coulr    apex_regn.prn_header_bg_color%type default '#e0e0e0'
   ,va_corps_polc_faml    apex_regn.prn_body_font_family%type default 'Helvetica'
   ,va_corps_polc_poids   apex_regn.prn_body_font_weight%type default 'normal'
   ,nu_corps_polc_tail    apex_regn.prn_body_font_size%type default 8
   ,va_corps_polc_coulr   apex_regn.prn_body_font_color%type
   ,va_corps_fond_coulr   apex_regn.prn_body_bg_color%type default '#f5f5f5'
   ,va_pied_polc_faml     apex_regn.prn_page_footer_font_family%type default 'Helvetica'
   ,va_pied_polc_poids    apex_regn.prn_page_footer_font_weight%type default 'normal'
   ,nu_pied_polc_tail     apex_regn.prn_page_footer_font_size%type default 8
   ,va_pied_polc_coulr    apex_regn.prn_page_footer_font_color%type
   ,va_pied_align         apex_regn.prn_page_footer_alignment%type default 'LEFT'
   ,va_pied_texte         apex_regn.prn_page_footer%type
  );

  type typ_rec_page is record
  (
    nu_largr        number default 0
   ,nu_dernr_coln   binary_integer default 0
  );

  type typ_arr_page is table of typ_rec_page
    index by binary_integer;

  gar_tail_papr              afw_07_sql_pkg.typ_arr_ndx_vc30;

  function formt_nom_fichr (pva_nom in varchar2)
    return varchar2
  is
    vva_nom   varchar2 (1000) default lower (pva_nom);
  begin
    vva_nom      :=
      afw_07_sql_pkg.rempl_br (vva_nom
                              ,'_');

    return substr (translate (vva_nom
                             ,'çàâéèêöùû /\?'
                             ,'caaeeeouu____')
                  ,1
                  ,120);
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

  function obten_parmt_impre_raprt (pnu_ref_ir in number)
    return typ_rec_parmt_impre
  is
    vpi_deft         typ_rec_parmt_impre;
    vpi_parmt_impr   typ_rec_parmt_impre;
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
        into vpi_parmt_impr
        from vd_afw_13_page_ir pir
            ,apex_ir           air
            ,apex_regn         reg
       where     pir.seqnc = pnu_ref_ir
             and air.id = pir.id_apex
             and reg.id = air.region_id;
    exception
      when no_data_found
      then
        vpi_parmt_impr.va_indic_trouv   := 'N';
    end;

    return vpi_parmt_impr;
  end;


  procedure afich_pdf (pnu_aplic   in number default afw_07_util_pkg.v ('APP_ID')
                      ,pnu_page    in number default afw_07_util_pkg.v ('APP_PAGE_ID'))
  is
    vpi_parmt_impr         typ_rec_parmt_impre;

    vnu_ref_ir             number;
    vva_nom_raprt          varchar2 (200);
    vva_mesg_aucun_don     varchar2 (32767);
    vnu_largr_deft         number;
    --vnu_unite_mesr_largr_deft number(10);

    vva_selct              varchar2 (32767);
    vnu_cursr              number;
    var_infor_coln         afw_07_sql_pkg.typ_arr_infor_coln;
    vnu_largr_dispo        number;
    vnu_compt_ligne        number;

    var_pages              typ_arr_page;
    vnu_index_page         binary_integer;
    vnu_somme_largr        number;
    vnu_dernr_coln_ajout   number;
    vnu_rpts_id            number;

    -- variables plpdf
    vnu_elmnt_lign         number := 0;
    vnu_elmnt_tabl         number := 0;
    vnu_elmnt_restn        number := 0;
    vnu_tail_polc_ent      number := 0;
    vnu_tail_polc_corps    number := 0;
    vnu_tail_polc_pied     number := 0;
    vnu_largr_restn        number := 0;
    vva_elmnt              varchar2 (300);
    vbo_type_indtr         boolean := false;
    v_blob                 blob;

    --variable des paramètres du tableau
    v_bordr_cell           plpdf_type.t_row_borders;
    v_data_cell            plpdf_type.t_row_datas;
    v_data_row_ent         plpdf_type.t_row_datas;
    v_tail_cell            plpdf_type.t_row_widths;
    v_tail_intr_cell       plpdf_type.t_row_widths;
    v_algnm_cell           plpdf_type.t_row_aligns;
    v_algnm_entet          plpdf_type.t_row_aligns;
    v_style_cell           plpdf_type.t_row_styles;
    v_lign_max             plpdf_type.t_row_maxlines;
  begin
    begin
      -- Chercher le rapport interactif sur la page
      select /*pir.libl_regn*/
             (select plug_name
                from apex_regn reg
               where reg.id = air.region_id)
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

    vva_nom_raprt    := aa.do_substitutions (vva_nom_raprt);

    if vva_selct is null
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SPX.000001'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    vnu_largr_deft   := nvl (vnu_largr_deft, 0);

    if vnu_largr_deft <= 0
    then
      vnu_largr_deft   := 1.5;
    end if;

    -- Récupérer les paramètres du raport
    vpi_parmt_impr   := obten_parmt_impre_raprt (vnu_ref_ir);

    vnu_cursr        :=
      afw_07_sql_pkg.ouvri_selct (vnu_ref_ir
                                 ,vnu_rpts_id
                                 ,vva_selct
                                 ,var_infor_coln
                                 ,'\n');

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
      -- vnu_largr_dispo                            := obten_largr_dispo_page (vpi_parmt_impr);

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


      -- Instancier le titre du rapport
      declare
        vva_titre_raprt   varchar2 (1000);
      begin
        vva_titre_raprt   := apex_application.do_substitutions (vpi_parmt_impr.va_entet_texte);
        vva_titre_raprt      :=
          afw_07_sql_pkg.rempl_br (vva_titre_raprt
                                  ,' ');

        vva_titre_raprt      :=
          nvl (replace (vva_titre_raprt
                       ,'#TITLE#'
                       ,vva_nom_raprt)
              ,vva_nom_raprt);
        vva_titre_raprt      :=
          afw_07_sql_pkg.rempl_br (vva_titre_raprt
                                  ,chr (10));
      end;

      begin
        --compter le nombre d'éléments
        for i in var_infor_coln.first () .. var_infor_coln.last ()
        loop
          if var_infor_coln (i).va_indic_expor = 'O'
          then
            vnu_elmnt_lign   := vnu_elmnt_lign + 1;
          end if;
        end loop;

        --initialiser le pdf
        if vnu_elmnt_lign > 4
        then
          plpdf.init ('L');
          plpdf.nopalias;
          plpdf.setdoctitle (   formt_nom_fichr (vva_nom_raprt)
                             || '.pdf');
          plpdf.setallmargin (afw_25_plpdf_util_pkg.convr (knu_marge_droit
                                                          ,'cm')
                             ,afw_25_plpdf_util_pkg.convr (0.5
                                                          ,'cm')
                             ,afw_25_plpdf_util_pkg.convr (knu_marge_gauch
                                                          ,'cm'));
          plpdf.newpage;
          plpdf.setprintfont (convr_parmt_faml (vpi_parmt_impr.va_entet_polc_faml)
                             ,convr_parmt_poids (vpi_parmt_impr.va_entet_polc_poids
                                                ,'B')
                             ,14);
          plpdf.printcell (0
                          ,10
                          ,vva_nom_raprt
                          ,0
                          ,0
                          ,'C');
          plpdf.linebreak (20);
        else
          plpdf.init;
          plpdf.nopalias;
          plpdf.setdoctitle (   formt_nom_fichr (vva_nom_raprt)
                             || '.pdf');
          plpdf.setallmargin (afw_25_plpdf_util_pkg.convr (knu_marge_droit
                                                          ,'cm')
                             ,afw_25_plpdf_util_pkg.convr (0.5
                                                          ,'cm')
                             ,afw_25_plpdf_util_pkg.convr (knu_marge_gauch
                                                          ,'cm'));
          plpdf.newpage;
          plpdf.setprintfont (convr_parmt_faml (vpi_parmt_impr.va_entet_polc_faml)
                             ,convr_parmt_poids (vpi_parmt_impr.va_entet_polc_poids
                                                ,'B')
                             ,14);
          plpdf.printcell (0
                          ,10
                          ,vva_nom_raprt
                          ,0
                          ,0
                          ,convr_parmt_align (vpi_parmt_impr.va_entet_align
                                             ,'C'));
          plpdf.linebreak (20);
        end if;

        -- Créer les différents set d'entêtes (tableau)
        vnu_dernr_coln_ajout   := 0;
        vnu_largr_restn        := (plpdf.getpageavailablewidth);
        vnu_elmnt_restn        := vnu_elmnt_lign;

        for j in var_pages.first () .. var_pages.last ()
        loop
          for i in vnu_dernr_coln_ajout + 1 .. var_pages (j).nu_dernr_coln
          loop
            if var_infor_coln (i).va_indic_expor = 'O'
            then
              --Taille selon la largeur du champ
              case var_infor_coln (i).va_type_largr
                when 'POUCE'
                then
                  var_infor_coln (i).nu_largr_reltv      :=
                    afw_25_plpdf_util_pkg.convr (var_infor_coln (i).nu_largr
                                                ,'in');
                  v_tail_intr_cell (i)   := (var_infor_coln (i).nu_largr_reltv / plpdf.getpageavailablewidth) * 100;
                when 'POURC'
                then
                  var_infor_coln (i).nu_largr_reltv   := var_infor_coln (i).nu_largr / 100;
                  v_tail_intr_cell (i)                := plpdf.getpageavailablewidth * var_infor_coln (i).nu_largr_reltv;
                when 'POINT'
                then
                  var_infor_coln (i).nu_largr_reltv   := var_infor_coln (i).nu_largr;
                  v_tail_intr_cell (i)                := var_infor_coln (i).nu_largr_reltv;
                else
                  v_tail_intr_cell (i)   := vnu_largr_restn / vnu_elmnt_restn;
              end case;

              vnu_elmnt_tabl                  := vnu_elmnt_tabl + 1;

              vva_elmnt                       := var_infor_coln (i).va_libl;

              v_bordr_cell (vnu_elmnt_tabl)   := '1';
              v_tail_cell (vnu_elmnt_tabl)    := v_tail_intr_cell (i);

              if var_infor_coln (i).va_type_largr != 'INDET'
              then
                vnu_largr_restn   := vnu_largr_restn - v_tail_cell (vnu_elmnt_tabl);
                vnu_elmnt_restn   := vnu_elmnt_lign - vnu_elmnt_tabl;
              else
                --Vérifier s'il y d'autre type que 'indeterminé' et calculer la largeur restante
                for k in i .. var_pages (j).nu_dernr_coln
                loop
                  if     k != var_pages (j).nu_dernr_coln
                     and var_infor_coln (k).va_type_largr != 'INDET'
                  then
                    vbo_type_indtr   := true;
                  end if;
                end loop;

                if vbo_type_indtr
                then
                  vnu_largr_restn   := vnu_largr_restn - v_tail_cell (vnu_elmnt_tabl);
                  vnu_elmnt_restn   := vnu_elmnt_lign - vnu_elmnt_tabl;
                end if;
              end if;

              v_algnm_entet (vnu_elmnt_tabl)      :=
                convr_parmt_align (var_infor_coln (i).va_align_entet
                                  ,'C');
              v_data_cell (vnu_elmnt_tabl)    := vva_elmnt;
              vbo_type_indtr                  := false;
            end if;
          end loop;

          vnu_dernr_coln_ajout   := var_pages (j).nu_dernr_coln;
        end loop;

        vnu_elmnt_tabl         := 0;

        if vpi_parmt_impr.nu_coln_polc_tail is not null
        then
          vnu_tail_polc_ent   := vpi_parmt_impr.nu_coln_polc_tail;
        else
          vnu_tail_polc_ent   := 11;
        end if;

        plpdf.setcolor4filling (224
                               ,224
                               ,224);
        plpdf.setprintfont (convr_parmt_faml (vpi_parmt_impr.va_coln_polc_faml)
                           ,convr_parmt_poids (vpi_parmt_impr.va_coln_polc_poids
                                              ,'B')
                           ,vnu_tail_polc_ent);
        v_data_row_ent         := v_data_cell;
        plpdf.row_print2 (v_data_cell
                         ,v_bordr_cell
                         ,v_tail_cell
                         ,v_algnm_entet
                         ,v_style_cell
                         ,v_lign_max
                         ,10
                         ,1);

        -- Écrire les données
        vnu_compt_ligne        := 0;

        while afw_07_sql_pkg.lire_ligne_selct (vnu_cursr
                                              ,var_infor_coln)
        loop
          vnu_compt_ligne   := vnu_compt_ligne + 1;

          --Instancier les couleurs de fond des lignes paires et impaires
          if mod (vnu_compt_ligne
                 ,2) = 0
          then
            plpdf.setcolor4filling (245
                                   ,245
                                   ,245);
          else
            plpdf.setcolor4filling (255
                                   ,255
                                   ,255);
          end if;

          --Remplir le tableau
          for i in var_infor_coln.first () .. var_infor_coln.last ()
          loop
            if var_infor_coln (i).va_indic_expor = 'O'
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
                    vva_elmnt   := '-';
                  end if;
                when 'NUMBR'
                then
                  if var_infor_coln (i).va_formt is null
                  then
                    vva_elmnt   := '-';
                  else
                    vva_elmnt      :=
                      (ltrim (to_char (var_infor_coln (i).nu_valr_numbr
                                      ,var_infor_coln (i).va_formt)));
                  end if;
                when 'DATE'
                then
                  if to_char (var_infor_coln (i).da_valr_date
                             ,var_infor_coln (i).va_formt)
                       is null
                  then
                    vva_elmnt   := '-';
                  else
                    vva_elmnt      :=
                      (to_char (var_infor_coln (i).da_valr_date
                               ,var_infor_coln (i).va_formt));
                  end if;
                when 'TIMST'
                then
                  if var_infor_coln (i).va_formt is null
                  then
                    vva_elmnt   := '-';
                  else
                    vva_elmnt      :=
                      (to_char (var_infor_coln (i).ts_valr_timst
                               ,var_infor_coln (i).va_formt));
                  end if;
                else
                  vva_elmnt   := var_infor_coln (i).va_valr_varch;
              end case;

              v_algnm_cell (vnu_elmnt_tabl)      :=
                convr_parmt_align (var_infor_coln (i).va_align_coln
                                  ,'C');
              v_data_cell (vnu_elmnt_tabl)    := vva_elmnt;
            end if;
          end loop;

          vnu_elmnt_tabl    := 0;

          if vpi_parmt_impr.nu_corps_polc_tail is not null
          then
            vnu_tail_polc_corps   := vpi_parmt_impr.nu_corps_polc_tail;
          else
            vnu_tail_polc_corps   := 8;
          end if;

          plpdf.setprintfont (convr_parmt_faml (vpi_parmt_impr.va_corps_polc_faml)
                             ,convr_parmt_poids (vpi_parmt_impr.va_corps_polc_poids
                                                ,null)
                             ,vnu_tail_polc_corps);
          plpdf.row_print2 (v_data_cell
                           ,v_bordr_cell
                           ,v_tail_cell
                           ,v_algnm_cell
                           ,v_style_cell
                           ,v_lign_max
                           ,5
                           ,1);

          if vpi_parmt_impr.nu_pied_polc_tail is not null
          then
            vnu_tail_polc_pied   := vpi_parmt_impr.nu_pied_polc_tail;
          else
            vnu_tail_polc_pied   := 8;
          end if;

          --pied de page
          if round ( (plpdf.getpageavailableheight - 20)
                   ,0) < round (plpdf.getcurrenty
                               ,0)
          then
            plpdf.setcurrenty (round (plpdf.getpageavailableheight - 6
                                     ,0));
            plpdf.setprintfont (convr_parmt_faml (vpi_parmt_impr.va_pied_polc_faml)
                               ,convr_parmt_poids (vpi_parmt_impr.va_pied_polc_poids
                                                  ,null)
                               ,vnu_tail_polc_pied);

            if vpi_parmt_impr.va_pied_texte is not null
            then
              plpdf.printcell (0
                              ,10
                              ,apex_application.do_substitutions (vpi_parmt_impr.va_pied_texte)
                              ,0
                              ,0
                              ,'C');
            end if;

            plpdf.printcell (0
                            ,10
                            ,to_char (plpdf.currentpagenumber)
                            ,0
                            ,0
                            ,'C');

            --Créer une nouvelle entête de tableau sur une nouvelle page s'il reste des données
            if afw_07_sql_pkg.lire_ligne_selct (vnu_cursr
                                               ,var_infor_coln) = true
            then
              plpdf.newpage;
              plpdf.setprintfont (convr_parmt_faml (vpi_parmt_impr.va_coln_polc_faml)
                                 ,convr_parmt_poids (vpi_parmt_impr.va_coln_polc_poids
                                                    ,null)
                                 ,vnu_tail_polc_ent);
              plpdf.setcolor4filling (224
                                     ,224
                                     ,224);
              plpdf.row_print2 (v_data_row_ent
                               ,v_bordr_cell
                               ,v_tail_cell
                               ,v_algnm_entet
                               ,v_style_cell
                               ,v_lign_max
                               ,10
                               ,1);
            end if;
          end if;
        end loop;

        --pied de page
        plpdf.setcurrenty (round (plpdf.getpageavailableheight - 6
                                 ,0));
        plpdf.setprintfont (convr_parmt_faml (vpi_parmt_impr.va_pied_polc_faml)
                           ,convr_parmt_poids (vpi_parmt_impr.va_pied_polc_poids
                                              ,null)
                           ,vnu_tail_polc_pied);

        if vpi_parmt_impr.va_pied_texte is not null
        then
          plpdf.printcell (0
                          ,10
                          ,apex_application.do_substitutions (vpi_parmt_impr.va_pied_texte)
                          ,0
                          ,0
                          ,'C');
        end if;

        plpdf.printcell (0
                        ,10
                        ,to_char (plpdf.currentpagenumber)
                        ,0
                        ,0
                        ,'C');

        --Envoyer les données au fichier blob
        plpdf.senddoc (v_blob);
      end;

      --téléverser pdf
      owa_util.mime_header ('application/pdf'
                           ,false);
      htp.p (   'Content-length: '
             || dbms_lob.getlength (v_blob));
      htp.p (   'Content-Disposition: attachment; filename="'
             || formt_nom_fichr (vva_nom_raprt)
             || '.pdf');
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
                                     ,'texte/csv, charset=UTF-8');

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
end afw_25_raprt_inter_expor_pkg;
/
