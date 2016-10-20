SET DEFINE OFF;
create or replace package afw_03_envoi_courl_pkg
as
  function creer (pva_servr         in varchar2
                 ,pnu_port          in number
                 ,pva_domn          in varchar2
                 ,pva_nom_envoy     in varchar2
                 ,pva_adres_envoy   in varchar2
                 ,pva_authe_methd   in varchar2
                 ,pva_authe_usagr   in varchar2
                 ,pva_authe_mdp     in varchar2
                 ,pva_sujet         in varchar2)
    return afw_17_envoi_courl_pkg.courl;

  procedure creer (pva_servr         in varchar2
                  ,pnu_port          in number
                  ,pva_domn          in varchar2
                  ,pva_nom_envoy     in varchar2
                  ,pva_adres_envoy   in varchar2
                  ,pva_authe_methd   in varchar2
                  ,pva_authe_usagr   in varchar2
                  ,pva_authe_mdp     in varchar2
                  ,pva_sujet         in varchar2);

  procedure notfr_clas_inter (pnu_prodt             in number
                             ,pva_code_clas_inter   in varchar2
                             ,pre_afw_03_journ      in vd_i_afw_03_journ%rowtype);
end afw_03_envoi_courl_pkg;
/
