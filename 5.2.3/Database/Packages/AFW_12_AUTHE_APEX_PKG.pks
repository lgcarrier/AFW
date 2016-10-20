SET DEFINE OFF;
create or replace package afw_12_authe_apex_pkg
is
  gbo_valdt_procd_authe_exter   boolean default false;

  kva_temn_domn        constant varchar2 (23) default 'AFW-DOMN';

  procedure demnd_activ_compt_utils (pnu_utils                   in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type
                                    ,pnu_numr_aplic_apex_cible   in number
                                    ,pnu_numr_page_apex_cible    in number
                                    ,pbo_indic_desct             in boolean default false
                                    ,pva_procd_persn             in varchar2);

  procedure valdr_utils (pva_code_utils    in varchar2
                        ,pva_mot_passe     in varchar2
                        ,pva_domn          in varchar2
                        ,pbo_forcr_authe   in boolean default false);

  procedure valdr_etat_authe (pbo_etat_authe          in out boolean
                             ,pva_code_utils          in     varchar2
                             ,pva_code_domn           in     varchar2
                             ,pva_code_utils_pour     in     varchar2
                             ,pva_code_domn_pour      in     varchar2
                             ,pbo_ignor_indic_actif   in     boolean default false);

  function authe_utils (p_username              in varchar2
                       ,p_password              in varchar2
                       ,p_domaine               in number
                       ,pbo_ignor_indic_actif   in boolean default false
                       ,pbo_forcr_authe         in boolean default false)
    return boolean;

  procedure inser_sesn;

  procedure defnr_varbl_utils_domn;

  procedure defnr_varbl_sesn;

  procedure rempl_mot_passe (pva_code_utils         in varchar2
                            ,pva_ancn_mot_passe     in varchar2
                            ,pva_nouv_mot_passe_1   in varchar2
                            ,pva_nouv_mot_passe_2   in varchar2);

  procedure reint_mot_passe (pnu_utils             in vd_i_afw_12_utils.seqnc%type
                            ,pva_mot_passe         in varchar2
                            ,pva_confr_mot_passe   in varchar2
                            ,pnu_domn              in vd_i_afw_12_domn.seqnc%type default null);

  procedure activ_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type);

  function valdr_sesn_sentr
    return boolean;

  procedure redrg_page_conxn;

  procedure redrg_page_acuei;

  procedure defnr_parmt_url_apres_authe (pnu_numr_apex_aplic   in number default afw_11_aplic_pkg.obten_numr_apex_aplic
                                        ,pnu_numr_apex_page    in number default afw_13_page_pkg.obten_numr_apex_page
                                        ,pva_scpc              in varchar2 default null
                                        ,pnu_sspc              in number default null
                                        ,pva_sapc              in varchar2 default null
                                        ,pva_scpi              in varchar2 default null
                                        ,pnu_sspi              in number default null
                                        ,pva_sapi              in varchar2 default null
                                        ,pnu_snpi              in number default null
                                        ,pnu_sidf              in number default null);

  function genr_url (pnu_numr_apex_aplic         in number
                    ,pnu_numr_apex_page          in number
                    ,pva_scpc                    in varchar2 default null
                    ,pnu_sspc                    in number default null
                    ,pva_sapc                    in varchar2 default null
                    ,pva_scpi                    in varchar2 default null
                    ,pnu_sspi                    in number default null
                    ,pva_sapi                    in varchar2 default null
                    ,pnu_snpi                    in number default null
                    ,pnu_sidf                    in number default null
                    ,pbo_indic_forcr_sspc        in boolean default false
                    ,pbo_indic_forcr_sidf        in boolean default false
                    ,pva_optio_reqst             in varchar2 default null
                    ,pva_optio_clear_page        in varchar2 default null
                    ,pva_indic_afich_valr_sesn   in varchar2 default 'O')
    return varchar2;

  procedure defnr_url_creat_utils (pva_url in varchar2);

  function obten_url_creat_utils
    return varchar2;

  procedure defnr_procd_persn (pva_nom_procd in varchar2);

  procedure exect_procd_persn;

  /* CONAL : Obselete, utiliser redrg_aplic_authe */
  procedure redrg_prodt_authe (pbo_forcr_redrc_cible in boolean default false);

  procedure redrg_aplic_authe (pbo_forcr_redrc_cible in boolean default false);

  procedure defnr_authe_redrc_cible (pnu_numr_aplic_apex   in number
                                    ,pnu_numr_page_apex    in number);

  procedure authe_redrg (pva_code_utils          in varchar2
                        ,pva_mot_passe           in varchar2
                        ,pva_domn                in varchar2
                        ,pnu_numr_apex_aplic     in number
                        ,pnu_numr_apex_page      in number
                        ,pva_scpc                in varchar2 default null
                        ,pnu_sspc                in number default null
                        ,pva_sapc                in varchar2 default null
                        ,pva_scpi                in varchar2 default null
                        ,pnu_sspi                in number default null
                        ,pva_sapi                in varchar2 default null
                        ,pnu_snpi                in number default null
                        ,pnu_sidf                in number default null
                        ,pbo_indic_forcr_sspc    in boolean default false
                        ,pbo_indic_forcr_sidf    in boolean default false
                        ,pva_optio_reqst         in varchar2 default null
                        ,pva_optio_clear_page    in varchar2 default null
                        ,pbo_ignor_indic_actif   in boolean default false
                        ,pbo_forcr_authe         in boolean default false);

  procedure authe_debg (pva_code_utils        in varchar2
                       ,pva_domn              in varchar2
                       ,pnu_numr_apex_aplic   in number
                       ,pnu_numr_apex_page    in number);
end afw_12_authe_apex_pkg;
/
