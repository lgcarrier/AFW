SET DEFINE OFF;
create or replace package body afw_18_tablr_form_pkg
is
  function genr_html_color_pickr
    return varchar2
  is
    vva_html   varchar2 (4000);
  begin
    vva_html   := '<img align="absmiddle" alt="" src="/i/htmldb/icons/palette.gif" onclick="colorPopUp(''f05_0004'')" style="cursor: pointer;"/>';

    vva_html      :=
         vva_html
      || '<img id="COULR_TEXTE_PREVIEW" class="colorpreview" align="absmiddle" style="" alt="" src="/i/1px_trans.gif"/>';

    return vva_html;
  end genr_html_color_pickr;

  procedure obten_json_item_depsm
  is
    vnu_page_sesn        vd_i_afw_13_page.seqnc%type := afw_13_page_pkg.obten_page_sesn;
    vnu_page_zero_sesn   vd_i_afw_13_page.seqnc%type := afw_13_page_pkg.obten_page_zero_sesn;
  begin
    -- génère l'objet JSON
    afw_15_ajax_pkg.obten_json_sql (   'select  pi.nom_apex,
                                             pi.depsm_alias_coln,
                                             aip.display_as type_item
                                       from  vd_afw_13_page_item pi,
                                             apex_item_page aip,
                                             apex_regn_coln arc,
                                             apex_regn ar
                                      where       pi.ref_page in ('
                                    || vnu_page_sesn
                                    || ', '
                                    || vnu_page_zero_sesn
                                    || ')
                                             and  aip.id = pi.id_apex
                                             and  arc.column_alias = pi.depsm_alias_coln
                                             and  arc.flow_id = ar.flow_id
                                             and  arc.region_id = ar.id
                                             and  ar.flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic
                                             and  ar.page_id = afw_13_page_pkg.obten_numr_apex_page
                                             and  ar.plug_source_type = ''UPDATABLE_SQL_QUERY''
                                       order by 1');
  end obten_json_item_depsm;

  function obten_nom_coln_cle_primr
    return varchar2
  is
    vcl_clob                   apex_page_procs.process_sql_clob%type;
    vva_temp                   varchar2 (32767);
    vva_nom_coln_cle_primr     varchar2 (30);
    vvc_elemn_procs_sql_clob   apex_application_global.vc_arr2;
  begin
    select process_sql_clob
      into vcl_clob
      from apex_page_procs
     where     flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic
           and flow_step_id = afw_13_page_pkg.obten_numr_apex_page
           and process_type = 'MULTI_ROW_UPDATE';

    vva_temp                   := vcl_clob;

    vvc_elemn_procs_sql_clob   := afw_07_util_pkg.string_to_table (vva_temp);

    return vvc_elemn_procs_sql_clob (3);
  exception
    when others
    then
      return 'SEQNC';
  end obten_nom_coln_cle_primr;
end afw_18_tablr_form_pkg;
/
