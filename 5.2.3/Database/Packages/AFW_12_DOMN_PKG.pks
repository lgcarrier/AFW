SET DEFINE OFF;
create or replace package afw_12_domn_pkg
is
  function ajout_domn (pva_code    in varchar2
                      ,pva_nom     in varchar2
                      ,pva_descr   in varchar2)
    return vd_i_afw_12_domn.seqnc%type;

  procedure ajout_domn (pva_code    in varchar2
                       ,pva_nom     in varchar2
                       ,pva_descr   in varchar2);

  function modfc_domn (pnu_seqnc   in number
                      ,pva_code    in varchar2
                      ,pva_nom     in varchar2
                      ,pva_descr   in varchar2)
    return vd_i_afw_12_domn.seqnc%type;

  procedure modfc_domn (pnu_seqnc   in number
                       ,pva_code    in varchar2
                       ,pva_nom     in varchar2
                       ,pva_descr   in varchar2);

  procedure suprm_domn (pnu_seqnc in number);

  function obten_code_domn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.code%type;

  function ajout_utils (pnu_utils         in number
                       ,pnu_domn          in number
                       ,pda_debut_efect   in date default sysdate
                       ,pda_fin_efect     in date default null)
    return vd_i_afw_12_domn_utils.seqnc%type;

  procedure ajout_utils (pnu_utils         in number
                        ,pnu_domn          in number
                        ,pda_debut_efect   in date default sysdate
                        ,pda_fin_efect     in date default null);

  procedure modfc_utils (pnu_seqnc         in number
                        ,pda_debut_efect   in date
                        ,pda_fin_efect     in date);

  procedure termn_utils (pnu_utils       in number
                        ,pda_fin_efect   in date);

  procedure termn_utils (pnu_utils       in number
                        ,pnu_domn        in number
                        ,pda_fin_efect   in date);

  procedure suprm_utils (pnu_seqnc in number);

  function obten_seqnc_domn (pva_code in vd_i_afw_12_domn.code%type)
    return vd_i_afw_12_domn.seqnc%type;

  function obten_nom_domn (pva_code in vd_i_afw_12_domn.code%type)
    return vd_i_afw_12_domn.nom%type;

  function obten_nom_domn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.nom%type;

  function obten_domn_sesn
    return vd_i_afw_12_domn.seqnc%type;

  function obten_code_domn_sesn
    return vd_i_afw_12_domn.code%type;

  function obten_nom_domn_sesn
    return vd_i_afw_12_domn.nom%type;

  function obten_domn_sesn_authe
    return number;

  function obten_code_domn_sesn_authe
    return varchar2;

  function obten_type_travl_deft (pnu_seqnc in number)
    return number;

  procedure chang_domn (pnu_domn in number);

  function obten_procd_authe_exter_afw (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.procd_authe_exter_afw%type;

  function obten_procd_avant_conxn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.procd_avant_conxn%type;

  function obten_procd_apres_conxn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.procd_apres_conxn%type;

  function obten_procd_apres_decnx (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.procd_apres_decnx%type;

  function valdr_demnd_activ_compt_utils (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return boolean;

  function obten_domn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn%rowtype;

  procedure alimn_type_travl (pnu_domn in vd_i_afw_12_domn.seqnc%type);

  procedure alimn_group_utils (pnu_domn        in vd_i_afw_12_domn.seqnc%type
                              ,pnu_modl_domn   in vd_i_afw_12_domn.seqnc%type default 0);

  procedure alimn_modl_rechr (pnu_domn        in vd_afw_12_domn.seqnc%type
                             ,pnu_modl_domn   in vd_afw_12_domn.seqnc%type default 0);

  procedure alimn_domn_type_publc (pnu_domn        in vd_i_afw_12_domn.seqnc%type
                                  ,pnu_modl_domn   in vd_i_afw_12_domn.seqnc%type default 0);

  procedure alimn_profl_courl (pnu_domn        in vd_afw_12_domn.seqnc%type
                              ,pnu_modl_domn   in vd_afw_12_domn.seqnc%type default 0);

  procedure alimn_confg_evenm_notfb (pnu_domn        in vd_afw_12_domn.seqnc%type
                                    ,pnu_modl_domn   in vd_afw_12_domn.seqnc%type default 0);

  procedure alimn_domn_opert (pnu_domn        in vd_afw_12_domn.seqnc%type
                             ,pnu_modl_domn   in vd_afw_12_domn.seqnc%type default 0);

  procedure alimn_domn_fonct (pnu_domn        in vd_afw_12_domn.seqnc%type
                             ,pnu_modl_domn   in vd_afw_12_domn.seqnc%type default 0);

  procedure valdr_chevc_date_domn_utils (pnu_seqnc        in vd_afw_12_domn_utils.seqnc%type
                                        ,pnu_ref_domn     in vd_afw_12_domn.seqnc%type
                                        ,pnu_ref_utils    in vd_afw_12_utils.seqnc%type
                                        ,pda_date_debut   in date
                                        ,pda_date_fin     in date);

  function obten_procd_infor_utils (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.procd_obten_infor_utils%type;

  function obten_indic_authe_courl (pva_code in vd_i_afw_12_domn.code%type)
    return vd_i_afw_12_domn.indic_authe_courl%type;
end afw_12_domn_pkg;
/
