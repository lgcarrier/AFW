SET DEFINE OFF;
create or replace package afw_21_plugn_navgt_enreg_pkg
  authid current_user
as
  function valdr_prise_charg
    return boolean;

  function obten_url_premr_enreg
    return varchar2;

  function obten_url_dernr_enreg
    return varchar2;

  function obten_url_suivn_enreg
    return varchar2;

  function obten_url_precd_enreg
    return varchar2;

  function obten_regn_navgt_precd
    return varchar2;

  function obten_regn_navgt_suivn
    return varchar2;

  procedure desct_navgt_enreg;

  --Process doit être séquence 9.1
  function valdr_plugn_activ
    return boolean;
end afw_21_plugn_navgt_enreg_pkg;
/
