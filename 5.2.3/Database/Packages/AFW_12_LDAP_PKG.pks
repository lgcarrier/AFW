SET DEFINE OFF;
create or replace package afw_12_ldap_pkg
is
  function obten_servr_ldap (pnu_domn in number default afw_12_domn_pkg.obten_domn_sesn)
    return vd_afw_12_servr_ldap%rowtype;

  function authe_apex (pva_code_utils   in varchar2
                      ,pva_mot_passe    in varchar2)
    return boolean;

  function authe_dn (pva_code_utils   in varchar2
                    ,pva_mot_passe    in varchar2)
    return boolean;

  function synch_utils (pva_nom                     in varchar2
                       ,pva_prenm                   in varchar2
                       ,pva_code                    in varchar2
                       ,pva_courl                   in varchar2
                       ,pva_indic_verl              in varchar2 default 'N'
                       ,pva_indic_chang_mot_passe   in varchar2 default 'O'
                       ,pva_indic_actif             in vd_i_afw_12_utils.indic_actif%type default 'N'
                       ,pva_temp_dn                 in vd_i_afw_12_utils.parmt_authe_exter_afw%type default null
                       ,pnu_domn                    in vd_i_afw_12_domn.seqnc%type default null)
    return vd_i_afw_12_utils.seqnc%type;
end afw_12_ldap_pkg;
/
