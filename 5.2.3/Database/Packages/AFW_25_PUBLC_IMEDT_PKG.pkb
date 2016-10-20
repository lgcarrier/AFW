SET DEFINE OFF;
create or replace package body afw_25_publc_imedt_pkg
as
  gnu_travl   number (10);

  function obten_nouv_travl (pva_nom_raprt in varchar2)
    return number
  is
  begin
    gnu_travl      :=
      afw_25_publc_noyau_pkg.initl_travl (pva_nom_raprt
                                         ,'O');
    return gnu_travl;
  end obten_nouv_travl;

  function ajout_publc (pnu_travl             in number
                       ,pva_nom_fichr_sort    in varchar2
                       ,pva_code_type_publc   in varchar2)
    return number
  is
  begin
    return afw_25_publc_noyau_pkg.ajout_publc_travl (pva_nom_fichr_sort
                                                    ,pva_code_type_publc
                                                    ,pnu_travl);
  end ajout_publc;

  function ajout_parmt (pva_code_parmt    in varchar2
                       ,pda_valr_parmt    in date
                       ,pnu_publc_travl   in number)
    return number
  is
    pnu_parmt_seqnc   number (10);
  begin
    pnu_parmt_seqnc      :=
      afw_25_publc_noyau_pkg.ajout_parmt (pva_code_parmt
                                         ,null
                                         ,null
                                         ,pda_valr_parmt
                                         ,pnu_publc_travl);
    return pnu_parmt_seqnc;
  end ajout_parmt;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pva_valr_parmt    in varchar2
                        ,pnu_publc_travl   in number)
  is
  begin
    afw_25_publc_noyau_pkg.ajout_parmt (pva_code_parmt
                                       ,pva_valr_parmt
                                       ,null
                                       ,null
                                       ,pnu_publc_travl);
  end ajout_parmt;

  function ajout_parmt (pva_code_parmt    in varchar2
                       ,pnu_valr_parmt    in number
                       ,pnu_publc_travl   in number)
    return number
  is
    pnu_parmt_seqnc   number (10);
  begin
    pnu_parmt_seqnc      :=
      afw_25_publc_noyau_pkg.ajout_parmt (pva_code_parmt
                                         ,null
                                         ,pnu_valr_parmt
                                         ,null
                                         ,pnu_publc_travl);
    return pnu_parmt_seqnc;
  end ajout_parmt;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pnu_valr_parmt    in number
                        ,pnu_publc_travl   in number)
  is
  begin
    afw_25_publc_noyau_pkg.ajout_parmt (pva_code_parmt
                                       ,null
                                       ,pnu_valr_parmt
                                       ,null
                                       ,pnu_publc_travl);
  end ajout_parmt;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pda_valr_parmt    in date
                        ,pnu_publc_travl   in number)
  is
  begin
    afw_25_publc_noyau_pkg.ajout_parmt (pva_code_parmt
                                       ,null
                                       ,null
                                       ,pda_valr_parmt
                                       ,pnu_publc_travl);
  end ajout_parmt;

  procedure lancr_raprt
  is
  begin
    afw_25_publc_noyau_pkg.lancr_travl ('PDF'
                                       ,gnu_travl);
  end lancr_raprt;

  procedure lancr_raprt (pva_nom_raprt         in varchar2
                        ,pva_type_publc        in varchar2
                        ,pva_code_parmt        in varchar2
                        ,pnu_valr_parmt        in number
                        ,pbo_redrg_web_reslt   in boolean default true
                        ,pnu_domn              in number default null
                        ,pnu_utils             in number default null)
  is
    pragma autonomous_transaction;
    vnu_publc_travl   number (10);
  begin
    gnu_travl      :=
      afw_25_publc_noyau_pkg.initl_travl (pva_nom_raprt
                                         ,'O');

    vnu_publc_travl      :=
      afw_25_publc_noyau_pkg.ajout_publc_travl (pva_nom_raprt
                                               ,pva_type_publc
                                               ,gnu_travl
                                               ,null);

    afw_25_publc_noyau_pkg.ajout_parmt (pva_code_parmt
                                       ,null
                                       ,pnu_valr_parmt
                                       ,null
                                       ,vnu_publc_travl);
    commit;
    afw_25_publc_noyau_pkg.lancr_travl ('PDF'
                                       ,gnu_travl
                                       ,pbo_redrg_web_reslt);
    commit;
  end lancr_raprt;
end afw_25_publc_imedt_pkg;
/
