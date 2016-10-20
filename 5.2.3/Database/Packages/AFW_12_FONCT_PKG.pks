SET DEFINE OFF;
create or replace package afw_12_fonct_pkg
as
  function verif_activ_fonct_domn (pnu_struc_aplic in number)
    return boolean;

  function verif_activ_fonct_domn (pva_struc_aplic in varchar2)
    return boolean;

  function verfr_fonct_domn_exist (pnu_struc_aplic in number)
    return boolean;

  function verfr_fonct_domn_exist (pva_struc_aplic in varchar2)
    return boolean;

  procedure ajout_opert_domn (pnu_opert_domn   in number
                             ,pnu_domn_cible   in number);

  procedure ajout_fonct_domn (pnu_domn_fonct   in number
                             ,pnu_domn_cible   in number);

  function obten_liste_fonct (pnu_page in vd_i_afw_13_page.seqnc%type)
    return varchar2;
end afw_12_fonct_pkg;
/
