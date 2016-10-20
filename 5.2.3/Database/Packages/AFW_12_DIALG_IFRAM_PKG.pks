SET DEFINE OFF;
create or replace package afw_12_dialg_ifram_pkg
is
  procedure ouvri_dialg (pnu_numr_apex_actio_dynmq   in number
                        ,pnu_numr_apex_aplic         in number
                        ,pnu_numr_apex_page          in number);

  procedure defnr_item_cle_etran (pnu_numr_apex_actio_dynmq   in number
                                 ,pva_item_cle_etran          in varchar2);

  function obten_item_cle_etran (pnu_numr_apex_actio_dynmq in number)
    return varchar2;

  function obten_dialg_ouver
    return number;

  function valdr_dialg_ouvert
    return boolean;

  procedure fermr_dialg_ouver;

  procedure suprm_dialg_sesn (pnu_sesn in number default afw_12_sesn_pkg.obten_sesn);
end afw_12_dialg_ifram_pkg;
/
