SET DEFINE OFF;
create or replace package body afw_21_plugn_check_pkg
is
  knu_minm_lov_colmn          constant number (1) default 2;
  knu_maxm_lov_colmn          constant number (1) default 6;

  knu_lov_displ_colmn         constant number (1) default 1;
  knu_lov_retrn_colmn         constant number (1) default 2;
  knu_lov_group_colmn         constant number (1) default 3;
  knu_lov_html_selct_colmn    constant number (1) default 4;
  knu_lov_html_reslt_colmn    constant number (1) default 5;
  knu_lov_custm_searc_colmn   constant number (1) default 6;

  procedure genr_item_check (p_item    in apex_plugin.t_page_item
                            ,p_value   in varchar2)
  is
    vta_coln_liste      apex_plugin_util.t_column_value_list;
    vva_item            varchar2 (32767);
    vta_item_selct      apex_application_global.vc_arr2;
    vva_displ_id        varchar2 (32767);
    vva_retrn_id        varchar2 (32767);
    vva_nom_page_item   p_item.name%type;

    function exist_valr_selct (pva_valr        in varchar2
                              ,pva_list_valr   in varchar2)
      return boolean
    is
      vvc_list_valr   apex_application_global.vc_arr2;
    begin
      vvc_list_valr   := afw_07_util_pkg.string_to_table (pva_list_valr);

      for i in 1 .. vvc_list_valr.count
      loop
        if (pva_valr = vvc_list_valr (i))
        then
          return true;
        end if;
      end loop;

      return false;
    end exist_valr_selct;
  begin
    vva_nom_page_item   := apex_plugin.get_input_name_for_page_item (true);


    vta_coln_liste      :=
      apex_plugin_util.get_data (p_sql_statement    => p_item.lov_definition
                                ,p_min_columns      => knu_minm_lov_colmn
                                ,p_max_columns      => knu_maxm_lov_colmn
                                ,p_component_name   => p_item.name
                                ,p_max_rows         => p_item.attribute_05);

    afw_15_htp_pkg.ouvri_bals ('input'
                              ,'type'
                              ,'hidden'
                              ,'id'
                              ,p_item.name
                              ,'value'
                              ,'');

    for i in 1 .. vta_coln_liste (knu_lov_displ_colmn).count
    loop
      afw_15_htp_pkg.ouvri_bals ('label'
                                ,'class'
                                ,'checkbox');
      afw_15_htp_pkg.ouvri_bals ('input'
                                ,'name'
                                ,vva_nom_page_item
                                ,'type'
                                ,'checkbox'
                                ,'value'
                                ,vta_coln_liste (knu_lov_retrn_colmn) (i)
                                ,case
                                   when exist_valr_selct (vta_coln_liste (knu_lov_retrn_colmn) (i)
                                                         ,p_value)
                                   then
                                     'checked'
                                   else
                                     null
                                 end
                                ,case
                                   when exist_valr_selct (vta_coln_liste (knu_lov_retrn_colmn) (i)
                                                         ,p_value)
                                   then
                                     'checked'
                                   else
                                     null
                                 end);
      --afw_15_htp_pkg.ouvri_bals ('i');
      --afw_15_htp_pkg.fermr_bals ('i');
      afw_15_htp_pkg.ecrir ('<i></i>'
                           ,false);
      afw_15_htp_pkg.ecrir (vta_coln_liste (knu_lov_displ_colmn) (i)
                           ,false);
      afw_15_htp_pkg.fermr_bals ('label');
    end loop;
  end genr_item_check;


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
end afw_21_plugn_check_pkg;
/
