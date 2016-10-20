SET DEFINE OFF;
create or replace package afw_21_plugn_tutrl_pkg
as
  function obten_tutrl (pva_code in vd_afw_13_tutrl.code%type)
    return vd_afw_13_tutrl.seqnc%type;

  function obten_etape_tutrl (pnu_tutrl         in vd_afw_13_tutrl.seqnc%type
                             ,pnu_ordre_presn   in vd_afw_13_etape_tutrl.ordre_presn%type)
    return vd_afw_13_etape_tutrl.seqnc%type;

  function obten_ordre_presn_etape_tutrl (pnu_etape_tutrl in vd_afw_13_etape_tutrl.seqnc%type)
    return vd_afw_13_etape_tutrl.ordre_presn%type;

  function obten_tutrl_premr_charg (pnu_page in vd_afw_13_etape_tutrl.ref_page%type)
    return vd_afw_13_tutrl.seqnc%type;

  function obten_indic_premr_charg (pnu_tutrl in vd_afw_13_tutrl.seqnc%type)
    return varchar2;

  function obten_liste_etape (pnu_tutrl in vd_afw_13_tutrl.seqnc%type)
    return number;

  function exist_histr_charg (pnu_tutrl   in vd_afw_13_tutrl.seqnc%type
                             ,pnu_utils   in vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct)
    return boolean;

  procedure ajout_histr (pnu_tutrl   in vd_afw_13_tutrl.seqnc%type
                        ,pnu_utils   in vd_afw_12_utils.seqnc%type);

  function exist_tutrl_cedl (pnu_page    in vd_afw_13_page.seqnc%type
                            ,pnu_utils   in vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct)
    return boolean;

  function obten_tutrl_cedl (pnu_page    in vd_afw_13_page.seqnc%type
                            ,pnu_utils   in vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct)
    return afw_12_tutrl_pkg.gty_parmt_tutrl;

  procedure defnr_etape_suivn_cedl (pnu_tutrl               in vd_afw_13_tutrl.seqnc%type
                                   ,pnu_ordre_etape_tutrl   in vd_afw_13_etape_tutrl.ordre_presn%type
                                   ,pnu_utils               in vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct);

  procedure termn_cedl_tutrl (pnu_tutrl   in vd_afw_13_tutrl.seqnc%type
                             ,pnu_utils   in vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct);
end afw_21_plugn_tutrl_pkg;
/
