SET DEFINE OFF;
create or replace package body afw_21_regn_pkg
is
  function valdr_prise_charg (pva_code_plugn in varchar2)
    return boolean
  is
    vnu_page_sesn           vd_afw_13_page.seqnc%type := afw_13_page_pkg.obten_page_sesn;
    vnu_page_zero_sesn      vd_afw_13_page.seqnc%type := afw_13_page_pkg.obten_page_zero_sesn;
    vva_indic_prise_charg   varchar2 (1);
    vbo_valr_retr           boolean := false;
    vnu_nombr               number (3);
  begin
    case pva_code_plugn
      when gta_code_plugn ('AFW_13_CONFR_SAUVG')
      then
        begin
          if afw_07_util_pkg.v ('A_AFW_13_MODE_RECHR') = 'O'
          then
            vva_indic_prise_charg   := 'N';
          else
            select p.indic_prise_charg_afw13_confr
              into vva_indic_prise_charg
              from vd_afw_13_page p
             where p.seqnc = afw_13_page_pkg.obten_page_sesn;
          end if;
        end;
      when gta_code_plugn ('AFW_18_DEPSM_TABLR_FORM')
      then
        begin
          select p.indic_prise_charg_afw18
            into vva_indic_prise_charg
            from vd_afw_13_page p
           where p.seqnc = afw_13_page_pkg.obten_page_sesn;

          select count (1)
            into vnu_nombr
            from vd_afw_13_page_item pi
                ,apex_regn_coln      arc
                ,apex_regn           ar
           where     pi.ref_page = afw_13_page_pkg.obten_page_sesn
                 and arc.column_alias = pi.depsm_alias_coln
                 and arc.flow_id = ar.flow_id
                 and arc.region_id = ar.id
                 and ar.flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic
                 and ar.page_id = afw_13_page_pkg.obten_numr_apex_page
                 and ar.plug_source_type = 'UPDATABLE_SQL_QUERY';
        end;
      when gta_code_plugn ('AFW_18')
      then
        begin
          select p.indic_prise_charg_afw18
            into vva_indic_prise_charg
            from vd_afw_13_page p
           where p.seqnc = afw_13_page_pkg.obten_page_sesn;
        end;
      /*
    when gta_code_plugn ('AFW_14_POPUP_LOV_ITEM') then
      begin
        select   count (1)
          into   vnu_nombr
          from   vd_afw_13_page_item pi,
                 vd_afw_14_popup_lov_ir pli,
                 vd_afw_13_page p,
                 apex_item_page aip
         where   pi.ref_page in (vnu_page_sesn, vnu_page_zero_sesn)
                 and aip.id = pi.id_apex
                 and aip.lov is not null
                 and pli.ref_page_item = pi.seqnc
                 and pli.ref_page = p.seqnc;
      end;
    when gta_code_plugn ('AFW_14_POPUP_LOV') then
      begin
        select   p.indic_prise_charg_afw14_popup
          into   vva_indic_prise_charg
          from   vd_afw_13_page p
         where   p.seqnc = afw_13_page_pkg.obten_page_sesn;
        select   count (1)
          into   vnu_nombr
          from   vd_afw_14_popup_lov_ir pli,
                 vd_afw_14_popup_lov_ir_retr plir,
                 vd_afw_13_page_ir_coln pic
         where   pli.ref_page = vnu_page_sesn
                 and pli.seqnc = plir.ref_popup_lov_ir
                 and plir.ref_page_ir_coln = pic.seqnc;
      end;*/
      else
        null;
    end case;

    if     (   vnu_nombr is null
            or (    vnu_nombr is not null
                and vnu_nombr > 0))
       and vva_indic_prise_charg = 'O'
    then
      vbo_valr_retr   := true;
    end if;

    return vbo_valr_retr;
  end valdr_prise_charg;

  function genr_plugn_regn_arbre (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn          afw_21_util_pkg.t_regn_rendr_reslt;
    rec_confg_plugn   afw_21_plugn_arbre_pkg.typ_rec_confg_plugn;
    vva_rafrc_arbre   varchar2 (5) default 'false';
    vva_charg_progr   varchar2 (5) default 'true';

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
    begin
      htp.p (   '<div id="arbre_ajax_'
             || p_regn.id
             || '" class="afw_13_plugn_regn_arbre_ajax"></div>');
    end genr_regn;
  begin
    afw_21_plugn_arbre_pkg.bascl_arbre_sesn (p_region.id);

    genr_regn (p_region);

    rec_confg_plugn   := afw_21_plugn_arbre_pkg.obten_enreg_confg_plugn (p_region.id);

    --Poru définir la valeur de l'item lors d,un changement d'application OU d'une redirection a l'intérieur d'une meme application
    afw_07_util_pkg.defnr_etat_sessn (rec_confg_plugn.item_noeud
                                     ,afw_12_arbre_pkg.obten_noeud_actif);
    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('jquery.cluetip'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/plugins/jquery-cluetip/1.2.5/');


    afw_21_util_pkg.ajout_css (   '#arbre_ajax_'
                               || p_region.id
                               || ' {width:'
                               || rec_confg_plugn.largr_regn_arbre
                               || 'px; height:'
                               || rec_confg_plugn.hautr_regn_arbre
                               || 'px;'
                               || '}'
                               || chr (10)
                               || '#arbre_ajax_'
                               || p_region.id
                               || ' ul {width:'
                               || (rec_confg_plugn.largr_regn_arbre - 20)
                               || 'px; }');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('json2'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/json/');

    afw_21_util_pkg.ajout_libr_javsc ('jquery.cookie'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/jquery-cookie/old/');

    afw_21_util_pkg.ajout_libr_javsc ('jquery.jsoncookie'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/jquery-jsoncookie/0.9/');

    afw_21_util_pkg.ajout_libr_javsc ('jquery.hoverIntent.r6'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/jquery-hoverintent/r6/');

    afw_21_util_pkg.ajout_libr_javsc ('jquery.cluetip'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/jquery-cluetip/1.2.5/');

    afw_21_util_pkg.ajout_libr_javsc ('jquery.jstree'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/jstree/pre1.0_fix_1/');

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.arbre'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    vva_rafrc_arbre   := case afw_12_arbre_pkg.obten_indic_rafrc (p_region.id) when 'O' then 'true' when 'N' then 'false' else vva_rafrc_arbre end;

    vva_charg_progr   := case rec_confg_plugn.indic_charg_progr when 'O' then 'true' when 'N' then 'false' else vva_charg_progr end;

    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.regn.arbre.insta.push(new afw.afw_21.regn.arbre.arbre({vva_id_div_regn:"'
                                            || 'arbre_ajax_'
                                            || p_region.id
                                            || '",vva_id_regn:"'
                                            || p_region.id
                                            || '",vva_seqnc_plugn:"'
                                            || rec_confg_plugn.seqnc
                                            || '",vva_plugn_ajax:"'
                                            || apex_plugin.get_ajax_identifier
                                            || '",vva_item_noeud:"'
                                            || p_region.attribute_01
                                            || '",vjs_noeud_actif:"'
                                            || afw_07_util_pkg.v (p_region.attribute_01)
                                            || '",vbo_rafrc_arbre:'
                                            || vva_rafrc_arbre
                                            || ',vva_mode_cache:'
                                            || '"'
                                            || rec_confg_plugn.mode_cache
                                            || '"'
                                            || ',vbo_charg_progr:'
                                            || vva_charg_progr
                                            || ',vva_selct_jquer_depsr_elemn:'
                                            || case
                                                 when p_region.attribute_02 is not null
                                                 then
                                                      '"'
                                                   || p_region.attribute_02
                                                   || '"'
                                                 else
                                                   'false'
                                               end
                                            || ',vva_selct_jquer_glisr_elemn:'
                                            || case
                                                 when p_region.attribute_03 is not null
                                                 then
                                                      '"'
                                                   || p_region.attribute_03
                                                   || '"'
                                                 else
                                                   'false'
                                               end
                                            || ',vva_item_fin_actio_glisr_elemn_arbre:"'
                                            || p_region.attribute_04
                                            || '"}));');

    afw_21_plugn_arbre_pkg.rafrc_efect (rec_confg_plugn.code
                                       ,rec_confg_plugn.numr_page_apex
                                       ,afw_12_utils_pkg.obten_usagr_conct ());

    return rec_regn;
  end genr_plugn_regn_arbre;

  function ajax_plugn_regn_arbre (p_region   in afw_21_util_pkg.t_regn
                                 ,p_plugin   in afw_21_util_pkg.t_plugn)
    return afw_21_util_pkg.t_regn_ajax_reslt
  is
    rec_regn_ajax   apex_plugin.t_region_ajax_result;
  begin
    case aa.g_widget_action
      when 'OBTEN_JSON_TYPE_NOEUD'
      then
        afw_21_plugn_arbre_pkg.genr_json_type_noeud (p_region.id);
      when 'OBTEN_JSON_ARBRE'
      then
        afw_21_plugn_arbre_pkg.genr_json_arbre (p_region.id);
      when 'OBTEN_JSON_NOEUD'
      then
        afw_21_plugn_arbre_pkg.genr_json_noeud (p_region.id
                                               ,aa.g_x01);
      when 'OUVRI_NOEUD'
      then
        afw_21_plugn_arbre_pkg.actio_ouvri_noeud (p_region.id
                                                 ,aa.g_x01);
      when 'FERMR_NOEUD'
      then
        afw_21_plugn_arbre_pkg.actio_fermr_noeud (p_region.id
                                                 ,aa.g_x01);
      when 'SELCT_NOEUD'
      then
        afw_21_plugn_arbre_pkg.actio_selct_noeud (p_region.id
                                                 ,aa.g_x01);
      when 'GLISR_ELEMN_ARBRE'
      then
        afw_21_plugn_arbre_pkg.actio_glisr_elemn_arbre (p_region.id
                                                       ,aa.g_x01
                                                       ,aa.g_x02);
      else
        null;
    end case;

    return rec_regn_ajax;
  end ajax_plugn_regn_arbre;

  function genr_plugn_regn_calnd (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn           afw_21_util_pkg.t_regn_rendr_reslt;
    rec_config_plugn   afw_21_plugn_calnd_pkg.typ_rec_config_plugn;
    vda_date_calnd     date;
    vva_mode_calnd     varchar2 (30);

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
    begin
      htp.p (   '<div id="'
             || p_regn.static_id
             || '" class="afw_21_plugn_calnd"></div>');
    end;
  begin
    genr_regn (p_region);

    rec_config_plugn   := afw_21_plugn_calnd_pkg.obten_enreg_config_plugn (p_region.id);

    -- Obtenir la date du calendrier
    vda_date_calnd     := afw_12_calnd_pkg.obten_date (p_region.id);

    -- Obtenir le mode du calendrier
    vva_mode_calnd     := afw_12_calnd_pkg.obten_mode (p_region.id);

    afw_21_util_pkg.ajout_libr_css ('fullcalendar'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/plugins/fullcalendar/1.5.3/fullcalendar/');

    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.regn.calnd'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    afw_21_plugn_calnd_coulr_pkg.defnr_css;

    afw_21_util_pkg.ajout_css (   '#'
                               || p_region.static_id
                               || ' {width: '
                               || rec_config_plugn.largr_regn_calnd
                               || 'px; margin: 0 auto;}');

    afw_21_util_pkg.ajout_libr_css ('jquery.cluetip'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/plugins/jquery-cluetip/1.2.5/');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('jquery.hoverIntent.r6'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/jquery-hoverintent/r6/');

    afw_21_util_pkg.ajout_libr_javsc ('jquery.cluetip'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/jquery-cluetip/1.2.5/');

    afw_21_util_pkg.ajout_libr_javsc ('fullcalendar'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/fullcalendar/1.5.3/fullcalendar/');

    afw_21_util_pkg.ajout_libr_javsc ('gcal'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/fullcalendar/1.5.3/fullcalendar/');

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.calnd'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.regn.calnd.insta.push(new afw.afw_21.regn.calnd.calnd('
                                            || '{'
                                            || apex_javascript.add_attribute ('vva_id_regn'
                                                                             ,p_region.static_id)
                                            || apex_javascript.add_attribute ('vva_nom_plugn'
                                                                             ,p_plugin.name)
                                            || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                                             ,apex_plugin.get_ajax_identifier)
                                            || apex_javascript.add_attribute ('vbo_modfb'
                                                                             ,afw_21_util_pkg.formt_plugn_atrib_boln (rec_config_plugn.indic_evenm_modfb)
                                                                             ,p_add_comma   => false)
                                            || case
                                                 when vva_mode_calnd is not null
                                                 then
                                                      ','
                                                   || apex_javascript.add_attribute ('vva_mode_calnd'
                                                                                    ,vva_mode_calnd
                                                                                    ,p_add_comma   => false)
                                                 else
                                                   null
                                               end
                                            || case
                                                 when vda_date_calnd is not null
                                                 then
                                                      ',vjs_date_calnd:'
                                                   || '{'
                                                   || apex_javascript.add_attribute ('vva_an'
                                                                                    ,to_char (vda_date_calnd
                                                                                             ,'YYYY'))
                                                   || apex_javascript.add_attribute ('vva_mois'
                                                                                    , (  to_char (vda_date_calnd
                                                                                                 ,'MM')
                                                                                       - 1))
                                                   || apex_javascript.add_attribute ('vva_jour'
                                                                                    ,to_char (vda_date_calnd
                                                                                             ,'DD')
                                                                                    ,p_add_comma   => false)
                                                   || '}'
                                                 else
                                                   null
                                               end
                                            || ',vjs_entet:'
                                            || '{'
                                            || apex_javascript.add_attribute ('gauch'
                                                                             ,rec_config_plugn.conct_propr_entet_gauch_formt)
                                            || apex_javascript.add_attribute ('centr'
                                                                             ,rec_config_plugn.conct_propr_entet_centr_formt)
                                            || apex_javascript.add_attribute ('droit'
                                                                             ,rec_config_plugn.conct_propr_entet_droit_formt
                                                                             ,p_add_comma   => false)
                                            || '}'
                                            || ',vjs_formt:'
                                            || '{'
                                            || '  vjs_agend:'
                                            || '  {'
                                            || apex_javascript.add_attribute ('vnu_nombr_mints'
                                                                             ,rec_config_plugn.nombr_mints_inter)
                                            || apex_javascript.add_attribute ('vva_heure_debut'
                                                                             ,rec_config_plugn.heure_debut_norml)
                                            || apex_javascript.add_attribute ('vva_heure_fin'
                                                                             ,rec_config_plugn.heure_fin_norml)
                                            || apex_javascript.add_attribute ('vva_heure_debut_exten'
                                                                             ,rec_config_plugn.heure_debut_exten)
                                            || apex_javascript.add_attribute ('vva_heure_fin_exten'
                                                                             ,rec_config_plugn.heure_fin_exten
                                                                             ,p_add_comma   => false)
                                            || '  }'
                                            || '}'
                                            || '}));');

    return rec_regn;
  end genr_plugn_regn_calnd;

  function ajax_plugn_regn_calnd (p_region   in afw_21_util_pkg.t_regn
                                 ,p_plugin   in afw_21_util_pkg.t_plugn)
    return afw_21_util_pkg.t_regn_ajax_reslt
  is
    rec_regn_ajax      apex_plugin.t_region_ajax_result;
    rec_config_plugn   afw_21_plugn_calnd_pkg.typ_rec_config_plugn;
  begin
    rec_config_plugn   := afw_21_plugn_calnd_pkg.obten_enreg_config_plugn (p_region.id);

    case aa.g_widget_action
      when 'DEFNR_ETAT_CALND'
      then
        afw_21_plugn_calnd_pkg.defnr_etat_calnd (p_region.id
                                                ,aa.g_x01
                                                ,aa.g_x02);
      when 'DEFNR_ACTIO_SELCT'
      then
        afw_21_plugn_calnd_pkg.initl_actio_sesn;
        afw_21_plugn_calnd_pkg.defnr_actio_selct (aa.g_x01
                                                 ,aa.g_x02
                                                 ,aa.g_x03);
      when 'DEFNR_ACTIO_CHOIX_EVENM'
      then
        afw_21_plugn_calnd_pkg.initl_actio_sesn;
        afw_21_plugn_calnd_pkg.defnr_actio_choix_evenm (aa.g_x01);
      when 'DEFNR_ACTIO_DEPLC_EVENM'
      then
        afw_21_plugn_calnd_pkg.initl_actio_sesn;
        afw_21_plugn_calnd_pkg.defnr_actio_deplc_evenm (aa.g_x01
                                                       ,aa.g_x02
                                                       ,aa.g_x03
                                                       ,aa.g_x04);
      when 'DEFNR_ACTIO_AJUST_EVENM'
      then
        afw_21_plugn_calnd_pkg.initl_actio_sesn;
        afw_21_plugn_calnd_pkg.defnr_actio_ajust_evenm (aa.g_x01
                                                       ,aa.g_x02);
      when 'OBTEN_JSON_EVENM_AGEND'
      then
        afw_21_plugn_calnd_pkg.obten_json_evenm_agend (p_region.id
                                                      ,aa.g_x01
                                                      ,aa.g_x02
                                                      ,aa.g_x03);
      when 'OBTEN_JSON_EVENM'
      then
        afw_21_plugn_calnd_pkg.obten_json_evenm (p_region.id
                                                ,aa.g_x01);
      else
        null;
    end case;

    return rec_regn_ajax;
  end ajax_plugn_regn_calnd;

  function genr_plugn_regn_barre_rechr_ir (p_region                in afw_21_util_pkg.t_regn
                                          ,p_plugin                in afw_21_util_pkg.t_plugn
                                          ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;
  begin
    afw_21_util_pkg.ajout_css (   '#'
                               || p_region.static_id
                               || ' {float: left; padding-top: 7px; display: none;}');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.barre_rechr_raprt_inter'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (
         'afw.afw_21.regn.barre_rechr_raprt_inter.insta.push(new afw.afw_21.regn.barre_rechr_raprt_inter.barre_rechr_raprt_inter({vva_id_div_regn:"'
      || p_region.static_id
      || '"}));');

    return rec_regn;
  end genr_plugn_regn_barre_rechr_ir;

  function genr_plugn_regn_acord (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn         afw_21_util_pkg.t_regn_rendr_reslt;
    vnu_largr_regn   number;
    vva_icone        varchar2 (400);
  begin
    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.regn.acord_menu'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    if afw_07_util_pkg.exist_item (p_region.attribute_01)
    then
      vnu_largr_regn   := nvl (afw_07_util_pkg.nv (p_region.attribute_01), p_region.attribute_02);
    else
      begin
        vnu_largr_regn   := to_number (p_region.attribute_01);
      exception
        when others
        then
          vnu_largr_regn   := p_region.attribute_02;
      end;
    end if;

    if p_region.attribute_03 = 'N'
    then
      vva_icone   := 'false';
    else
      vva_icone      :=
           '{"header":"'
        || p_region.attribute_04
        || '","headerSelected":"'
        || p_region.attribute_05
        || '"}';
    end if;

    afw_21_util_pkg.ajout_css (   '#'
                               || p_region.static_id
                               || ' {height: inherit;}'
                               || chr (10)
                               || '#'
                               || p_region.static_id
                               || '_acord {height: inherit;}');


    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.acord_menu'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.regn.acord_menu.insta.push(new afw.afw_21.regn.acord_menu.acord_menu({'
                                            || '"vva_id_regn_acord":"'
                                            || p_region.static_id
                                            || '_acord'
                                            || '","vva_header":".acord_menu_enfan'
                                            || '","vjs_icone":'
                                            || vva_icone
                                            || '}));');


    --debut plugin PANNEAU GAUCHE
    --ce code devrait aller dans un plugin de region panneau de gauche

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.pan_latrl_gauch'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');


    --Initialiser la poigne pour afficher/cacher le panneau de gauche
    afw_21_util_pkg.ajout_code_javsc_charg ('afw.afw_21.regn.pan_latrl_gauch.insta.push(afw.afw_21.regn.pan_latrl_gauch.pan_latrl_gauch());');

    --fin plugin PANNEAU GAUCHE
    return rec_regn;
  end genr_plugn_regn_acord;

  function genr_plugn_regn_acord_enfan (p_region                in afw_21_util_pkg.t_regn
                                       ,p_plugin                in afw_21_util_pkg.t_plugn
                                       ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;
  begin
    afw_15_htp_pkg.ouvri_bals ('div'
                              ,'class'
                              ,'acord_menu_enfan');

    if p_region.attribute_02 is not null
    then
      afw_15_htp_pkg.ouvri_bals ('span'
                                ,'id'
                                ,p_region.attribute_06
                                ,'class'
                                ,   'icon_acord_gauch ui-icon '
                                 || p_region.attribute_02
                                ,'onclick'
                                ,case
                                   when p_region.attribute_03 is not null
                                   then
                                        'window.location='''
                                     || afw_21_util_pkg.obten_reslt_expre_plsql (p_region.attribute_03)
                                     || ''''
                                   else
                                     null
                                 end);
      afw_15_htp_pkg.fermr_bals ('span');
    end if;

    afw_15_htp_pkg.ouvri_bals ('a'
                              ,'href'
                              ,'#');
    afw_15_htp_pkg.ecrir (afw_21_util_pkg.obten_reslt_expre_plsql (p_region.attribute_01)
                         ,false);
    afw_15_htp_pkg.fermr_bals ('a');

    if p_region.attribute_04 is not null
    then
      afw_15_htp_pkg.ouvri_bals ('span'
                                ,'id'
                                ,p_region.attribute_07
                                ,'class'
                                ,   'icon_acord_droit ui-icon '
                                 || p_region.attribute_04
                                ,'onclick'
                                ,case
                                   when p_region.attribute_05 is not null
                                   then
                                        'window.location='''
                                     || afw_21_util_pkg.obten_reslt_expre_plsql (p_region.attribute_05)
                                     || ''''
                                   else
                                     null
                                 end);
      afw_15_htp_pkg.fermr_bals ('span');
    end if;

    afw_15_htp_pkg.fermr_bals ('div');

    return rec_regn;
  end genr_plugn_regn_acord_enfan;

  function genr_plugn_regn_dialg (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;
  begin
    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_css (   '#'
                               || p_region.static_id
                               || ' {display:none;} .no-close .ui-dialog-titlebar-close {display:none;}');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.dialg'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.regn.dialg.insta.push(new afw.afw_21.regn.dialg.dialg('
                                            || '{'
                                            || apex_javascript.add_attribute ('vva_id_regn'
                                                                             ,p_region.static_id)
                                            || apex_javascript.add_attribute ('vva_titre'
                                                                             ,p_region.name)
                                            || apex_javascript.add_attribute ('vva_nom_plugn'
                                                                             ,p_plugin.name)
                                            || apex_javascript.add_attribute ('vbo_modal'
                                                                             ,afw_21_util_pkg.formt_plugn_atrib_boln (p_region.attribute_01))
                                            || apex_javascript.add_attribute ('vbo_redmn'
                                                                             ,afw_21_util_pkg.formt_plugn_atrib_boln (p_region.attribute_02))
                                            || apex_javascript.add_attribute ('vbo_fermr_echap'
                                                                             ,afw_21_util_pkg.formt_plugn_atrib_boln (p_region.attribute_03))
                                            || apex_javascript.add_attribute ('vbo_ouvri_autom'
                                                                             ,afw_21_util_pkg.formt_plugn_atrib_boln (p_region.attribute_05))
                                            || apex_javascript.add_attribute ('vbo_deplc'
                                                                             ,afw_21_util_pkg.formt_plugn_atrib_boln (p_region.attribute_06))
                                            || apex_javascript.add_attribute ('vva_clas_css'
                                                                             ,p_region.attribute_04)
                                            || apex_javascript.add_attribute ('vnu_largr'
                                                                             ,p_region.attribute_07
                                                                             ,p_add_comma   => false)
                                            || '}));');

    return rec_regn;
  end genr_plugn_regn_dialg;

  function genr_plugn_regn_drop (p_region                in afw_21_util_pkg.t_regn
                                ,p_plugin                in afw_21_util_pkg.t_plugn
                                ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
    begin
      afw_15_htp_pkg.ouvri_bals ('div'
                                ,'id'
                                ,   'drop_'
                                 || p_regn.id
                                ,'class'
                                ,   'ui-widget ui-widget-content ui-corner-all afw_21_regn_drop '
                                 || p_regn.attribute_03);
      afw_15_htp_pkg.ouvri_bals ('p');

      if p_regn.attribute_05 = 'Y'
      then
        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,   'ui-icon '
                                   || p_regn.attribute_06
                                  ,'style'
                                  ,'float:left; margin-right:.3em;');
        afw_15_htp_pkg.fermr_bals ('span');
      end if;

      afw_15_htp_pkg.ecrir ('Deposer des fichiers ici pour attacher.'
                           ,false);
      afw_15_htp_pkg.fermr_bals ('p');
      afw_15_htp_pkg.fermr_bals ('div');
    end genr_regn;
  begin
    genr_regn (p_region);

    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.regn.drop'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.drop'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.regn.drop.insta.push(new afw.afw_21.regn.drop.drop({'
                                            || '"vva_id_regn":"'
                                            || 'drop_'
                                            || p_region.id
                                            || '","vva_acept":"'
                                            || p_region.attribute_01
                                            || '","vva_id_item_drop":"'
                                            || p_region.attribute_02
                                            || '","vbo_cachr_regn":'
                                            || case p_region.attribute_04 when 'Y' then 'true' when 'N' then 'false' else 'true' end
                                            || '}));');

    return rec_regn;
  end genr_plugn_regn_drop;

  function genr_domn_contx_autor (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;
    vnu_domn   number (10);

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
      vnu_domn   number (10);

      procedure genr_lien_domn_contx (pnu_domn in number)
      is
        cursor cur_domn (pnu_domn in number)
        is
          select    d.code
                 || ' - '
                 || d.nom
                   abrev
            from vd_i_afw_12_domn d
           where d.seqnc = pnu_domn;

        rec_domn   cur_domn%rowtype;
      begin
        open cur_domn (pnu_domn);

        fetch cur_domn
          into rec_domn;

        close cur_domn;

        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icons');

        afw_15_htp_pkg.ouvri_bals ('a'
                                  ,'href'
                                  ,'#'
                                  ,'alt'
                                  ,'Afficher les domaines autorisés.'
                                  ,'title'
                                  ,'Afficher les domaines autorisés.'
                                  ,'class'
                                  ,'afich_domn_contx_autor');

        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'ui-button-icon-primary ui-icon ui-icon-newwin');
        afw_15_htp_pkg.fermr_bals ('span');

        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'ui-button-text icon-left');
        afw_15_htp_pkg.ecrir (rec_domn.abrev);
        afw_15_htp_pkg.fermr_bals ('span');
        afw_15_htp_pkg.fermr_bals ('a');

        afw_15_htp_pkg.fermr_bals ('span');
      end genr_lien_domn_contx;
    begin
      -- Exclure la page de connexion
      if afw_13_page_pkg.obten_page_sesn != afw_11_aplic_pkg.obten_page_conxn
      then
        afw_15_htp_pkg.ouvri_bals ('div'
                                  ,'id'
                                  ,   'domn_contx_autor_R'
                                   || p_regn.id
                                  ,'class'
                                  ,'domn_contx_autor');

        vnu_domn   := afw_12_domn_pkg.obten_domn_sesn;

        genr_lien_domn_contx (vnu_domn);

        afw_15_htp_pkg.fermr_bals ('div');
      end if;
    end genr_regn;
  begin
    genr_regn (p_region);

    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.regn.domn_contx_autor'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.domn_contx_autor'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.regn.domn_contx_autor.insta.push(new afw.afw_21.regn.domn_contx_autor.domn_contx_autor({'
                                            || apex_javascript.add_attribute ('vva_id_regn'
                                                                             ,   'domn_contx_autor_R'
                                                                              || p_region.id)
                                            || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                                             ,apex_plugin.get_ajax_identifier)
                                            || apex_javascript.add_attribute ('vbo_ouvri_charg'
                                                                             ,case when afw_12_domn_pkg.obten_domn_sesn is null then true else false end
                                                                             ,p_add_comma   => false)
                                            || '}));');

    return rec_regn;
  end genr_domn_contx_autor;

  function ajax_domn_contx_autor (p_region   in afw_21_util_pkg.t_regn
                                 ,p_plugin   in afw_21_util_pkg.t_plugn)
    return afw_21_util_pkg.t_regn_ajax_reslt
  is
    rec_regn_ajax   apex_plugin.t_region_ajax_result;

    procedure genr_liste_domn_autor
    is
      cursor cur_domn
      is
          select d.seqnc
                ,   d.code
                 || ' :: '
                 || d.nom
                   abrev
            from vd_i_afw_12_domn     d
                ,vd_i_afw_12_domn_utils du
           where     du.ref_domn = d.seqnc
                 and du.ref_utils = afw_12_utils_pkg.obten_usagr_conct
                 and du.date_debut_efect <= sysdate
                 and (       du.date_fin_efect is not null
                         and du.date_fin_efect >= sysdate
                      or du.date_fin_efect is null)
        order by d.code;
    --TODO
    --Filtrer cette liste
    begin
      afw_15_htp_pkg.ouvri_bals ('div'
                                ,'class'
                                ,'ui-widget-content liste_domn_autor afw_21_regn_domn_contx_autor');
      afw_15_htp_pkg.ouvri_bals ('ul');

      --Loop sur les domn autor
      for rec_domn in cur_domn
      loop
        afw_15_htp_pkg.ouvri_bals ('li');
        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icons chang_domn');
        afw_15_htp_pkg.ouvri_bals ('a'
                                  ,'href'
                                  ,afw_08_url_pkg.genr_url (pnu_numr_page      => 1
                                                           ,pva_nom_varbl_1    => 'SIDF'
                                                           ,pva_valr_varbl_1   => afw_04_fil_arian_pkg.obten_fa_courn ()
                                                           ,pva_nom_varbl_2    => 'SSPC'
                                                           ,pva_valr_varbl_2   => rec_domn.seqnc
                                                           ,pva_nom_varbl_3    => 'SAPC'
                                                           ,pva_valr_varbl_3   => 'SAFD_CHANG_DOMN'
                                                           ,pva_sesn           => afw_12_sesn_pkg.obten_sesn)
                                  ,'alt'
                                  ,'Changer de domaine.'
                                  ,'title'
                                  ,'Changer de domaine.');
        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'ui-button-icon-primary ui-icon ui-icon-refresh');
        afw_15_htp_pkg.fermr_bals ('span');

        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'ui-button-text');
        afw_15_htp_pkg.ecrir (rec_domn.abrev);
        afw_15_htp_pkg.fermr_bals ('span');
        afw_15_htp_pkg.fermr_bals ('a');
        afw_15_htp_pkg.fermr_bals ('span');
        afw_15_htp_pkg.fermr_bals ('li');
      end loop;

      afw_15_htp_pkg.fermr_bals ('ul');
      afw_15_htp_pkg.fermr_bals ('div');
    end genr_liste_domn_autor;
  begin
    case aa.g_widget_action
      when 'OBTEN_LISTE_DOMN_AUTOR'
      then
        genr_liste_domn_autor;
      else
        null;
    end case;

    return rec_regn_ajax;
  end ajax_domn_contx_autor;

  function genr_afw_04_fil_arian (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
      vbo_sous_liste_ouver   boolean default false;

      procedure genr_ouvri_sous_liste_boots
      is
      begin
        if not vbo_sous_liste_ouver
        then
          afw_15_htp_pkg.ouvri_bals ('ul'
                                    ,'class'
                                    ,'dropdown-menu');
          vbo_sous_liste_ouver   := true;
        end if;
      end genr_ouvri_sous_liste_boots;

      procedure genr_fermr_sous_liste_boots
      is
      begin
        if vbo_sous_liste_ouver
        then
          afw_15_htp_pkg.fermr_bals ('ul');
          vbo_sous_liste_ouver   := false;
        end if;
      end genr_fermr_sous_liste_boots;

      procedure genr_fil_arian_twitr_boots
      is
        cursor cur_fil
        is
              select count (1) over (partition by session_id) nb
                    ,rank () over (order by timst)        rg
                    ,libl
                    ,page
                    ,seqnc
                    ,app_id
                from vd_afw_04_fil_arian fa
               where fa.indic_afich = 'O'
          connect by fa.ref_elemn_sup = prior fa.seqnc
          start with    (    fa.ref_elemn_sup is null
                         and nvl (p_regn.attribute_07, 'Y') = 'Y')
                     or (    fa.ref_elemn_sup is not null
                         and nvl (p_regn.attribute_07, 'Y') = 'N');

        cursor cur_contx (pnu_fil_arian in number)
        is
          select ctx.contx
                ,ctx.actio
                ,ctx.seqnc_contx
                ,ctx.contx_inter
                ,ctx.actio_inter
                ,ctx.seqnc_contx_inter
                ,ctx.nom_procd_infor_suplm
                ,ctx.infor_suplm
            from vd_afw_04_contx ctx
           where ctx.ref_fil_arian = pnu_fil_arian;

        rec_contx         cur_contx%rowtype;
        vva_lien          varchar2 (150)
                            default    'f?p=%app_id%'
                                    || ':%page%:'
                                    || afw_12_sesn_pkg.obten_sesn
                                    || '::NO::SIDF,SAPC:'
                                    || afw_04_fil_arian_pkg.obten_fa_courn ()
                                    || ',XFA%seqnc%';
        vva_lien_href     varchar2 (1999);
        vva_lien_titre    varchar2 (200);
        vva_lien_alt      varchar2 (200);
        vva_libl          varchar2 (1999);
        vnu_debut_subst   pls_integer;
        vnu_fin_subst     pls_integer;
        vva_icone_seprt   varchar2 (30) default p_regn.attribute_01;
        vva_prefx         varchar2 (50) default p_regn.attribute_03;
        vva_valr_formt    varchar2 (4000);
      begin
        afw_15_htp_pkg.ouvri_bals ('ul'
                                  ,'class'
                                  ,'nav navbar-nav');

        for rec_fil in cur_fil
        loop
          vva_libl   := apex_application.do_substitutions (rec_fil.libl);

          if rec_fil.rg = rec_fil.nb
          then
            vva_lien_href    := null;
            vva_lien_titre   := null;
            vva_lien_alt     := null;
          else
            vva_lien_href      :=
              afw_08_url_pkg.genr_url (pnu_numr_aplic     => rec_fil.app_id
                                      ,pnu_numr_page      => rec_fil.page
                                      ,pva_nom_varbl_1    => 'SIDF'
                                      ,pva_valr_varbl_1   => afw_04_fil_arian_pkg.obten_fa_courn ()
                                      ,pva_nom_varbl_2    => 'SAPC'
                                      ,pva_valr_varbl_2   =>   'XFA'
                                                            || rec_fil.seqnc);

            --            vva_lien_href      :=
            --              apex_application.do_substitutions (replace (replace (replace (replace (vva_lien
            --                                                                                    ,'%page%'
            --                                                                                    ,rec_fil.page)
            --                                                                           ,'%libl%'
            --                                                                           ,rec_fil.libl)
            --                                                                  ,'%seqnc%'
            --                                                                  ,rec_fil.seqnc)
            --                                                         ,'%app_id%'
            --                                                         ,rec_fil.app_id));

            -- TODO::CARLO
            -- Traduire
            vva_lien_titre      :=
                 'Naviguer vers '
              || vva_libl;
            vva_lien_alt      :=
                 'Naviguer vers '
              || vva_libl;
          end if;

          -- TODO::CARLO
          -- Traduire
          afw_15_htp_pkg.ouvri_bals ('li'
                                    ,'class'
                                    ,   'dropdown'
                                     || case when vva_lien_href is null then ' active' else null end /*,'title'
                                                                                                     ,case
                                                                                                         when vva_lien_href is null then 'Vous-êtes ici'
                                                                                                         else null
                                                                                                      end*/
                                                                                                    );

          if vva_lien_href is not null
          then
            afw_15_htp_pkg.ouvri_bals ('a'
                                      ,'href'
                                      ,vva_lien_href
                                      ,'alt'
                                      ,vva_lien_alt /*,'title'
                                                    ,vva_lien_titre*/
                                                   );
            afw_15_htp_pkg.ouvri_bals ('i'
                                      ,'class'
                                      ,'fa fa-arrow-right');
            afw_15_htp_pkg.fermr_bals ('i');

            afw_15_htp_pkg.ecrir (   ' '
                                  || vva_libl);

            afw_15_htp_pkg.fermr_bals ('a');
          else
            afw_15_htp_pkg.ouvri_bals ('a'
                                      ,'href'
                                      ,'#');


            afw_15_htp_pkg.ecrir (vva_libl);
            afw_15_htp_pkg.fermr_bals ('a');
          end if;


          -- Afficher informations supplementaires
          if p_regn.attribute_05 = 'Y'
          then
            open cur_contx (rec_fil.seqnc);

            fetch cur_contx
              into rec_contx;

            close cur_contx;

            if rec_contx.nom_procd_infor_suplm is not null
            then
              vva_valr_formt   := afw_21_util_pkg.obten_reslt_expre_plsql (rec_contx.nom_procd_infor_suplm);


              if vva_valr_formt is not null
              then
                genr_ouvri_sous_liste_boots;
                afw_15_htp_pkg.ouvri_bals ('li');
                afw_15_htp_pkg.ecrir (vva_valr_formt);
                afw_15_htp_pkg.fermr_bals ('li');
                vva_valr_formt   := null;
              end if;
            end if;

            if rec_contx.seqnc_contx is not null
            then
              vva_valr_formt      :=
                afw_21_util_pkg.obten_reslt_expre_plsql (   'afw_12_struc_aplic_cu_pkg.obten_valr_formt('''
                                                         || afw_12_struc_aplic_pkg.obten_seqnc (rec_contx.contx)
                                                         || ''','
                                                         || rec_contx.seqnc_contx
                                                         || ')');

              if vva_valr_formt is not null
              then
                genr_ouvri_sous_liste_boots;
                afw_15_htp_pkg.ouvri_bals ('li');

                afw_15_htp_pkg.ecrir (vva_valr_formt);

                afw_15_htp_pkg.fermr_bals ('li');
                vva_valr_formt   := null;
              end if;
            end if;

            if rec_contx.infor_suplm is not null
            then
              genr_ouvri_sous_liste_boots;
              afw_15_htp_pkg.ouvri_bals ('li');
              afw_15_htp_pkg.ecrir (rec_contx.infor_suplm);
              afw_15_htp_pkg.fermr_bals ('li');
            end if;

            -- Afficher contexte
            if p_regn.attribute_06 = 'Y'
            then
              genr_ouvri_sous_liste_boots;
              afw_15_htp_pkg.ouvri_bals ('li');

              afw_15_htp_pkg.ecrir (   '<span>Contexte: '
                                    || rec_contx.contx
                                    || '</span><br />'
                                    || '<span>Sequence: '
                                    || rec_contx.seqnc_contx
                                    || '</span><br />'
                                    || '<span>Action: '
                                    || rec_contx.actio
                                    || '</span>');

              if    rec_contx.contx_inter is not null
                 or rec_contx.actio_inter is not null
                 or rec_contx.seqnc_contx_inter is not null
              then
                afw_15_htp_pkg.ecrir (   '<br /><span>***** Intermédiaire *****</span><br />'
                                      || '<span>Contexte: '
                                      || rec_contx.contx_inter
                                      || '</span><br />'
                                      || '<span>Sequence: '
                                      || rec_contx.seqnc_contx_inter
                                      || '</span><br />'
                                      || '<span>Action: '
                                      || rec_contx.actio_inter
                                      || '</span>');
              end if;

              afw_15_htp_pkg.fermr_bals ('li');
            end if;

            genr_fermr_sous_liste_boots;
          end if;

          afw_15_htp_pkg.fermr_bals ('li');
        end loop;

        afw_15_htp_pkg.fermr_bals ('ul');
      end genr_fil_arian_twitr_boots;
    begin
      -- Exclure la page de connexion
      if     afw_04_fil_arian_pkg.trait_page ()
         and afw_13_page_pkg.obten_page_sesn != afw_11_aplic_pkg.obten_page_conxn
      then
        afw_15_htp_pkg.ouvri_bals ('div'
                                  ,'id'
                                  ,   'afw_04_fil_arian_R'
                                   || p_regn.id
                                  ,'class'
                                  ,'afw_04_fil_arian hidden-xs');

        case p_regn.attribute_04
          when 'CLASQ'
          then
            -- Générer le prefixe
            if p_regn.attribute_03 is not null
            then
              afw_15_htp_pkg.ecrir (   p_regn.attribute_03
                                    || ':');
            end if;

            -- Générer le fil ariane classique
            afw_15_htp_pkg.ecrir (afw_04_fil_arian_cu_pkg.afich);
          when 'AVANC'
          then
            -- Générer le fil ariane avancé
            -- genr_fil_arian ();
            genr_fil_arian_twitr_boots ();
          when 'TWITR_BOOTS'
          then
            -- Générer le fil ariane avancé
            genr_fil_arian_twitr_boots ();
          else
            null;
        end case;

        afw_15_htp_pkg.fermr_bals ('div');

        afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_AUTOR_DUPLQ_PAGE'
                                        ,'N');
      end if;
    end genr_regn;
  begin
    genr_regn (p_region);

    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.regn.fil_arian'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.fil_arian'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    return rec_regn;
  end genr_afw_04_fil_arian;

  function genr_afw_01_err_apex (p_region                in afw_21_util_pkg.t_regn
                                ,p_plugin                in afw_21_util_pkg.t_plugn
                                ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
    begin
      afw_01_err_apex_pkg.afich_mesg_infor_apex ();
    end genr_regn;
  begin
    genr_regn (p_region);

    --dans certain cas, APEX ne semble pas faire de commit
    commit;

    return rec_regn;
  end genr_afw_01_err_apex;

  function genr_afw_01_afich_mesg (p_region                in afw_21_util_pkg.t_regn
                                  ,p_plugin                in afw_21_util_pkg.t_plugn
                                  ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
    begin
      afw_01_gestn_mesg_pkg.afich_mesg_par_numr (p_regn.attribute_01);
    end genr_regn;
  begin
    genr_regn (p_region);
    return rec_regn;
  end genr_afw_01_afich_mesg;

  function genr_afw_13_menu (p_region                in afw_21_util_pkg.t_regn
                            ,p_plugin                in afw_21_util_pkg.t_plugn
                            ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn                    afw_21_util_pkg.t_regn_rendr_reslt;
    rec_confg_plugn_menu        afw_24_navbr_pkg.typ_rec_confg_plugn;
    rec_confg_plugn_item_racn   afw_24_navbr_pkg.typ_rec_confg_plugn_item;
    rec_confg_plugn_item        afw_24_navbr_pkg.typ_rec_confg_plugn_item;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
      vnu_page_regn   number (10);

      procedure genr_menu
      is
        vva_reqt               varchar2 (4000);
        vnu_niv                number (3);
        vva_libl               varchar2 (4000);
        vva_url_cible          varchar2 (200);
        vva_etat_libl          varchar2 (3);
        vnu_item_parnt         number (10);
        vnu_seqnc              number (10);
        vva_clas_racn          varchar2 (60);
        vva_indic_premr_full   varchar2 (1) default 'O';

        --TODO::CARLO im.code
        cursor cur_item_menu
        is
            select seqnc
                  ,forml_libl_formt
                  ,afw_13_menu_pkg.obten_url_cible (im.seqnc) url_cible
                  ,null                                     est_actif
                  ,im.code
                  ,im.icone
                  ,im.lien_id_html
                  ,im.lien_class_css_html
                  ,im.lien_atrib_html
              from vd_afw_13_item_menu im
             where     afw_13_menu_pkg.verfr_droit_acces (im.seqnc) = 1
                   and afw_13_menu_pkg.trait_condt_afich_numbr (im.seqnc) = 1
                   and im.ref_item_menu is null
                   and im.ref_menu = rec_confg_plugn_menu.ref_menu
          order by im.ordre_presn;

        procedure genr_item_menu (pnu_item_menu   in number
                                 ,pbo_genr_tabl   in boolean default false)
        is
          cursor cur_item_menu_enfan
          is
              select seqnc
                    ,niv
                    ,forml_libl_formt
                    ,url_cible
                    ,est_actif
                    ,icone
                    ,lien_id_html
                    ,lien_class_css_html
                    ,lien_atrib_html
                from (select seqnc
                            ,null                                     niv
                            ,forml_libl_formt
                            ,afw_13_menu_pkg.obten_url_cible (im.seqnc) url_cible
                            ,null                                     est_actif
                            ,ordre_presn
                            ,icone
                            ,im.lien_id_html
                            ,im.lien_class_css_html
                            ,im.lien_atrib_html
                        from vd_afw_13_item_menu im
                       where     afw_13_menu_pkg.verfr_droit_acces (im.seqnc) = 1
                             and afw_13_menu_pkg.trait_condt_afich_numbr (im.seqnc) = 1
                             and im.ref_item_menu = pnu_item_menu
                             and rec_confg_plugn_item_racn.etend_nombr_coln = 1
                      union all
                      select seqnc
                            ,1                                        niv
                            ,forml_libl_formt
                            ,afw_13_menu_pkg.obten_url_cible (im.seqnc) url_cible
                            ,null                                     est_actif
                            ,ordre_presn
                            ,icone
                            ,im.lien_id_html
                            ,im.lien_class_css_html
                            ,im.lien_atrib_html
                        from vd_afw_13_item_menu im
                       where     afw_13_menu_pkg.verfr_droit_acces (im.seqnc) = 1
                             and afw_13_menu_pkg.trait_condt_afich_numbr (im.seqnc) = 1
                             and rec_confg_plugn_item_racn.etend_nombr_coln > 1
                             and im.ref_item_menu = pnu_item_menu) sourc
            order by sourc.ordre_presn;

          vbo_enfan_exist   boolean default false;
        begin
          for rec_ime in cur_item_menu_enfan
          loop
            rec_confg_plugn_item      :=
              afw_24_navbr_pkg.obten_enreg_confg_plugn_item (rec_confg_plugn_menu.seqnc
                                                            ,rec_ime.seqnc);


            vbo_enfan_exist   := afw_13_menu_pkg.verfr_enfan_exist (rec_ime.seqnc);

            if vbo_enfan_exist
            then
              -- li
              afw_24_navbr_pkg.creer_liste ('dropdown-header');

              -- a
              case
                when rec_ime.url_cible is not null
                then
                  afw_15_htp_pkg.ouvri_bals ('a'
                                            ,'href'
                                            ,rec_ime.url_cible);
                  afw_24_navbr_pkg.ajout_icone (rec_ime.icone);
                  afw_15_htp_pkg.ouvri_bals ('span');
                  afw_15_htp_pkg.ecrir (rec_ime.forml_libl_formt);
                  afw_15_htp_pkg.fermr_bals ('span');
                  afw_15_htp_pkg.fermr_bals ('a');
                else
                  afw_24_navbr_pkg.ajout_icone (rec_ime.icone);
                  afw_15_htp_pkg.ecrir (rec_ime.forml_libl_formt);
              end case;

              --li
              afw_24_navbr_pkg.fermr_liste;
            else
              -- li
              afw_24_navbr_pkg.creer_liste;
              -- a
              afw_24_navbr_pkg.ecrir_lien (rec_ime.forml_libl_formt
                                          ,rec_ime.lien_class_css_html
                                          ,rec_ime.url_cible
                                          ,rec_ime.icone
                                          ,rec_ime.lien_id_html
                                          ,rec_ime.lien_atrib_html);
            end if;

            if vbo_enfan_exist
            then
              -- ul
              --afw_24_navbr_pkg.creer_liste_desrd ('dropdown-menu');
              null;
            end if;

            genr_item_menu (rec_ime.seqnc);

            if vbo_enfan_exist
            then
              -- ul
              --afw_24_navbr_pkg.fermr_liste_desrd;

              -- li
              afw_24_navbr_pkg.creer_liste ('divider');
            --li
            --afw_24_navbr_pkg.fermr_liste;
            end if;

            --li
            afw_24_navbr_pkg.fermr_liste;
          end loop;
        exception
          when others
          then
            raise;
        end genr_item_menu;
      begin
        -- creation entete
        -- ul
        afw_24_navbr_pkg.creer_entet ();

        for rec_im in cur_item_menu
        loop
          rec_confg_plugn_item_racn      :=
            afw_24_navbr_pkg.obten_enreg_confg_plugn_item (rec_confg_plugn_menu.seqnc
                                                          ,rec_im.seqnc);

          if rec_confg_plugn_item_racn.etend_nombr_coln = 0
          then
            afw_24_navbr_pkg.genr_elemn_no_drop (rec_im.forml_libl_formt
                                                ,rec_im.url_cible
                                                ,rec_im.icone
                                                ,rec_im.lien_class_css_html
                                                ,rec_im.lien_id_html
                                                ,rec_im.lien_atrib_html);
          else
            afw_24_navbr_pkg.creer_elemn_drop (rec_im.forml_libl_formt
                                              ,rec_im.url_cible
                                              ,rec_confg_plugn_item_racn.clas_css_racn
                                              ,rec_confg_plugn_item_racn.ref_dv_align_valr_organ
                                              ,rec_im.icone
                                              ,rec_im.lien_id_html);

            if rec_confg_plugn_item_racn.etend_nombr_coln = 1
            then
              -- ul
              afw_24_navbr_pkg.creer_liste_desrd (   'dropdown-menu'
                                                  || ' menu_'
                                                  || lower (rec_im.code));
            end if;

            genr_item_menu (rec_im.seqnc);

            if rec_confg_plugn_item_racn.etend_nombr_coln = 1
            then
              -- ul
              afw_24_navbr_pkg.fermr_liste_desrd;
            end if;

            -- li
            afw_24_navbr_pkg.fermr_elemn_drop;
          end if;
        end loop;

        -- ul
        afw_24_navbr_pkg.fermr_entet;
      exception
        when others
        then
          raise;
      end genr_menu;
    begin
      -- Exclure la page de connexion
      if afw_13_page_pkg.obten_page_sesn != afw_11_aplic_pkg.obten_page_conxn
      then
        genr_menu ();

        afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_AUTOR_DUPLQ_PAGE'
                                        ,'N');
      end if;
    exception
      when others
      then
        raise;
    end genr_regn;
  begin
    rec_confg_plugn_menu   := afw_24_navbr_pkg.obten_enreg_confg_plugn (p_region.id);

    genr_regn (p_region);

    return rec_regn;
  exception
    when others
    then
      raise;
  end genr_afw_13_menu;

  function genr_afw_13_menu_smart_admin (p_region                in afw_21_util_pkg.t_regn
                                        ,p_plugin                in afw_21_util_pkg.t_plugn
                                        ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn                    afw_21_util_pkg.t_regn_rendr_reslt;
    rec_confg_plugn_menu        afw_24_menu_smart_admin_pkg.typ_rec_confg_plugn;
    rec_confg_plugn_item_racn   afw_24_menu_smart_admin_pkg.typ_rec_confg_plugn_item;
    rec_confg_plugn_item        afw_24_menu_smart_admin_pkg.typ_rec_confg_plugn_item;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
      vnu_page_regn   number (10);

      procedure genr_menu
      is
        vva_reqt               varchar2 (4000);
        vnu_niv                number (3);
        vva_libl               varchar2 (4000);
        vva_url_cible          varchar2 (200);
        vva_etat_libl          varchar2 (3);
        vnu_item_parnt         number (10);
        vnu_seqnc              number (10);
        vva_clas_racn          varchar2 (60);
        vva_indic_premr_full   varchar2 (1) default 'O';

        --TODO::CARLO im.code
        cursor cur_item_menu
        is
            select seqnc
                  ,forml_libl_formt
                  ,afw_13_menu_pkg.obten_url_cible_js (im.seqnc
                                                      ,im.seqnc)
                     url_cible
                  ,afw_13_menu_pkg.valdt_noeud_actif (im.seqnc
                                                     ,im.ref_menu)
                     as est_actif
                  ,im.code
                  ,im.icone
              from vd_afw_13_item_menu im
             where     afw_13_menu_pkg.verfr_droit_acces (im.seqnc) = 1
                   and afw_13_menu_pkg.trait_condt_afich_numbr (im.seqnc) = 1
                   and im.ref_item_menu is null
                   and im.ref_menu = rec_confg_plugn_menu.ref_menu
          order by im.ordre_presn;

        procedure genr_item_menu (pnu_item_menu   in number
                                 ,pbo_genr_tabl   in boolean default false)
        is
          cursor cur_item_menu_enfan
          is
              select seqnc
                    ,forml_libl_formt
                    ,url_cible
                    ,est_actif
                    ,icone
                from (select seqnc
                            ,forml_libl_formt
                            ,afw_13_menu_pkg.obten_url_cible_js (im.seqnc
                                                                ,im.seqnc)
                               url_cible
                            ,afw_13_menu_pkg.valdt_noeud_actif (im.seqnc
                                                               ,im.ref_menu)
                               as est_actif
                            ,ordre_presn
                            ,icone
                        from vd_afw_13_item_menu im
                       where     afw_13_menu_pkg.verfr_droit_acces (im.seqnc) = 1
                             and afw_13_menu_pkg.trait_condt_afich_numbr (im.seqnc) = 1
                             and im.ref_item_menu = pnu_item_menu) sourc
            order by sourc.ordre_presn;

          vva_clas   varchar2 (200) default null;
        begin
          for rec_ime in cur_item_menu_enfan
          loop
            rec_confg_plugn_item      :=
              afw_24_menu_smart_admin_pkg.obten_enreg_confg_plugn_item (rec_confg_plugn_menu.seqnc
                                                                       ,rec_ime.seqnc);

            afw_24_menu_smart_admin_pkg.ouvri_elemn_liste (case when rec_ime.est_actif = 'YES' then 'active' else null end);

            if not afw_13_menu_pkg.verfr_enfan_exist (rec_ime.seqnc)
            then
              afw_24_menu_smart_admin_pkg.creer_elemn (rec_ime.forml_libl_formt
                                                      ,rec_ime.url_cible
                                                      ,rec_ime.icone
                                                      ,false);
            else
              afw_24_menu_smart_admin_pkg.creer_elemn (rec_ime.forml_libl_formt
                                                      ,rec_ime.url_cible
                                                      ,rec_ime.icone
                                                      ,true);

              afw_24_menu_smart_admin_pkg.ouvri_liste;
              genr_item_menu (rec_ime.seqnc);
              afw_24_menu_smart_admin_pkg.fermr_liste;
            end if;

            afw_24_menu_smart_admin_pkg.fermr_elemn_liste;
          end loop;
        exception
          when others
          then
            raise;
        end genr_item_menu;
      begin
        -- creation entete
        -- ul
        afw_24_menu_smart_admin_pkg.ouvri_entet ();

        for rec_im in cur_item_menu
        loop
          rec_confg_plugn_item_racn      :=
            afw_24_menu_smart_admin_pkg.obten_enreg_confg_plugn_item (rec_confg_plugn_menu.seqnc
                                                                     ,rec_im.seqnc);

          afw_24_menu_smart_admin_pkg.ouvri_elemn_liste (case when rec_im.est_actif = 'YES' then 'active' else null end);

          if not afw_13_menu_pkg.verfr_enfan_exist (rec_im.seqnc)
          then
            afw_24_menu_smart_admin_pkg.creer_elemn (rec_im.forml_libl_formt
                                                    ,rec_im.url_cible
                                                    ,rec_im.icone
                                                    ,false);
          else
            afw_24_menu_smart_admin_pkg.creer_elemn (rec_im.forml_libl_formt
                                                    ,rec_im.url_cible
                                                    ,rec_im.icone
                                                    ,true);
            afw_24_menu_smart_admin_pkg.ouvri_liste;
            genr_item_menu (rec_im.seqnc);
            afw_24_menu_smart_admin_pkg.fermr_liste;
          end if;

          afw_24_menu_smart_admin_pkg.fermr_elemn_liste ();
        end loop;

        -- ul
        afw_24_menu_smart_admin_pkg.fermr_entet;
      exception
        when others
        then
          raise;
      end genr_menu;
    begin
      -- Exclure la page de connexion
      if afw_13_page_pkg.obten_page_sesn != afw_11_aplic_pkg.obten_page_conxn
      then
        genr_menu ();

        afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_AUTOR_DUPLQ_PAGE'
                                        ,'N');
      end if;
    exception
      when others
      then
        raise;
    end genr_regn;
  begin
    rec_confg_plugn_menu   := afw_24_menu_smart_admin_pkg.obten_enreg_confg_plugn (p_region.id);

    genr_regn (p_region);

    return rec_regn;
  exception
    when others
    then
      raise;
  end genr_afw_13_menu_smart_admin;

  function genr_menu_plein_ecran (p_region                in afw_21_util_pkg.t_regn
                                 ,p_plugin                in afw_21_util_pkg.t_plugn
                                 ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn               afw_21_util_pkg.t_regn_rendr_reslt;
    rec_confg_plugn_menu   afw_24_menu_plein_ecran_pkg.typ_rec_confg_plugn;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
      procedure genr_menu
      is
        --TODO::CARLO im.code
        cursor cur_item_menu
        is
            select seqnc
                  ,forml_libl_formt
                  ,afw_13_menu_pkg.obten_url_cible_js (im.seqnc
                                                      ,im.seqnc)
                     url_cible
                  ,afw_13_menu_pkg.valdt_noeud_actif (im.seqnc
                                                     ,im.ref_menu)
                     as est_actif
                  ,im.code
                  ,im.icone
                  ,im.lien_id_html
                  ,im.lien_class_css_html
                  ,im.lien_atrib_html
              from vd_afw_13_item_menu im
             where     afw_13_menu_pkg.verfr_droit_acces (im.seqnc) = 1
                   and afw_13_menu_pkg.trait_condt_afich_numbr (im.seqnc) = 1
                   and im.ref_item_menu is null
                   and im.ref_menu = rec_confg_plugn_menu.ref_menu
          order by im.ordre_presn;

        vnu_nombr_coln        number default 0;
        vnu_nombr_coln_maxm   number default 6;
      begin
        afw_24_menu_plein_ecran_pkg.ouvri_menu ();

        for rec_im in cur_item_menu
        loop
          vnu_nombr_coln   := vnu_nombr_coln + 1;

          if vnu_nombr_coln = 1
          then
            afw_24_menu_plein_ecran_pkg.ouvri_rang;
          end if;

          afw_24_menu_plein_ecran_pkg.creer_elemn (rec_im.forml_libl_formt
                                                  ,rec_im.url_cible
                                                  ,rec_im.icone
                                                  ,rec_im.lien_id_html
                                                  ,rec_im.lien_class_css_html
                                                  ,rec_im.lien_atrib_html);

          if vnu_nombr_coln = vnu_nombr_coln_maxm
          then
            afw_24_menu_plein_ecran_pkg.fermr_rang;
            vnu_nombr_coln   := 0;
          end if;
        end loop;

        afw_24_menu_plein_ecran_pkg.fermr_menu;
      exception
        when others
        then
          raise;
      end genr_menu;
    begin
      -- Exclure la page de connexion
      if afw_13_page_pkg.obten_page_sesn != afw_11_aplic_pkg.obten_page_conxn
      then
        genr_menu ();

        afw_07_util_pkg.defnr_etat_sesn ('A_AFW_04_AUTOR_DUPLQ_PAGE'
                                        ,'N');
      end if;
    exception
      when others
      then
        raise;
    end genr_regn;
  begin
    rec_confg_plugn_menu   := afw_24_menu_plein_ecran_pkg.obten_enreg_confg_plugn (p_region.id);

    genr_regn (p_region);

    return rec_regn;
  exception
    when others
    then
      raise;
  end genr_menu_plein_ecran;

  function genr_afw_13_liste_navgt (p_region                in afw_21_util_pkg.t_regn
                                   ,p_plugin                in afw_21_util_pkg.t_plugn
                                   ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
      vva_elemn_liste_navgt   varchar2 (32767) default afw_13_page_pkg.genr_elemn_liste_navgt;
    begin
      -- Ne pas generer si la liste est vide
      -- Exclure la page de connexion
      if     vva_elemn_liste_navgt is not null
         and afw_13_page_pkg.obten_page_sesn != afw_11_aplic_pkg.obten_page_conxn
      then
        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'btn-group');
        afw_15_htp_pkg.ouvri_bals ('a'
                                  ,'href'
                                  ,'#'
                                  ,'data-toggle'
                                  ,'dropdown'
                                  ,'class'
                                  ,'btn btn-ribbon btn-navgt btn-xs dropdown-toggle');
        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'caret single');
        afw_15_htp_pkg.fermr_bals ('span');
        afw_15_htp_pkg.fermr_bals ('a');
        afw_15_htp_pkg.ouvri_bals ('ul'
                                  ,'class'
                                  ,'dropdown-menu pull-right');
        afw_15_htp_pkg.ecrir (vva_elemn_liste_navgt);
        afw_15_htp_pkg.fermr_bals ('ul');
        afw_15_htp_pkg.fermr_bals ('span');
      end if;
    end genr_regn;
  begin
    genr_regn (p_region);

    return rec_regn;
  end genr_afw_13_liste_navgt;

  function genr_aide_page (p_region                in afw_21_util_pkg.t_regn
                          ,p_plugin                in afw_21_util_pkg.t_plugn
                          ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
      procedure genr_lien_aide_page
      is
      begin
        afw_15_htp_pkg.ouvri_bals ('a'
                                  ,'href'
                                  ,'#'
                                  ,'alt'
                                  ,'Afficher l''aide de la page'
                                  ,'title'
                                  ,'Afficher l''aide de la page'
                                  ,'class'
                                  ,'afich_afw_13_aide_page btn btn-info btn-mini');



        afw_15_htp_pkg.ouvri_bals ('i'
                                  ,'class'
                                  ,'fa fa-question');
        afw_15_htp_pkg.fermr_bals ('i');

        --TODO::CARLO
        -- traduction
        afw_15_htp_pkg.ecrir (' Aide');

        afw_15_htp_pkg.fermr_bals ('a');
      end genr_lien_aide_page;
    begin
      afw_15_htp_pkg.ouvri_bals ('div'
                                ,'id'
                                ,   'afw_13_aide_page_R'
                                 || p_regn.id
                                ,'class'
                                ,'afw_13_aide_page');
      genr_lien_aide_page;

      afw_15_htp_pkg.fermr_bals ('div');
    end genr_regn;
  begin
    genr_regn (p_region);

    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.regn.aide_page'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.aide_page'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.regn.aide_page.insta.push(new afw.afw_21.regn.aide_page.aide_page({'
                                            || apex_javascript.add_attribute ('vva_id_regn'
                                                                             ,   'afw_13_aide_page_R'
                                                                              || p_region.id)
                                            || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                                             ,apex_plugin.get_ajax_identifier
                                                                             ,p_add_comma   => false)
                                            || '}));');

    return rec_regn;
  end genr_aide_page;

  function ajax_aide_page (p_region   in afw_21_util_pkg.t_regn
                          ,p_plugin   in afw_21_util_pkg.t_plugn)
    return afw_21_util_pkg.t_regn_ajax_reslt
  is
    rec_regn_ajax   apex_plugin.t_region_ajax_result;
  begin
    case aa.g_widget_action
      when 'OBTEN_AIDE_PAGE'
      then
        afw_15_htp_pkg.ouvri_bals ('div'
                                  ,'class'
                                  ,'ui-widget-content');
        afw_15_htp_pkg.ecrir (afw_13_regn_piltb_pkg.obten_contn_aide_page (afw_13_page_pkg.obten_page_sesn
                                                                          ,afw_01_lang_pkg.obten_lang_sesn));

        --if wwv_flow_api.p_ALLOW_FEEDBACK_YN = 'Y' then
        /*
        afw_15_htp_pkg.ouvri_bals ('a'
                                  ,'id'
                                  ,'boutn_comnt_bogue'
                                  ,'href'
                                  ,'#'
                                  ,'alt'
                                  ,'Page de feedback'
                                  ,'title'
                                  ,'Page de feedback'
                                  ,'class'
                                  ,'btn btn-primary btn-large');

        afw_15_htp_pkg.ouvri_bals ('i', 'class', 'fa fa-bug');
        afw_15_htp_pkg.fermr_bals ('i');

        afw_15_htp_pkg.ecrir ('Soumettre vos commentaires et bogues');
        afw_15_htp_pkg.fermr_bals ('a');
        */



        --end if;

        afw_15_htp_pkg.fermr_bals ('div');
      else
        null;
    end case;

    return rec_regn_ajax;
  end ajax_aide_page;

  function genr_ifram (p_region                in afw_21_util_pkg.t_regn
                      ,p_plugin                in afw_21_util_pkg.t_plugn
                      ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn            afw_21_util_pkg.t_regn_rendr_reslt;

    vnu_min_height      integer := nvl (p_region.attribute_06, 0);
    vnu_height_offset   integer := nvl (p_region.attribute_07, 0);

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
      vva_url               varchar2 (1000);
      vnu_numr_apex_aplic   number;
      vnu_numr_apex_page    number;
      vbo_url_apex          boolean;
      vva_region_atrib      varchar2 (1000);
    begin
     <<bloc_html_atrib>>
      begin
        select region_attributes_substitution
          into vva_region_atrib
          from apex_regn ar
         where ar.id = p_regn.id;
      end bloc_html_atrib;


      if afw_21_util_pkg.formt_plugn_atrib_boln (p_regn.attribute_01)
      then
        vnu_numr_apex_aplic   := afw_21_util_pkg.obten_reslt_expre_plsql (p_regn.attribute_02);

        vnu_numr_apex_page    := afw_21_util_pkg.obten_reslt_expre_plsql (p_regn.attribute_03);

        vva_url               :=
          afw_08_url_pkg.genr_url (vnu_numr_apex_aplic
                                  ,vnu_numr_apex_page);
      else
        vva_url   := afw_21_util_pkg.obten_reslt_expre_plsql (p_regn.attribute_04);
      end if;

      afw_15_htp_pkg.ouvri_bals ('div'
                                ,'id'
                                ,p_regn.static_id
                                ,'class'
                                ,'afw_21_regn_ifram');
      afw_15_htp_pkg.ouvri_bals (pva_nom       => 'iframe'
                                ,pva_parmt_1   => 'id'
                                ,pva_valr_1    => p_regn.id
                                ,pva_parmt_2   => 'src'
                                ,pva_valr_2    => vva_url
                                ,pva_parmt_3   => 'class'
                                ,pva_valr_3    => case when afw_21_util_pkg.formt_plugn_atrib_boln (p_regn.attribute_05) then 'auto-height' else null end
                                ,pva_parmt_4   => 'height'
                                ,pva_valr_4    => vnu_min_height
                                ,pva_extra     => vva_region_atrib);
      afw_15_htp_pkg.ouvri_bals ('p');
      afw_15_htp_pkg.fermr_bals ('p');
      afw_15_htp_pkg.fermr_bals ('iframe');
      afw_15_htp_pkg.fermr_bals ('div');
    end genr_regn;
  begin
    if afw_21_util_pkg.formt_plugn_atrib_boln (p_region.attribute_05)
    then
      --Ajouter les librairies JavaScript
      afw_21_util_pkg.ajout_libr_javsc ('jquery.iframe-auto-height.plugin.1.9.5'
                                       ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                        || 'assets/plugins/jquery-iframe-auto-height/1.9.5/release/');
      afw_21_util_pkg.ajout_code_javsc_charg (   '$("#'
                                              || p_region.id
                                              || '").iframeAutoHeight({"minHeight":'
                                              || to_char (vnu_min_height)
                                              || ',"heightOffset":'
                                              || to_char (vnu_height_offset)
                                              || '});');
    end if;

    genr_regn (p_region);

    return rec_regn;
  end genr_ifram;

  function genr_telvr_fichr (p_region                in afw_21_util_pkg.t_regn
                            ,p_plugin                in afw_21_util_pkg.t_plugn
                            ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
    begin
      afw_15_htp_pkg.ouvri_bals ('div'
                                ,'id'
                                ,   'afw_21_telvr_fichr_R'
                                 || p_regn.id
                                ,'class'
                                ,'afw_21_telvr_fichr'
                                ,'name'
                                ,'files[]');

      -- INPUT
      afw_15_htp_pkg.ouvri_bals ('input/'
                                ,'id'
                                ,'selct_fichr'
                                ,'type'
                                ,'file'
                                ,pva_extra   => 'multiple');

      -- DROP ZONE
      afw_15_htp_pkg.ouvri_bals ('div'
                                ,'class'
                                ,'drop_zone');
      afw_15_htp_pkg.ecrir (afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('PLU.000001'
                                                                      ,pva_code_prodt   => 'AFW'));
      afw_15_htp_pkg.fermr_bals ('div');

      -- OUTPUT
      afw_15_htp_pkg.ouvri_bals ('output'
                                ,'class'
                                ,'liste_fichr');
      afw_15_htp_pkg.ouvri_bals ('ul');
      afw_15_htp_pkg.fermr_bals ('ul');
      afw_15_htp_pkg.fermr_bals ('output');

      afw_15_htp_pkg.fermr_bals ('div');
    end genr_regn;
  begin
    afw_21_plugn_blob_pkg.suprm_colct ();

    genr_regn (p_region);

    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.regn.telvr_fichr'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.telvr_fichr'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.regn.telvr_fichr.insta.push(new afw.afw_21.regn.telvr_fichr.telvr_fichr({'
                                            || apex_javascript.add_attribute ('vva_id_regn'
                                                                             ,   'afw_21_telvr_fichr_R'
                                                                              || p_region.id)
                                            || apex_javascript.add_attribute ('vva_nom_plugn'
                                                                             ,p_plugin.name)
                                            || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                                             ,apex_plugin.get_ajax_identifier)
                                            || apex_javascript.add_attribute ('vbo_telvr_multp'
                                                                             ,afw_21_util_pkg.formt_plugn_atrib_boln (p_region.attribute_01))
                                            || apex_javascript.add_attribute ('vva_mesg_limt_tail_fichr'
                                                                             ,afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('PLU.000002'
                                                                                                                        ,pva_code_prodt   => 'AFW'))
                                            || apex_javascript.add_attribute ('vva_mesg_navgt_obsol'
                                                                             ,afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('PLU.000003'
                                                                                                                        ,pva_code_prodt   => 'AFW'))
                                            || apex_javascript.add_attribute ('vva_mesg_limt_telvr'
                                                                             ,afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('PLU.000004'
                                                                                                                        ,pva_code_prodt   => 'AFW')
                                                                             ,p_add_comma   => false)
                                            || '}));');

    return rec_regn;
  end genr_telvr_fichr;

  function genr_time_line (p_region                in afw_21_util_pkg.t_regn
                          ,p_plugin                in afw_21_util_pkg.t_plugn
                          ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
    begin
      afw_15_htp_pkg.ouvri_bals ('div'
                                ,'id'
                                ,   p_region.id
                                 || '_timeline'
                                ,'class'
                                ,'timeline');
      afw_15_htp_pkg.fermr_bals ('div');
    end genr_regn;
  begin
    afw_21_plugn_blob_pkg.suprm_colct ();

    genr_regn (p_region);

    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('timeline'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/plugins/timeline/2.7.0/');

    afw_21_util_pkg.ajout_libr_javsc ('timeline'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/timeline/2.7.0/');

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.time_line'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    -- afw_21_util_pkg.ajout_code_javsc_charg ('$.getScript("http://www.google.com/jsapi",function(){google.load("visualization", "1")});');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.regn.time_line.insta.push(new afw.afw_21.regn.time_line.time_line({'
                                            || apex_javascript.add_attribute ('vva_id_regn'
                                                                             ,   p_region.id
                                                                              || '_timeline')
                                            || apex_javascript.add_attribute ('vva_nom_plugn'
                                                                             ,p_plugin.name)
                                            || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                                             ,apex_plugin.get_ajax_identifier
                                                                             ,p_add_comma   => false)
                                            || '}));');

    return rec_regn;
  end genr_time_line;

  function genr_gantt (p_region                in afw_21_util_pkg.t_regn
                      ,p_plugin                in afw_21_util_pkg.t_plugn
                      ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
    begin
      afw_15_htp_pkg.ouvri_bals ('div'
                                ,'id'
                                ,   p_region.id
                                 || '_timeline'
                                ,'class'
                                ,'timeline');
      afw_15_htp_pkg.fermr_bals ('div');
    end genr_regn;
  begin
    afw_21_plugn_blob_pkg.suprm_colct ();

    genr_regn (p_region);

    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('timeline'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/plugins/timeline/2.7.0/');

    /* apex_javascript.add_library (p_name             => 'jsapi'
                                 ,p_directory        => '//www.google.com/'
                                 ,p_skip_extension   => true);*/

    afw_21_util_pkg.ajout_libr_javsc ('timeline'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/timeline/2.7.0/');

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.regn.time_line'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    -- afw_21_util_pkg.ajout_code_javsc_charg ('$.getScript("http://www.google.com/jsapi",function(){google.load("visualization", "1")});');


    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.regn.time_line.insta.push(new afw.afw_21.regn.time_line.time_line({'
                                            || apex_javascript.add_attribute ('vva_id_regn'
                                                                             ,   p_region.id
                                                                              || '_timeline')
                                            || apex_javascript.add_attribute ('vva_nom_plugn'
                                                                             ,p_plugin.name)
                                            || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                                             ,apex_plugin.get_ajax_identifier
                                                                             ,p_add_comma   => false)
                                            || '}));');

    return rec_regn;
  end genr_gantt;

  function genrt_pdf (p_region                in afw_21_util_pkg.t_regn
                     ,p_plugin                in afw_21_util_pkg.t_plugn
                     ,p_is_printer_friendly   in boolean)
    return afw_21_util_pkg.t_regn_rendr_reslt
  is
    rec_regn   afw_21_util_pkg.t_regn_rendr_reslt;

    procedure genr_regn (p_regn in afw_21_util_pkg.t_regn)
    is
    begin
      afw_21_plugn_pdf_pkg.genrt_plugn_regn_pdf (p_region.id
                                                ,afw_21_util_pkg.obten_reslt_expre_plsql (p_region.attribute_01));
    end genr_regn;
  begin
    genr_regn (p_region);

    return rec_regn;
  end genrt_pdf;
begin
  gta_code_plugn ('AFW_13_CONFR_SAUVG')        := 'AFW_13_CONFR_SAUVG';
  gta_code_plugn ('AFW_18_DEPSM_TABLR_FORM')   := 'AFW_18_DEPSM_TABLR_FORM';
  gta_code_plugn ('AFW_18')                    := 'AFW_18';
  gta_code_plugn ('AFW_14_POPUP_LOV_ITEM')     := 'AFW_14_POPUP_LOV_ITEM';
  gta_code_plugn ('AFW_14_POPUP_LOV')          := 'AFW_14_POPUP_LOV';
exception
  when others
  then
    afw_01_err_apex_pkg.lever_err_apex_mesg ('Initialisation de afw_13_plugn_pkg');
end afw_21_regn_pkg;
/
