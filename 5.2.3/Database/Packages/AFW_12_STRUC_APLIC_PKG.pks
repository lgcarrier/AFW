SET DEFINE OFF;
create or replace package afw_12_struc_aplic_pkg
as
  kva_elemn_titre_court   constant number (1) default 1;
  kva_elemn_titre         constant number (1) default 2;
  kva_elemn_descr         constant number (1) default 3;
  gva_valr_formt                   varchar2 (32767);

  function obten_struc_aplic_formt (pnu_seqnc_struc in number)
    return varchar2;

  function obten_struc_aplic_formt (pva_code_struc   in varchar2
                                   ,pnu_prodt        in number default afw_11_prodt_pkg.obten_prodt_sesn)
    return varchar2;

  procedure obten_struc_aplic_formt (pva_code_struc          in     varchar2
                                    ,pva_adjec_demns            out varchar2
                                    ,pva_struc_aplic_formt      out varchar2
                                    ,pnu_prodt               in     number default afw_11_prodt_pkg.obten_prodt_sesn);

  function obten_code (pnu_seqnc in number)
    return varchar2;

  function obten_seqnc (pva_code    in varchar2
                       ,pnu_prodt   in number default afw_11_prodt_pkg.obten_prodt_sesn)
    return number;

  /*function obten_valr_formt (pnu_struc_aplic in number,
                             pnu_seqnc_struc_aplic in number,
                             pnu_elemn_desr in number default kva_elemn_titre)
    return varchar2;*/

  procedure creer_group (pnu_ref_struc_aplic in vd_i_afw_12_struc_aplic.seqnc%type);

  function creer_struc (pva_code         in varchar2
                       ,pva_nom          in varchar2
                       ,pva_descr        in varchar2
                       ,pva_code_prodt   in varchar2)
    return number;

  procedure creer_struc (pva_code         in varchar2
                        ,pva_nom          in varchar2
                        ,pva_descr        in varchar2
                        ,pva_code_prodt   in varchar2);

  procedure suprm_struc (pnu_seqnc in number);

  procedure modfr_struc (pnu_seqnc   in number
                        ,pva_code    in varchar2
                        ,pva_nom     in varchar2
                        ,pva_descr   in varchar2);

  function obten_url_acces (pnu_seqnc_struc   in number
                           ,pnu_sspc          in number
                           ,pva_sapc          in varchar2 default null
                           ,pva_scpc          in varchar2 default null
                           ,pnu_sspi          in number default null
                           ,pva_sapi          in varchar2 default null
                           ,pva_scpi          in varchar2 default null
                           ,pnu_snpi          in number default null
                           ,pva_reint_sidf    in varchar2 default 'N'
                           ,pva_valr_sess     in varchar2 default null
                           ,pva_valr_sidf     in varchar2 default null)
    return varchar2;

  function obten_url_liste (pnu_seqnc_struc   in number
                           ,pva_sapc          in varchar2 default null
                           ,pva_scpc          in varchar2 default null
                           ,pnu_sspi          in number default null
                           ,pva_sapi          in varchar2 default null
                           ,pva_scpi          in varchar2 default null
                           ,pnu_snpi          in number default null
                           ,pva_reint_sidf    in varchar2 default 'N'
                           ,pva_valr_sess     in varchar2 default null
                           ,pva_valr_sidf     in varchar2 default null)
    return varchar2;

  procedure maj_atrib_struc_aplic (pnu_struc_aplic in vd_i_afw_12_struc_aplic.seqnc%type);

  procedure verfr_presn_tradc (pnu_struc_aplic number);

  function obten_atrib_struc_aplic (pva_prodt              in vd_afw_11_prodt.code%type
                                   ,pva_code_struc_aplic   in vd_afw_12_struc_aplic.code%type
                                   ,pva_nom_coln_atrib     in vd_afw_12_atrib_struc_aplic.nom_coln%type)
    return vd_afw_12_atrib_struc_aplic.seqnc%type;

  function obten_nom_coln_atrib (pnu_seqnc in vd_afw_12_atrib_struc_aplic.nom_coln%type)
    return vd_afw_12_atrib_struc_aplic.nom_coln%type;

  function obten_icone_font_awesm (pnu_struc_aplic in vd_i_afw_12_struc_aplic.seqnc%type)
    return varchar2;
end afw_12_struc_aplic_pkg;
/
