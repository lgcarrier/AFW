SET DEFINE OFF;
create or replace package afw_13_navgt_pkg
  authid current_user
as
  type typ_rec_elemn is record
  (
    rn            number (10)
   ,seqnc         number (10)
   ,indic_courn   varchar2 (1)
  );

  type typ_tab_navgt_elemt is table of typ_rec_elemn;

  function obten_rang
    return typ_tab_navgt_elemt
    pipelined;

  function obten_tout_rang
    return typ_tab_navgt_elemt
    pipelined;

  function obten_sspc (pnu_ofset        in number default 1
                      ,pbo_enreg_limt   in boolean default false)
    return number;

  function obten_valr_formt (pnu_seqnc_elemn in number)
    return varchar2;

  function obten_url_suivn
    return varchar2;

  function obten_url_precd
    return varchar2;

  function obten_url_dernr (pva_indic_extra_termn in varchar2)
    return varchar2;

  function obten_url_premr
    return varchar2;

  procedure initl_navgt (pva_sql in varchar2 default null);

  procedure defnr_contx_navgt;

  function obten_numr_courn
    return number;

  procedure obten_premr_enreg;

  procedure obten_dernr_enreg;

  function verfr_presn_navgt
    return boolean;

  function formt_filtr_varch (pva_coln   in varchar2
                             ,pva_valr   in varchar2)
    return varchar2;

  function formt_filtr_numbr (pva_coln    in varchar2
                             ,pva_valr    in varchar2
                             ,pva_formt   in varchar2 default null)
    return varchar2;

  function formt_filtr_date (pva_coln    in varchar2
                            ,pva_valr    in varchar2
                            ,pva_formt   in varchar2 default null)
    return varchar2;

  procedure ajout_filtr_rechr (pva_nouv_filtr         in varchar2
                              ,pbo_rempl_filtr_auto   in boolean default false);

  procedure trait_mode_rechr;

  function est_en_mode_rechr
    return boolean;

  function est_en_mode_rechr_va
    return varchar2;

  procedure script_mode_rechr;

  procedure efect_rechr;
--procedure acept_rechr;

end afw_13_navgt_pkg;
/
