SET DEFINE OFF;
create or replace package afw_12_group_stat_pkg
as
  procedure creer_group_stat (pva_code         in varchar2
                             ,pva_nom          in varchar2
                             ,pva_descr        in varchar2
                             ,pva_code_prodt   in varchar2);

  function creer_group_stat (pva_code         in varchar2
                            ,pva_nom          in varchar2
                            ,pva_descr        in varchar2
                            ,pva_code_prodt   in varchar2)
    return number;

  procedure creer_stat (pnu_ref_group_stat   in number
                       ,pva_code             in varchar2
                       ,pva_nom              in varchar2);

  procedure suprm_group (pnu_seqnc in number);

  function obten_group_stat (pva_code         in vd_i_afw_12_group_stat.code%type
                            ,pva_code_prodt   in vd_i_afw_11_prodt.code%type)
    return vd_i_afw_12_group_stat.seqnc%type;

  function obten_group_stat (pva_code    in varchar2
                            ,pnu_prodt   in number
                            ,pnu_domn    in number)
    return number;

  function verfr_procs_aprob_insta (pnu_group_stat in vd_i_afw_12_group_stat.seqnc%type)
    return varchar2;

  procedure insta_procs_aprob (pnu_seqnc               in number
                              ,pnu_struc_aplic         in number
                              ,pnu_seqnc_struc_aplic   in number
                              ,pnu_stat_initl          in number default null
                              ,pva_role_aprob          in varchar2 default null
                              ,pnu_domn                in number default afw_12_domn_pkg.obten_domn_sesn);

  procedure initl_a_partr_struc_aplic (pnu_group_stat    in number
                                      ,pnu_struc_aplic   in number
                                      ,pnu_domn          in number default afw_12_domn_pkg.obten_domn_sesn);

  function duplq_procs (pnu_group_stat in number)
    return vd_i_afw_12_group_stat.seqnc%type;

  procedure duplq_procs (pnu_group_stat in number);

  function obten_role_aprob_json (pnu_group_stat in number)
    return varchar2;
end afw_12_group_stat_pkg;
/
