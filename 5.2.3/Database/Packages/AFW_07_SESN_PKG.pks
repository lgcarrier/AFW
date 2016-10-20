SET DEFINE OFF;
create or replace package afw_07_sesn_pkg
as
  gva_aplic_en_cours   number (10) default afw_07_util_pkg.v ('A_SAFP_APLIC');
  gva_prodt_en_cours   number (10) default afw_07_util_pkg.v ('A_SAFP_PRODT');

  procedure defnr_valr_sesn (pva_nom    in varchar2
                            ,pva_valr   in varchar2);

  procedure defnr_valr_sesn_alter (pva_nom    in varchar2
                                  ,pva_valr   in varchar2);

  function obten_valr_sesn (pva_nom in varchar2)
    return varchar2;

  procedure suprm_valr_sesn (pva_nom in varchar2);

  procedure defnr_aplic_en_cours (pva_aplic in varchar2);

  function obten_aplic_en_cours
    return varchar2;

  procedure defnr_prodt_en_cours (pva_prodt in varchar2);

  function obten_prodt_en_cours
    return varchar2;
end afw_07_sesn_pkg;
/
