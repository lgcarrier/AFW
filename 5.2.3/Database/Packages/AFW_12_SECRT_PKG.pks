SET DEFINE OFF;
create or replace package afw_12_secrt_pkg
as
  function verfr_presn_utils_group (pva_group         in varchar2
                                   ,pbo_ignor_super   in boolean default false
                                   ,pnu_utils         in number default afw_12_utils_pkg.obten_usagr_conct ())
    return boolean;

  function verfr_presn_utils_group_numbr (pva_group         in varchar2
                                         ,pbo_ignor_super   in boolean default false
                                         ,pnu_utils         in number default afw_12_utils_pkg.obten_usagr_conct ())
    return number
    deterministic;

  function verfc_droit_acces (pva_code_struc_aplic        in varchar2
                             ,pbo_indic_acces             in boolean default null
                             ,pbo_indic_creat             in boolean default null
                             ,pbo_indic_modfc             in boolean default null
                             ,pbo_indic_suprs             in boolean default null
                             ,pnu_seqnc_membr_struc_lie   in number
                             ,pnu_prodt                   in number default afw_11_prodt_pkg.obten_prodt_sesn
                             ,pnu_utils                   in number default afw_12_utils_pkg.obten_usagr_conct)
    return boolean;

  function verfc_droit_acces_numrq (pva_code_struc_aplic        in varchar2
                                   ,pva_indic_acces             in varchar2 default null
                                   ,pva_indic_creat             in varchar2 default null
                                   ,pva_indic_modfc             in varchar2 default null
                                   ,pva_indic_suprs             in varchar2 default null
                                   ,pnu_seqnc_membr_struc_lie   in number default null
                                   ,pnu_prodt                   in number default afw_11_prodt_pkg.obten_prodt_sesn
                                   ,pnu_utils                   in number default afw_12_utils_pkg.obten_usagr_conct)
    return number;

  function verfc_droit_acces_schem_apex (pbo_indic_acces   in boolean default null
                                        ,pbo_indic_creat   in boolean default null
                                        ,pbo_indic_modfc   in boolean default null
                                        ,pbo_indic_suprs   in boolean default null)
    return boolean;

  function defnr_nom_item (pva_nom_item in varchar2)
    return boolean;

  function obten_nom_item_courn
    return varchar2;

  function verf_presn_opert_item (pnu_utils   in number
                                 ,pva_item    in varchar2)
    return boolean;

  function verfr_presn_group_utils (pva_code_group in varchar2)
    return boolean;

  function verfr_presn_opert_utils (pva_code_opert in varchar2)
    return boolean;

  function verif_si_conct
    return boolean;

  function verif_acces_liste_navgt (pnu_afw_13_elemn_liste_navgt in number)
    return boolean;

  function verif_apart_group_non_conct (pva_group              in varchar2
                                       ,pva_utils              in varchar2
                                       ,pva_resdr_sous_group   in varchar2 default 'N')
    return boolean;

  function verif_admin_prodt
    return number;

  function obten_opert_en_cours_verfc
    return varchar2;

  procedure defnr_opert_en_cours_verfc (pva_opert in varchar2);

  procedure defnr_code_utils (pva_code_utils in varchar2);

  procedure defnr_code_domn (pva_code_domn in varchar2);

  function obten_code_utils
    return varchar2;

  function obten_code_domn
    return varchar2;
end afw_12_secrt_pkg;
/
