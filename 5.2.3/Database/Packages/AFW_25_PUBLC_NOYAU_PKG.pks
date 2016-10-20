SET DEFINE OFF;
create or replace package afw_25_publc_noyau_pkg
is
  function obten_travl_courn (pbo_imedt        in boolean default true
                             ,pnu_type_travl   in number default null
                             ,pbo_mesgr        in boolean default false
                             ,pnu_domn         in number default afw_12_domn_pkg.obten_domn_sesn
                             ,pnu_utils        in number default afw_12_utils_pkg.obten_usagr_conct)
    return number;

  function initl_travl (pva_nom_fichr_sort   in varchar2
                       ,pva_indic_imedt      in varchar2
                       ,pnu_type_travl       in number default null
                       ,pbo_mesgr            in boolean default false
                       ,pnu_domn             in number default afw_12_domn_pkg.obten_domn_sesn
                       ,pnu_utils            in number default afw_12_utils_pkg.obten_usagr_conct)
    return number;

  procedure ajout_publc_travl (pva_nom_fichr_sort    in varchar2
                              ,pva_code_type_publc   in varchar2
                              ,pnu_travl             in number
                              ,pva_code_publc        in varchar2 default null
                              ,pnu_domn              in number default afw_12_domn_pkg.obten_domn_sesn);

  function ajout_publc_travl (pva_nom_fichr_sort    in varchar2
                             ,pva_code_type_publc   in varchar2
                             ,pnu_travl             in number
                             ,pva_code_publc        in varchar2 default null
                             ,pnu_domn              in number default afw_12_domn_pkg.obten_domn_sesn)
    return number;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pva_valr_varch    in varchar2
                        ,pnu_valr_numbr    in number
                        ,pda_valr_date        date
                        ,pnu_publc_travl   in number);

  function obten_nombr_ocurn_exect_courn
    return number;

  procedure lancr_travl (pva_formt             in varchar2
                        ,pnu_travl             in number
                        ,pbo_redrg_web_reslt   in boolean default true);

  function ajout_parmt (pva_code_parmt    in varchar2
                       ,pva_valr_varch    in varchar2
                       ,pnu_valr_numbr    in number
                       ,pda_valr_date        date
                       ,pnu_publc_travl   in number)
    return number;
end afw_25_publc_noyau_pkg;
/
