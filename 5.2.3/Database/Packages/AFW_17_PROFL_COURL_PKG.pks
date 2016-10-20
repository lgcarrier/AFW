SET DEFINE OFF;
create or replace package afw_17_profl_courl_pkg
as
  function obten_code (pnu_profl_courl in number)
    return varchar2;

  function obten_seqnc (pva_code_profl_courl   in varchar2
                       ,pva_code_domn          in varchar2 default afw_12_domn_pkg.obten_code_domn_sesn)
    return number;

  procedure ajout_profl_courl_domn (pnu_domn_profl_courl   in number
                                   ,pnu_domn_cible         in number);
end afw_17_profl_courl_pkg;
/
