SET DEFINE OFF;
create or replace package afw_18_tablr_form_pkg
is
  function genr_html_color_pickr
    return varchar2;

  procedure obten_json_item_depsm;

  function obten_nom_coln_cle_primr
    return varchar2;
end afw_18_tablr_form_pkg;
/
