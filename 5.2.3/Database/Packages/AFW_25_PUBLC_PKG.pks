SET DEFINE OFF;
create or replace package afw_25_publc_pkg
is
  function obten_travl_courn (pva_imedt in varchar2)
    return number;

  function obten_travl_courn (pbo_imedt in boolean default true)
    return number;

  function obten_nouv_travl (pva_nom_raprt    in varchar2
                            ,pnu_type_travl   in number default null
                            ,pbo_mesgr        in boolean default false)
    return number;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pva_valr_parmt    in varchar2
                        ,pnu_travl_publc   in number);

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pnu_valr_parmt    in number
                        ,pnu_travl_publc   in number);

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pda_valr_parmt    in date
                        ,pnu_travl_publc   in number);

  function obten_nombr_publc_travl (pnu_travl in number default null)
    return number;

  procedure ajout_publc_travl (pva_nom          in varchar2
                              ,pva_type_publc   in varchar2
                              ,pva_code_parmt   in varchar2
                              ,pnu_valr_parmt   in number
                              ,pnu_travl        in number default null
                              ,pnu_type_travl   in number default null
                              ,pbo_mesgr        in boolean default false);

  function ajout_publc_travl (pva_nom          in varchar2
                             ,pva_type_publc   in varchar2
                             ,pva_code_parmt   in varchar2
                             ,pnu_valr_parmt   in number
                             ,pnu_travl        in number default null
                             ,pnu_type_travl   in number default null
                             ,pbo_mesgr        in boolean default false)
    return number;

  function initl_travl (pnu_travl            in number
                       ,pva_nom_fichr_sort   in varchar2
                       ,pva_indic_imedt      in varchar2
                       ,pnu_type_travl       in number default null)
    return number;

  procedure copie_publc_travl (pnu_sorc_travl    in number
                              ,pnu_destn_travl   in number
                              ,pnu_publc_travl   in number default null);

  procedure ajout_travl_courn (pnu_travl         in number default null
                              ,pnu_publc_travl   in number default null);

  procedure defnr_stat_publc_travl (pnu_seqnc       in number
                                   ,pva_code_stat   in varchar2);
end afw_25_publc_pkg;
/
