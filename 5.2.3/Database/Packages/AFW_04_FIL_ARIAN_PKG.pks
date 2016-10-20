SET DEFINE OFF;
create or replace package afw_04_fil_arian_pkg
as
  gnu_fa_page_inter   number (10);

  function obten_dernr_page
    return number;

  function trait_page (pnu_page_id in number default null)
    return boolean;

  function obten_seqnc_fa_de_page_dest (pnu_page_dest     in number
                                       ,pnu_aplic_dest    in number default afw_07_polc_pkg.obten_valr_contx_numr_aplic
                                       ,pnu_seqnc_deprt   in number default null)
    return number;

  procedure synch_varbl (pbo_sur_soums   in boolean default false
                        ,pnu_fa_courn    in number default afw_07_polc_pkg.obten_valr_contx_sidf);

  procedure synch;

  procedure persn (pva_titre_persn   in varchar2
                  ,pnu_index         in number default 0);

  --deprecated USE AFW_04_FIL_ARIAN_CU_PKG
  function afich (pbo_regrp_menu in boolean default false)
    return clob;

  procedure suprm_elemn_apres (pnu_seqnc_a_partr_de number);

  procedure synch_login;

  function est_valid_sidf (pbo_postn   in boolean default false
                          ,pnu_fa      in number default null)
    return boolean;

  function obten_fa_courn
    return number;

  procedure migr_sesn (pnu_ancn_sesn    in number
                      ,pnu_nouvl_sesn   in number);

  function obten_url_fa (pnu_seqnc_fa          in vd_afw_04_fil_arian.seqnc%type
                        ,pva_indic_mesg_sucs   in varchar2 default 'N')
    return varchar2;

  --deprecated
  procedure suprm_elemn_apres_courn;
end afw_04_fil_arian_pkg;
/
