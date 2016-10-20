SET DEFINE OFF;
create or replace package afw_25_travl_publc_pkg
as
  procedure lancr_travl (pnu_travl             in number
                        ,pnu_formt             in varchar
                        ,pbo_redrg_web_reslt   in boolean default true);

  procedure lancr_publc_travl (pnu_publc_travl       in number
                              ,pnu_formt             in varchar
                              ,pbo_redrg_web_reslt   in boolean default true);

  procedure defnr_contx_exect_raprt (pnu_travl         in number
                                    ,pnu_travl_publc   in number
                                    ,pva_type_publc    in varchar2
                                    ,pva_code_publc    in varchar2
                                    ,pva_code_engin    in varchar2 default null);

  function obten_domn_contx_exect
    return number;

  function obten_travl_exect
    return number;

  function obten_publc_travl_exect
    return number;

  function obten_utils_contx_exect
    return number;

  procedure vider_cache;

  procedure obten_fichr_sort (pbl_travl_termn            out nocopy blob
                             ,pva_mime_type_travl        out        varchar2
                             ,pnu_tail_fichr             out        pls_integer
                             ,pva_nom_fichr              out        varchar2
                             ,pbo_suprm_fichr_cache   in            boolean default true);

  function obten_stat_publc_travl (pnu_publc_travl in number)
    return number;

  function obten_versn_publc_courn (pnu_publc in number)
    return number;
end afw_25_travl_publc_pkg;
/
