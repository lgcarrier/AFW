SET DEFINE OFF;
create or replace package afw_12_struc_aplic_cu_pkg
  authid current_user
is
  kva_elemn_titre_court   constant number (1) default 1;
  kva_elemn_titre         constant number (1) default 2;
  kva_elemn_descr         constant number (1) default 3;

  type gta_liste_coln is table of wwv_flow_global.vc_arr2
    index by pls_integer;

  function resdr_elemn (pnu_struc_aplic         in number
                       ,pnu_seqnc_struc_aplic      number
                       ,pva_chemn_reslt         in varchar2)
    return varchar2;

  function resdr_tabl_elemn (pnu_struc_aplic         in number
                            ,pnu_seqnc_struc_aplic      number
                            ,pva_chemn_reslt         in varchar2
                            ,pta_liste_coln          in apex_application_global.vc_arr2
                            ,pta_liste_subst         in afw_07_sql_pkg.typ_liste_subst default afw_07_sql_pkg.c_liste_subst_vide)
    return afw_07_sql_pkg.typ_coln_valr;

  function obten_valr_formt (pnu_struc_aplic         in number
                            ,pnu_seqnc_struc_aplic   in number
                            ,pnu_elemn_desr          in number default kva_elemn_titre)
    return varchar2;

  function obten_valr_atrib_formt (pnu_seqnc_atrib         in number
                                  ,pnu_seqnc_struc_aplic   in number
                                  ,pva_formt               in varchar2 default null)
    return varchar2;
end afw_12_struc_aplic_cu_pkg;
/
