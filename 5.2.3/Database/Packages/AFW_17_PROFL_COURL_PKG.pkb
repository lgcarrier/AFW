SET DEFINE OFF;
create or replace package body afw_17_profl_courl_pkg
as
  function obten_code (pnu_profl_courl in number)
    return varchar2
  is
    pva_code   vd_i_afw_17_profl_courl.code%type;
  begin
    select pc.code
      into pva_code
      from vd_i_afw_17_profl_courl pc
     where pc.seqnc = pnu_profl_courl;

    return pva_code;
  exception
    when others
    then
      return null;
  end obten_code;

  function obten_seqnc (pva_code_profl_courl   in varchar2
                       ,pva_code_domn          in varchar2 default afw_12_domn_pkg.obten_code_domn_sesn)
    return number
  is
    pnu_seqnc   vd_i_afw_17_profl_courl.seqnc%type;
  begin
    select pc.seqnc
      into pnu_seqnc
      from vd_i_afw_17_profl_courl pc
     where     pc.code = pva_code_profl_courl
           and pc.ref_domn = afw_12_domn_pkg.obten_seqnc_domn (pva_code_domn);

    return pnu_seqnc;
  end obten_seqnc;

  procedure ajout_profl_courl_domn (pnu_domn_profl_courl   in number
                                   ,pnu_domn_cible         in number)
  is
  begin
    insert into vd_afw_17_profl_courl (servr_sortn
                                      ,port_sortn
                                      ,domn
                                      ,nom_envoy
                                      ,adres_envoy
                                      ,authe_methd_sortn
                                      ,authe_usagr_sortn
                                      ,authe_mdp_sortn
                                      ,code
                                      ,ref_domn
                                      ,nom
                                      ,descr
                                      ,indic_ssl_sortn
                                      ,servr_entra
                                      ,port_entra
                                      ,indic_ssl_entra
                                      ,authe_methd_entra
                                      ,authe_usagr_entra
                                      ,authe_mdp_entra
                                      ,protc_entra)
      select servr_sortn
            ,port_sortn
            ,domn
            ,nom_envoy
            ,adres_envoy
            ,authe_methd_sortn
            ,authe_usagr_sortn
            ,authe_mdp_sortn
            ,code
            ,pnu_domn_cible
            ,nom
            ,descr
            ,indic_ssl_sortn
            ,servr_entra
            ,port_entra
            ,indic_ssl_entra
            ,authe_methd_entra
            ,authe_usagr_entra
            ,authe_mdp_entra
            ,protc_entra
        from vd_afw_17_profl_courl
       where seqnc = pnu_domn_profl_courl;
  end ajout_profl_courl_domn;
end afw_17_profl_courl_pkg;
/
