SET DEFINE OFF;
create or replace package afw_25_publc_imedt_pkg
as
  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pva_valr_parmt    in varchar2
                        ,pnu_publc_travl   in number);

  function ajout_parmt (pva_code_parmt    in varchar2
                       ,pnu_valr_parmt    in number
                       ,pnu_publc_travl   in number)
    return number;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pnu_valr_parmt    in number
                        ,pnu_publc_travl   in number);

  function ajout_parmt (pva_code_parmt    in varchar2
                       ,pda_valr_parmt    in date
                       ,pnu_publc_travl   in number)
    return number;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pda_valr_parmt    in date
                        ,pnu_publc_travl   in number);

  procedure lancr_raprt;

  procedure lancr_raprt (pva_nom_raprt         in varchar2
                        ,pva_type_publc        in varchar2
                        ,pva_code_parmt        in varchar2
                        ,pnu_valr_parmt        in number
                        ,pbo_redrg_web_reslt   in boolean default true
                        ,pnu_domn              in number default null
                        ,pnu_utils             in number default null);

  function obten_nouv_travl (pva_nom_raprt in varchar2)
    return number;

  function ajout_publc (pnu_travl             in number
                       ,pva_nom_fichr_sort    in varchar2
                       ,pva_code_type_publc   in varchar2)
    return number;
end afw_25_publc_imedt_pkg;
/
