SET DEFINE OFF;
create or replace package afw_23_rechr_pkg
  authid current_user
is
  procedure purgr_rechr (pnu_utils   in number default null
                        ,pnu_rechr   in number default null);

  function obten_enonc_rechr (pnu_rechr in number)
    return varchar2;

  procedure exect_rechr (pva_valr_rechr   in varchar2
                        ,pnu_modl         in number default 25820);

  procedure exect_rechr_apex (pva_valr_rechr in varchar2);

  function obten_enonc_rechr_formt (pnu_rechr in number)
    return varchar2;

  function obten_prodt_rechr (pnu_rechr in number)
    return number;

  function obten_lien_formt (pva_lien_non_formt in varchar2)
    return varchar2;

  procedure ajout_modl_rechr_domn (pnu_modl_rechr_sourc   in vd_afw_23_modl_rechr.seqnc%type
                                  ,pnu_domn_cible         in vd_afw_12_domn.seqnc%type);
end afw_23_rechr_pkg;
/
