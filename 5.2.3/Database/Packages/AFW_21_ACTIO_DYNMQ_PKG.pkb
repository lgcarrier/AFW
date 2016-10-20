SET DEFINE OFF;
create or replace package body afw_21_actio_dynmq_pkg
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
      when gta_code_plugn ('AFW_18')
      then
        begin
          select p.indic_prise_charg_afw18
            into vva_indic_prise_charg
            from vd_afw_13_page p
           where p.seqnc = afw_13_page_pkg.obten_page_sesn;
        end; /*
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

  function obten_id_regn_afect (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
    return number
  is
    vnu_id_regn_afect   apex_actio_dynmq_actio.affected_region_id%type;
  begin
    select aada.affected_region_id
      into vnu_id_regn_afect
      from apex_actio_dynmq_actio aada
     where aada.id = pnu_actio_dynmq;

    return vnu_id_regn_afect;
  exception
    when no_data_found
    then
      return null;
  end obten_id_regn_afect;

  function obten_ident_regn_afect (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
    return varchar2
  is
    vva_ident   apex_regn.region_name%type;
  begin
    select nvl (ar.region_name
               ,   'R'
                || ar.id)
      into vva_ident
      from apex_regn              ar
          ,apex_actio_dynmq_actio aada
     where     ar.id = aada.affected_region_id
           and aada.id = pnu_actio_dynmq;

    return vva_ident;
  exception
    when no_data_found
    then
      return null;
  end obten_ident_regn_afect;

  function obten_elemn_afect (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
    return varchar2
  is
    vva_elemn_afect   apex_actio_dynmq_actio.affected_elements%type;
  begin
    select aada.affected_elements
      into vva_elemn_afect
      from apex_actio_dynmq_actio aada
     where aada.id = pnu_actio_dynmq;

    return vva_elemn_afect;
  exception
    when no_data_found
    then
      return null;
  end obten_elemn_afect;

  function obten_elemn_decln (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
    return varchar2
  is
    vva_elemn_decln   apex_actio_dynmq_evenm.triggering_element%type;
  begin
    select aade.triggering_element
      into vva_elemn_decln
      from apex_actio_dynmq_evenm aade
          ,apex_actio_dynmq_actio aada
     where     aade.id = aada.event_id
           and aada.id = pnu_actio_dynmq;

    return vva_elemn_decln;
  exception
    when no_data_found
    then
      return null;
  end obten_elemn_decln;

  function obten_boutn_decln (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
    return varchar2
  is
    vva_boutn_decln   apex_boutn_page.button_name%type;
  begin
    select abp.button_name
      into vva_boutn_decln
      from apex_boutn_page        abp
          ,apex_actio_dynmq_evenm aade
          ,apex_actio_dynmq_actio aada
     where     abp.id = aade.triggering_button_id
           and aade.triggering_element_type = 'BUTTON'
           and aade.id = aada.event_id
           and aada.id = pnu_actio_dynmq;

    return vva_boutn_decln;
  exception
    when no_data_found
    then
      return null;
  end obten_boutn_decln;

  function genr_plugn_confr_sauvg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                  ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
    vva_mesg_confr    varchar2 (2000);
  begin
    if valdr_prise_charg (gta_code_plugn ('AFW_13_CONFR_SAUVG'))
    then
      vva_mesg_confr   := nvl (afw_21_plugn_confr_sauvg_pkg.obten_mesg_confr, p_dynamic_action.attribute_01);

      afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                        ,p_plugin);

      afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.confr_sauvg'
                                       ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                        || 'assets/libs/js/');

      rec_actio_dynmq.javascript_function      :=
           'function(){'
        || 'afw.afw_21.actio_dynmq.confr_sauvg.insta.push('
        || 'new afw.afw_21.actio_dynmq.confr_sauvg.confr_sauvg('
        || '{'
        || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                         ,to_char (p_dynamic_action.id))
        || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                         ,   'actio_dynmq_'
                                          || p_dynamic_action.id)
        || apex_javascript.add_attribute ('vva_nom_plugn'
                                         ,p_plugin.name)
        || apex_javascript.add_attribute ('vva_plugn_ajax'
                                         ,apex_plugin.get_ajax_identifier)
        || apex_javascript.add_attribute ('vva_mesg_confr'
                                         ,vva_mesg_confr
                                         ,p_add_comma   => false)
        || '}));}';

      return rec_actio_dynmq;
    else
      rec_actio_dynmq.javascript_function   := 'false';
    end if;

    return rec_actio_dynmq;
  exception
    when others
    then
      ete ();
      raise;
  end genr_plugn_confr_sauvg;

  function ajax_plugn_confr_sauvg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                  ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
  begin
    case aa.g_widget_action
      when 'OBTEN_JSON_ITEM'
      then
        afw_21_plugn_confr_sauvg_pkg.obten_json_item_confr ();
      when 'OBTEN_JSON_REQT'
      then
        afw_21_plugn_confr_sauvg_pkg.obten_json_reqt_sauvg ();
      else
        null;
    end case;

    return rec_actio_dynmq;
  end ajax_plugn_confr_sauvg;

  function genr_plugn_confr_sauvg_reint (p_dynamic_action   in apex_plugin.t_dynamic_action
                                        ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_13.plugn_confr_sauvg.reint();'
      || '}';
    return rec_actio_dynmq;
  end genr_plugn_confr_sauvg_reint;

  function genr_afw_18_depsm_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                        ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;

    function valdr_prise_charg
      return boolean
    is
      vbo_valdr_prise_charg   boolean default false;
      vnu_nombr               number;
    begin
      select count (*)
        into vnu_nombr
        from apex_regn_coln      arc
            ,apex_regn           ar
            ,vd_afw_13_page_item pi
            ,vd_afw_11_aplic     ap
            ,vd_afw_13_page      p
       where     arc.column_alias = pi.depsm_alias_coln
             and arc.flow_id = ar.flow_id
             and arc.region_id = ar.id
             and ar.plug_source_type = 'UPDATABLE_SQL_QUERY'
             and ar.flow_id = ap.numr_aplic_apex
             and ar.page_id = p.numr_apex
             and pi.ref_page = p.seqnc
             and ap.seqnc = p.ref_aplic
             and p.indic_prise_charg_afw18 = 'O'
             and p.seqnc = afw_13_page_pkg.obten_page_sesn;

      vbo_valdr_prise_charg   := case when vnu_nombr > 0 then true else false end;

      return vbo_valdr_prise_charg;
    end valdr_prise_charg;
  begin
    if valdr_prise_charg
    then
      afw_07_util_pkg.ajout_info_debug ('AFW 21 - Plugin Action Dynamique - D¿ssements Formulaire Tabulaire');

      afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                        ,p_plugin);

      afw_21_util_pkg.ajout_libr_css ('afw.afw_21.actio_dynmq.afw_18_depsm_tablr_form'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/css/');

      afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.afw_18_depsm_tablr_form'
                                       ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                        || 'assets/libs/js/');

      rec_actio_dynmq.javascript_function      :=
           'function(){'
        || 'afw.afw_21.actio_dynmq.afw_18_depsm_tablr_form.insta.push('
        || 'new afw.afw_21.actio_dynmq.afw_18_depsm_tablr_form.afw_18_depsm_tablr_form('
        || '{'
        || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                         ,to_char (p_dynamic_action.id))
        || apex_javascript.add_attribute ('vva_nom_plugn'
                                         ,p_plugin.name)
        || apex_javascript.add_attribute ('vva_plugn_ajax'
                                         ,apex_plugin.get_ajax_identifier)
        || apex_javascript.add_attribute ('vva_nom_coln_cle_primr'
                                         ,afw_18_tablr_form_pkg.obten_nom_coln_cle_primr
                                         ,p_add_comma   => false)
        || '}));}';
    else
      rec_actio_dynmq.javascript_function   := 'false';
    end if;

    return rec_actio_dynmq;
  end genr_afw_18_depsm_tablr_form;

  function ajax_afw_18_depsm_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                        ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
  begin
    case aa.g_widget_action
      when 'OBTEN_ITEM_DEPSM_TABLR_FORM'
      then
        afw_18_tablr_form_pkg.obten_json_item_depsm ();
      else
        null;
    end case;

    return rec_actio_dynmq;
  end ajax_afw_18_depsm_tablr_form;

  function genr_plugn_depsm_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
  begin
    return genr_afw_18_depsm_tablr_form (p_dynamic_action
                                        ,p_plugin);
  end genr_plugn_depsm_tablr_form;

  function ajax_plugn_depsm_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
  begin
    return ajax_afw_18_depsm_tablr_form (p_dynamic_action
                                        ,p_plugin);
  end ajax_plugn_depsm_tablr_form;

  function genr_plugn_navgt_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    if valdr_prise_charg (gta_code_plugn ('AFW_18'))
    then
      afw_07_util_pkg.ajout_info_debug ('AFW 21 - Plugin Action Dynamique - Navigation Formulaire Tabulaire');

      afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                        ,p_plugin);

      afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.navgt_tablr_form'
                                       ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                        || 'assets/libs/js/');

      rec_actio_dynmq.javascript_function      :=
           'function(){'
        || 'afw.afw_21.actio_dynmq.navgt_tablr_form.initl();'
        || '}';
    else
      rec_actio_dynmq.javascript_function   := 'false';
    end if;

    return rec_actio_dynmq;
  end genr_plugn_navgt_tablr_form;

  function genr_plugn_gestn_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    if valdr_prise_charg (gta_code_plugn ('AFW_18'))
    then
      afw_07_util_pkg.ajout_info_debug ('AFW 21 - Plugin Action Dynamique - Gestion Formulaire Tabulaire');

      afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                        ,p_plugin);

      afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.gestn_tablr_form'
                                       ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                        || 'assets/libs/js/');

      rec_actio_dynmq.javascript_function      :=
           'function(){'
        || 'afw.afw_21.actio_dynmq.gestn_tablr_form.initl();'
        || '}';
    else
      rec_actio_dynmq.javascript_function   := 'false';
    end if;

    return rec_actio_dynmq;
  end genr_plugn_gestn_tablr_form;

  function genr_plugn_cliqr_selct_texte (p_dynamic_action   in apex_plugin.t_dynamic_action
                                        ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq         apex_plugin.t_dynamic_action_render_result;
    vva_elemn_decln         apex_actio_dynmq_evenm.triggering_element%type;
    vvc_liste_elemn_afect   apex_application_global.vc_arr2;
    vva_liste_elemn_afect   varchar2 (4000);
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Cliquer pour selectioner tout le texte');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.cliqr_selct_texte'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    vva_elemn_decln   := obten_elemn_decln (p_dynamic_action.id);

    vvc_liste_elemn_afect      :=
      afw_07_util_pkg.string_to_table (obten_elemn_afect (p_dynamic_action.id)
                                      ,',');

    if vvc_liste_elemn_afect.count > 0
    then
      vva_liste_elemn_afect   := '[';

      for i in 1 .. vvc_liste_elemn_afect.count
      loop
        vva_liste_elemn_afect      :=
             vva_liste_elemn_afect
          || '"'
          || vvc_liste_elemn_afect (i)
          || '",';
      end loop;

      vva_liste_elemn_afect      :=
           rtrim (vva_liste_elemn_afect
                 ,',')
        || ']';

      --Initialiser le plugin
      rec_actio_dynmq.javascript_function      :=
           'function(){'
        || 'afw.afw_21.actio_dynmq.cliqr_selct_texte.insta.push('
        || 'new afw.afw_21.actio_dynmq.cliqr_selct_texte.cliqr_selct_texte({'
        || apex_javascript.add_attribute ('vva_item_sourc'
                                         ,vva_elemn_decln)
        || afw_21_util_pkg.ajout_atrib_tabl_javsc ('vjs_cible'
                                                  ,vva_liste_elemn_afect
                                                  ,pbo_afich_virgl   => false)
        || '}));}';
    else
      rec_actio_dynmq.javascript_function   := 'false';
    end if;

    return rec_actio_dynmq;
  end genr_plugn_cliqr_selct_texte;

  function genr_matrc_raprt_sql (p_dynamic_action   in apex_plugin.t_dynamic_action
                                ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq           apex_plugin.t_dynamic_action_render_result;
    vva_id_regn_reprt_catch   varchar2 (400);
    vva_id_regn_reprt         varchar2 (400);
    vva_surlg_ligne           varchar2 (1000);

    function obten_tabl_javsc (pva_liste in varchar2)
      return varchar2
    is
      vvc_liste        apex_application_global.vc_arr2;
      vva_tabl_javsc   varchar2 (1000);
    begin
      vvc_liste        :=
        afw_07_util_pkg.string_to_table (pva_liste
                                        ,',');

      vva_tabl_javsc   := '[';

      if vvc_liste.count > 0
      then
        for i in vvc_liste.first .. vvc_liste.last
        loop
          vva_tabl_javsc      :=
               vva_tabl_javsc
            || '"'
            || vvc_liste (i)
            || '",';
        end loop;
      end if;

      vva_tabl_javsc      :=
           rtrim (vva_tabl_javsc
                 ,',')
        || ']';

      return vva_tabl_javsc;
    end obten_tabl_javsc;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 - Plugin Action Dynamique - genr_matrc_raprt_sql');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    vva_id_regn_reprt_catch      :=
         'report_'
      || obten_id_regn_afect (p_dynamic_action.id)
      || '_catch';
    vva_id_regn_reprt      :=
         'report_R'
      || obten_id_regn_afect (p_dynamic_action.id);

    vva_surlg_ligne   := obten_tabl_javsc (p_dynamic_action.attribute_02);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.trans_raprt_sql'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.matrc_raprt_sql'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.matrc_raprt_sql.insta.push('
      || 'new afw.afw_21.actio_dynmq.matrc_raprt_sql.matrc_raprt_sql({'
      || apex_javascript.add_attribute ('vva_id_regn_reprt_catch'
                                       ,vva_id_regn_reprt_catch)
      || apex_javascript.add_attribute ('vva_id_regn_reprt'
                                       ,vva_id_regn_reprt)
      || apex_javascript.add_attribute ('vva_id_regn'
                                       ,obten_id_regn_afect (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vnu_nombr_coln_gauch'
                                       ,p_dynamic_action.attribute_01)
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_surlg_ligne'
                                                ,vva_surlg_ligne
                                                ,pbo_afich_virgl   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_matrc_raprt_sql;

  function genr_group_entet_raprt_sql (p_dynamic_action   in apex_plugin.t_dynamic_action
                                      ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq           apex_plugin.t_dynamic_action_render_result;
    vva_id_regn_reprt_catch   varchar2 (400);
    vva_id_regn_reprt         varchar2 (400);
    vva_ligne_1               varchar2 (1000);
    vva_ligne_2               varchar2 (1000);
    vva_ligne_3               varchar2 (1000);

    function obten_tabl_javsc (pva_liste_libl    in varchar2
                              ,pva_liste_formt   in varchar2)
      return varchar2
    is
      vvc_liste_libl         apex_application_global.vc_arr2;
      vvc_liste_formt        apex_application_global.vc_arr2;
      vvc_liste_sous_formt   apex_application_global.vc_arr2;
      vva_tabl_javsc         varchar2 (1000);
      vnu_colsp              number (2);
      vnu_rowsp              number (2);
    begin
      vvc_liste_libl      :=
        afw_07_util_pkg.string_to_table (pva_liste_libl
                                        ,',');
      vvc_liste_formt      :=
        afw_07_util_pkg.string_to_table (pva_liste_formt
                                        ,',');

      vva_tabl_javsc   := '[';

      if     vvc_liste_libl.count > 0
         and vvc_liste_formt.count > 0
         and vvc_liste_libl.count = vvc_liste_formt.count
      then
        for i in vvc_liste_libl.first .. vvc_liste_libl.last
        loop
          vvc_liste_sous_formt      :=
            afw_07_util_pkg.string_to_table (vvc_liste_formt (i)
                                            ,';');

          if vvc_liste_sous_formt.count = 2
          then
            vnu_colsp   := vvc_liste_sous_formt (1);
            vnu_rowsp   := vvc_liste_sous_formt (2);
          else
            vnu_colsp   := 1;
            vnu_rowsp   := 1;
          end if;

          vva_tabl_javsc      :=
               vva_tabl_javsc
            || '{'
            || '"libl":"'
            || trim (vvc_liste_libl (i))
            || '","colsp":'
            || vnu_colsp
            || ',"rowsp":'
            || vnu_rowsp
            || '},';
        end loop;
      end if;

      vva_tabl_javsc      :=
           rtrim (vva_tabl_javsc
                 ,',')
        || ']';

      return vva_tabl_javsc;
    end obten_tabl_javsc;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 - Plugin Action Dynamique - genr_group_entet_raprt_sql');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_21_PLUGN_GROUP_ENTET_RAPRT_SQL'
                                    ,p_plugin.name);
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_21_ACTIO_DYNMQ_GROUP_ENTET_RAPRT_SQL'
                                    ,p_dynamic_action.id);

    vva_id_regn_reprt_catch      :=
         'report_'
      || obten_id_regn_afect (p_dynamic_action.id)
      || '_catch';
    vva_id_regn_reprt      :=
         'report_R'
      || obten_id_regn_afect (p_dynamic_action.id);

    vva_ligne_1      :=
      obten_tabl_javsc (p_dynamic_action.attribute_01
                       ,p_dynamic_action.attribute_02);
    vva_ligne_2      :=
      obten_tabl_javsc (p_dynamic_action.attribute_03
                       ,p_dynamic_action.attribute_04);
    vva_ligne_3      :=
      obten_tabl_javsc (p_dynamic_action.attribute_05
                       ,p_dynamic_action.attribute_06);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.trans_raprt_sql'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.group_entet_raprt_sql'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.group_entet_raprt_sql.insta.push('
      || 'new afw.afw_21.actio_dynmq.group_entet_raprt_sql.group_entet_raprt_sql({'
      || apex_javascript.add_attribute ('vva_id_regn_reprt_catch'
                                       ,vva_id_regn_reprt_catch)
      || apex_javascript.add_attribute ('vva_id_regn_reprt'
                                       ,vva_id_regn_reprt)
      || apex_javascript.add_attribute ('vva_id_regn'
                                       ,obten_id_regn_afect (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_clas_css_surlg'
                                       ,p_dynamic_action.attribute_07)
      || apex_javascript.add_attribute ('vva_selct_surlg'
                                       ,p_dynamic_action.attribute_08)
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_ligne_1'
                                                ,vva_ligne_1)
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_ligne_2'
                                                ,vva_ligne_2)
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_ligne_3'
                                                ,vva_ligne_3
                                                ,pbo_afich_virgl   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_group_entet_raprt_sql;

  function genr_group_entet_raprt_inter (p_dynamic_action   in apex_plugin.t_dynamic_action
                                        ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq        apex_plugin.t_dynamic_action_render_result;
    vva_ligne_1            varchar2 (1000);
    vva_ligne_2            varchar2 (1000);
    vva_ligne_3            varchar2 (1000);
    vva_trans_libl         varchar2 (32767);
    vnu_nombr_coln_gauch   number (5) default 1;
    vnu_nombr_coln_seprt   number (5) default 1; --a gerer CONAL
    vnu_nombr_coln_ventl   number (5) default 0;

    function obten_tabl_javsc (pva_liste in varchar2)
      return varchar2
    is
      vvc_liste_group        apex_application_global.vc_arr2;
      vvc_liste_sous_group   apex_application_global.vc_arr2;
      vva_tabl_javsc         varchar2 (1000);
      vnu_colsp              number (2);
      vnu_rowsp              number (2);
    begin
      vvc_liste_group      :=
        afw_07_util_pkg.string_to_table (pva_liste
                                        ,',');

      vva_tabl_javsc   := '[';

      if vvc_liste_group.count > 0
      then
        for i in vvc_liste_group.first .. vvc_liste_group.last
        loop
          vvc_liste_sous_group      :=
            afw_07_util_pkg.string_to_table (vvc_liste_group (i)
                                            ,';');

          vnu_colsp   := vvc_liste_sous_group (2);
          vnu_rowsp   := vvc_liste_sous_group (3);

          vva_tabl_javsc      :=
               vva_tabl_javsc
            || '{'
            || '"libl":"'
            || trim (vvc_liste_sous_group (1))
            || '","colsp":'
            || vnu_colsp
            || ',"rowsp":'
            || vnu_rowsp
            || '},';
        end loop;
      end if;

      vva_tabl_javsc      :=
           rtrim (vva_tabl_javsc
                 ,',')
        || ']';

      return vva_tabl_javsc;
    end obten_tabl_javsc;

    function obten_tabl_javsc_trans_libl (pva_liste_a_trans in varchar2)
      return varchar2
    is
      vva_tabl_javsc      varchar2 (32767);
      vvc_liste_a_trans   apex_application_global.vc_arr2;
      vvc_liste_coupl     apex_application_global.vc_arr2;
    begin
      vvc_liste_a_trans      :=
        afw_07_util_pkg.string_to_table (pva_liste_a_trans
                                        ,',');
      vva_tabl_javsc   := '[';

      if vvc_liste_a_trans.count > 0
      then
        for i in vvc_liste_a_trans.first .. vvc_liste_a_trans.last
        loop
          vvc_liste_coupl      :=
            afw_07_util_pkg.string_to_table (vvc_liste_a_trans (i)
                                            ,';');

          vva_tabl_javsc      :=
               vva_tabl_javsc
            || '{'
            || '"id":"'
            || trim (vvc_liste_coupl (1))
            || '","nouv_libl":"'
            || trim (vvc_liste_coupl (2))
            || '"},';
        end loop;
      end if;

      vva_tabl_javsc      :=
           rtrim (vva_tabl_javsc
                 ,',')
        || ']';

      return vva_tabl_javsc;
    end obten_tabl_javsc_trans_libl;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 - Plugin Action Dynamique - genr_group_entet_raprt_inter');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_21_PLUGN_GROUP_ENTET_RAPRT_INTER'
                                    ,p_plugin.name);
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_21_ACTIO_DYNMQ_GROUP_ENTET_RAPRT_INTER'
                                    ,p_dynamic_action.id);

    vva_ligne_1      := obten_tabl_javsc (p_dynamic_action.attribute_01);
    vva_ligne_2      := obten_tabl_javsc (p_dynamic_action.attribute_02);
    vva_ligne_3      := obten_tabl_javsc (p_dynamic_action.attribute_03);
    vva_trans_libl   := obten_tabl_javsc_trans_libl (p_dynamic_action.attribute_04);

    if p_dynamic_action.attribute_10 > 1
    then
      vnu_nombr_coln_gauch   := p_dynamic_action.attribute_10;
      vnu_nombr_coln_ventl   := p_dynamic_action.attribute_10 - 1;
    end if;

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.group_entet_raprt_inter'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.group_entet_raprt_inter.suprm("'
      || 'R'
      || obten_id_regn_afect (p_dynamic_action.id)
      || '");'
      || 'afw.afw_21.actio_dynmq.group_entet_raprt_inter.insta.push('
      || 'new afw.afw_21.actio_dynmq.group_entet_raprt_inter.group_entet_raprt_inter({'
      || apex_javascript.add_attribute ('vva_id_regn'
                                       ,   'R'
                                        || obten_id_regn_afect (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vbo_gerer_ventl'
                                       ,case p_dynamic_action.attribute_05 when 'Y' then true else false end)
      || apex_javascript.add_attribute ('vva_clas_css_ventl'
                                       ,p_dynamic_action.attribute_06)
      || apex_javascript.add_attribute ('vva_clas_css_ventl_horzn'
                                       ,p_dynamic_action.attribute_07)
      || apex_javascript.add_attribute ('vva_clas_css_ventl_vertc'
                                       ,p_dynamic_action.attribute_08)
      || apex_javascript.add_attribute ('vva_clas_css_ventl_gauch'
                                       ,p_dynamic_action.attribute_09)
      || apex_javascript.add_attribute ('vva_clas_css_surlg'
                                       ,p_dynamic_action.attribute_11)
      || apex_javascript.add_attribute ('vva_selct_surlg'
                                       ,p_dynamic_action.attribute_12)
      || apex_javascript.add_attribute ('vnu_nombr_coln_gauch'
                                       ,vnu_nombr_coln_gauch)
      || apex_javascript.add_attribute ('vnu_nombr_coln_ventl'
                                       ,vnu_nombr_coln_ventl)
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_ligne_1'
                                                ,vva_ligne_1
                                                ,false)
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_ligne_2'
                                                ,vva_ligne_2
                                                ,false)
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_ligne_3'
                                                ,vva_ligne_3
                                                ,false)
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_trans_libl_raprt'
                                                ,vva_trans_libl
                                                ,false
                                                ,pbo_afich_virgl   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_group_entet_raprt_inter;

  function genr_boutn_jquer_ui (p_dynamic_action   in apex_plugin.t_dynamic_action
                               ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Ajouter un groupe d''entete dans un rapport SQL');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Initialiser le plugin
    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.jQuery(".ui-state-default").hover(function(){afw.jQuery(this).addClass("ui-state-hover");},function(){afw.jQuery(this).removeClass("ui-state-hover");});'
      || 'afw.jQuery(".ui-state-default").click(function(){afw.jQuery(this).toggleClass("ui-state-active");});'
      || '}';

    return rec_actio_dynmq;
  end genr_boutn_jquer_ui;

  function genr_raprt_sql_rang_drag (p_dynamic_action   in apex_plugin.t_dynamic_action
                                    ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq           apex_plugin.t_dynamic_action_render_result;
    vva_id_regn_reprt_catch   varchar2 (400);
    vva_id_regn_reprt         varchar2 (400);
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Transformer les rangees d''un rapport SQL en objets deplacables');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    vva_id_regn_reprt_catch      :=
         'report_'
      || obten_id_regn_afect (p_dynamic_action.id)
      || '_catch';
    vva_id_regn_reprt      :=
         'report_R'
      || obten_id_regn_afect (p_dynamic_action.id);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.trans_raprt_sql'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.raprt_sql_rang_drag'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.raprt_sql_rang_drag.insta.push('
      || 'new afw.afw_21.actio_dynmq.raprt_sql_rang_drag.raprt_sql_rang_drag({'
      || apex_javascript.add_attribute ('vva_id_regn_reprt_catch'
                                       ,vva_id_regn_reprt_catch)
      || apex_javascript.add_attribute ('vva_id_regn_reprt'
                                       ,vva_id_regn_reprt)
      || apex_javascript.add_attribute ('vva_id_regn'
                                       ,obten_id_regn_afect (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_aide'
                                       ,'clone')
      || apex_javascript.add_attribute ('vva_revnr'
                                       ,case p_dynamic_action.attribute_01 when 'Y' then 'true' when 'N' then 'false' else 'true' end)
      || apex_javascript.add_attribute ('vnu_duree_revnr'
                                       ,p_dynamic_action.attribute_02)
      || apex_javascript.add_attribute ('vva_clas_css_rang_drag'
                                       ,p_dynamic_action.attribute_05)
      || apex_javascript.add_attribute ('vva_selct_jquer_regn_drop'
                                       ,p_dynamic_action.attribute_06
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_raprt_sql_rang_drag;

  function genr_raprt_inter_rang_drag (p_dynamic_action   in apex_plugin.t_dynamic_action
                                      ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq     apex_plugin.t_dynamic_action_render_result;
    vva_id_regn_reprt   varchar2 (400);
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Transformer les rangees d''un rapport ineractif en objets deplacables');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    vva_id_regn_reprt      :=
         'R'
      || obten_id_regn_afect (p_dynamic_action.id);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.raprt_inter_rang_drag'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.raprt_inter_rang_drag.insta.push('
      || 'new afw.afw_21.actio_dynmq.raprt_inter_rang_drag.raprt_inter_rang_drag({'
      || apex_javascript.add_attribute ('vva_id_regn_reprt'
                                       ,vva_id_regn_reprt)
      || apex_javascript.add_attribute ('vva_aide'
                                       ,'clone')
      || apex_javascript.add_attribute ('vva_revnr'
                                       ,case p_dynamic_action.attribute_01 when 'Y' then 'true' when 'N' then 'false' else 'true' end)
      || apex_javascript.add_attribute ('vnu_duree_revnr'
                                       ,p_dynamic_action.attribute_02)
      || apex_javascript.add_attribute ('vva_clas_css_rang_drag'
                                       ,p_dynamic_action.attribute_05)
      || apex_javascript.add_attribute ('vva_selct_jquer_regn_drop'
                                       ,p_dynamic_action.attribute_06
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_raprt_inter_rang_drag;

  function genr_afich_dialg_ifram (p_dynamic_action   in apex_plugin.t_dynamic_action
                                  ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq       apex_plugin.t_dynamic_action_render_result;
    vva_url               varchar2 (1000);
    vnu_numr_apex_aplic   number;
    vnu_numr_apex_page    number;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Afficher un dialogue avec un iframe');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.actio_dynmq.dialg'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.dialg'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    vnu_numr_apex_aplic   := afw_21_util_pkg.obten_reslt_expre_plsql (p_dynamic_action.attribute_14);

    vnu_numr_apex_page    := afw_21_util_pkg.obten_reslt_expre_plsql (p_dynamic_action.attribute_15);

    if p_dynamic_action.attribute_07 = 'PAGE'
    then
      vva_url      :=
        afw_08_url_pkg.genr_url (vnu_numr_apex_aplic
                                ,vnu_numr_apex_page
                                ,'SIDF'
                                ,afw_04_fil_arian_pkg.obten_fa_courn ()
                                ,'SSPC'
                                ,case when p_dynamic_action.attribute_10 is not null then '#SSPC#' else null end
                                ,'SAPC'
                                ,p_dynamic_action.attribute_06
                                ,'SCPI'
                                ,p_dynamic_action.attribute_02
                                ,'SSPI'
                                ,case when p_dynamic_action.attribute_11 is not null then '#SSPI#' else null end
                                ,pva_mode_debg   => afw_07_util_pkg.v ('DEBUG'));
    end if;

    afw_12_dialg_ifram_pkg.defnr_item_cle_etran (p_dynamic_action.id
                                                ,p_dynamic_action.attribute_12);

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.dialg.insta.push('
      || 'new afw.afw_21.actio_dynmq.dialg.dialg('
      || '{'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                       ,   'actio_dynmq_'
                                        || p_dynamic_action.id)
      || apex_javascript.add_attribute ('vva_titre'
                                       ,p_dynamic_action.attribute_01)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || apex_javascript.add_attribute ('vva_plugn_ajax'
                                       ,apex_plugin.get_ajax_identifier)
      || apex_javascript.add_attribute ('vva_type_url'
                                       ,p_dynamic_action.attribute_07)
      || apex_javascript.add_attribute ('vva_url'
                                       ,vva_url)
      || apex_javascript.add_attribute ('vva_item_contn_url'
                                       ,p_dynamic_action.attribute_08)
      || apex_javascript.add_attribute ('vnu_numr_apex_aplic'
                                       ,vnu_numr_apex_aplic)
      || apex_javascript.add_attribute ('vnu_numr_apex_page'
                                       ,vnu_numr_apex_page)
      || apex_javascript.add_attribute ('vva_item_sspc'
                                       ,to_char (p_dynamic_action.attribute_10))
      || apex_javascript.add_attribute ('vva_item_sspi'
                                       ,to_char (p_dynamic_action.attribute_11))
      || apex_javascript.add_attribute ('vbo_redmn'
                                       ,afw_21_util_pkg.formt_plugn_atrib_boln ('N'))
      || apex_javascript.add_attribute ('vbo_fermr_echap'
                                       ,afw_21_util_pkg.formt_plugn_atrib_boln ('Y'))
      || apex_javascript.add_attribute ('vbo_deplc'
                                       ,afw_21_util_pkg.formt_plugn_atrib_boln ('Y'))
      || apex_javascript.add_attribute ('vva_clas_css'
                                       ,p_dynamic_action.attribute_05)
      || apex_javascript.add_attribute ('vnu_largr'
                                       ,p_dynamic_action.attribute_03)
      || apex_javascript.add_attribute ('vnu_hautr'
                                       ,p_dynamic_action.attribute_04
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_afich_dialg_ifram;

  function ajax_afich_dialg_ifram (p_dynamic_action   in apex_plugin.t_dynamic_action
                                  ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
  begin
    case aa.g_widget_action
      when 'OUVRI_DIALG'
      then
        afw_12_dialg_ifram_pkg.ouvri_dialg (aa.g_x01
                                           ,aa.g_x02
                                           ,aa.g_x03);
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      return rec_actio_dynmq;
  end ajax_afich_dialg_ifram;

  function genr_fermr_dialg_ifram (p_dynamic_action   in apex_plugin.t_dynamic_action
                                  ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Fermer un dialogue iframe');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'parent.afw.jQuery("#"+parent.afw.jQuery(frameElement).parent().attr("id")).trigger("dialogclose_actio_dynmq");'
      || '}';

    return rec_actio_dynmq;
  end genr_fermr_dialg_ifram;

  function genr_afich_regn_dialg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Afficher une region dialogue');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'vjs_dialg = afw.afw_21.regn.dialg.obten("'
      || obten_ident_regn_afect (p_dynamic_action.id)
      || '");'
      || case
           when p_dynamic_action.attribute_01 is not null
           then
                'vjs_dialg.defnr_largr('
             || p_dynamic_action.attribute_01
             || ');'
           else
             null
         end
      || 'vjs_dialg.ouvri();'
      || '}';

    return rec_actio_dynmq;
  end genr_afich_regn_dialg;

  function genr_fermr_regn_dialg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Fermer une region dialogue');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'vjs_dialg = afw.afw_21.regn.dialg.obten("'
      || obten_ident_regn_afect (p_dynamic_action.id)
      || '");'
      || 'vjs_dialg.fermr();'
      || '}';

    return rec_actio_dynmq;
  end genr_fermr_regn_dialg;

  function genr_soumt_clob (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Soumettre des items (CLOB)');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.soumt_clob'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.soumt_clob.insta.push('
      || 'new afw.afw_21.actio_dynmq.soumt_clob.soumt_clob('
      || '{'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                       ,   'actio_dynmq_'
                                        || p_dynamic_action.id)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || apex_javascript.add_attribute ('vva_reqt_soums_page'
                                       ,lower (obten_boutn_decln (p_dynamic_action.id)))
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_liste_items'
                                                ,afw_21_util_pkg.obten_tabl_javsc_liste_items (p_dynamic_action.attribute_01)
                                                ,false)
      || apex_javascript.add_attribute ('vva_plugn_ajax'
                                       ,apex_plugin.get_ajax_identifier
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_soumt_clob;

  function ajax_soumt_clob (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq      apex_plugin.t_dynamic_action_ajax_result;
    vva_nom_colct_clob   varchar2 (255) default 'IO_AFW_21_COLCT_CLOB';
  begin
    case aa.g_widget_action
      when 'CREER_COLCT_CLOB'
      then
        apex_collection.create_or_truncate_collection (vva_nom_colct_clob);
        htp.p ('{"stat":"colct_cree"}');
      when 'TELVS_CLOB'
      then
        if apex_collection.collection_exists (vva_nom_colct_clob)
        then
          if aa.g_f01.count > 0
          then
            afw_07_clob_pkg.creer_nouv ();

            for i in 1 .. aa.g_f01.count
            loop
              afw_07_clob_pkg.ajout (aa.g_f01 (i));
            end loop;

            apex_collection.add_member (p_collection_name   => vva_nom_colct_clob
                                       ,p_c001              => aa.g_x01
                                       ,p_clob001           => afw_07_clob_pkg.obten ());

            afw_07_clob_pkg.termn ();
          end if;

          htp.p (   'La sauvegarde de "'
                 || aa.g_x01
                 || '" est termine.');
        end if;
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      ete ();
  end ajax_soumt_clob;

  function genr_suprm_item_clob (p_dynamic_action   in apex_plugin.t_dynamic_action
                                ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Supprimer le contenu des items (CLOB)');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.suprm_item_clob'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.suprm_item_clob.insta.push('
      || 'new afw.afw_21.actio_dynmq.suprm_item_clob.suprm_item_clob('
      || '{'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                       ,   'actio_dynmq_'
                                        || p_dynamic_action.id)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || apex_javascript.add_attribute ('vva_reqt_soums_page'
                                       ,lower (obten_boutn_decln (p_dynamic_action.id)))
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_liste_items'
                                                ,afw_21_util_pkg.obten_tabl_javsc_liste_items (p_dynamic_action.attribute_01)
                                                ,false
                                                ,false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_suprm_item_clob;

  function genr_dml_obten_clob (p_dynamic_action   in apex_plugin.t_dynamic_action
                               ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Obtenir des CLOB');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.dml_obten_clob'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.dml_obten_clob.insta.push('
      || 'new afw.afw_21.actio_dynmq.dml_obten_clob.dml_obten_clob('
      || '{'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                       ,   'actio_dynmq_'
                                        || p_dynamic_action.id)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || apex_javascript.add_attribute ('vva_table'
                                       ,p_dynamic_action.attribute_01)
      || apex_javascript.add_attribute ('vva_item_cle_primr_1'
                                       ,p_dynamic_action.attribute_02)
      || apex_javascript.add_attribute ('vva_coln_cle_primr_1'
                                       ,p_dynamic_action.attribute_03)
      || apex_javascript.add_attribute ('vva_item_cle_primr_2'
                                       ,p_dynamic_action.attribute_04)
      || apex_javascript.add_attribute ('vva_coln_cle_primr_2'
                                       ,p_dynamic_action.attribute_05)
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_liste_items'
                                                ,afw_21_util_pkg.obten_tabl_javsc_liste_items (p_dynamic_action.attribute_06)
                                                ,false)
      || afw_21_util_pkg.ajout_atrib_tabl_javsc ('var_liste_coln'
                                                ,afw_21_util_pkg.obten_tabl_javsc_liste_items (p_dynamic_action.attribute_07)
                                                ,false)
      || apex_javascript.add_attribute ('vva_plugn_ajax'
                                       ,apex_plugin.get_ajax_identifier
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_dml_obten_clob;

  function ajax_dml_obten_clob (p_dynamic_action   in apex_plugin.t_dynamic_action
                               ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq      apex_plugin.t_dynamic_action_ajax_result;
    vva_nom_colct_clob   varchar2 (255) default p_plugin.name;

    procedure obten_clob_table (pva_table              in varchar2
                               ,pva_coln_cle_primr_1   in varchar2
                               ,pva_item_cle_primr_1   in varchar2
                               ,pva_coln_cle_primr_2   in varchar2 default null
                               ,pva_item_cle_primr_2   in varchar2 default null
                               ,pva_coln               in varchar2)
    is
      vva_squel_progr_a_lancr   varchar2 (4000) default 'declare
         vcl_contn clob;
         vnu_cle_primr_1 number default :p1;
         vnu_cle_primr_2 number default :p2;
       begin
         dbms_lob.createtemporary(vcl_contn, true);

         select  %COLN%
            into  vcl_contn
           from  %TABLE%
         where  %COLN% is not null and %COLN_CLE_PRIMR_1% = vnu_cle_primr_1%ENONC_CLE_PRIMR_2%;

         afw_15_htp_pkg.ecrir_clob(vcl_contn);

       exception
         when no_data_found then
           null;
         when others then
           ete ();
       end;';
      vva_progr_a_lancr         varchar2 (4000)
                                  default afw_07_util_pkg.multi_replc (vva_squel_progr_a_lancr
                                                                      ,'%TABLE%'
                                                                      ,pva_table
                                                                      ,'%COLN_CLE_PRIMR_1%'
                                                                      ,pva_coln_cle_primr_1
                                                                      ,'%ENONC_CLE_PRIMR_2%'
                                                                      ,case
                                                                         when pva_coln_cle_primr_2 is not null
                                                                         then
                                                                              ' and '
                                                                           || pva_coln_cle_primr_2
                                                                           || ' = :p2'
                                                                         else
                                                                           null
                                                                       end
                                                                      ,'%COLN%'
                                                                      ,pva_coln);
    begin
      execute immediate vva_progr_a_lancr
        using afw_07_util_pkg.v (pva_item_cle_primr_1)
             ,afw_07_util_pkg.v (pva_item_cle_primr_2);
    exception
      when others
      then
        ete ();
    end obten_clob_table;

    function valdt_colct_exist
      return boolean
    is
      vva_nom_colct_clob   varchar2 (255) default 'IO_AFW_21_COLCT_CLOB';
      vnu_exist            number;
      vbo_exist            boolean;
    begin
      select count (1)
        into vnu_exist
        from apex_collections
       where collection_name = vva_nom_colct_clob;

      if vnu_exist > 0
      then
        vbo_exist   := true;
      else
        vbo_exist   := false;
      end if;

      return vbo_exist;
    end valdt_colct_exist;

    procedure obten_clob_colct (pva_item in varchar2)
    is
      vva_nom_colct_clob   varchar2 (255) default 'IO_AFW_21_COLCT_CLOB';
      vcl_contn            clob;
    begin
      dbms_lob.createtemporary (vcl_contn
                               ,true);

      select clob001
        into vcl_contn
        from apex_collections
       where     collection_name = vva_nom_colct_clob
             and c001 = pva_item;

      afw_15_htp_pkg.ecrir_clob (vcl_contn);
    exception
      when no_data_found
      then
        null;
      when others
      then
        ete ();
    end obten_clob_colct;
  begin
    case aa.g_widget_action
      when 'DML_OBTEN_CLOB'
      then
        if     not valdt_colct_exist
           and afw_07_util_pkg.v (aa.g_x03) is not null
        then
          obten_clob_table (aa.g_x01
                           ,aa.g_x02
                           ,aa.g_x03
                           ,aa.g_x04
                           ,aa.g_x05
                           ,aa.g_x06);
        else
          obten_clob_colct (aa.g_x07);
        end if;
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      ete ();
  end ajax_dml_obten_clob;

  function genr_afich_mesg_procs (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Affiche message des processus');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.afich_mesg_procs'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.afich_mesg_procs.insta.push('
      || 'new afw.afw_21.actio_dynmq.afich_mesg_procs.afich_mesg_procs('
      || '{'
      || apex_javascript.add_attribute ('vva_plugn_ajax'
                                       ,apex_plugin.get_ajax_identifier
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_afich_mesg_procs;

  function ajax_afich_mesg_procs (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;

    procedure genr_mesg_sucs
    is
    begin
      if afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_21_MESG_SUCS') is not null
      then
        afw_15_htp_pkg.ecrir (afw_07_util_pkg.multi_replc (afw_13_page_pkg.obten_modl_mesg_sucs
                                                          ,'#SUCCESS_MESSAGE#'
                                                          ,afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_21_MESG_SUCS'))
                             ,false);

        afw_07_sesn_pkg.suprm_valr_sesn ('S_AFW_21_MESG_SUCS');
      end if;
    end genr_mesg_sucs;

    procedure genr_mesg_ereur
    is
    begin
      if afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_21_MESG_EREUR') is not null
      then
        afw_15_htp_pkg.ecrir (afw_07_util_pkg.multi_replc (afw_13_page_pkg.obten_modl_mesg_ereur
                                                          ,'#MESSAGE#'
                                                          ,afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_21_MESG_EREUR'))
                             ,false);

        afw_07_sesn_pkg.suprm_valr_sesn ('S_AFW_21_MESG_EREUR');
      end if;
    end genr_mesg_ereur;
  begin
    case aa.g_widget_action
      when 'OBTEN_MESG'
      then
        genr_mesg_sucs;
        genr_mesg_ereur;
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      ete ();
  end ajax_afich_mesg_procs;

  function genr_afich_mesg_infor (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Affiche message informatif');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.afich_mesg_infor'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.afich_mesg_infor.insta.push('
      || 'new afw.afw_21.actio_dynmq.afich_mesg_infor.afich_mesg_infor('
      || '{'
      || apex_javascript.add_attribute ('vva_plugn_ajax'
                                       ,apex_plugin.get_ajax_identifier
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_afich_mesg_infor;

  function ajax_afich_mesg_infor (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
  begin
    case aa.g_widget_action
      when 'OBTEN_MESG'
      then
        afw_01_err_apex_pkg.afich_mesg_infor_apex;
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      return rec_actio_dynmq;
  end ajax_afich_mesg_infor;

  function genr_menu_redrc (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - AFW 13 menu redirection');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.menu_redrc'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.menu_redrc.vva_plugn_ajax = "'
      || apex_plugin.get_ajax_identifier
      || '";}';

    return rec_actio_dynmq;
  end genr_menu_redrc;

  function ajax_menu_redrc (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
    vnu_menu_actif    vd_afw_13_menu.seqnc%type;
  begin
    case aa.g_widget_action
      when 'DEFNR_ITEM_ACTIF'
      then
        vnu_menu_actif   := afw_13_menu_pkg.obten_menu_part_item_menu (aa.g_x01);
        afw_12_menu_pkg.defnr_item_actif (vnu_menu_actif
                                         ,aa.g_x01);

        --afw_12_menu_pkg.defnr_menu_actif (vnu_menu_actif);

        htp.p ('');
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      return rec_actio_dynmq;
  end ajax_menu_redrc;

  function genr_aide_page_item (p_dynamic_action   in apex_plugin.t_dynamic_action
                               ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
    vbo_afich_multp   boolean default true;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - AFW 13 aide item page');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.aide_page_item'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.aide_page_item.vva_plugn_ajax = "'
      || apex_plugin.get_ajax_identifier
      || '";'
      || 'afw.afw_21.actio_dynmq.aide_page_item.vbo_afich_multp = '
      || case p_dynamic_action.attribute_01 when 'Y' then 'false' else 'true' end
      || ';}';

    return rec_actio_dynmq;
  end genr_aide_page_item;

  function ajax_aide_page_item (p_dynamic_action   in apex_plugin.t_dynamic_action
                               ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
  begin
    case aa.g_widget_action
      when 'OBTEN_AIDE'
      then
        afw_15_htp_pkg.ouvri_bals ('div'
                                  ,'class'
                                  ,'ui-widget-content');

        afw_15_htp_pkg.ecrir (afw_01_gestn_mesg_aide_pkg.obten_aide_page_item (aa.g_x01));

        afw_15_htp_pkg.fermr_bals ('div');
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      return rec_actio_dynmq;
  end ajax_aide_page_item;

  function genr_aide_page (p_dynamic_action   in apex_plugin.t_dynamic_action
                          ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
    vbo_afich_multp   boolean default true;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - AFW 13 aide page');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.actio_dynmq.aide_page'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.aide_page'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.aide_page.insta.push('
      || 'new afw.afw_21.actio_dynmq.aide_page.aide_page({'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_titre'
                                       ,p_dynamic_action.attribute_01)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || apex_javascript.add_attribute ('vva_plugn_ajax'
                                       ,apex_plugin.get_ajax_identifier
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_aide_page;

  function ajax_aide_page (p_dynamic_action   in apex_plugin.t_dynamic_action
                          ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
  begin
    case aa.g_widget_action
      when 'OBTEN_AIDE_PAGE'
      then
        afw_15_htp_pkg.ouvri_bals ('div'
                                  ,'class'
                                  ,'ui-widget-content');
        afw_15_htp_pkg.ecrir (afw_13_regn_piltb_pkg.obten_contn_aide_page (afw_13_page_pkg.obten_page_sesn
                                                                          ,afw_01_lang_pkg.obten_lang_sesn));

        -- TODO::CARLO
        --if wwv_flow_api.p_ALLOW_FEEDBACK_YN = 'Y' then
        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'id'
                                  ,'boutn_comnt_bogue'
                                  ,'class'
                                  ,'ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icons');

        afw_15_htp_pkg.ouvri_bals ('a'
                                  ,'href'
                                  ,'#'
                                  ,'alt'
                                  ,'Page de feedback'
                                  ,'title'
                                  ,'Page de feedback');

        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'ui-button-icon-primary ui-icon fff-icon-bug-add');
        afw_15_htp_pkg.fermr_bals ('span');

        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'ui-button-text icon-left');
        afw_15_htp_pkg.ecrir ('Commentaires / Bogues');
        afw_15_htp_pkg.fermr_bals ('span');

        afw_15_htp_pkg.fermr_bals ('a');

        afw_15_htp_pkg.fermr_bals ('span');
        --end if;

        afw_15_htp_pkg.fermr_bals ('div');
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      return rec_actio_dynmq;
  end ajax_aide_page;

  function genr_redrc_url (p_dynamic_action   in apex_plugin.t_dynamic_action
                          ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Redirection vers un URL');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.redrc_url'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.redrc_url.insta.push('
      || 'new afw.afw_21.actio_dynmq.redrc_url.redrc_url('
      || '{'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                       ,   'actio_dynmq_'
                                        || p_dynamic_action.id)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || apex_javascript.add_attribute ('vva_url'
                                       ,afw_21_util_pkg.obten_reslt_expre_plsql (p_dynamic_action.attribute_01)
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_redrc_url;

  function genr_redrc_url_dynmq (p_dynamic_action   in apex_plugin.t_dynamic_action
                                ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Redirection vers un URL Dynamique');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.redrc_url_dynmq'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.redrc_url_dynmq.insta.push('
      || 'new afw.afw_21.actio_dynmq.redrc_url_dynmq.redrc_url_dynmq('
      || '{'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                       ,   'actio_dynmq_'
                                        || p_dynamic_action.id)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || apex_javascript.add_attribute ('vva_plugn_ajax'
                                       ,apex_plugin.get_ajax_identifier)
      || apex_javascript.add_attribute ('vva_fonct_url'
                                       ,p_dynamic_action.attribute_01
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_redrc_url_dynmq;

  function ajax_redrc_url_dynmq (p_dynamic_action   in apex_plugin.t_dynamic_action
                                ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq     apex_plugin.t_dynamic_action_ajax_result;
    vva_progr_a_lancr   varchar2 (4000)
                          default    'begin afw_21_actio_dynmq_pkg.gva_redrc_url_dynmq :='
                                  || '  %PROCD_PERSN%; '
                                  || '  exception when others then ete();'
                                  || 'end;';
  begin
    case aa.g_widget_action
      when 'OBTEN_URL'
      then
        vva_progr_a_lancr      :=
          replace (vva_progr_a_lancr
                  ,'%PROCD_PERSN%'
                  ,aa.g_x01);

        execute immediate vva_progr_a_lancr;

        afw_15_htp_pkg.ecrir (   '{"url":"'
                              || gva_redrc_url_dynmq
                              || '"}');
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      return rec_actio_dynmq;
  end ajax_redrc_url_dynmq;

  function genr_trans_ident_coln_ir (p_dynamic_action   in apex_plugin.t_dynamic_action
                                    ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Transformer les identifiants de colonnes d''un IR');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.trans_ident_coln_raprt_inter'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.trans_ident_coln_raprt_inter.insta.push('
      || 'new afw.afw_21.actio_dynmq.trans_ident_coln_raprt_inter.trans_ident_coln_raprt_inter('
      || '{'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                       ,   'actio_dynmq_'
                                        || p_dynamic_action.id)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || 'vjs_ident_coln:{'
      || p_dynamic_action.attribute_01
      || '}'
      || '}));}';

    return rec_actio_dynmq;
  end genr_trans_ident_coln_ir;

  function genr_pris_charg_navgt (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Avertissement navigateur non pris en charge');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.avert_navgt_pris_charg'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.avert_navgt_pris_charg.insta.push('
      || 'new afw.afw_21.actio_dynmq.avert_navgt_pris_charg.avert_navgt_pris_charg('
      || '{'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                       ,   'actio_dynmq_'
                                        || p_dynamic_action.id)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || apex_javascript.add_attribute ('vva_titre'
                                       ,p_dynamic_action.attribute_01)
      || apex_javascript.add_attribute ('vva_mesg'
                                       ,p_dynamic_action.attribute_02)
      || apex_javascript.add_attribute ('vnu_largr'
                                       ,p_dynamic_action.attribute_03)
      || apex_javascript.add_attribute ('vnu_hautr'
                                       ,p_dynamic_action.attribute_04
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_pris_charg_navgt;

  function genr_afw_41_forml_repns (p_dynamic_action   in apex_plugin.t_dynamic_action
                                   ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq       apex_plugin.t_dynamic_action_render_result;
    vva_url               varchar2 (1000);
    vnu_numr_apex_aplic   number;
    vnu_numr_apex_page    number;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Afficher un dialogue avec une question et son formulaire de reponse');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies CSS
    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.actio_dynmq.forml_repns'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.forml_repns'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --TODO::BOIER
    -- Gerer les "return values" en session (afw_12_
    /*
                afw_12_gabrt_forml_repns.defnr_item_cle_etran (p_dynamic_action.id,
                                                 p_dynamic_action.attribute_12);
    */

    --TODO::BOIER
    -- Coder le fichier CSS
    -- Code le fichier JS

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.forml_repns.insta.push('
      || 'new afw.afw_21.actio_dynmq.forml_repns.forml_repns('
      || '{'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                       ,   'actio_dynmq_'
                                        || p_dynamic_action.id)
      || apex_javascript.add_attribute ('vva_plugn_ajax'
                                       ,apex_plugin.get_ajax_identifier)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name
                                       ,p_add_comma   => false)     /*|| apex_javascript.add_attribute ('vva_item_gabrt_detl_forml',
                                         p_dynamic_action.attribute_01)
|| apex_javascript.add_attribute ('vva_item_procd_persn_repns',
                             p_dynamic_action.attribute_03,
                             )
|| apex_javascript.add_attribute ('vva_titre',
                            p_dynamic_action.attribute_02
                            )
 || apex_javascript.add_attribute ('vbo_fermr_echap',
                             afw_21_util_pkg.formt_plugn_atrib_boln (p_dynamic_action.attribute_02))
|| apex_javascript.add_attribute ('vbo_deplc',
                             afw_21_util_pkg.formt_plugn_atrib_boln (p_dynamic_action.attribute_03))
|| apex_javascript.add_attribute ('vva_clas_css',
                             p_dynamic_action.attribute_04)
|| apex_javascript.add_attribute ('vnu_largr',
                             p_dynamic_action.attribute_05)
|| apex_javascript.add_attribute ('vnu_hautr',
                             p_dynamic_action.attribute_06,
                             p_add_comma                => false)*/
      || '}));}';

    return rec_actio_dynmq;
  end genr_afw_41_forml_repns;

  function ajax_afw_41_forml_repns (p_dynamic_action   in apex_plugin.t_dynamic_action
                                   ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
  begin
    case aa.g_widget_action
      when 'OUVRI_FORML_REPNS'
      then
        --TODO::BOIER
        --afw_12_gabrt_detl_forml_pkg.initl(...);
        afw_15_htp_pkg.ouvri_bals ('div'
                                  ,'id'
                                  ,   'actio_dynmq_'
                                   || p_dynamic_action.id
                                  ,'class'
                                  ,'afw_21_actio_dynmq_forml_repns');


        /*afw_21_plugn_forml_pkg.genr_forml_html (
          afw_07_util_pkg.v (p_dynamic_action.attribute_01),
          afw_07_util_pkg.v (p_dynamic_action.attribute_02),
          afw_07_util_pkg.v (p_dynamic_action.attribute_03));*/


        afw_15_htp_pkg.fermr_bals ('div');
      when 'OBTEN_TITRE'
      then
        afw_15_htp_pkg.ecrir ( /*afw_21_plugn_forml_pkg.obten_titre_forml (
                                 afw_07_util_pkg.v (p_dynamic_action.attribute_01),
                                 afw_07_util_pkg.v (p_dynamic_action.attribute_04))*/
                              null);
      when 'ENREG_REPNS'
      then
        /*afw_21_plugn_forml_pkg.enreg_repns (
          afw_07_util_pkg.v (p_dynamic_action.attribute_01),
          aa.g_x01,
          aa.g_x02,
          aa.g_x03,
          aa.g_x04);*/
        null;
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      return rec_actio_dynmq;
  end ajax_afw_41_forml_repns;

  function genr_afw_12_modfr_mot_passe (p_dynamic_action   in apex_plugin.t_dynamic_action
                                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
    vbo_afich_multp   boolean default true;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - AFW 12 modifier mot de passe');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies CSS
    /*afw_21_util_pkg.ajout_libr_css ('afw.afw_21.actio_dynmq.modfr_mot_passe',
                                                afw_11_prodt_pkg.obten_dosr_fichr_afw || 'assets/libs/css/');*/

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.modfr_mot_passe'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.modfr_mot_passe.insta.push('
      || 'new afw.afw_21.actio_dynmq.modfr_mot_passe.modfr_mot_passe({'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_titre'
                                       ,p_dynamic_action.attribute_01)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || apex_javascript.add_attribute ('vva_plugn_ajax'
                                       ,apex_plugin.get_ajax_identifier
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  end genr_afw_12_modfr_mot_passe;

  function genr_soumt_blob (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Soumettre des fichiers (BLOB)');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.soumt_blob'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.soumt_blob.insta.push('
      || 'new afw.afw_21.actio_dynmq.soumt_blob.soumt_blob('
      || '{'
      || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                       ,to_char (p_dynamic_action.id))
      || apex_javascript.add_attribute ('vva_html_id_actio_dynmq'
                                       ,   'actio_dynmq_'
                                        || p_dynamic_action.id)
      || apex_javascript.add_attribute ('vva_nom_plugn'
                                       ,p_plugin.name)
      || apex_javascript.add_attribute ('vva_plugn_ajax'
                                       ,apex_plugin.get_ajax_identifier
                                       ,p_add_comma   => false)
      || '}));}';

    return rec_actio_dynmq;
  exception
    when others
    then
      rec_actio_dynmq.javascript_function   := 'false';
  end genr_soumt_blob;

  function ajax_soumt_blob (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
    vbl_fichr_tempr   blob;
    vbl_fichr         blob;
    vva_chain_tempr   varchar2 (8000);
    vra_chain_tempr   raw (32767);

    cursor cur_portn_fichr (pva_nom_fichr in apex_collections.c001%type)
    is
        select ac.c001 nom
              ,ac.c002 mime_type
              ,ac.c003 portn
          from apex_collections ac
         where     ac.collection_name = afw_21_plugn_blob_pkg.kva_nom_colct_portn_blob
               and ac.c001 = pva_nom_fichr
      order by ac.n001
              ,ac.n002;
  begin
    case aa.g_widget_action
      when 'CREER_COLCT_BLOB'
      then
        --        ete ('CREER_COLCT_BLOB');
        afw_21_plugn_blob_pkg.creer_colct;
        htp.p ('{"stat":"colct_cree"}');
      when 'TELVR_BLOB'
      then
        --        ete ('TELVR_BLOB');

        if     afw_21_plugn_blob_pkg.colct_exist
           and aa.g_f01.count > 0
        then
          dbms_lob.createtemporary (vbl_fichr
                                   ,true);
          dbms_lob.createtemporary (vbl_fichr_tempr
                                   ,true);

          for i in 1 .. aa.g_f01.count
          loop
            vva_chain_tempr      :=
              afw_07_util_pkg.multi_replc (aa.g_f01 (i)
                                          ,'%2B'
                                          ,'+'
                                          ,'%2F'
                                          ,'/'
                                          ,'%3D'
                                          ,'=');

            vra_chain_tempr   := utl_encode.base64_decode (utl_raw.cast_to_raw (vva_chain_tempr));

            vbl_fichr_tempr   := to_blob (vra_chain_tempr);

            dbms_lob.append (vbl_fichr
                            ,vbl_fichr_tempr);
          end loop;

          afw_21_plugn_blob_pkg.ajout_membr_colct (pva_nom_fichr   => aa.g_x01
                                                  ,pva_mime_type   => aa.g_x02
                                                  ,pbl_fichr       => vbl_fichr);

          --          ete ('fichier'
          --              ,pbl_blob   => vbl_fichr);

          dbms_lob.freetemporary (vbl_fichr);
          dbms_lob.freetemporary (vbl_fichr_tempr);

          htp.p (   'La sauvegarde du fichier  "'
                 || aa.g_x01
                 || '" est termin¿');
        end if;
      when 'CREER_COLCT_PORTN_BLOB'
      then
        --        ete ('CREER_COLCT_PORTN_BLOB');
        afw_21_plugn_blob_pkg.creer_colct_portn;
        htp.p ('{"stat":"colct_portn_cree"}');
      when 'TELVR_PORTN_BLOB'
      then
        --        ete ('TELVR_PORTN_BLOB');

        if     afw_21_plugn_blob_pkg.colct_portn_exist
           and aa.g_f01.count > 0
        then
          for i in 1 .. aa.g_f01.count
          loop
            vva_chain_tempr      :=
              afw_07_util_pkg.multi_replc (aa.g_f01 (i)
                                          ,'%2B'
                                          ,'+'
                                          ,'%2F'
                                          ,'/'
                                          ,'%3D'
                                          ,'=');

            afw_21_plugn_blob_pkg.ajout_membr_colct_portn (pva_nom_fichr      => aa.g_x01
                                                          ,pva_mime_type      => aa.g_x02
                                                          ,pnu_portn_part_1   => aa.g_x03
                                                          ,pnu_portn_part_2   => i
                                                          ,pva_portn          => vva_chain_tempr);
          end loop;
        end if;
      when 'TERMR_TELVR_PORTN_BLOB'
      then
        --        ete ('TERMR_TELVR_PORTN_BLOB');
        dbms_lob.createtemporary (vbl_fichr
                                 ,true);
        dbms_lob.createtemporary (vbl_fichr_tempr
                                 ,true);

        for rec_portn in cur_portn_fichr (aa.g_x01)
        loop
          vra_chain_tempr   := utl_encode.base64_decode (utl_raw.cast_to_raw (rec_portn.portn));

          vbl_fichr_tempr   := to_blob (vra_chain_tempr);

          dbms_lob.append (vbl_fichr
                          ,vbl_fichr_tempr);
        end loop;

        afw_21_plugn_blob_pkg.suprm_portn_fichr (aa.g_x01);

        afw_21_plugn_blob_pkg.ajout_membr_colct (pva_nom_fichr   => aa.g_x01
                                                ,pva_mime_type   => aa.g_x02
                                                ,pbl_fichr       => vbl_fichr);

        --        ete ('fichier'
        --            ,pbl_blob   => vbl_fichr);

        dbms_lob.freetemporary (vbl_fichr);
        dbms_lob.freetemporary (vbl_fichr_tempr);

        htp.p (   'La sauvegarde du fichier  "'
               || aa.g_x01
               || '" est termin¿');
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      ete ();
  end ajax_soumt_blob;

  function genr_initl_comps (p_dynamic_action   in apex_plugin.t_dynamic_action
                            ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
    vbo_afich_multp   boolean default true;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Initialisation de composant');
    --Initialiser le plugin
    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_01.mesg.gestn_err_apex();'
      || 'afw.afw_13.page.item.genr_poubl();'
      || 'afw.afw_13.page.boutn.cachr_boots_dropdown();'
      || case when afw_11_prodt_pkg.obten_initl_comps_javsc is not null then afw_11_prodt_pkg.obten_initl_comps_javsc else null end
      || case
           when afw_11_prodt_pkg.obten_domn_docmn_html is not null
           then
                'document.domain="'
             || afw_11_prodt_pkg.obten_domn_docmn_html
             || '";'
           else
             null
         end
      || '}';

    return rec_actio_dynmq;
  end genr_initl_comps;

  function genr_afw_21_navgt_enreg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                   ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Navigation par enregistrement');

    if afw_21_plugn_navgt_enreg_pkg.valdr_prise_charg
    then
      afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                        ,p_plugin);

      --Ajouter les librairies CSS
      afw_21_util_pkg.ajout_libr_css ('afw.afw_21.actio_dynmq.navgt_enreg'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/css/');

      --Ajouter les librairies JavaScript
      afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.navgt_enreg'
                                       ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                        || 'assets/libs/js/');

      --position des boutons
      --p_dynamic_action.attribute_01
      --formulaire
      --r¿on
      --emplacement sp¿fique

      --vva_selct_jquer_postn_boutn_navgt_precd
      --p_dynamic_action.attribute_02

      --vva_selct_jquer_postn_boutn_navgt_suivn
      --p_dynamic_action.attribute_03

      rec_actio_dynmq.javascript_function      :=
           'function(){'
        || 'afw.afw_21.actio_dynmq.navgt_enreg.insta.push('
        || 'new afw.afw_21.actio_dynmq.navgt_enreg.navgt_enreg('
        || '{'
        || apex_javascript.add_attribute ('vnu_id_actio_dynmq'
                                         ,to_char (p_dynamic_action.id))
        || apex_javascript.add_attribute ('vva_nom_plugn'
                                         ,p_plugin.name)
        || apex_javascript.add_attribute ('vva_regn_navgt_precd'
                                         ,afw_21_plugn_navgt_enreg_pkg.obten_regn_navgt_precd)
        || apex_javascript.add_attribute ('vva_regn_navgt_suivn'
                                         ,afw_21_plugn_navgt_enreg_pkg.obten_regn_navgt_suivn)
        || apex_javascript.add_attribute ('vva_url_precd'
                                         ,afw_21_plugn_navgt_enreg_pkg.obten_url_precd_enreg)
        || apex_javascript.add_attribute ('vva_url_suivn'
                                         ,afw_21_plugn_navgt_enreg_pkg.obten_url_suivn_enreg)
        || apex_javascript.add_attribute ('vva_plugn_ajax'
                                         ,apex_plugin.get_ajax_identifier
                                         ,p_add_comma   => false)
        || '}));}';
    else
      --ete ('NOT afw_21_plugn_navgt_enreg_pkg.valdr_prise_charg');
      rec_actio_dynmq.javascript_function   := 'false';
    end if;

    return rec_actio_dynmq;
  end genr_afw_21_navgt_enreg;

  function ajax_afw_21_navgt_enreg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                   ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
  begin
    case aa.g_widget_action
      when 'NAVGT_PREMR_ENREG'
      then
        null;
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      return rec_actio_dynmq;
  end ajax_afw_21_navgt_enreg;

  function genr_tutrl (p_dynamic_action   in apex_plugin.t_dynamic_action
                      ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
    vnu_tutrl         vd_afw_13_tutrl.seqnc%type;
    vnu_etape_tutrl   vd_afw_13_etape_tutrl.seqnc%type;
    vnu_ordre_presn   vd_afw_13_etape_tutrl.ordre_presn%type default nvl (p_dynamic_action.attribute_03, 0);
    vva_liste_etape   varchar2 (32767);
    vbo_afch_tutrl    boolean default false;
    vre_parmt_tutrl   afw_12_tutrl_pkg.gty_parmt_tutrl;
  begin
    /*
    * http://bootstraptour.com/api/
    */

    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Tutoriel');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Si le tutoriel est d¿nit comme un premier chargement et qu'il n'existe pas d'occurrences pour l'utilisateur en cours (historique),
    --  Pousser le tutoriel dans la session
    --Sinon
    --  Attendre le d¿encheur (Appel action dynamique)
    case p_dynamic_action.attribute_01
      when 'SUR_DEMND'
      then
        vnu_tutrl        := afw_21_plugn_tutrl_pkg.obten_tutrl (p_dynamic_action.attribute_02);
        vnu_etape_tutrl      :=
          afw_21_plugn_tutrl_pkg.obten_etape_tutrl (vnu_tutrl
                                                   ,vnu_ordre_presn);
        vbo_afch_tutrl   := true;
      --        ete ('SUR DEMANDE'
      --            ,   'Tutoriel/Etape/Page: '
      --             || vnu_tutrl
      --             || '/'
      --             || vnu_etape_tutrl
      --             || '/'
      --             || afw_13_page_pkg.obten_page_sesn);
      when 'PREMR_CHARG' --Dans les faits, ce mode sert ¿onsommer la c¿le des tutoriaux
      then
        -- EXISTS CEDULE
        if afw_21_plugn_tutrl_pkg.exist_tutrl_cedl (afw_13_page_pkg.obten_page_sesn)
        then
          vre_parmt_tutrl   := afw_21_plugn_tutrl_pkg.obten_tutrl_cedl (afw_13_page_pkg.obten_page_sesn);

          vnu_tutrl         := vre_parmt_tutrl.ref_tutrl;
          vnu_etape_tutrl   := vre_parmt_tutrl.ref_etape_tutrl;

          vbo_afch_tutrl    := true;
        else
          --Se baser sur l'existance d'une premiere etape avec "afw_13_page_pkg.obten_page_sesn" dans un tutoriel a "Oui"
          vnu_tutrl   := afw_21_plugn_tutrl_pkg.obten_tutrl_premr_charg (afw_13_page_pkg.obten_page_sesn);

          if     vnu_tutrl is not null
             and not afw_21_plugn_tutrl_pkg.exist_histr_charg (vnu_tutrl)
             and afw_21_plugn_tutrl_pkg.obten_indic_premr_charg (vnu_tutrl) = 'O'
          then
            --            ete ('PREMIER CHARGEMENT'
            --                ,   'Tutoriel/Etape/Page: '
            --                 || vnu_tutrl
            --                 || '/'
            --                 || vnu_etape_tutrl
            --                 || '/'
            --                 || afw_13_page_pkg.obten_page_sesn);
            vnu_etape_tutrl   := null;
            vbo_afch_tutrl    := true;
          end if;
        end if;
    end case;

    if     vbo_afch_tutrl
       and vnu_tutrl is not null
    then
      --Ajouter les librairies CSS
      afw_21_util_pkg.ajout_libr_css ('bootstrap-tour'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/bootstrap-tour/0.10.2/build/css/');

      --Ajouter les librairies JavaScript
      afw_21_util_pkg.ajout_libr_javsc ('bootstrap-tour'
                                       ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                        || 'assets/plugins/bootstrap-tour/0.10.2/build/js/');

      afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.tutrl'
                                       ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                        || 'assets/libs/js/');

      rec_actio_dynmq.javascript_function      :=
           'function(){'
        || 'afw.afw_21.actio_dynmq.tutrl.insta.push('
        || 'new afw.afw_21.actio_dynmq.tutrl.tutrl('
        || '{'
        || apex_javascript.add_attribute ('id'
                                         ,p_dynamic_action.attribute_02)
        || apex_javascript.add_attribute ('vva_nom'
                                         ,p_dynamic_action.attribute_02)
        || apex_javascript.add_attribute ('vva_nom_plugn'
                                         ,p_plugin.name)
        || apex_javascript.add_attribute ('vnu_seqnc_tutrl'
                                         ,vnu_tutrl)
        || apex_javascript.add_attribute ('vnu_etape_actue'
                                         ,afw_21_plugn_tutrl_pkg.obten_ordre_presn_etape_tutrl (vnu_etape_tutrl))
        || apex_javascript.add_attribute ('vva_plugn_ajax'
                                         ,apex_plugin.get_ajax_identifier
                                         ,p_add_comma   => false)
        || '}));}';
    else
      rec_actio_dynmq.javascript_function   := 'false';
    end if;

    return rec_actio_dynmq;
  end genr_tutrl;

  function ajax_tutrl (p_dynamic_action   in apex_plugin.t_dynamic_action
                      ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;

    vnu_index         number;
    pcl_liste_etape   clob;
  begin
    case aa.g_widget_action
      when 'DEFNR_ETAP_TUTRL'
      then
        null;
      --ete ('key', aa.g_x01);
      --ete ('flag debut/fin', aa.g_x02);
      when 'OUVER_TOUR'
      then
        afw_21_plugn_tutrl_pkg.ajout_histr (aa.g_x01
                                           ,afw_12_utils_pkg.obten_usagr_conct);
        afw_21_plugn_tutrl_pkg.termn_cedl_tutrl (aa.g_x01);
      when 'FERMR_TOUR'
      then
        --Enlever tous cedules fait par tutoriel courant pour utilisateur courant
        --Cause bogue si submit
        --afw_21_plugn_tutrl_pkg.termn_cedl_tutrl (aa.g_x01);
        null;
      when 'AFICH_ETAPE'
      then
        null;
      when 'FIN_AFICH_ETAPE'
      then
        --Ajout de la prochaine etape si
        afw_21_plugn_tutrl_pkg.defnr_etape_suivn_cedl (aa.g_x01
                                                      ,aa.g_x02);
      when 'OBTEN_LISTE_ETAPE'
      then
        vnu_index         := afw_21_plugn_tutrl_pkg.obten_liste_etape (aa.g_x01);
        pcl_liste_etape   := afw_07_clob_pkg.obten (vnu_index);

        afw_15_htp_pkg.ecrir ('{"liste_etape":'
                             ,false);
        afw_15_htp_pkg.ecrir_clob (pcl_liste_etape);
        afw_15_htp_pkg.ecrir ('}');
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      ete ();
      return rec_actio_dynmq;
  end ajax_tutrl;

  function genr_favr (p_dynamic_action   in apex_plugin.t_dynamic_action
                     ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin - Favoris');

    afw_21_util_pkg.debug_actio_dynmq (p_dynamic_action
                                      ,p_plugin);

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.actio_dynmq.favr'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    rec_actio_dynmq.javascript_function      :=
         'function(){'
      || 'afw.afw_21.actio_dynmq.favr.vva_plugn_ajax = "'
      || apex_plugin.get_ajax_identifier
      || '";}';

    return rec_actio_dynmq;
  end genr_favr;

  function ajax_favr (p_dynamic_action   in apex_plugin.t_dynamic_action
                     ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result
  is
    rec_actio_dynmq   apex_plugin.t_dynamic_action_ajax_result;
  begin
    case aa.g_widget_action
      when 'AJOUT_FAVR'
      then
        afw_12_favr_pkg.ajout_favr (aa.g_x01
                                   ,aa.g_x02
                                   ,pva_clas         => p_plugin.attribute_01
                                   ,pva_titre        => p_plugin.attribute_02
                                   ,pva_clas_inver   => p_plugin.attribute_03);
      when 'SUPRM_FAVR'
      then
        afw_12_favr_pkg.suprm_favr (aa.g_x01
                                   ,aa.g_x02
                                   ,pva_clas         => p_plugin.attribute_03
                                   ,pva_titre        => p_plugin.attribute_04
                                   ,pva_clas_inver   => p_plugin.attribute_01);
      else
        null;
    end case;

    return rec_actio_dynmq;
  exception
    when others
    then
      return rec_actio_dynmq;
  end ajax_favr;
begin
  gta_code_plugn ('AFW_13_CONFR_SAUVG')      := 'AFW_13_CONFR_SAUVG';
  gta_code_plugn ('AFW_18')                  := 'AFW_18';
  gta_code_plugn ('AFW_14_POPUP_LOV_ITEM')   := 'AFW_14_POPUP_LOV_ITEM';
  gta_code_plugn ('AFW_14_POPUP_LOV')        := 'AFW_14_POPUP_LOV';
end afw_21_actio_dynmq_pkg;
/
