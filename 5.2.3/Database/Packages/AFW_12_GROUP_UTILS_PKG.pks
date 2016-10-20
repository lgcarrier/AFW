SET DEFINE OFF;
create or replace package afw_12_group_utils_pkg
as
  function obten_code (pnu_group_utils in vd_i_afw_12_group_utils.seqnc%type)
    return vd_i_afw_12_group_utils.code%type;

  function obten_nom (pnu_group_utils in vd_i_afw_12_group_utils.seqnc%type)
    return vd_i_afw_12_group_utils.nom%type;

  function obten_seqnc (pva_code    in vd_i_afw_12_group_utils.code%type
                       ,pnu_prodt   in vd_i_afw_11_prodt.seqnc%type default null
                       ,pnu_domn    in vd_i_afw_12_domn.seqnc%type default null)
    return vd_i_afw_12_group_utils.seqnc%type;

  function ajout_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                       ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                       ,pda_debut_efect   in date default sysdate
                       ,pda_fin_efect     in date default null
                       ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return vd_i_afw_12_lien_group_utils.seqnc%type;

  procedure ajout_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                        ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                        ,pda_debut_efect   in date default sysdate
                        ,pda_fin_efect     in date default null
                        ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn);

  function exist_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                       ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                       ,pda_date          in date
                       ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return boolean;

  function ajout_group_utils (pnu_group         in vd_i_afw_12_group_utils.seqnc%type
                             ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                             ,pda_debut_efect   in date default sysdate
                             ,pda_fin_efect     in date default null
                             ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return vd_i_afw_12_lien_group_utils.seqnc%type;

  procedure ajout_group_utils (pnu_group         in vd_i_afw_12_group_utils.seqnc%type
                              ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                              ,pda_debut_efect   in date default sysdate
                              ,pda_fin_efect     in date default null
                              ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn);

  procedure ajout_group_utils_domn (pnu_group_utils_sourc   in vd_i_afw_12_group_utils.seqnc%type
                                   ,pnu_domn_cible          in vd_i_afw_12_domn.seqnc%type);

  procedure ajout_utils_group_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                                    ,pda_debut_efect   in date default sysdate
                                    ,pda_fin_efect     in date default null
                                    ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn);

  procedure duplq_utils_group_utils (pnu_utils_sourc   in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_utils_cible   in vd_i_afw_12_utils.seqnc%type);

  procedure termn_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                        ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                        ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn
                        ,pda_fin_efect     in date default sysdate);

  procedure activ_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                        ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                        ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn);

  function ajout_utils_super_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                   ,pda_debut_efect   in date default sysdate
                                   ,pda_fin_efect     in date default null
                                   ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return number;

  procedure ajout_utils_super_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                    ,pda_debut_efect   in date default sysdate
                                    ,pda_fin_efect     in date default null
                                    ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn);

  function ajout_utils_conxn_derv (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                  ,pda_debut_efect   in date default sysdate
                                  ,pda_fin_efect     in date default null
                                  ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return number;

  procedure ajout_utils_conxn_derv (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                   ,pda_debut_efect   in date default sysdate
                                   ,pda_fin_efect     in date default null
                                   ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn);

  procedure termn_utils_super_utils (pnu_utils       in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_domn        in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn
                                    ,pda_fin_efect   in date default sysdate);

  procedure termn_utils_conxn_derv (pnu_utils       in vd_i_afw_12_utils.seqnc%type
                                   ,pnu_domn        in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn
                                   ,pda_fin_efect   in date default sysdate);


  function creer_group_utils_domn (pva_nom                       in vd_i_afw_12_group_utils.nom%type
                                  ,pva_descr                     in vd_i_afw_12_group_utils.descr%type default null
                                  ,pva_code                      in vd_i_afw_12_group_utils.code%type default null
                                  ,pva_code_prefx                in varchar2 default null
                                  ,pva_indic_ignor_group_admin   in vd_i_afw_12_group_utils.indic_ignor_group_admin%type default 'N'
                                  ,pva_indic_systm               in vd_i_afw_12_group_utils.indic_systm%type default 'N'
                                  ,pnu_domn                      in vd_i_afw_12_group_utils.ref_domn%type default afw_12_domn_pkg.obten_domn_sesn
                                  ,pva_indic_group_aplic         in vd_i_afw_12_group_utils.indic_group_aplic%type default 'N')
    return vd_i_afw_12_group_utils.seqnc%type;

  procedure creer_group_utils_domn (pva_nom                       in vd_i_afw_12_group_utils.nom%type
                                   ,pva_descr                     in vd_i_afw_12_group_utils.descr%type default null
                                   ,pva_code                      in vd_i_afw_12_group_utils.code%type default null
                                   ,pva_code_prefx                in varchar2 default null
                                   ,pva_indic_ignor_group_admin   in vd_i_afw_12_group_utils.indic_ignor_group_admin%type default 'N'
                                   ,pva_indic_systm               in vd_i_afw_12_group_utils.indic_systm%type default 'N'
                                   ,pnu_domn                      in vd_i_afw_12_group_utils.ref_domn%type default afw_12_domn_pkg.obten_domn_sesn
                                   ,pva_indic_group_aplic         in vd_i_afw_12_group_utils.indic_group_aplic%type default 'N');

  procedure modfr_group_utils (pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                              ,pva_nom           in vd_i_afw_12_group_utils.nom%type
                              ,pva_descr         in vd_i_afw_12_group_utils.descr%type);

  procedure suprm_group_utils (pnu_group_utils in vd_i_afw_12_group_utils.seqnc%type);
end afw_12_group_utils_pkg;
/
