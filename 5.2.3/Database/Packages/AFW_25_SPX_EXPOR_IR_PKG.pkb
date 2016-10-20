SET DEFINE OFF;
create or replace package body afw_25_spx_expor_ir_pkg
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

  procedure alimn_tail_papr (ppi_parmt in typ_rec_parmt_impre)
  is
    vnu_factr_conv   number;
  begin
    gar_tail_papr ('LETTER-L')    := 8.5;
    gar_tail_papr ('LETTER-H')    := 11;

    gar_tail_papr ('LEGAL-L')     := 8.5;
    gar_tail_papr ('LEGAL-H')     := 14;

    gar_tail_papr ('A4-L')        := 8.26;
    gar_tail_papr ('A4-H')        := 11.69;

    gar_tail_papr ('A3-L')        := 11.69;
    gar_tail_papr ('A3-H')        := 16.53;

    gar_tail_papr ('TABLOID-L')   := 17;
    gar_tail_papr ('TABLOID-H')   := 11;

    if    nvl (ppi_parmt.nu_largr_papr, 0) = 0
       or nvl (ppi_parmt.nu_hautr_papr, 0) = 0
    then
      gar_tail_papr ('CUSTOM-L')   := gar_tail_papr ('LETTER-L');
      gar_tail_papr ('CUSTOM-H')   := gar_tail_papr ('LETTER-H');
    else
      vnu_factr_conv      :=
        case upper (nvl (ppi_parmt.va_unite_mesr, 'INCHES')) when 'POINTS' then 72 when 'MILLIMETERS' then 25.4 when 'CENTIMETERS' then 2.54 else 1 --Défaut: INCHES
                                                                                                                                                   end;
      gar_tail_papr ('CUSTOM-L')      :=
        round (ppi_parmt.nu_largr_papr / vnu_factr_conv
              ,2);
      gar_tail_papr ('CUSTOM-H')      :=
        round (ppi_parmt.nu_hautr_papr / vnu_factr_conv
              ,2);
    end if;
  end;

  function convr_parmt_largr_papr (ppi_parmt in typ_rec_parmt_impre)
    return number
  is
    vva_axe     varchar2 (1);
    vva_index   varchar2 (30);
  begin
    if nvl (ppi_parmt.va_orien_papr, 'VERTICAL') = 'VERTICAL'
    then
      vva_axe   := 'L';
    else
      vva_axe   := 'H';
    end if;

    vva_index      :=
         ppi_parmt.va_formt_papr
      || '-'
      || vva_axe;

    if not gar_tail_papr.exists (vva_index)
    then
      vva_index      :=
           'LETTER-'
        || vva_axe;
    end if;

    return gar_tail_papr (vva_index);
  end;

  function convr_parmt_hautr_papr (ppi_parmt in typ_rec_parmt_impre)
    return number
  is
    vva_axe     varchar2 (1);
    vva_index   varchar2 (30);
  begin
    if nvl (ppi_parmt.va_orien_papr, 'VERTICAL') = 'VERTICAL'
    then
      vva_axe   := 'H';
    else
      vva_axe   := 'L';
    end if;

    vva_index      :=
         ppi_parmt.va_formt_papr
      || '-'
      || vva_axe;

    if not gar_tail_papr.exists (vva_index)
    then
      vva_index      :=
           'LETTER-'
        || vva_axe;
    end if;

    return gar_tail_papr (vva_index);
  end;

  function convr_parmt_align (pva_parmt   in varchar2
                             ,pva_deft    in varchar2)
    return varchar2
  is
  begin
    return case upper (pva_parmt) when 'LEFT' then 'gauche' when 'RIGHT' then 'droite' when 'CENTER' then 'centre' else pva_deft end;
  end;

  function convr_parmt_faml (pva_parmt in varchar2)
    return varchar2
  is
  begin
    return case lower (pva_parmt) when 'times' then 'times new roman' when 'courier' then 'courier' else 'helvetica' -- Défaut
                                                                                                                    end;
  end;

  function convr_parmt_poids (pva_parmt   in varchar2
                             ,pva_deft    in varchar2)
    return varchar2
  is
  begin
    return case lower (pva_parmt) when 'bold' then 'gras' when 'normal' then 'normal' else pva_deft end;
  end;

  procedure ecrir_feuil_style (ppi_parmt in typ_rec_parmt_impre)
  is
  begin
    spx_xml_pkg.creer_sectn_feuil_style ();

    -- Marges gauches et droites sont communes
    spx_xml_pkg.creer_sectn_style ();
    spx_xml_pkg.creer_elemn_cible_style ('entete');
    spx_xml_pkg.creer_elemn_cible_style ('pied-page');
    spx_xml_pkg.creer_elemn_cible_style ('section');
    spx_xml_pkg.creer_elemn_atrib_numrq ('marge-gauche'
                                        ,knu_marge_gauch);
    spx_xml_pkg.creer_elemn_atrib_numrq ('marge-droite'
                                        ,knu_marge_droit);
    spx_xml_pkg.fermr_sectn ('style');

    spx_xml_pkg.creer_sectn_style ('entete');
    spx_xml_pkg.creer_elemn_atrib_numrq ('marge-haut'
                                        ,0.5);
    spx_xml_pkg.creer_elemn_atrib ('police-famille'
                                  ,convr_parmt_faml (ppi_parmt.va_entet_polc_faml));
    spx_xml_pkg.creer_elemn_atrib ('police-poids'
                                  ,convr_parmt_poids (ppi_parmt.va_entet_polc_poids
                                                     ,'gras'));
    spx_xml_pkg.creer_elemn_atrib_numrq ('police-taille'
                                        ,nvl (ppi_parmt.nu_entet_polc_tail, 10));

    if ppi_parmt.va_entet_polc_coulr like '#%'
    then
      spx_xml_pkg.creer_elemn_atrib ('police-couleur'
                                    ,ppi_parmt.va_entet_polc_coulr);
    end if;

    spx_xml_pkg.creer_elemn_atrib ('alignement-h'
                                  ,convr_parmt_align (ppi_parmt.va_entet_align
                                                     ,'gauche'));
    spx_xml_pkg.fermr_sectn ('style');

    begin
      spx_xml_pkg.creer_sectn_style ('pied-page');

      begin
        spx_xml_pkg.creer_sectn_style ('texte'
                                      ,'pied-texte');
        spx_xml_pkg.creer_elemn_atrib_numrq ('espacement-bas'
                                            ,0.04);
        spx_xml_pkg.fermr_sectn ('style');
      end;

      begin
        spx_xml_pkg.creer_sectn_style ('tableau');
        spx_xml_pkg.creer_elemn_atrib_numrq ('bordure-haut-taille'
                                            ,1);

        --spx_xml_pkg.creer_elemn_atrib_rgb ('bordure-haut-couleur', 224, 224, 224);
        if ppi_parmt.va_pied_polc_coulr like '#%'
        then
          spx_xml_pkg.creer_elemn_atrib ('bordure-haut-couleur'
                                        ,ppi_parmt.va_pied_polc_coulr);
        end if;

        spx_xml_pkg.fermr_sectn ('style');
      end;

      spx_xml_pkg.creer_elemn_atrib_numrq ('marge-bas'
                                          ,0.5);

      spx_xml_pkg.creer_elemn_atrib ('police-famille'
                                    ,convr_parmt_faml (ppi_parmt.va_pied_polc_faml));
      spx_xml_pkg.creer_elemn_atrib ('police-poids'
                                    ,convr_parmt_poids (ppi_parmt.va_pied_polc_poids
                                                       ,'normal'));
      spx_xml_pkg.creer_elemn_atrib_numrq ('police-taille'
                                          ,nvl (ppi_parmt.nu_pied_polc_tail, 8));

      if ppi_parmt.va_pied_polc_coulr like '#%'
      then
        spx_xml_pkg.creer_elemn_atrib ('police-couleur'
                                      ,ppi_parmt.va_pied_polc_coulr);
      end if;

      spx_xml_pkg.creer_elemn_atrib ('alignement-h'
                                    ,convr_parmt_align (ppi_parmt.va_pied_align
                                                       ,'centre'));

      begin
        spx_xml_pkg.creer_sectn_style (null
                                      ,'usager');
        spx_xml_pkg.creer_elemn_atrib ('alignement-h'
                                      ,'gauche');
        spx_xml_pkg.fermr_sectn ('style');

        spx_xml_pkg.creer_sectn_style (null
                                      ,'date');
        spx_xml_pkg.creer_elemn_atrib ('alignement-h'
                                      ,'centre');
        spx_xml_pkg.fermr_sectn ('style');

        spx_xml_pkg.creer_sectn_style (null
                                      ,'page-x-de-y');
        spx_xml_pkg.creer_elemn_atrib ('alignement-h'
                                      ,'droite');
        spx_xml_pkg.fermr_sectn ('style');
      end;

      spx_xml_pkg.fermr_sectn ('style');
    end;

    begin
      spx_xml_pkg.creer_sectn_style ('section');
      spx_xml_pkg.creer_elemn_atrib_numrq ('largeur'
                                          ,convr_parmt_largr_papr (ppi_parmt));
      spx_xml_pkg.creer_elemn_atrib_numrq ('hauteur'
                                          ,convr_parmt_hautr_papr (ppi_parmt));
      spx_xml_pkg.creer_elemn_atrib_numrq ('marge-haut'
                                          ,0.125);
      spx_xml_pkg.creer_elemn_atrib_numrq ('marge-bas'
                                          ,0.125);

      spx_xml_pkg.creer_elemn_atrib ('police-famille'
                                    ,convr_parmt_faml (ppi_parmt.va_corps_polc_faml));
      spx_xml_pkg.creer_elemn_atrib ('police-poids'
                                    ,convr_parmt_poids (ppi_parmt.va_corps_polc_poids
                                                       ,'normal'));
      spx_xml_pkg.creer_elemn_atrib_numrq ('police-taille'
                                          ,nvl (ppi_parmt.nu_corps_polc_tail, 8));

      if ppi_parmt.va_corps_polc_coulr like '#%'
      then
        spx_xml_pkg.creer_elemn_atrib ('police-couleur'
                                      ,ppi_parmt.va_corps_polc_coulr);
      end if;

      begin
        spx_xml_pkg.creer_sectn_style ('ligne'
                                      ,'pair');

        spx_xml_pkg.creer_sectn_style ('cellule');

        if ppi_parmt.va_corps_fond_coulr like '#%'
        then
          spx_xml_pkg.creer_elemn_atrib ('fond-couleur'
                                        ,ppi_parmt.va_corps_fond_coulr);
        else
          spx_xml_pkg.creer_elemn_atrib_rgb ('fond-couleur'
                                            ,245
                                            ,245
                                            ,245);
        end if;

        spx_xml_pkg.fermr_sectn ('style');

        spx_xml_pkg.fermr_sectn ('style');
      end;

      begin
        spx_xml_pkg.creer_sectn_style ('ligne'
                                      ,'impair');
        -- Aucun style particulier pour les lignes impaires
        spx_xml_pkg.fermr_sectn ('style');
      end;

      begin
        spx_xml_pkg.creer_sectn_style ('entete-tableau');
        spx_xml_pkg.creer_elemn_atrib ('police-famille'
                                      ,convr_parmt_faml (ppi_parmt.va_coln_polc_faml));
        spx_xml_pkg.creer_elemn_atrib ('police-poids'
                                      ,convr_parmt_poids (ppi_parmt.va_coln_polc_poids
                                                         ,'gras'));
        spx_xml_pkg.creer_elemn_atrib_numrq ('police-taille'
                                            ,nvl (ppi_parmt.nu_coln_polc_tail, 8));

        if ppi_parmt.va_coln_polc_coulr like '#%'
        then
          spx_xml_pkg.creer_elemn_atrib ('police-couleur'
                                        ,ppi_parmt.va_coln_polc_coulr);
        end if;

        if ppi_parmt.va_coln_fond_coulr like '#%'
        then
          spx_xml_pkg.creer_elemn_atrib ('fond-couleur'
                                        ,ppi_parmt.va_coln_fond_coulr);
        else
          spx_xml_pkg.creer_elemn_atrib_rgb ('fond-couleur'
                                            ,245
                                            ,245
                                            ,245);
        end if;

        spx_xml_pkg.fermr_sectn ('style');

        spx_xml_pkg.creer_sectn_style ('colonne');

        spx_xml_pkg.creer_elemn_atrib_rgb ('bordure-couleur'
                                          ,20
                                          ,20
                                          ,20);

        spx_xml_pkg.creer_elemn_atrib_numrq ('bordure-taille'
                                            ,0.01);
        spx_xml_pkg.fermr_sectn ('style');
      end;

      spx_xml_pkg.fermr_sectn ('style');
    end;

    spx_xml_pkg.creer_sectn_style (null
                                  ,'gauche');
    spx_xml_pkg.creer_elemn_atrib ('alignement-h'
                                  ,'gauche');
    spx_xml_pkg.fermr_sectn ('style');

    spx_xml_pkg.creer_sectn_style (null
                                  ,'centre');
    spx_xml_pkg.creer_elemn_atrib ('alignement-h'
                                  ,'centre');
    spx_xml_pkg.fermr_sectn ('style');

    spx_xml_pkg.creer_sectn_style (null
                                  ,'droite');
    spx_xml_pkg.creer_elemn_atrib ('alignement-h'
                                  ,'droite');
    spx_xml_pkg.fermr_sectn ('style');

    spx_xml_pkg.creer_sectn_style (null
                                  ,'gras');
    spx_xml_pkg.creer_elemn_atrib ('police-poids'
                                  ,'gras');
    spx_xml_pkg.fermr_sectn ('style');

    --Style utilisé pour aligner vert. texte
    spx_xml_pkg.creer_sectn_style (null
                                  ,'align_vertc');
    spx_xml_pkg.creer_elemn_atrib_numrq ('police-taille'
                                        ,1);
    spx_xml_pkg.fermr_sectn ('style');

    spx_xml_pkg.fermr_sectn ('feuil_style');
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

    alimn_tail_papr (vpi_parmt_impr);

    return vpi_parmt_impr;
  end;

  function obten_largr_dispo_page (ppi_parmt in typ_rec_parmt_impre)
    return number
  is
    vnu_largr_page   number;
  begin
    vnu_largr_page   := convr_parmt_largr_papr (ppi_parmt);

    return vnu_largr_page - knu_marge_gauch - knu_marge_droit;
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
       where     pag.ref_aplic = (select pro.seqnc
                                    from vd_afw_11_aplic pro
                                   where pro.numr_aplic_apex = pnu_aplic)
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
                                              ,pva_code_prodt   => 'SDP');
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
      vnu_largr_dispo                            := obten_largr_dispo_page (vpi_parmt_impr);

      -- Transformer toutes les valeurs en pouces
      vnu_index_page                             := 1;
      -- Créer la premiere page
      var_pages (vnu_index_page).nu_dernr_coln   := 0;

      for i in var_infor_coln.first () .. var_infor_coln.last ()
      loop
        case var_infor_coln (i).va_type_largr
          when 'POUCE'
          then
            var_infor_coln (i).nu_largr_reltv   := var_infor_coln (i).nu_largr;
          when 'POURC'
          then
            var_infor_coln (i).nu_largr_reltv   := (var_infor_coln (i).nu_largr / 100) * vnu_largr_dispo;
          when 'RELTF'
          then
            var_infor_coln (i).nu_largr_reltv   := var_infor_coln (i).nu_largr * vnu_largr_deft;
          when 'POINT'
          then
            var_infor_coln (i).nu_largr_reltv   := var_infor_coln (i).nu_largr / 72;
          else
            var_infor_coln (i).nu_largr_reltv   := vnu_largr_deft;
        end case;

        -- Assurer une largeur minimale
        if nvl (var_infor_coln (i).nu_largr_reltv, 0) < 0.25
        then
          var_infor_coln (i).nu_largr_reltv   := 0.25;
        end if;

        -- Assurer une largeur maximale
        if nvl (var_infor_coln (i).nu_largr_reltv, 0) > vnu_largr_dispo
        then
          var_infor_coln (i).nu_largr_reltv   := vnu_largr_dispo;
        end if;

        if var_infor_coln (i).va_indic_expor = 'O'
        then
          -- Changer de page si ca ne rentre pas
          if var_pages (vnu_index_page).nu_largr + var_infor_coln (i).nu_largr_reltv > vnu_largr_dispo
          then
            vnu_index_page   := vnu_index_page + 1;
          end if;

          -- La page sera créée si elle n'existe pas
          var_pages (vnu_index_page).nu_dernr_coln   := i;
          var_pages (vnu_index_page).nu_largr        := var_pages (vnu_index_page).nu_largr + var_infor_coln (i).nu_largr_reltv;
        end if;
      end loop;

      spx_util_pkg.debtr_docmn (   formt_nom_fichr (vva_nom_raprt)
                                || '.pdf'
                               ,true);

      -- Écrire la feuille de style
      ecrir_feuil_style (vpi_parmt_impr);

      -- Écrire l'entête
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

        spx_xml_pkg.creer_sectn_entet ();

        if gbl_logo is not null
        then
          declare
            vnu_largr_table   number;
          begin
            if nvl (gnu_largr_logo, 0) = 0
            then
              vnu_largr_table   := 100;
            else
              vnu_largr_table   := (gnu_largr_logo * 100) / (convr_parmt_largr_papr (vpi_parmt_impr) - knu_marge_gauch - knu_marge_droit);
            end if;

            spx_xml_pkg.creer_sectn_tabl ();
            spx_xml_pkg.creer_sectn_entet_tabl (false);
            spx_xml_pkg.creer_elemn_coln_tabl (null
                                              ,round (vnu_largr_table));
            spx_xml_pkg.creer_elemn_coln_tabl (null
                                              ,5);
            spx_xml_pkg.creer_elemn_coln_tabl (null
                                              ,95 - round (vnu_largr_table));
            spx_xml_pkg.fermr_sectn ('entet_tabl');
            spx_xml_pkg.creer_sectn_ligne ();
            spx_xml_pkg.creer_sectn_cell ();
            spx_xml_pkg.creer_elemn_image ('logo'
                                          ,gbl_logo);
            spx_xml_pkg.fermr_sectn ('cell');
            spx_xml_pkg.creer_sectn_cell ();
            spx_xml_pkg.fermr_sectn ('cell');
            spx_xml_pkg.creer_sectn_cell ();
            spx_xml_pkg.creer_elemn_ligne_texte (vva_titre_raprt);
            spx_xml_pkg.fermr_sectn ('cell');
            spx_xml_pkg.fermr_sectn ('ligne');
            spx_xml_pkg.fermr_sectn ('tabl');
          end;
        else
          spx_xml_pkg.creer_elemn_ligne_texte (vva_titre_raprt);
        end if;

        spx_xml_pkg.fermr_sectn ('entet');
      end;

      -- Écrire le pied de page
      begin
        spx_xml_pkg.creer_sectn_pied_page ();

        if vpi_parmt_impr.va_pied_texte is not null
        then
          spx_xml_pkg.creer_elemn_ligne_texte (apex_application.do_substitutions (vpi_parmt_impr.va_pied_texte)
                                              ,'pied-texte');
        end if;

        begin
          spx_xml_pkg.creer_sectn_tabl ();

          begin
            spx_xml_pkg.creer_sectn_entet_tabl (false);
            spx_xml_pkg.creer_elemn_coln_tabl (null
                                              ,1
                                              ,'usager');
            spx_xml_pkg.creer_elemn_coln_tabl (null
                                              ,1
                                              ,'date');
            spx_xml_pkg.creer_elemn_coln_tabl (null
                                              ,1
                                              ,'page-x-de-y');
            spx_xml_pkg.fermr_sectn ('entet_tabl');
          end;

          begin
            spx_xml_pkg.creer_sectn_ligne ();

            spx_xml_pkg.creer_sectn_cell ();
            spx_xml_pkg.creer_elemn_ligne_texte (   'Demandé par: '
                                                 || afw_12_utils_pkg.obten_nom_formt_de_code_utils (afw_07_util_pkg.v ('APP_USER')));
            spx_xml_pkg.fermr_sectn ('cell');

            spx_xml_pkg.creer_sectn_cell ();
            spx_xml_pkg.creer_elemn_ligne_texte (formt_date ());
            spx_xml_pkg.fermr_sectn ('cell');

            spx_xml_pkg.creer_sectn_cell ();
            spx_xml_pkg.creer_elemn_ligne_texte (   'Page '
                                                 || spx_xml_pkg.obten_champ_numr_page ()
                                                 || ' de '
                                                 || spx_xml_pkg.obten_champ_nombr_pages ());
            spx_xml_pkg.fermr_sectn ('cell');

            spx_xml_pkg.fermr_sectn ('ligne');
          end;

          spx_xml_pkg.fermr_sectn ('tabl');
        end;

        spx_xml_pkg.fermr_sectn ('pied_page');
      end;

      -- Créer le corps du rapport
      begin
        spx_xml_pkg.creer_sectn_sectn (null
                                      ,null
                                      ,'aucun'
                                      ,false);

        -- Créer le tableau qui affichera les données
        spx_xml_pkg.creer_sectn_tabl ();

        -- Créer les différents set d'entêtes (pages)
        vnu_dernr_coln_ajout   := 0;

        for j in var_pages.first () .. var_pages.last ()
        loop
          spx_xml_pkg.creer_sectn_entet_tabl ();
          spx_xml_pkg.ajout_atrib ('largeur'
                                  ,   round ( (var_pages (j).nu_largr / vnu_largr_dispo) * 100
                                            ,0)
                                   || '%');

          for i in vnu_dernr_coln_ajout + 1 .. var_pages (j).nu_dernr_coln
          loop
            if var_infor_coln (i).va_indic_expor = 'O'
            then
              spx_xml_pkg.creer_elemn_coln_tabl (var_infor_coln (i).va_libl
                                                ,var_infor_coln (i).nu_largr_reltv
                                                ,convr_parmt_align (var_infor_coln (i).va_align_entet
                                                                   ,'gauche'));
            end if;
          end loop;

          vnu_dernr_coln_ajout   := var_pages (j).nu_dernr_coln;

          spx_xml_pkg.fermr_sectn ('entet_tabl');
        end loop;

        -- Écrire les données
        vnu_compt_ligne        := 0;

        while afw_07_sql_pkg.lire_ligne_selct (vnu_cursr
                                              ,var_infor_coln)
        loop
          vnu_compt_ligne   := vnu_compt_ligne + 1;

          spx_xml_pkg.creer_sectn_ligne ();

          if instr (var_infor_coln (1).va_valr_varch
                   ,'indic_surlg_ligne_raprt') != 0
          then
            spx_xml_pkg.ajout_atrib ('classe'
                                    ,'gras');
            var_infor_coln (1).va_valr_varch      :=
              substr (var_infor_coln (1).va_valr_varch
                     ,  instr (var_infor_coln (1).va_valr_varch
                              ,'</span>')
                      + 7);
          end if;

          /*if mod (vnu_compt_ligne,
                  2) = 0 then
            spx_xml_pkg.ajout_atrib ('classe',
                                     'pair');
          else
            spx_xml_pkg.ajout_atrib ('classe',
                                     'impair');
          end if;*/

          for i in var_infor_coln.first () .. var_infor_coln.last ()
          loop
            if var_infor_coln (i).va_indic_expor = 'O'
            then
              spx_xml_pkg.creer_sectn_cell ();
              spx_xml_pkg.ajout_atrib ('classe'
                                      ,convr_parmt_align (var_infor_coln (i).va_align_coln
                                                         ,'gauche'));

              case var_infor_coln (i).va_type_valr
                when 'VARCH'
                then
                  spx_xml_pkg.creer_elemn_bloc_texte (var_infor_coln (i).va_valr_varch);
                when 'NUMBR'
                then
                  if var_infor_coln (i).va_formt is null
                  then
                    spx_xml_pkg.creer_elemn_ligne_texte (var_infor_coln (i).nu_valr_numbr);
                  else
                    spx_xml_pkg.creer_elemn_ligne_texte (ltrim (to_char (var_infor_coln (i).nu_valr_numbr
                                                                        ,var_infor_coln (i).va_formt)));
                  end if;
                when 'DATE'
                then
                  if var_infor_coln (i).va_formt is null
                  then
                    spx_xml_pkg.creer_elemn_ligne_texte (var_infor_coln (i).da_valr_date);
                  else
                    spx_xml_pkg.creer_elemn_ligne_texte (to_char (var_infor_coln (i).da_valr_date
                                                                 ,var_infor_coln (i).va_formt));
                  end if;
                when 'TIMST'
                then
                  if var_infor_coln (i).va_formt is null
                  then
                    spx_xml_pkg.creer_elemn_ligne_texte (var_infor_coln (i).ts_valr_timst);
                  else
                    spx_xml_pkg.creer_elemn_ligne_texte (to_char (var_infor_coln (i).ts_valr_timst
                                                                 ,var_infor_coln (i).va_formt));
                  end if;
                else
                  spx_xml_pkg.creer_elemn_bloc_texte (var_infor_coln (i).va_valr_varch);
              end case;

              spx_xml_pkg.creer_elemn_ligne_texte (' '
                                                  ,'align_vertc');
              spx_xml_pkg.fermr_sectn ('cell');
            end if;
          end loop;

          spx_xml_pkg.fermr_sectn ('ligne');
        end loop;

        spx_xml_pkg.fermr_sectn ('tabl');

        if vnu_compt_ligne = 0
        then
          spx_xml_pkg.creer_elemn_ligne_texte (aa.do_substitutions (vva_mesg_aucun_don));
        end if;

        spx_xml_pkg.fermr_sectn ('sectn');
      end;

      spx_util_pkg.afich_pdf ( (nvl (vpi_parmt_impr.va_contn_disps, 'ATTACHMENT') = 'ATTACHMENT')
                             ,true);
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
       where     pag.ref_aplic = (select pro.seqnc
                                    from vd_afw_11_aplic pro
                                   where pro.numr_aplic_apex = pnu_aplic)
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
end afw_25_spx_expor_ir_pkg;
/
