SET DEFINE OFF;
create or replace package body afw_21_util_pkg
is
  gbo_mode_debg                  boolean default aa.g_debug;
  gva_compteur                   number default 0;
  kva_exten_javsc       constant varchar2 (3) default '.js';
  kva_exten_css         constant varchar2 (4) default '.css';
  kva_exten_mini        constant varchar2 (4) default '.min';
  kva_conv_date_formt   constant varchar2 (21) default 'YYYY-MM-DD HH24:MI:SS';

  procedure debug_actio_dynmq (p_dynamic_action   in t_actn_dynmq
                              ,p_plugin           in t_plugn)
  is
  begin
    if aa.g_debug
    then
      apex_plugin_util.debug_dynamic_action (p_plugin
                                            ,p_dynamic_action);
    end if;
  exception
    when others
    then
      ete ();
  end debug_actio_dynmq;

  procedure debug_page_item (p_page_item               in t_page_item
                            ,p_plugin                  in t_plugn
                            ,pva_value                 in varchar2
                            ,pbo_is_readonly           in boolean
                            ,pbo_is_printer_friendly   in boolean)
  is
  begin
    if aa.g_debug
    then
      apex_plugin_util.debug_page_item (p_plugin
                                       ,p_page_item
                                       ,pva_value
                                       ,pbo_is_readonly
                                       ,pbo_is_printer_friendly);
    end if;
  end debug_page_item;

  procedure ajout_libr_javsc (pva_nom          in varchar2
                             ,pva_reprt        in varchar2 default    afw_11_prodt_pkg.obten_dosr_fichr_afw
                                                                   || 'assets/js/'
                             ,pva_versn        in varchar2 default    '?v='
                                                                   || afw_11_prodt_pkg.obten_numr_versn_prodt_afw
                             ,pbo_saut_extns   in boolean default true
                             ,pbo_exten_mini   in boolean default false)
  is
  begin
    afw_07_util_pkg.ajout_libr_javsc (   pva_nom
                                      || case when not gbo_mode_debg then kva_exten_mini else null end
                                      || kva_exten_javsc
                                     ,pva_reprt
                                     ,pva_versn
                                     ,true
                                     ,pbo_exten_mini);
  end ajout_libr_javsc;

  procedure ajout_code_javsc_charg (pva_code   in varchar2
                                   ,pva_cle    in varchar2 default null)
  is
  begin
    afw_07_util_pkg.ajout_code_javsc_charg (pva_code
                                           ,pva_cle);
  end ajout_code_javsc_charg;

  procedure ajout_libr_css (pva_nom          in varchar2
                           ,pva_reprt        in varchar2 default    afw_11_prodt_pkg.obten_dosr_fichr_afw
                                                                 || 'assets/css/'
                           ,pva_versn        in varchar2 default    '?v='
                                                                 || afw_11_prodt_pkg.obten_numr_versn_prodt_afw
                           ,pbo_saut_extns   in boolean default true)
  is
  begin
    afw_07_util_pkg.ajout_libr_css (   pva_nom
                                    || case when not gbo_mode_debg then kva_exten_mini else null end
                                    || kva_exten_css
                                   ,pva_reprt
                                   ,pva_versn
                                   ,true);
  end ajout_libr_css;

  procedure ajout_css (pva_style            in varchar2
                      ,pbo_inser_en_ligne   in boolean default true)
  is
  begin
    afw_07_util_pkg.ajout_css (pva_style
                              ,pbo_inser_en_ligne);
  end ajout_css;

  procedure formt_url_fichr (pva_url         in     varchar2
                            ,pva_reprt       in out varchar2
                            ,pva_nom_fichr   in out varchar2
                            ,pva_extns       in out varchar2)
  is
  begin
    pva_reprt      :=
      substr (pva_url
             ,1
             ,instr (pva_url
                    ,'/'
                    ,-1));
    pva_nom_fichr      :=
      substr (pva_url
             ,  instr (pva_url
                      ,'/'
                      ,-1)
              + 1);

    pva_extns      :=
      substr (pva_url
             ,  instr (pva_url
                      ,'.'
                      ,-1)
              + 1);
  end formt_url_fichr;

  procedure ecrir_item_input (p_item            in t_page_item
                             ,p_plugin          in t_plugn
                             ,pva_value         in varchar2
                             ,pva_type_input    in varchar2
                             ,pvc_clas_css      in apex_application_global.vc_arr2
                             ,pva_place_holdr   in varchar2 default null
                             ,pnu_nombr_reslt   in number default null)
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('input/'
                              ,'type'
                              ,pva_type_input
                              ,'id'
                              ,p_item.name
                              ,'name'
                              ,apex_plugin.get_input_name_for_page_item (false)
                              ,'value'
                              ,pva_value
                              ,'class'
                              ,afw_07_util_pkg.table_to_string (pvc_clas_css
                                                               ,' ')
                              ,'size'
                              ,p_item.element_width
                              ,'maxlength'
                              ,p_item.element_max_length
                              ,'height'
                              ,p_item.element_height
                              ,case when pva_place_holdr is not null then 'placeholder' else null end
                              ,pva_place_holdr
                              ,case when pnu_nombr_reslt is not null then 'results' else null end
                              ,pnu_nombr_reslt
                              ,pva_extra   => p_item.element_attributes);
  end ecrir_item_input;

  procedure ecrir_item_input_lectr_seule (p_item         in t_page_item
                                         ,p_plugin       in t_plugn
                                         ,pva_value      in varchar2
                                         ,pvc_clas_css   in apex_application_global.vc_arr2)
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('input/'
                              ,'type'
                              ,'hidden'
                              ,'id'
                              ,p_item.name
                              ,'name'
                              ,apex_plugin.get_input_name_for_page_item (false)
                              ,'value'
                              ,pva_value
                              ,'class'
                              ,afw_07_util_pkg.table_to_string (pvc_clas_css
                                                               ,' ')
                              ,'maxlength'
                              ,p_item.element_max_length
                              ,pva_extra   => p_item.element_attributes);

    afw_15_htp_pkg.ouvri_bals ('span'
                              ,'id'
                              ,   p_item.name
                               || '_DISPLAY'
                              ,'class'
                              ,'display_only');

    if p_item.escape_output
    then
      afw_15_htp_pkg.ecrir (htf.escape_sc (pva_value));
    else
      afw_15_htp_pkg.ecrir (pva_value);
    end if;

    afw_15_htp_pkg.fermr_bals ('span');
  end ecrir_item_input_lectr_seule;

  procedure ecrir_item_input_mode_imprs (p_item      in t_page_item
                                        ,p_plugin    in t_plugn
                                        ,pva_value   in varchar2)
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('span'
                              ,'id'
                              ,   p_item.name
                               || '_DISPLAY'
                              ,'class'
                              ,'display_only');

    afw_15_htp_pkg.ecrir (apex_plugn_util.escape (pva_value
                                                 ,p_item.escape_output));

    afw_15_htp_pkg.fermr_bals ('span');
  end ecrir_item_input_mode_imprs;

  --Deprecated
  procedure ecrir_item_input_popup_arbor (p_item                         in t_page_item
                                         ,p_plugin                       in t_plugn
                                         ,pva_value                      in varchar2
                                         ,pva_type_input                 in varchar2
                                         ,pvc_clas_css_input             in apex_application_global.vc_arr2
                                         ,pva_logo_ouvr_popup            in varchar2
                                         ,pvc_clas_css_logo_ouvr_popup   in apex_application_global.vc_arr2)
  is
    vva_display_value     varchar2 (4000);
    --vnu_seqnc_popup_lov_ir   vd_afw_14_popup_lov_ir.seqnc%type;
    vnu_numr_aplic_apex   vd_afw_13_page.app_id_formt%type;
    vnu_numr_page_apex    vd_afw_13_page.numr_apex%type;
    vva_actio_onclc       varchar2 (1000);
    vva_contx             varchar2 (200);
    vva_mode_gestn        varchar2 (23);
  begin
    vva_mode_gestn   := p_item.attribute_03;

    -- item cache qui contient generalement la sequence
    afw_15_htp_pkg.ouvri_bals ('input/'
                              ,'type'
                              ,'hidden'
                              ,'id'
                              ,   p_item.name
                               || '_HIDDENVALUE'
                              ,'name'
                              ,apex_plugin.get_input_name_for_page_item (false)
                              ,'value'
                              ,pva_value
                              ,'class'
                              ,afw_07_util_pkg.table_to_string (pvc_clas_css_input
                                                               ,' ')
                              ,'size'
                              ,p_item.element_width
                              ,'maxlength'
                              ,p_item.element_max_length
                              ,'height'
                              ,p_item.element_height
                              ,pva_extra   => p_item.element_attributes);


    afw_15_htp_pkg.ouvri_bals ('fieldset'
                              ,'id'
                              ,   p_item.name
                               || '_fieldset'
                              ,'class'
                              ,'lov');

    afw_15_htp_pkg.ouvri_bals ('table'
                              ,'cellspacing'
                              ,'0'
                              ,'cellpadding'
                              ,'0'
                              ,'border'
                              ,'0'
                              ,'id'
                              ,   p_item.name
                               || '_holder'
                              ,'class'
                              ,'lov'
                              ,'summary'
                              ,'');

    afw_15_htp_pkg.ouvri_bals ('tbody');

    afw_15_htp_pkg.ouvri_bals ('tr');

    afw_15_htp_pkg.ouvri_bals ('td'
                              ,'class'
                              ,'lov');

    vva_display_value      :=
      apex_plugn_util.get_display_data (p_sql_statement        => p_item.lov_definition
                                       ,p_min_columns          => 1
                                       ,p_max_columns          => 2
                                       ,p_component_name       => p_item.name
                                       ,p_display_column_no    => 1
                                       ,p_search_column_no     => 2
                                       ,p_search_string        => pva_value
                                       ,p_display_extra        => true
                                       ,p_support_legacy_lov   => false);

    afw_15_htp_pkg.ouvri_bals ('input/'
                              ,'type'
                              ,pva_type_input
                              ,'id'
                              ,p_item.name
                              ,'value'
                              ,vva_display_value
                              ,'class'
                              ,afw_07_util_pkg.table_to_string (pvc_clas_css_input
                                                               ,' ')
                              ,'size'
                              ,p_item.element_width
                              ,'maxlength'
                              ,p_item.element_max_length
                              ,'height'
                              ,p_item.element_height
                              ,pva_extra   =>   'disabled="disabled" onfocus="this.blur();" '
                                             || p_item.element_attributes);

    afw_15_htp_pkg.fermr_bals ('td');
    afw_15_htp_pkg.ouvri_bals ('td');

    case
      when vva_mode_gestn in ('SIMPL'
                             ,'AVANC')
      then
        --On prend les configurations au niveau de l'item
        vnu_numr_aplic_apex   := p_item.attribute_08;
        vnu_numr_page_apex    := p_item.attribute_02;

        select    '::::SCPI,SSPI:ITEM,'
               || pi.seqnc
          into vva_contx
          from vd_afw_13_page_item pi
              ,vd_afw_13_page      p
         where     pi.nom_apex = p_item.name
               and pi.ref_page = p.seqnc
               and p.seqnc = afw_13_page_pkg.obten_page_sesn;
      when vva_mode_gestn = 'AFW'
      then
        --On prend les configurations au niveau d'APEXFramework (AFW 14)
        /*select pli.seqnc,
               p2.numr_apex,
               p.app_id_formt,
               '::::SCPI,SSPI:ITEM,' || pi.seqnc
        into vnu_seqnc_popup_lov_ir,
             vnu_numr_page_apex,
             vnu_numr_aplic_apex,
             vva_contx
        from vd_afw_14_popup_lov_ir pli,
             vd_afw_13_page_item pi,
             vd_afw_13_page p,
             vd_afw_13_page p2
        where     pli.ref_page_item = pi.seqnc
              and pi.nom_apex = p_item.name
              and pi.ref_page = p.seqnc
              and p.seqnc = afw_13_page_pkg.obten_page_sesn
              and pli.ref_page = p2.seqnc;*/
        null;
      else
        null;
    end case;

    vva_actio_onclc      :=
         'afw_PopUp(''f?p='
      || vnu_numr_aplic_apex
      || ':'
      || vnu_numr_page_apex
      || ':'
      || afw_07_util_pkg.nv ('SESSION')
      || vva_contx
      || ''', '''', '
      || p_item.attribute_06
      || ', '
      || p_item.attribute_07
      || ');';
    afw_15_htp_pkg.ouvri_bals ('a'
                              ,'href'
                              ,'#'
                              ,'onclick'
                              ,vva_actio_onclc);
    afw_15_htp_pkg.ouvri_bals ('img/'
                              ,'src'
                              ,pva_logo_ouvr_popup
                              ,'class'
                              ,afw_07_util_pkg.table_to_string (pvc_clas_css_logo_ouvr_popup
                                                               ,' ')
                              ,pva_extra   => p_item.element_attributes);
    afw_15_htp_pkg.fermr_bals ('a');
    afw_15_htp_pkg.fermr_bals ('td');
    afw_15_htp_pkg.fermr_bals ('tr');
    afw_15_htp_pkg.fermr_bals ('tbody');
    afw_15_htp_pkg.fermr_bals ('table');
    afw_15_htp_pkg.fermr_bals ('fieldset');
  end ecrir_item_input_popup_arbor;

  function obten_actio_dynmq_elemn_afect (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
    return varchar2
  is
    vva_elemn_afect   apex_actio_dynmq_actio.affected_elements%type;
  begin
    select aada.affected_elements
      into vva_elemn_afect
      from apex_actio_dynmq_actio aada
     where aada.id = pnu_actio_dynmq;

    return vva_elemn_afect;
  end obten_actio_dynmq_elemn_afect;

  function obten_actio_dynmq_elemn_decln (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
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
  end obten_actio_dynmq_elemn_decln;

  function obten_reslt_expre_plsql (pva_expre_plsql in varchar2)
    return varchar2
  is
  begin
    if pva_expre_plsql is not null
    then
      return apex_plugn_util.get_plsql_expression_result (pva_expre_plsql);
    else
      return null;
    end if;
  end obten_reslt_expre_plsql;

  function obten_reslt_expre_plsql_date (pva_expre_plsql in varchar2)
    return date
  is
  begin
    return to_date (obten_reslt_expre_plsql (   'to_char('
                                             || pva_expre_plsql
                                             || ','''
                                             || kva_conv_date_formt
                                             || ''')')
                   ,kva_conv_date_formt);
  end;

  function obten_reslt_expre_plsql_numbr (pva_expre_plsql in varchar2)
    return number
  is
  begin
    return to_number (obten_reslt_expre_plsql (pva_expre_plsql));
  end;

  function obten_reslt_expre_plsql_boln (pva_expre_plsql in varchar2)
    return boolean
  is
    vva_result   varchar2 (1);
  begin
    vva_result   := obten_reslt_expre_plsql_boln_v (pva_expre_plsql);

    return case when vva_result = 'O' then true when vva_result = 'N' then false else null end;
  end;

  function obten_reslt_expre_plsql_boln_v (pva_expre_plsql in varchar2)
    return varchar2
  is
  begin
    return obten_reslt_expre_plsql (   'case when '
                                    || pva_expre_plsql
                                    || ' then ''O'' else ''N'' end');
  exception
    when others
    then
      raise;
  end;


  function formt_plugn_atrib_boln (pva_atrib_boln in varchar2)
    return boolean
  is
    vbo_valr_formt   boolean default true;
  begin
    return case pva_atrib_boln when 'N' then false else true end;
  end formt_plugn_atrib_boln;

  function obten_tabl_javsc_liste_items (pva_liste_items   in varchar2
                                        ,pva_seprt         in varchar2 default ',')
    return varchar2
  is
    vvc_items        apex_application_global.vc_arr2;
    vva_tabl_javsc   varchar2 (32767);
  begin
    vvc_items        :=
      afw_07_util_pkg.string_to_table (pva_liste_items
                                      ,pva_seprt);

    vva_tabl_javsc   := '[';

    if vvc_items.count > 0
    then
      for i in 1 .. vvc_items.count
      loop
        vva_tabl_javsc      :=
             vva_tabl_javsc
          || '"'
          || vvc_items (i)
          || '",';
      end loop;
    end if;

    vva_tabl_javsc      :=
         rtrim (vva_tabl_javsc
               ,',')
      || ']';

    return vva_tabl_javsc;
  end obten_tabl_javsc_liste_items;

  function ajout_atrib_tabl_javsc (pva_nom_atrib          in varchar2
                                  ,pva_tabl_javsc         in varchar2
                                  ,pbo_pas_afich_si_nul   in boolean default true
                                  ,pbo_afich_virgl        in boolean default true)
    return varchar2
  is
    pva_atrib   varchar2 (32767);
  begin
    if not (    pbo_pas_afich_si_nul
            and (   pva_tabl_javsc is null
                 or pva_tabl_javsc = '[]'))
    then
      pva_atrib      :=
           '"'
        || pva_nom_atrib
        || '":'
        || pva_tabl_javsc;
    end if;

    return    pva_atrib
           || case
                when     pbo_pas_afich_si_nul
                     and pva_atrib is null
                     and pbo_afich_virgl
                then
                  null
                when pbo_afich_virgl
                then
                  ','
                else
                  null
              end;
  end ajout_atrib_tabl_javsc;

  function ajout_atrib_objet_javsc (pva_nom_atrib          in varchar2
                                   ,pva_objet_javsc        in varchar2
                                   ,pbo_pas_afich_si_nul   in boolean default true
                                   ,pbo_afich_virgl        in boolean default true)
    return varchar2
  is
    pva_atrib   varchar2 (32767);
  begin
    if not (    pbo_pas_afich_si_nul
            and (   pva_objet_javsc is null
                 or pva_objet_javsc = '{}'))
    then
      pva_atrib      :=
           '"'
        || pva_nom_atrib
        || '":'
        || pva_objet_javsc;
    end if;

    return    pva_atrib
           || case
                when     pbo_pas_afich_si_nul
                     and pva_atrib is null
                     and pbo_afich_virgl
                then
                  null
                when pbo_afich_virgl
                then
                  ','
                else
                  null
              end;
  end ajout_atrib_objet_javsc;

  function ajout_atrib_fonct_javsc (pva_nom_atrib          in varchar2
                                   ,pva_fonct_javsc        in varchar2
                                   ,pbo_pas_afich_si_nul   in boolean default true
                                   ,pbo_afich_virgl        in boolean default true)
    return varchar2
  is
    pva_atrib   varchar2 (32767);
  begin
    if not (    pbo_pas_afich_si_nul
            and pva_fonct_javsc is null)
    then
      pva_atrib      :=
           '"'
        || pva_nom_atrib
        || '":'
        || pva_fonct_javsc;
    end if;

    return    pva_atrib
           || case
                when     pbo_pas_afich_si_nul
                     and pva_atrib is null
                     and pbo_afich_virgl
                then
                  null
                when pbo_afich_virgl
                then
                  ','
                else
                  null
              end;
  end ajout_atrib_fonct_javsc;

  procedure ecrir_json_ereur (pva_sourc   in varchar2
                             ,pva_code    in varchar2
                             ,pva_mesg    in varchar2)
  is
  begin
    --source = plugin
    --code = internal ou user
    --mesg =

    afw_15_htp_pkg.ecrir ('{ereur:{"sourc":"","code":"","mesg":""}}'
                         ,false);
  end ecrir_json_ereur;

  function obten_confg_plugn (pva_type_plugn        in varchar2
                             ,pva_nom_plugn         in varchar2
                             ,pnu_numr_apex_aplic   in number default null)
    return t_plugn
  is
    vta_plugn   t_plugn;
  begin
    select fp.name
          ,null
          ,aps.attribute_01
          ,aps.attribute_02
          ,aps.attribute_03
          ,aps.attribute_04
          ,aps.attribute_05
          ,aps.attribute_06
          ,aps.attribute_07
          ,aps.attribute_08
          ,aps.attribute_09
          ,aps.attribute_10
          ,aps.attribute_11
          ,aps.attribute_12
          ,aps.attribute_13
          ,aps.attribute_14
          ,aps.attribute_15
      into vta_plugn.name
          ,vta_plugn.file_prefix
          ,vta_plugn.attribute_01
          ,vta_plugn.attribute_02
          ,vta_plugn.attribute_03
          ,vta_plugn.attribute_04
          ,vta_plugn.attribute_05
          ,vta_plugn.attribute_06
          ,vta_plugn.attribute_07
          ,vta_plugn.attribute_08
          ,vta_plugn.attribute_09
          ,vta_plugn.attribute_10
          ,vta_plugn.attribute_11
          ,vta_plugn.attribute_12
          ,vta_plugn.attribute_13
          ,vta_plugn.attribute_14
          ,vta_plugn.attribute_15
      from apex_plugn       fp
          ,apex_plugn_setng aps
     where     fp.flow_id = nvl (pnu_numr_apex_aplic, afw_11_aplic_pkg.obten_numr_apex_aplic)
           and fp.plugin_type = pva_type_plugn
           and fp.name = pva_nom_plugn
           and fp.flow_id = aps.flow_id
           and fp.plugin_type = aps.plugin_type
           and    'PLUGIN_'
               || fp.name = aps.plugin;

    return vta_plugn;
  end obten_confg_plugn;
end afw_21_util_pkg;
/
