SET DEFINE OFF;
create or replace package afw_13_mime_type_pkg
as
  function obten_seqnc (pva_mime_type   in varchar2
                       ,pva_nom_fichr   in varchar2)
    return number;

  function obten_seqnc (pva_nom_fichr in varchar2)
    return number;

  function obten_icon (pnu_mime_type           in number
                      ,pva_indic_chemn_compl   in varchar2 default 'O')
    return varchar2;

  function obten_type_fichr (pnu_mime_type in number)
    return number;

  function obten_mime_type (pva_exten in vd_i_afw_13_mime_type.ext%type)
    return vd_i_afw_13_mime_type.mime_type%type;

  function obten_exten_nom_fichr (pva_nom_fichr in varchar2)
    return vd_i_afw_13_mime_type.ext%type;
end afw_13_mime_type_pkg;
/
