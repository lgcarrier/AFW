SET DEFINE OFF;
create or replace package afw_12_calnd_pkg
as
  function obten_date (pnu_numr_apex_regn in number)
    return date;

  function obten_mode (pnu_numr_apex_regn in number)
    return varchar2;

  function obten_type_agend
    return varchar2;

  function obten_selct_indic_journ_compl
    return varchar2;

  function obten_selct_date_debut
    return varchar2;

  function obten_selct_date_fin
    return varchar2;

  function obten_choix_evenm_ident
    return varchar2;

  function obten_deplc_evenm_ident
    return varchar2;

  function obten_deplc_indic_journ_compl
    return varchar2;

  function obten_deplc_date_debut
    return varchar2;

  function obten_deplc_date_fin
    return varchar2;

  function obten_ajust_evenm_ident
    return varchar2;

  function obten_ajust_date_fin
    return varchar2;

  procedure defnr_date (pnu_numr_apex_regn   in number
                       ,pva_date             in varchar2);

  procedure defnr_mode (pnu_numr_apex_regn   in number
                       ,pva_mode             in varchar2);

  procedure defnr_type_agend (pva_type in varchar2);
end afw_12_calnd_pkg;
/
