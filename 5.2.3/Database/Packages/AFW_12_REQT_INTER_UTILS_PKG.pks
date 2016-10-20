SET DEFINE OFF;
create or replace package afw_12_reqt_inter_utils_pkg
is
  function obten_reqt_inter_utils (pnu_reqt_inter_utils in vd_i_afw_12_reqt_inter_utils.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils%rowtype;

  function obten_reqt_inter_utils_ident (pva_ident in vd_i_afw_12_reqt_inter_utils.ident%type)
    return vd_i_afw_12_reqt_inter_utils%rowtype;

  function obten_ident (pnu_reqt_inter_utils in vd_i_afw_12_reqt_inter_utils.seqnc%type)
    return varchar2;

  function obten_url_inter (pnu_reqt_inter_utils in vd_i_afw_12_reqt_inter_utils.seqnc%type)
    return varchar2;

  function obten_url_inter_formt_html (pnu_reqt_inter_utils in vd_i_afw_12_reqt_inter_utils.seqnc%type)
    return varchar2;

  function obten_type_reqt_inter_code (pva_ident in vd_i_afw_12_reqt_inter_utils.ident%type)
    return varchar2;

  function obten_utils_reqt_inter_utils (pva_ident in vd_i_afw_12_reqt_inter_utils.ident%type)
    return vd_i_afw_12_reqt_inter_utils.ref_utils%type;

  function reqt_creat_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                  ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                  ,pnu_numr_aplic_apex_cible   in number
                                  ,pnu_numr_page_apex_cible    in number
                                  ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type;

  function reqt_activ_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                  ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                  ,pnu_numr_aplic_apex_cible   in number
                                  ,pnu_numr_page_apex_cible    in number
                                  ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type
                                  ,pva_procd_persn             in vd_i_afw_12_reqt_inter_utils.procd_persn_url_apres_authe%type default null)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type;

  function reqt_reint_mot_passe (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                ,pnu_numr_aplic_apex_cible   in number
                                ,pnu_numr_page_apex_cible    in number
                                ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type;

  function reqt_reint_mot_passe_exter (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                      ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                      ,pnu_numr_aplic_apex_cible   in number
                                      ,pnu_numr_page_apex_cible    in number
                                      ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type;

  function reqt_creat_initl_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                        ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                        ,pnu_numr_aplic_apex_cible   in number
                                        ,pnu_numr_page_apex_cible    in number
                                        ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type;

  function reqt_obten_code_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                 ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                 ,pnu_numr_aplic_apex_cible   in number
                                 ,pnu_numr_page_apex_cible    in number
                                 ,pnu_prodt_evenm_notfb       in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_12_reqt_inter_utils.seqnc%type;

  procedure demnd_reint_mot_passe_oubli (pva_code_utils              in vd_i_afw_12_utils.code_utils%type
                                        ,pva_courl                   in vd_i_afw_12_utils.courl%type
                                        ,pva_code_domn               in vd_i_afw_12_domn.code%type
                                        ,pnu_numr_aplic_apex_cible   in number
                                        ,pnu_numr_page_apex_cible    in number
                                        ,pbo_indic_verl              in boolean default false);

  procedure demnd_reint_mot_passe_oubli (pva_courl                   in vd_i_afw_12_utils.courl%type
                                        ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                        ,pnu_numr_aplic_apex_cible   in number
                                        ,pnu_numr_page_apex_cible    in number
                                        ,pbo_indic_verl              in boolean default false);

  procedure demnd_code_utils_oubli (pva_courl                   in vd_i_afw_12_utils.courl%type
                                   ,pva_code_domn               in vd_i_afw_12_domn.code%type
                                   ,pnu_numr_aplic_apex_cible   in number
                                   ,pnu_numr_page_apex_cible    in number
                                   ,pbo_indic_verl              in boolean default false);

  procedure demnd_activ_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                    ,pnu_numr_aplic_apex_cible   in number
                                    ,pnu_numr_page_apex_cible    in number
                                    ,pbo_indic_desct             in boolean default false
                                    ,pva_procd_persn             in vd_i_afw_12_reqt_inter_utils.procd_persn_url_apres_authe%type default null);

  procedure infor_creat_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                    ,pnu_numr_aplic_apex_cible   in number
                                    ,pnu_numr_page_apex_cible    in number
                                    ,pbo_indic_activ_utils       in boolean default true);

  procedure infor_creat_initl_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                          ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                          ,pnu_numr_aplic_apex_cible   in number
                                          ,pnu_numr_page_apex_cible    in number
                                          ,pbo_indic_activ_utils       in boolean default true);

  procedure trait_reqt_inter_utils (pva_ident in vd_i_afw_12_reqt_inter_utils.ident%type);

  procedure defnr_aplic_authe_redrc_cible (pva_ident in vd_i_afw_12_reqt_inter_utils.ident%type);

  procedure trait_reqt_activ_compt_utils (pva_ident in vd_i_afw_12_reqt_inter_utils.ident%type);

  procedure trait_reqt_reint_mot_passe (pva_ident             in vd_i_afw_12_reqt_inter_utils.ident%type
                                       ,pva_mot_passe         in varchar2
                                       ,pva_confr_mot_passe   in varchar2);
end afw_12_reqt_inter_utils_pkg;
/
