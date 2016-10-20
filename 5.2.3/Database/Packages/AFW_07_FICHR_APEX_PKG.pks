SET DEFINE OFF;
create or replace package afw_07_fichr_apex_pkg
as
  function inser_fichr (pva_nom_fichr   in apex_fichr.filename%type
                       ,pbl_fichr       in blob)
    return apex_fichr.id%type;

  function obten_id_fichr (pva_nom in apex_fichr.name%type)
    return apex_fichr.id%type;

  function obten_nom (pnu_id_fichr in apex_fichr.id%type)
    return apex_fichr.name%type;

  function obten_nom_fichr (pnu_id_fichr in apex_fichr.id%type)
    return apex_fichr.filename%type;

  function obten_nom_fichr (pva_nom in apex_fichr.name%type)
    return apex_fichr.filename%type;

  function obten_mime_type_fichr (pnu_id_fichr in apex_fichr.id%type)
    return apex_fichr.mime_type%type;

  procedure suprm_fichr (pnu_id_fichr in apex_fichr.id%type);
end afw_07_fichr_apex_pkg;
/
