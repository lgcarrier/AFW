SET DEFINE OFF;
create or replace package body afw_21_item_pkg
is
  kva_name_favr         constant varchar2 (30) default 'IO_AFW_21_FAVR';
  kva_name_bascl_favr   constant varchar2 (50) default 'IO_AFW_21_BASCL_FAVR';

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
           where       pi.ref_page in (vnu_page_sesn, vnu_page_zero_sesn)
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
           where       pli.ref_page = vnu_page_sesn
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

  function genr_plugn_item_masq (p_item                  in apex_plugin.t_page_item
                                ,p_plugin                in apex_plugin.t_plugin
                                ,p_value                 in varchar2
                                ,p_is_readonly           in boolean
                                ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result
  is
    rec_page_item       apex_plugin.t_page_item_render_result;
    vvc_clas_css        apex_application_global.vc_arr2;
    vva_nom_page_item   p_item.name%type;
    vva_masq            p_item.attribute_02%type;
    vva_type_masq       p_item.attribute_01%type;
    vva_masq_persn      p_item.attribute_02%type;
    vva_carct_espcm     p_item.attribute_03%type;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 13 Plugin - AFW 13 - Item masqué');
    afw_21_util_pkg.debug_page_item (p_item
                                    ,p_plugin
                                    ,p_value
                                    ,p_is_readonly
                                    ,p_is_printer_friendly);
    vva_nom_page_item   := p_item.name;
    vva_type_masq       := p_item.attribute_01;
    vva_masq_persn      := p_item.attribute_02;
    vva_carct_espcm     := nvl (p_item.attribute_03, '');

    vvc_clas_css (1)    := 'text_field';

    if p_is_printer_friendly
    then
      afw_21_util_pkg.ecrir_item_input_mode_imprs (p_item
                                                  ,p_plugin
                                                  ,p_value);
    elsif p_is_readonly
    then
      afw_21_util_pkg.ecrir_item_input_lectr_seule (p_item
                                                   ,p_plugin
                                                   ,p_value
                                                   ,vvc_clas_css);
    else
      afw_21_util_pkg.ecrir_item_input (p_item
                                       ,p_plugin
                                       ,p_value
                                       ,'text'
                                       ,vvc_clas_css);

      rec_page_item.is_navigable   := true;
    end if;

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('jquery.maskedinput-1.2.2'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/jquery-maskedinput/1.2.2/');

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.item.masq'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');


    if vva_type_masq = 'PERSN'
    then
      vva_masq   := vva_masq_persn;
    else
      vva_masq   := vva_type_masq;
    end if;

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.item.masq.insta.push(new afw.afw_21.item.masq.masq({vva_id_item:"'
                                            || vva_nom_page_item
                                            || '",vva_masq:"'
                                            || vva_masq
                                            || '",vva_carct_espcm:"'
                                            || vva_carct_espcm
                                            || '"}));');

    return rec_page_item;
  end genr_plugn_item_masq;

  function genr_plugn_item_popup_arbor (p_item                  in apex_plugin.t_page_item
                                       ,p_plugin                in apex_plugin.t_plugin
                                       ,p_value                 in varchar2
                                       ,p_is_readonly           in boolean
                                       ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result
  is
    rec_page_item                  apex_plugin.t_page_item_render_result;
    vvc_clas_css_input             apex_application_global.vc_arr2;
    vvc_clas_css_logo_ouvr_popup   apex_application_global.vc_arr2;
    vva_nom_page_item              p_item.name%type;
    vva_reprt_fichr_javsc          varchar2 (255);
    vva_nom_fichr_javsc            varchar2 (50);
    vva_extns_fichr_javsc          varchar2 (10);
    vva_reprt_fichr_css            varchar2 (255);
    vva_nom_fichr_css              varchar2 (50);
    vva_extns_fichr_css            varchar2 (10);
    vva_logo_ouvr_popup            varchar (30);
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 13 Plugin - AFW 13 - Item Popup LOV Arborescence');
    afw_21_util_pkg.debug_page_item (p_item
                                    ,p_plugin
                                    ,p_value
                                    ,p_is_readonly
                                    ,p_is_printer_friendly);

    vva_nom_page_item                  := p_item.name;
    vva_logo_ouvr_popup                := p_item.attribute_01;

    afw_21_util_pkg.formt_url_fichr (p_plugin.attribute_01
                                    ,vva_reprt_fichr_javsc
                                    ,vva_nom_fichr_javsc
                                    ,vva_extns_fichr_javsc);
    afw_21_util_pkg.formt_url_fichr (p_plugin.attribute_02
                                    ,vva_reprt_fichr_css
                                    ,vva_nom_fichr_css
                                    ,vva_extns_fichr_css);

    vvc_clas_css_input (1)             := 'text_field';

    vvc_clas_css_logo_ouvr_popup (1)   := 'ouvr_popup_lov_arbor';

    if p_is_printer_friendly
    then
      afw_21_util_pkg.ecrir_item_input_mode_imprs (p_item
                                                  ,p_plugin
                                                  ,p_value);
    elsif p_is_readonly
    then
      afw_21_util_pkg.ecrir_item_input_lectr_seule (p_item
                                                   ,p_plugin
                                                   ,p_value
                                                   ,vvc_clas_css_input);
    else
      afw_21_util_pkg.ecrir_item_input_popup_arbor (p_item
                                                   ,p_plugin
                                                   ,p_value
                                                   ,'text'
                                                   ,vvc_clas_css_input
                                                   ,vva_logo_ouvr_popup
                                                   ,vvc_clas_css_logo_ouvr_popup);

      rec_page_item.is_navigable   := true;
    end if;

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc (vva_nom_fichr_javsc
                                     ,vva_reprt_fichr_javsc
                                     ,pbo_saut_extns   => true);

    afw_21_util_pkg.ajout_libr_css (vva_nom_fichr_css
                                   ,vva_reprt_fichr_css
                                   ,pbo_saut_extns   => true);

    return rec_page_item;
  end genr_plugn_item_popup_arbor;

  function genr_champ_rechr (p_item                  in apex_plugin.t_page_item
                            ,p_plugin                in apex_plugin.t_plugin
                            ,p_value                 in varchar2
                            ,p_is_readonly           in boolean
                            ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result
  is
    rec_page_item       apex_plugin.t_page_item_render_result;
    vvc_clas_css        apex_application_global.vc_arr2;
    vva_nom_page_item   p_item.name%type;
    vva_place_holdr     p_item.attribute_01%type;
    vnu_nombr_reslt     p_item.attribute_02%type;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin Item - Champ de recherche webkit');
    afw_21_util_pkg.debug_page_item (p_item
                                    ,p_plugin
                                    ,p_value
                                    ,p_is_readonly
                                    ,p_is_printer_friendly);
    vva_nom_page_item   := p_item.name;

    vva_place_holdr     := p_item.attribute_01;
    vnu_nombr_reslt     := p_item.attribute_02;

    vvc_clas_css (1)    := 'afw_21_champ_rechr';

    if     not p_is_printer_friendly
       and not p_is_readonly
    then
      afw_21_util_pkg.ecrir_item_input (p_item
                                       ,p_plugin
                                       ,p_value
                                       ,'search'
                                       ,vvc_clas_css
                                       ,vva_place_holdr
                                       ,vnu_nombr_reslt);

      rec_page_item.is_navigable   := true;
    end if;

    --Ajouter les librairies JavaScript
    /*afw_21_util_pkg.ajout_libr_javsc (
                      'jquery.watermark.min',
      afw_11_prodt_pkg.obten_dosr_fichr_afw
      || 'assets/plugins/jquery-watermark/3.1.3/');*/

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.item.champ_rechr'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.item.champ_rechr.insta.push(new afw.afw_21.item.champ_rechr.champ_rechr({'
                                            || '"vva_id_item":"'
                                            || p_item.name
                                            || '","vva_plugn_ajax":"'
                                            || apex_plugin.get_ajax_identifier
                                            || '"'
                                            || '}));');

    return rec_page_item;
  end genr_champ_rechr;

  function ajax_champ_rechr (p_item     in apex_plugin.t_page_item
                            ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result
  is
    rec_page_item   apex_plugin.t_page_item_ajax_result;

    procedure exect_rechr (pva_valr_rechr   in varchar2
                          ,p_item           in apex_plugin.t_page_item)
    is
    begin
      afw_23_rechr_pkg.exect_rechr_apex (pva_valr_rechr);
      afw_15_htp_pkg.ecrir (afw_08_url_pkg.genr_url (afw_11_aplic_pkg.obten_numr_apex_aplic ('SAFU')
                                                    ,6
                                                    ,'SIDF'
                                                    ,null)
                           ,false);
    end;
  begin
    case aa.g_widget_action
      when 'EXECT_RECHR'
      then
        exect_rechr (aa.g_x01
                    ,p_item);
      else
        null;
    end case;

    return rec_page_item;
  end ajax_champ_rechr;

  function genr_selct_2 (p_item                  in apex_plugin.t_page_item
                        ,p_plugin                in apex_plugin.t_plugin
                        ,p_value                 in varchar2
                        ,p_is_readonly           in boolean
                        ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result
  is
    rec_page_item              apex_plugin.t_page_item_render_result;
    vbo_singl_value            boolean;
    vbo_multp_value            boolean;
    vva_indic_allow_clear      varchar2 (1) default 'N';
    vva_indic_load_remt_data   varchar2 (1) default p_item.attribute_03;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin Item - Select 2');
    afw_21_util_pkg.debug_page_item (p_item
                                    ,p_plugin
                                    ,p_value
                                    ,p_is_readonly
                                    ,p_is_printer_friendly);

    -- Single-value and Multiple-value
    vbo_singl_value              := case p_item.attribute_01 when 'SINGL_VALUE' then true else false end;
    vbo_multp_value              := case p_item.attribute_01 when 'MULTP_VALUE' then true else false end;

    if vbo_multp_value
    then
      vva_indic_allow_clear   := null;
    elsif (vbo_singl_value /* and p_item.placeholder is not null*/
                          )
    then
      vva_indic_allow_clear   := p_item.attribute_02;
    end if;

    if vva_indic_load_remt_data = 'N'
    then
      afw_21_plugn_selct_2_pkg.genr_item_selct (p_item
                                               ,p_value);
    else
      afw_21_plugn_selct_2_pkg.genr_item_tag (p_item
                                             ,p_value);
    end if;

    rec_page_item.is_navigable   := true;

    --Ajouter les librairies CSS
    if p_plugin.attribute_01 = 'Y'
    then
      afw_21_util_pkg.ajout_libr_css ('select2'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/select2/3.5.0/');

      afw_21_util_pkg.ajout_libr_css ('select2-bootstrap'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/select2/3.5.0/');
    end if;

    --Ajouter les librairies JavaScript
    afw_21_util_pkg.ajout_libr_javsc ('select2'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/plugins/select2/3.5.0/');

    -- TODO::LGCARRIER
    -- Devrait se générer en fonction de la langue du produit (et de la session)
    /*
    if XYZ
    then
     afw_21_util_pkg.ajout_libr_javsc (
       'select2_locale_fr'
      ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
       || 'assets/plugins/select2/3.5.0/');
    end if;
    */

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.widget.selectList'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.item.selct_2'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.item.selct_2.insta.push('
                                            || 'new afw.afw_21.item.selct_2.selct_2('
                                            || '{'
                                            || apex_javascript.add_attribute ('vva_nom_plugn'
                                                                             ,p_plugin.name)
                                            || apex_javascript.add_attribute ('vva_id_item'
                                                                             ,p_item.name)
                                            || apex_javascript.add_attribute ('vbo_multp'
                                                                             ,vbo_multp_value)
                                            || apex_javascript.add_attribute ('vbo_load_remt_data'
                                                                             ,afw_21_util_pkg.formt_plugn_atrib_boln (p_item.attribute_03))
                                            || apex_javascript.add_attribute ('vva_place_holdr'
                                                                             ,p_item.placeholder)
                                            || apex_javascript.add_attribute (
                                                 'vbo_allow_clear'
                                                ,case
                                                   when vva_indic_allow_clear is not null then afw_21_util_pkg.formt_plugn_atrib_boln (vva_indic_allow_clear)
                                                   else null
                                                 end)
                                            || apex_javascript.add_attribute ('vnu_minm_reslt_for_searc'
                                                                             ,to_number (p_item.attribute_04))
                                            || apex_javascript.add_attribute ('vnu_maxm_selct_size'
                                                                             ,to_number (p_item.attribute_06))
                                            || apex_javascript.add_attribute ('vnu_minm_input_length'
                                                                             ,to_number (p_item.attribute_07))
                                            || apex_javascript.add_attribute ('vnu_maxm_input_length'
                                                                             ,to_number (p_item.attribute_08))
                                            || apex_javascript.add_attribute ('vva_seprt'
                                                                             ,p_item.attribute_09)
                                            || apex_javascript.add_attribute ('vva_largr'
                                                                             ,p_item.attribute_12)
                                            || apex_javascript.add_attribute ('vva_clas_contn_reslt'
                                                                             ,p_item.element_css_classes)
                                            || apex_javascript.add_attribute ('vbo_allow_inser'
                                                                             ,afw_21_util_pkg.formt_plugn_atrib_boln (p_item.attribute_13))
                                            || apex_javascript.add_attribute ('vva_liste_item_parnt'
                                                                             ,apex_plugin_util.page_item_names_to_jquery (p_item.lov_cascade_parent_items))
                                            || apex_javascript.add_attribute ('vva_liste_item_submt'
                                                                             ,apex_plugin_util.page_item_names_to_jquery (p_item.ajax_items_to_submit))
                                            || apex_javascript.add_attribute ('vbo_rafrc_optim'
                                                                             ,p_item.ajax_optimize_refresh)
                                            || apex_javascript.add_attribute ('vbo_lectr_seule'
                                                                             ,p_is_readonly)
                                            || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                                             ,apex_plugin.get_ajax_identifier
                                                                             ,p_add_comma   => false)
                                            || '}));');

    return rec_page_item;
  end genr_selct_2;

  function ajax_selct_2 (p_item     in apex_plugin.t_page_item
                        ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result
  is
    rec_page_item         apex_plugin.t_page_item_ajax_result;

    vbo_singl_value       boolean;
    vbo_multp_value       boolean;

    vnu_minm_lov_colmn    number (1) default 2;
    vnu_maxm_lov_colmn    number (1) default 3;

    vnu_lov_displ_colmn   number (1) default 1;
    vnu_lov_retrn_colmn   number (1) default 2;
    vnu_lov_group_colmn   number (1) default 3;
  begin
    -- Single-value and Multiple-value
    vbo_singl_value   := case p_item.attribute_01 when 'SINGL_VALUE' then true else false end;
    vbo_multp_value   := case p_item.attribute_01 when 'MULTP_VALUE' then true else false end;

    case
      when aa.g_widget_action = 'RAFRC_CASCD_LOV'
      then
        htp.prn ();
      when aa.g_widget_action = 'VALR_SELCT_INITL'
      then
        -- Est utilisé si l'item doit se rafraîchir à cuse d'un cascading lov
        afw_21_plugn_selct_2_pkg.genr_json_initl_selct_lov (p_item);
      when aa.g_widget_action = 'RECHR_LOV'
      then
        afw_21_plugn_selct_2_pkg.genr_json_rechr_lov (p_item);
      else
        null;
    end case;

    return rec_page_item;
  end ajax_selct_2;

  function genr_favr (p_item                  in apex_plugin.t_page_item
                     ,p_plugin                in apex_plugin.t_plugin
                     ,p_value                 in varchar2
                     ,p_is_readonly           in boolean
                     ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result
  is
    rec_page_item           apex_plugin.t_page_item_render_result;
    vbo_singl_value         boolean;
    vbo_multp_value         boolean;

    vnu_struc_aplic         number (10) default afw_12_struc_aplic_pkg.obten_seqnc (afw_07_util_pkg.v (p_item.attribute_01));
    vnu_seqnc_struc_aplic   number (10) default afw_07_util_pkg.v (p_item.attribute_02);
    vta_plugn_favr          afw_21_util_pkg.t_plugn;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin Item - Favoris');
    afw_21_util_pkg.debug_page_item (p_item
                                    ,p_plugin
                                    ,p_value
                                    ,p_is_readonly
                                    ,p_is_printer_friendly);

    if vnu_seqnc_struc_aplic is not null
    then
      vta_plugn_favr      :=
        afw_21_util_pkg.obten_confg_plugn (afw_21_util_pkg.kva_type_plugn_actio_dynmq
                                          ,kva_name_favr);
      afw_15_htp_pkg.ecrir (afw_12_favr_pkg.obten_icone_favr (pnu_seqnc_struc_aplic   => vnu_seqnc_struc_aplic
                                                             ,pnu_struc_aplic         => vnu_struc_aplic
                                                             ,pva_clas_selct          => vta_plugn_favr.attribute_01
                                                             ,pva_titre_selct         => vta_plugn_favr.attribute_02
                                                             ,pva_clas_non_selct      => vta_plugn_favr.attribute_03
                                                             ,pva_titre_non_selct     => vta_plugn_favr.attribute_04));
    end if;

    return rec_page_item;
  end genr_favr;

  function ajax_favr (p_item     in apex_plugin.t_page_item
                     ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result
  is
    rec_page_item   apex_plugin.t_page_item_ajax_result;
  begin
    return rec_page_item;
  end ajax_favr;

  function genr_bascl_favr (p_item                  in apex_plugin.t_page_item
                           ,p_plugin                in apex_plugin.t_plugin
                           ,p_value                 in varchar2
                           ,p_is_readonly           in boolean
                           ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result
  is
    rec_page_item           apex_plugin.t_page_item_render_result;
    vva_id_item_bascl       varchar2 (255) default p_item.attribute_01;
    vva_indic_gestn_filtr   varchar2 (1) default nvl (p_item.attribute_02, 'N');
    vva_id_item_filtr       varchar2 (255) default case vva_indic_gestn_filtr when 'Y' then p_item.attribute_03 else null end;
    vva_sql_filtr           varchar2 (4000) default case vva_indic_gestn_filtr when 'Y' then p_item.attribute_04 else null end;

    vta_plugn_favr          afw_21_util_pkg.t_plugn;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin Item - Basculer Favoris');
    afw_21_util_pkg.debug_page_item (p_item
                                    ,p_plugin
                                    ,p_value
                                    ,p_is_readonly
                                    ,p_is_printer_friendly);

    if afw_07_util_pkg.exist_item (vva_id_item_bascl)
    then
      /*vta_plugn_favr      :=
        afw_21_util_pkg.obten_confg_plugn (
          afw_21_util_pkg.kva_type_plugn_item
         ,kva_name_bascl_favr);*/

      afw_21_plugn_favr_pkg.genr_icone_favr (pva_id_item               => p_item.name
                                            ,pva_id_item_alimn_bascl   => vva_id_item_bascl
                                            ,pva_gerer_filtr           => vva_indic_gestn_filtr
                                            ,pva_id_item_alimn_filtr   => vva_id_item_filtr
                                            ,pva_valr_alimn_filtr      => vva_sql_filtr
                                            ,pva_clas_actif            => p_plugin.attribute_01
                                            ,pva_titre_actif           => p_plugin.attribute_02
                                            ,pva_clas_inact            => p_plugin.attribute_03
                                            ,pva_titre_inact           => p_plugin.attribute_04);
    end if;

    --Ajout librairies JS
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.item.bascl_favr'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.item.bascl_favr.insta.push('
                                            || 'new afw.afw_21.item.bascl_favr.bascl_favr('
                                            || '{'
                                            || apex_javascript.add_attribute ('vva_nom_plugn'
                                                                             ,p_plugin.name)
                                            || apex_javascript.add_attribute ('vva_id_item'
                                                                             ,p_item.name)
                                            || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                                             ,apex_plugin.get_ajax_identifier
                                                                             ,p_add_comma   => false)
                                            || '}));');

    return rec_page_item;
  end genr_bascl_favr;

  function ajax_bascl_favr (p_item     in apex_plugin.t_page_item
                           ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result
  is
    rec_page_item           apex_plugin.t_page_item_ajax_result;
    vva_id_item_bascl       varchar2 (255) default p_item.attribute_01;
    vva_indic_gestn_filtr   varchar2 (1) default nvl (p_item.attribute_02, 'N');
    vva_id_item_filtr       varchar2 (255) default case vva_indic_gestn_filtr when 'Y' then p_item.attribute_03 else null end;
    vva_sql_filtr           varchar2 (4000) default case vva_indic_gestn_filtr when 'Y' then p_item.attribute_04 else null end;
  begin
    case aa.g_widget_action
      when 'BASCL_FAVR'
      then
        --Gérer l'item filtre
        --Toggle item contenant basculer
        afw_21_plugn_favr_pkg.bascl_favr (pva_id_item_alimn_bascl   => vva_id_item_bascl
                                         ,pva_gerer_filtr           => vva_indic_gestn_filtr
                                         ,pva_id_alimn_filtr        => vva_id_item_filtr
                                         ,pva_valr_alimn_filtr      => vva_sql_filtr
                                         ,pva_clas_actif            => p_plugin.attribute_01
                                         ,pva_titre_actif           => p_plugin.attribute_02
                                         ,pva_clas_inact            => p_plugin.attribute_03
                                         ,pva_titre_inact           => p_plugin.attribute_04);
      else
        null;
    end case;

    return rec_page_item;
  end ajax_bascl_favr;

  function genr_tradc_champ (p_item                  in apex_plugin.t_page_item
                            ,p_plugin                in apex_plugin.t_plugin
                            ,p_value                 in varchar2
                            ,p_is_readonly           in boolean
                            ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result
  is
    rec_page_item       apex_plugin.t_page_item_render_result;
    vva_progr_a_lancr   varchar2 (4000)
                          default    'begin '
                                  || '  %PROCD_ECRIT%(:1,:2,:3,:4); '
                                  || '  exception when others then ete();'
                                  || 'end;';

    cursor cur_prodt_lang
    is
        select pl.ref_lang
          from vd_afw_11_prodt_lang pl
         where pl.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
      order by pl.indic_deft nulls last
              ,ordre_presn;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin Item - Traduction de champ');
    afw_21_util_pkg.debug_page_item (p_item
                                    ,p_plugin
                                    ,p_value
                                    ,p_is_readonly
                                    ,p_is_printer_friendly);

    case p_item.attribute_01
      when 'TEXTF'
      then
        vva_progr_a_lancr      :=
          replace (vva_progr_a_lancr
                  ,'%PROCD_ECRIT%'
                  ,p_item.attribute_02);
      when 'TEXTR'
      then
        vva_progr_a_lancr      :=
          replace (vva_progr_a_lancr
                  ,'%PROCD_ECRIT%'
                  ,p_item.attribute_03);
    end case;

    afw_15_htp_pkg.ouvri_bals ('div'
                              ,'id'
                              ,p_item.name);

    for rec_prodt_lang in cur_prodt_lang
    loop
      execute immediate vva_progr_a_lancr
        using rec_prodt_lang.ref_lang
             ,afw_13_page_pkg.obten_struc_aplic (afw_13_page_pkg.obten_page_sesn)
             ,afw_04_contx_pkg.obten_seqnc_contx (afw_12_struc_aplic_pkg.obten_code (afw_13_page_pkg.obten_struc_aplic (afw_13_page_pkg.obten_page_sesn)))
             ,p_item.attribute_04;
    end loop;

    afw_15_htp_pkg.fermr_bals ('div');


    --Ajout librairies JS
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.item.tradc_champ'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.item.tradc_champ.insta.push('
                                            || 'new afw.afw_21.item.tradc_champ.tradc_champ('
                                            || '{'
                                            || apex_javascript.add_attribute ('vva_nom_plugn'
                                                                             ,p_plugin.name)
                                            || apex_javascript.add_attribute ('vva_id_item'
                                                                             ,p_item.name)
                                            || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                                             ,apex_plugin.get_ajax_identifier
                                                                             ,p_add_comma   => false)
                                            || '}));');

    return rec_page_item;
  end genr_tradc_champ;

  function ajax_tradc_champ (p_item     in apex_plugin.t_page_item
                            ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result
  is
    rec_page_item   apex_plugin.t_page_item_ajax_result;
  begin
    case aa.g_widget_action
      when 'SAUVG_TRADC'
      then
        --Sauvegarder la traduction du champ
        afw_21_plugn_lang_pkg.sauvg_tradc (
          aa.g_x01
         ,afw_13_page_pkg.obten_struc_aplic (afw_13_page_pkg.obten_page_sesn)
         ,afw_04_contx_pkg.obten_seqnc_contx (afw_12_struc_aplic_pkg.obten_code (afw_13_page_pkg.obten_struc_aplic (afw_13_page_pkg.obten_page_sesn)))
         ,aa.g_x02
         ,aa.g_x03);
      else
        null;
    end case;

    return rec_page_item;
  end ajax_tradc_champ;

  function genr_item_choix_aprob (p_item                  in apex_plugin.t_page_item
                                 ,p_plugin                in apex_plugin.t_plugin
                                 ,p_value                 in varchar2
                                 ,p_is_readonly           in boolean
                                 ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result
  is
    rec_page_item   apex_plugin.t_page_item_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin Item - Choix item approbation');
    afw_21_util_pkg.debug_page_item (p_item
                                    ,p_plugin
                                    ,p_value
                                    ,p_is_readonly
                                    ,p_is_printer_friendly);

    if p_is_readonly
    then
      afw_21_plugn_choix_aprob_pkg.genr_item_lectr_seule (p_item
                                                         ,p_value
                                                         ,p_is_readonly
                                                         ,p_is_printer_friendly);
    else
      afw_21_plugn_choix_aprob_pkg.genr_item (p_item
                                             ,p_value);
    end if;

    --Ajout librairies CSS
    afw_21_util_pkg.ajout_libr_css ('afw.afw_21.item.choix_aprob'
                                   ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                    || 'assets/libs/css/');

    --Ajout librairies JS
    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.item.choix_aprob'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.item.choix_aprob.insta.push('
                                            || 'new afw.afw_21.item.choix_aprob.choix_aprob('
                                            || '{'
                                            || apex_javascript.add_attribute ('vva_id'
                                                                             ,   p_item.name
                                                                              || afw_21_plugn_choix_aprob_pkg.kva_id_dialg)
                                            || apex_javascript.add_attribute ('vva_clas_custm'
                                                                             ,p_item.attribute_03)
                                            || apex_javascript.add_attribute ('vnu_largr'
                                                                             ,p_item.attribute_04)
                                            || apex_javascript.add_attribute ('vnu_hautr'
                                                                             ,p_item.attribute_05)
                                            || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                                             ,apex_plugin.get_ajax_identifier
                                                                             ,p_add_comma   => false)
                                            || '}));');

    return rec_page_item;
  end genr_item_choix_aprob;

  function ajax_item_choix_aprob (p_item     in apex_plugin.t_page_item
                                 ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result
  is
    rec_page_item   apex_plugin.t_page_item_ajax_result;
  begin
    case aa.g_widget_action
      when 'CHOIS_APROB'
      then
        afw_12_insta_procs_aprob_pkg.chois_evolt_stat (afw_12_struc_aplic_pkg.obten_seqnc (p_item.attribute_01)
                                                      ,afw_21_util_pkg.obten_reslt_expre_plsql (p_item.attribute_02)
                                                      ,aa.g_x01
                                                      ,afw_12_domn_pkg.obten_domn_sesn ()
                                                      ,sysdate
                                                      ,aa.g_x02);
      when 'INSTA_PROCS_APROB'
      then
        afw_12_group_stat_pkg.insta_procs_aprob (aa.g_x01
                                                ,afw_12_struc_aplic_pkg.obten_seqnc (p_item.attribute_01)
                                                ,afw_21_util_pkg.obten_reslt_expre_plsql (p_item.attribute_02)
                                                ,null
                                                ,rtrim (aa.g_x02
                                                       ,':'));
      else
        null;
    end case;

    afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code (pva_code_mesg    => 'GEN.100016'
                                                   ,pva_code_prodt   => 'AFW');

    return rec_page_item;
  exception
    when others
    then
      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code (pva_code_mesg     => 'GEN.100095'
                                                     ,pva_valr_subst1   => sqlerrm
                                                     ,pva_code_prodt    => 'AFW');
      return rec_page_item;
  end ajax_item_choix_aprob;

  function genr_check (p_item                  in apex_plugin.t_page_item
                      ,p_plugin                in apex_plugin.t_plugin
                      ,p_value                 in varchar2
                      ,p_is_readonly           in boolean
                      ,p_is_printer_friendly   in boolean)
    return apex_plugin.t_page_item_render_result
  is
    rec_page_item   apex_plugin.t_page_item_render_result;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 21 Plugin Item - Checkbox');
    afw_21_util_pkg.debug_page_item (p_item
                                    ,p_plugin
                                    ,p_value
                                    ,p_is_readonly
                                    ,p_is_printer_friendly);


    afw_21_util_pkg.ajout_libr_javsc ('afw.afw_21.item.check'
                                     ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                      || 'assets/libs/js/');

    --Initialiser le plugin
    afw_21_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.item.check.insta.push('
                                            || 'new afw.afw_21.item.check.check('
                                            || '{'
                                            || apex_javascript.add_attribute ('vva_nom_plugn'
                                                                             ,p_plugin.name)
                                            || apex_javascript.add_attribute ('vva_id_item'
                                                                             ,p_item.name)
                                            || apex_javascript.add_attribute ('vva_seprt'
                                                                             ,p_item.attribute_01)
                                            || '}));');

    afw_21_plugn_check_pkg.genr_item_check (p_item
                                           ,p_value);

    return rec_page_item;
  end genr_check;

  function ajax_check (p_item     in apex_plugin.t_page_item
                      ,p_plugin   in apex_plugin.t_plugin)
    return apex_plugin.t_page_item_ajax_result
  is
    rec_page_item   apex_plugin.t_page_item_ajax_result;
  begin
    /*case
       when aa.g_widget_action = 'RAFRC_VALR'
       then
          htp.prn ();
       else
          null;
    end case;*/

    return rec_page_item;
  end ajax_check;
begin
  gta_code_plugn ('AFW_13_CONFR_SAUVG')        := 'AFW_13_CONFR_SAUVG';
  gta_code_plugn ('AFW_18_DEPSM_TABLR_FORM')   := 'AFW_18_DEPSM_TABLR_FORM';
  gta_code_plugn ('AFW_18')                    := 'AFW_18';
  gta_code_plugn ('AFW_14_POPUP_LOV_ITEM')     := 'AFW_14_POPUP_LOV_ITEM';
  gta_code_plugn ('AFW_14_POPUP_LOV')          := 'AFW_14_POPUP_LOV';
end afw_21_item_pkg;
/
