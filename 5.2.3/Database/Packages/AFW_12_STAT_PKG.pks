SET DEFINE OFF;
create or replace package afw_12_stat_pkg
as
  gva_indic_stat_systm        varchar2 (1) default 'N';
  gbo_indic_evolt_stat_code   boolean default false;

  function obten_stat (pva_code_struc_aplic   in varchar2
                      ,pva_code_stat          in varchar2
                      ,pva_code_prodt         in varchar2 default afw_11_prodt_pkg.obten_code_prodt)
    return number
    result_cache;

  function obten_stat_group_stat (pva_code_group_stat   in varchar2
                                 ,pva_code_stat         in varchar2
                                 ,pva_code_prodt        in varchar2 default afw_11_prodt_pkg.obten_code_prodt)
    return number
    result_cache;

  function obten_code_stat (pnu_seqnc_stat in number)
    return varchar2
    result_cache;

  function obten_stat_initl_struc_aplic (pva_code_struc_aplic   in varchar2
                                        ,pva_code_prodt         in varchar2 default null)
    return number
    result_cache;

  function obten_stat_initl_struc_aplic (pnu_struc_aplic in number)
    return number
    result_cache;

  function obten_stat_initl_group_stat (pva_code_group_stat   in varchar2
                                       ,pva_code_prodt        in varchar2 default null)
    return number
    result_cache;

  function obten_stat_initl_group_stat (pnu_group_stat in number)
    return number
    result_cache;

  function obten_code_stat_initl_struc_ap (pva_code_struc_aplic   in varchar2
                                          ,pva_code_prodt         in varchar2 default null)
    return varchar2
    result_cache;

  function obten_code_stat_initl_struc_ap (pnu_struc_aplic in number)
    return varchar2
    result_cache;

  function obten_code_stat_initl_group_st (pva_code_group_stat   in varchar2
                                          ,pva_code_prodt        in varchar2 default null)
    return varchar2
    result_cache;

  function obten_code_stat_initl_group_st (pnu_group_stat in number)
    return varchar2
    result_cache;

  function obten_stat_formt (pva_code_struc_aplic   in varchar2
                            ,pva_code_stat          in varchar2
                            ,pva_code_prodt         in varchar2 default afw_11_prodt_pkg.obten_code_prodt)
    return varchar2
    result_cache;

  function obten_stat_formt (pnu_seqnc in number)
    return varchar2
    result_cache;

  function obten_stat_group_stat_formt (pva_code_group_stat   in varchar2
                                       ,pva_code_stat         in varchar2
                                       ,pva_code_prodt        in varchar2 default afw_11_prodt_pkg.obten_code_prodt)
    return varchar2
    result_cache;

  function valdr_evolt_stat (pnu_stat_ancie   in number
                            ,pnu_stat_nouv    in number)
    return boolean
    result_cache;

  function difrn_ordre (pnu_ref_stat_1   in number
                       ,pnu_ref_stat_2   in number)
    return number
    result_cache;

  function obten_liste_formt (pnu_stat   in number
                             ,pva_code   in varchar2)
    return varchar2
    result_cache;

  function obten_postn_reltv (pva_struc_aplic       in varchar2
                             ,pva_code_stat_base    in varchar2
                             ,pva_code_stat_cible   in varchar2
                             ,pva_code_prodt        in varchar2 default null)
    return number
    result_cache;

  function obten_postn_reltv (pva_struc_aplic       in varchar2
                             ,pnu_code_stat_base    in number
                             ,pnu_code_stat_cible   in number)
    return number
    result_cache;

  function obten_postn_reltv_group_stat (pva_group_stat        in varchar2
                                        ,pva_code_stat_base    in varchar2
                                        ,pva_code_stat_cible   in varchar2
                                        ,pva_code_prodt        in varchar2 default null)
    return number
    result_cache;

  function obten_postn_reltv_group_stat (pva_group_stat        in varchar2
                                        ,pnu_code_stat_base    in number
                                        ,pnu_code_stat_cible   in number)
    return number
    result_cache;

  procedure creer_stat (pnu_ref_struc_aplic   in number
                       ,pva_code              in varchar2
                       ,pva_nom               in varchar2);

  procedure creer_stat_group_stat (pnu_group_stat   in number
                                  ,pva_code         in varchar2
                                  ,pva_nom          in varchar2
                                  ,pva_descr        in varchar2);

  function creer_stat_group_stat (pnu_group_stat   in number
                                 ,pva_code         in varchar2
                                 ,pva_nom          in varchar2
                                 ,pva_descr        in varchar2)
    return number;

  procedure maj_stat_group_stat (pnu_stat    in number
                                ,pva_code    in varchar2
                                ,pva_nom     in varchar2
                                ,pva_descr   in varchar2);

  procedure suprm_stat_group_stat (pnu_stat in number);

  procedure valdr_stat_initl_uniq (pnu_group_stat    in number default null
                                  ,pnu_struc_aplic   in number default null);

  function obten_indic_insta_procs_aprob (pnu_stat in number)
    return varchar2;
end afw_12_stat_pkg;
/
