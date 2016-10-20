SET DEFINE OFF;
create or replace package afw_12_utils_pkg
as
  gva_code_utils        varchar2 (30);
  gva_code_utils_pour   varchar2 (30) default null;
  gva_code_domn         varchar2 (30);
  gva_code_domn_pour    varchar2 (30) default null;

  type gty_utils_infor is record
  (
    prenm         varchar2 (200)
   ,nom           varchar2 (200)
   ,utils_formt   varchar2 (4000)
   ,courl         varchar2 (200)
  );

  gre_utils_infor       gty_utils_infor;

  procedure init;

  function obten_code_usagr_conct (pva_indic_forcr_apex in varchar2 default 'N')
    return varchar2;

  function obten_usagr_conct (pva_indic_forcr_apex in varchar2 default 'N')
    return vd_i_afw_12_utils.seqnc%type;

  function obten_nom_formt_de_code_utils (pva_code_utils         in varchar2
                                         ,pva_indic_conxn_pour   in varchar2 default 'O'
                                         ,pva_indic_code         in varchar2 default 'N')
    return varchar2;

  procedure genr_audits (pva_code_audits in varchar2);

  function obten_nom_formt (pnu_utils in number)
    return varchar2;

  function obten_nom_formt_de_utils (pnu_utils in number)
    return varchar2;

  function verfr_usagr_vald (pva_code_utils in varchar2)
    return boolean;

  function obten_utils_de_code (pva_code in varchar2)
    return vd_i_afw_12_utils.seqnc%type;

  function obten_utils_de_courl (pva_courl in varchar2)
    return vd_i_afw_12_utils.seqnc%type;

  function obten_code_utils_de_courl (pva_courl in varchar2)
    return vd_i_afw_12_utils.code_utils%type;

  function obten_utils_de_code_base_don (pva_code_base_don in varchar2)
    return vd_i_afw_12_utils.seqnc%type;

  function obten_cle_encry_utils_conct
    return raw;

  function obten_code_utils (pnu_seqnc in number)
    return vd_i_afw_12_utils.code_utils%type;

  function creer_utils (pva_nom                     in varchar2
                       ,pva_prenm                   in varchar2
                       ,pva_code                    in varchar2
                       ,pva_courl                   in varchar2
                       ,pva_indic_verl              in varchar2 default 'N'
                       ,pva_indic_chang_mot_passe   in varchar2 default 'O'
                       ,pva_indic_actif             in vd_i_afw_12_utils.indic_actif%type default 'N'
                       ,pva_parmt_authe_exter_afw   in vd_i_afw_12_utils.parmt_authe_exter_afw%type default null)
    return vd_i_afw_12_utils.seqnc%type;

  procedure creer_utils (pva_nom                     in varchar2
                        ,pva_prenm                   in varchar2
                        ,pva_code                    in varchar2
                        ,pva_courl                   in varchar2
                        ,pva_indic_verl              in varchar2 default 'N'
                        ,pva_indic_chang_mot_passe   in varchar2 default 'O'
                        ,pva_indic_actif             in vd_i_afw_12_utils.indic_actif%type default 'N'
                        ,pva_parmt_authe_exter_afw   in vd_i_afw_12_utils.parmt_authe_exter_afw%type default null);

  function obten_courl_utils (pnu_utils in number)
    return vd_i_afw_12_utils.courl%type;

  function obten_dernr_aplic (pnu_utils in number)
    return vd_i_afw_12_utils.dernr_prodt_acces%type;

  procedure updat_dernr_aplic (pnu_utils        in number
                              ,pva_nouv_prodt   in varchar2);

  function obten_dernr_domn (pnu_utils in number)
    return vd_i_afw_12_domn.code%type;

  procedure updat_dernr_domn (pnu_utils       in number
                             ,pva_nouv_domn   in varchar2);

  function genr_code_utils (pva_nom     in vd_i_afw_12_utils.nom%type
                           ,pva_prenm   in vd_i_afw_12_utils.prenm%type)
    return vd_i_afw_12_utils.code_utils%type;

  procedure defnr_item_aplic_apex;

  procedure modfr_nom_prenm_utils (pnu_utils   in vd_i_afw_12_utils.seqnc%type
                                  ,pva_nom     in vd_i_afw_12_utils.nom%type
                                  ,pva_prenm   in vd_i_afw_12_utils.prenm%type);

  procedure modfr_courl_utils (pnu_utils   in vd_i_afw_12_utils.seqnc%type
                              ,pva_courl   in vd_i_afw_12_utils.courl%type);

  procedure modfr_code_utils (pnu_utils        in vd_i_afw_12_utils.seqnc%type
                             ,pva_code_utils   in vd_i_afw_12_utils.code_utils%type);

  function obten_audit_usagr_conct
    return varchar2;

  function obten_usagr_conct_sql (pva_code_utils in varchar2)
    return number
    result_cache;

  function obten_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return vd_i_afw_12_utils%rowtype;

  function obten_utils (pva_code_utils in vd_i_afw_12_utils.code_utils%type)
    return vd_i_afw_12_utils.seqnc%type;

  procedure verlr_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type);

  procedure devrl_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type);

  procedure activ_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type);

  procedure desct_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type);

  function valdr_formt_code_utils (pva_code_utils in vd_i_afw_12_utils.code_utils%type)
    return boolean;

  function valdr_formt_courl_utils (pva_courl in vd_i_afw_12_utils.courl%type)
    return boolean;

  function verfc_apart_super_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return boolean;

  function verfc_apart_super_utils_n (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return number;

  function verfc_apart_autor_conxn_derv (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return boolean;

  function verfc_apart_autor_conxn_derv_n (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return number;

  function obten_parmt_authe_exter_afw (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return vd_i_afw_12_utils.parmt_authe_exter_afw%type;

  function valdr_courl (pva_courl in varchar2)
    return boolean;

  function valdr_courl_confr (pva_courl         in varchar2
                             ,pva_courl_confr   in varchar2)
    return boolean;

  function verfr_utils_verlr (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return boolean;

  function verfr_utils_activ (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return boolean;

  function verfr_utils_est_utils_conct (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return boolean;

  function verfr_utils_est_utils_conct (pva_code_utils in vd_i_afw_12_utils.code_utils%type)
    return boolean;

  procedure suprm_tous_utils;

  procedure verlr_tous_utils;

  procedure desct_tous_utils;

  function obten_utils_infor_procd (pnu_domn    in number
                                   ,pnu_utils   in number)
    return gre_utils_infor%type;

  function obten_utils_infor_procd (pnu_domn         in number
                                   ,pva_code_utils   in varchar2)
    return gre_utils_infor%type;

  function obten_utils_courl_infor_procd (pnu_domn    in number
                                         ,pnu_utils   in number)
    return varchar2;

  function obten_utils_formt_infor_procd (pnu_domn    in number
                                         ,pnu_utils   in number)
    return varchar2;
end afw_12_utils_pkg;
/
