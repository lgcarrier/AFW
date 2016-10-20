SET DEFINE OFF;
create or replace package body afw_21_plugn_selct_2_pkg
is
  knu_minm_lov_colmn          constant number (1) default 2;
  knu_maxm_lov_colmn          constant number (1) default 6;

  knu_lov_displ_colmn         constant number (1) default 1;
  knu_lov_retrn_colmn         constant number (1) default 2;
  knu_lov_group_colmn         constant number (1) default 3;
  knu_lov_html_selct_colmn    constant number (1) default 4;
  knu_lov_html_reslt_colmn    constant number (1) default 5;
  knu_lov_custm_searc_colmn   constant number (1) default 6;

  procedure genr_item_tag (p_item    in apex_plugin.t_page_item
                          ,p_value   in varchar2)
  is
  begin
    apex_plugin_util.print_hidden (p_item_name    => p_item.name
                                  ,p_value        => p_value
                                  ,p_id_postfix   => null);
  end genr_item_tag;

  procedure genr_item_selct (p_item    in apex_plugin.t_page_item
                            ,p_value   in varchar2)
  is
    vta_coln_liste      apex_plugin_util.t_column_value_list;
    vva_item            varchar2 (32767);
    vta_item_selct      apex_application_global.vc_arr2;
    vva_displ_id        varchar2 (32767);
    vva_retrn_id        varchar2 (32767);
    vva_nom_page_item   p_item.name%type;
    vbo_singl_value     boolean;
    vbo_multp_value     boolean;

    procedure ajout_optio (pva_valr_retr    in varchar2
                          ,pva_valr_afich   in varchar2
                          ,pva_extra        in varchar2 default null)
    is
    begin
      afw_15_htp_pkg.ecrir (afw_15_htp_pkg.ouvri_bals ('option'
                                                      ,'value'
                                                      ,pva_valr_retr
                                                      ,pva_extra   => pva_extra)
                           ,false);
      afw_15_htp_pkg.ecrir (pva_valr_afich
                           ,false);
      afw_15_htp_pkg.fermr_bals ('option');
    end ajout_optio;

    function exist_valr_selct (pva_valr         in varchar2
                              ,pva_valr_selct   in varchar2)
      return boolean
    is
      vvc_valr_selct   apex_application_global.vc_arr2;
    begin
      vvc_valr_selct      :=
        afw_07_util_pkg.string_to_table (pva_valr_selct
                                        ,p_item.attribute_09);

      for i in 1 .. vvc_valr_selct.count
      loop
        if (pva_valr = vvc_valr_selct (i))
        then
          return true;
        end if;
      end loop;

      return false;
    end exist_valr_selct;
  begin
    -- Single-value and Multiple-value
    vbo_singl_value     := case p_item.attribute_01 when 'SINGL_VALUE' then true else false end;
    vbo_multp_value     := case p_item.attribute_01 when 'MULTP_VALUE' then true else false end;

    vva_nom_page_item   := apex_plugin.get_input_name_for_page_item (vbo_multp_value);

    afw_15_htp_pkg.ouvri_bals ('select'
                              ,'name'
                              ,vva_nom_page_item
                              ,'id'
                              ,p_item.name
                              ,pva_extra   =>   p_item.element_attributes
                                             || case when vbo_multp_value then 'multiple' else null end);

    vta_coln_liste      :=
      apex_plugin_util.get_data (p_sql_statement    => p_item.lov_definition
                                ,p_min_columns      => knu_minm_lov_colmn
                                ,p_max_columns      => knu_maxm_lov_colmn
                                ,p_component_name   => p_item.name
                                ,p_max_rows         => p_item.attribute_05);

    if (    vbo_singl_value
        and p_item.placeholder is not null)
    then
      afw_15_htp_pkg.ecrir (afw_15_htp_pkg.ouvri_bals ('option')
                           ,false);
      afw_15_htp_pkg.fermr_bals ('option');
    end if;

    if (    p_item.lov_display_null
        and (   p_item.lov_null_text is not null
             or p_item.lov_null_value is not null))
    then
      apex_plugin_util.print_option (p_display_value   => p_item.lov_null_text
                                    ,p_return_value    => p_item.lov_null_value
                                    ,p_is_selected     => false
                                    ,p_attributes      => p_item.element_option_attributes
                                    ,p_escape          => p_item.escape_output);
    end if;

    for i in 1 .. vta_coln_liste (knu_lov_displ_colmn).count
    loop
      apex_plugin_util.print_option (p_display_value   => vta_coln_liste (knu_lov_displ_colmn) (i)
                                    ,p_return_value    => vta_coln_liste (knu_lov_retrn_colmn) (i)
                                    ,p_is_selected     => exist_valr_selct (vta_coln_liste (knu_lov_retrn_colmn) (i)
                                                                           ,p_value)
                                    ,p_attributes      => p_item.element_option_attributes
                                    ,p_escape          => p_item.escape_output);
    end loop;

    afw_15_htp_pkg.fermr_bals ('select');
  end genr_item_selct;


  procedure genr_item_lectr_seule (p_item                  in apex_plugin.t_page_item
                                  ,p_value                 in varchar2
                                  ,p_is_readonly           in boolean
                                  ,p_is_printer_friendly   in boolean)
  is
    vva_read_only   varchar2 (4000);
  begin
    vva_read_only      :=
      apex_plugin_util.get_display_data (p_sql_statement    => p_item.lov_definition
                                        ,p_min_columns      => knu_minm_lov_colmn
                                        ,p_max_columns      => knu_maxm_lov_colmn
                                        ,p_component_name   => p_item.name
                                        ,p_search_string    => p_value);

    apex_plugin_util.print_hidden_if_readonly (p_item_name             => p_item.name
                                              ,p_value                 => case p_item.attribute_01 when 'SINGL_VALUE' then p_value else vva_read_only end
                                              ,p_is_readonly           => p_is_readonly
                                              ,p_is_printer_friendly   => p_is_printer_friendly);

    apex_plugin_util.print_display_only (p_item_name          => p_item.name
                                        ,p_display_value      => vva_read_only
                                        ,p_show_line_breaks   => false
                                        ,p_escape             => true
                                        ,p_attributes         => p_item.element_attributes);
  end genr_item_lectr_seule;

  procedure ecrir_parmt_json (pta_coln_liste    in out nocopy apex_plugin_util.t_column_value_list2
                             ,pva_impre_debut   in            varchar2
                             ,pva_nom_parmt     in            varchar2
                             ,pnu_numr_coln     in            pls_integer
                             ,pnu_index_tabl    in            pls_integer
                             ,pva_impre_fin     in            varchar2)
  is
    procedure ecrir (pva_texte in varchar2)
    is
    begin
      htp.prn (pva_texte);
    end ecrir;

    procedure ecrir_debut
    is
    begin
      ecrir (pva_impre_debut);
    end ecrir_debut;

    procedure ecrir_fin
    is
    begin
      ecrir (pva_impre_fin);
    end ecrir_fin;

    procedure ecrir_ident
    is
    begin
      ecrir (   '"'
             || pva_nom_parmt
             || '"');
    end ecrir_ident;

    procedure ecrir_seprt
    is
    begin
      ecrir (':');
    end ecrir_seprt;

    procedure ecrir_valr
    is
    begin
      if pnu_numr_coln >= knu_lov_html_selct_colmn
      then
        ecrir (   '"'
               || case pta_coln_liste (pnu_numr_coln).data_type
                    when apex_plugin_util.c_data_type_varchar2
                    then
                      afw_07_util_pkg.echap_text_json (pta_coln_liste (pnu_numr_coln).value_list (pnu_index_tabl).varchar2_value
                                                      ,'N'
                                                      ,pva_seprt_saut_ligne   => ' ')
                    when apex_plugin_util.c_data_type_number
                    then
                      to_char (pta_coln_liste (pnu_numr_coln).value_list (pnu_index_tabl).number_value)
                    else
                      afw_07_util_pkg.echap_text_json (pta_coln_liste (pnu_numr_coln).value_list (pnu_index_tabl).varchar2_value
                                                      ,'N'
                                                      ,pva_seprt_saut_ligne   => ' ')
                  end
               || '"');
      else
        ecrir (
             '"'
          || case pta_coln_liste (pnu_numr_coln).data_type
               when apex_plugin_util.c_data_type_varchar2
               then
                 afw_07_util_pkg.echap_text_json (pta_coln_liste (pnu_numr_coln).value_list (pnu_index_tabl).varchar2_value)
               when apex_plugin_util.c_data_type_number
               then
                 to_char (pta_coln_liste (pnu_numr_coln).value_list (pnu_index_tabl).number_value)
               else
                 afw_07_util_pkg.echap_text_json (pta_coln_liste (pnu_numr_coln).value_list (pnu_index_tabl).varchar2_value)
             end
          || '"');
      end if;
    exception
      when no_data_found
      then
        ecrir ('""');
    end ecrir_valr;
  begin
    ecrir_debut;

    ecrir_ident;
    ecrir_seprt;
    ecrir_valr;

    ecrir_fin;
  end ecrir_parmt_json;

  procedure genr_json_rechr_lov (p_item in apex_plugin.t_page_item)
  is
    vta_coln_liste   apex_plugin_util.t_column_value_list2;
    vva_liste        varchar2 (32767) default null;
    vva_valr         varchar2 (4000) := case when aa.g_x01 is not null then upper (aa.g_x01) else '%' end;
  begin
    vta_coln_liste      :=
      apex_plugin_util.get_data2 (p_sql_statement      => p_item.lov_definition
                                 ,p_min_columns        => knu_minm_lov_colmn
                                 ,p_max_columns        => knu_maxm_lov_colmn
                                 ,p_component_name     => p_item.name
                                 ,p_search_type        => p_item.attribute_10
                                 ,p_search_column_no   => p_item.attribute_14
                                 ,p_search_string      => vva_valr
                                 ,p_max_rows           => p_item.attribute_05);

    htp.prn ('{"liste_valr":[');

    for i in 1 .. vta_coln_liste (1).value_list.count
    loop
      if i > 1
      then
        htp.prn (',');
      end if;

      ecrir_parmt_json (vta_coln_liste
                       ,'{'
                       ,'id'
                       ,knu_lov_retrn_colmn
                       ,i
                       ,',');
      ecrir_parmt_json (vta_coln_liste
                       ,null
                       ,'text'
                       ,knu_lov_displ_colmn
                       ,i
                       ,',');
      ecrir_parmt_json (vta_coln_liste
                       ,null
                       ,'group'
                       ,knu_lov_group_colmn
                       ,i
                       ,',');
      ecrir_parmt_json (vta_coln_liste
                       ,null
                       ,'html_selct'
                       ,knu_lov_html_selct_colmn
                       ,i
                       ,',');
      ecrir_parmt_json (vta_coln_liste
                       ,null
                       ,'html_reslt'
                       ,knu_lov_html_reslt_colmn
                       ,i
                       ,',');
      ecrir_parmt_json (vta_coln_liste
                       ,null
                       ,'chain_rechr'
                       ,knu_lov_custm_searc_colmn
                       ,i
                       ,'}');
    --      htp.prn (
    --           '{"id":"'
    --        || case vta_coln_liste (2).data_type
    --             when apex_plugin_util.c_data_type_varchar2
    --             then
    --               afw_07_util_pkg.echap_text_json (
    --                 vta_coln_liste (2).value_list (i).varchar2_value)
    --             when apex_plugin_util.c_data_type_number
    --             then
    --               to_char (vta_coln_liste (2).value_list (i).number_value)
    --             else
    --               afw_07_util_pkg.echap_text_json (
    --                 vta_coln_liste (2).value_list (i).varchar2_value)
    --           end
    --        || '","text":"'
    --        || case vta_coln_liste (1).data_type
    --             when apex_plugin_util.c_data_type_varchar2
    --             then
    --               afw_07_util_pkg.echap_text_json (
    --                 vta_coln_liste (1).value_list (i).varchar2_value)
    --             when apex_plugin_util.c_data_type_number
    --             then
    --               to_char (vta_coln_liste (1).value_list (i).number_value)
    --             else
    --               afw_07_util_pkg.echap_text_json (
    --                 vta_coln_liste (1).value_list (i).varchar2_value)
    --           end
    --        || '","group":"'
    --        || case vta_coln_liste (3).data_type
    --             when apex_plugin_util.c_data_type_varchar2
    --             then
    --               afw_07_util_pkg.echap_text_json (
    --                 vta_coln_liste (3).value_list (i).varchar2_value)
    --             when apex_plugin_util.c_data_type_number
    --             then
    --               to_char (vta_coln_liste (3).value_list (i).number_value)
    --             else
    --               afw_07_util_pkg.echap_text_json (
    --                 vta_coln_liste (3).value_list (i).varchar2_value)
    --           end
    --        || '","html_selct":"'
    --        || case vta_coln_liste (4).data_type
    --             when apex_plugin_util.c_data_type_varchar2
    --             then
    --               afw_07_util_pkg.echap_text_json (
    --                 vta_coln_liste (4).value_list (i).varchar2_value)
    --             when apex_plugin_util.c_data_type_number
    --             then
    --               to_char (vta_coln_liste (4).value_list (i).number_value)
    --             else
    --               afw_07_util_pkg.echap_text_json (
    --                 vta_coln_liste (4).value_list (i).varchar2_value)
    --           end
    --        || '","html_reslt":"'
    --        || case vta_coln_liste (5).data_type
    --             when apex_plugin_util.c_data_type_varchar2
    --             then
    --               afw_07_util_pkg.echap_text_json (
    --                 vta_coln_liste (5).value_list (i).varchar2_value)
    --             when apex_plugin_util.c_data_type_number
    --             then
    --               to_char (vta_coln_liste (5).value_list (i).number_value)
    --             else
    --               afw_07_util_pkg.echap_text_json (
    --                 vta_coln_liste (5).value_list (i).varchar2_value)
    --           end
    --        || '"}');
    end loop;

    htp.prn (']}');
  exception
    when others
    then
      raise;
  end genr_json_rechr_lov;

  procedure genr_json_initl_selct_lov (p_item in apex_plugin.t_page_item)
  is
    vta_coln_liste   apex_plugin_util.t_column_value_list2;
    vva_liste        varchar2 (32767) default null;
    vva_valr         varchar2 (4000) := case when aa.g_x01 is not null then aa.g_x01 else null end;
    vvc_valr_selct   apex_application_global.vc_arr2;
  begin
    vvc_valr_selct      :=
      afw_07_util_pkg.string_to_table (vva_valr
                                      ,p_item.attribute_09);

    if vvc_valr_selct.count > 1
    then
      htp.prn ('[');
    end if;

    for i in 1 .. vvc_valr_selct.count
    loop
      vta_coln_liste      :=
        apex_plugin_util.get_data2 (p_sql_statement      => nvl (p_item.attribute_11, null)
                                   ,p_min_columns        => knu_minm_lov_colmn
                                   ,p_max_columns        => knu_maxm_lov_colmn
                                   ,p_component_name     => p_item.name
                                   ,p_search_type        => apex_plugin_util.c_search_lookup
                                   ,p_search_column_no   => knu_lov_retrn_colmn
                                   ,p_search_string      => vvc_valr_selct (i)
                                   ,p_max_rows           => 1);

      if vta_coln_liste (1).value_list.count > 0
      then
        if i > 1
        then
          htp.prn (',');
        end if;

        ecrir_parmt_json (vta_coln_liste
                         ,'{'
                         ,'id'
                         ,knu_lov_retrn_colmn
                         ,1
                         ,',');
        ecrir_parmt_json (vta_coln_liste
                         ,null
                         ,'text'
                         ,knu_lov_displ_colmn
                         ,1
                         ,',');
        ecrir_parmt_json (vta_coln_liste
                         ,null
                         ,'group'
                         ,knu_lov_group_colmn
                         ,1
                         ,',');
        ecrir_parmt_json (vta_coln_liste
                         ,null
                         ,'html_selct'
                         ,knu_lov_html_selct_colmn
                         ,1
                         ,'}');
      --        htp.prn (
      --             '{"id":"'
      --          || case vta_coln_liste (2).data_type
      --               when apex_plugin_util.c_data_type_varchar2
      --               then
      --                 afw_07_util_pkg.echap_text_json (
      --                   vta_coln_liste (2).value_list (1).varchar2_value)
      --               when apex_plugin_util.c_data_type_number
      --               then
      --                 to_char (vta_coln_liste (2).value_list (1).number_value)
      --               else
      --                 afw_07_util_pkg.echap_text_json (
      --                   vta_coln_liste (2).value_list (1).varchar2_value)
      --             end
      --          || '","text":"'
      --          || case vta_coln_liste (1).data_type
      --               when apex_plugin_util.c_data_type_varchar2
      --               then
      --                 afw_07_util_pkg.echap_text_json (
      --                   vta_coln_liste (1).value_list (1).varchar2_value)
      --               when apex_plugin_util.c_data_type_number
      --               then
      --                 to_char (vta_coln_liste (1).value_list (1).number_value)
      --               else
      --                 afw_07_util_pkg.echap_text_json (
      --                   vta_coln_liste (1).value_list (1).varchar2_value)
      --             end
      --        || '","group":"'
      --        || case vta_coln_liste (3).data_type
      --             when apex_plugin_util.c_data_type_varchar2
      --             then
      --               afw_07_util_pkg.echap_text_json (
      --                 vta_coln_liste (3).value_list (i).varchar2_value)
      --             when apex_plugin_util.c_data_type_number
      --             then
      --               to_char (vta_coln_liste (3).value_list (i).number_value)
      --             else
      --               afw_07_util_pkg.echap_text_json (
      --                 vta_coln_liste (3).value_list (i).varchar2_value)
      --           end
      --        || '","html_selct":"'
      --        || case vta_coln_liste (4).data_type
      --             when apex_plugin_util.c_data_type_varchar2
      --             then
      --               afw_07_util_pkg.echap_text_json (
      --                 vta_coln_liste (4).value_list (i).varchar2_value)
      --             when apex_plugin_util.c_data_type_number
      --             then
      --               to_char (vta_coln_liste (4).value_list (i).number_value)
      --             else
      --               afw_07_util_pkg.echap_text_json (
      --                 vta_coln_liste (4).value_list (i).varchar2_value)
      --           end
      --        || '","html_reslt":"'
      --        || case vta_coln_liste (5).data_type
      --             when apex_plugin_util.c_data_type_varchar2
      --             then
      --               afw_07_util_pkg.echap_text_json (
      --                 vta_coln_liste (5).value_list (i).varchar2_value)
      --             when apex_plugin_util.c_data_type_number
      --             then
      --               to_char (vta_coln_liste (5).value_list (i).number_value)
      --             else
      --               afw_07_util_pkg.echap_text_json (
      --                 vta_coln_liste (5).value_list (i).varchar2_value)
      --           end
      --          || '"}');
      end if;
    end loop;

    if vvc_valr_selct.count > 1
    then
      htp.prn (']');
    end if;
  exception
    when others
    then
      raise;
  end genr_json_initl_selct_lov;
end afw_21_plugn_selct_2_pkg;
/
