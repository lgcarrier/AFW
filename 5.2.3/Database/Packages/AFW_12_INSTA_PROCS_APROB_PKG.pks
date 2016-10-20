SET DEFINE OFF;
create or replace package afw_12_insta_procs_aprob_pkg
as
  function obten_insta_procs_aprob (pnu_struc_aplic         in number
                                   ,pnu_seqnc_struc_aplic   in number)
    return vd_i_afw_12_insta_procs_aprob.seqnc%type;

  function creer_insta_procs_aprob (pnu_group_stat          in number
                                   ,pnu_struc_aplic         in number
                                   ,pnu_seqnc_struc_aplic   in number
                                   ,pnu_domn                in number)
    return number;

  procedure creer_insta_procs_aprob (pnu_group_stat          in number
                                    ,pnu_struc_aplic         in number
                                    ,pnu_seqnc_struc_aplic   in number
                                    ,pnu_domn                in number);

  procedure creer_insta_procs_aprob_stat (pnu_insta_procs_aprob   in number
                                         ,pnu_stat                in number
                                         ,pnu_domn                in number
                                         ,pda_debut_efect         in date default sysdate
                                         ,pda_fin_efect           in date default null);

  function obten_ip_aprob_stat_actue (pnu_insta_procs_aprob in number)
    return vd_i_afw_12_ip_aprob_stat.seqnc%type;

  function obten_ipa_etat_actue (pnu_insta_procs_aprob in number)
    return vd_i_afw_12_stat.seqnc%type;

  procedure termn_insta_procs_aprob_stat (pnu_insta_procs_aprob        in number
                                         ,pnu_insta_procs_aprob_stat   in number
                                         ,pda_fin_efect                in date default sysdate);

  procedure evolt_insta_procs_aprob (pnu_insta_procs_aprob   in number
                                    ,pnu_proch_stat          in number
                                    ,pnu_domn                in number default null);

  procedure evolt_insta_procs_aprob_sa (pnu_struc_aplic         in number
                                       ,pnu_seqnc_struc_aplic   in number
                                       ,pnu_proch_stat          in number
                                       ,pnu_domn                in number default null);

  procedure suprm_insta_regle_aprob (pnu_insta_procs_aprob   in number
                                    ,pnu_regle_aprob         in number);

  procedure creer_insta_regle_aprob (pnu_insta_procs_aprob   in number
                                    ,pnu_regle_aprob         in number
                                    ,pnu_domn                in number
                                    ,pda_date_aprob          in date default sysdate
                                    ,pva_comnt_aprob         in varchar2 default null);

  function verfr_evolt_posbl_etat_regle (pnu_insta_procs_aprob   in number
                                        ,pnu_regle_aprob         in number)
    return varchar2;

  function verfr_evolt_posbl_etat_evolt (pnu_insta_procs_aprob   in number
                                        ,pnu_evolt_stat          in number)
    return varchar2;

  procedure chois_insta_regle_aprob (pnu_insta_procs_aprob   in number
                                    ,pnu_regle_aprob         in number
                                    ,pnu_domn                in number
                                    ,pda_date_aprob          in date default sysdate
                                    ,pva_comnt_aprob         in varchar2 default null);

  procedure chois_insta_regle_aprob (pnu_struc_aplic         in number
                                    ,pnu_seqnc_struc_aplic   in number
                                    ,pnu_regle_aprob         in number
                                    ,pnu_domn                in number
                                    ,pda_date_aprob          in date default sysdate
                                    ,pva_comnt_aprob         in varchar2 default null);

  procedure chois_evolt_stat (pnu_insta_procs_aprob   in number
                             ,pnu_evolt_stat          in number
                             ,pnu_domn                in number
                             ,pda_date_aprob          in date default sysdate
                             ,pva_comnt_aprob         in varchar2 default null
                             ,pnu_utils               in number default afw_12_utils_pkg.obten_usagr_conct);

  procedure chois_evolt_stat (pnu_struc_aplic         in number
                             ,pnu_seqnc_struc_aplic   in number
                             ,pnu_evolt_stat          in number
                             ,pnu_domn                in number
                             ,pda_date_aprob          in date default sysdate
                             ,pva_comnt_aprob         in varchar2 default null
                             ,pnu_utils               in number default afw_12_utils_pkg.obten_usagr_conct);

  function verfr_evolt_bloq (pnu_insta_procs_aprob in number)
    return varchar2;

  function verfr_evolt_bloq (pnu_struc_aplic         in number
                            ,pnu_seqnc_struc_aplic   in number)
    return varchar2;
end afw_12_insta_procs_aprob_pkg;
/
