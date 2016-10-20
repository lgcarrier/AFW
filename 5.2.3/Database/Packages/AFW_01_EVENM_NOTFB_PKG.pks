SET DEFINE OFF;
create or replace package afw_01_evenm_notfb_pkg
as
  procedure verfr_presn_doubl_aplic (pnu_evenm_notfb in number);

  function verfr_presn_doubl (pnu_hierc_aplic in number)
    return boolean;

  procedure ajout_confg_en_domn (pnu_domn_confg_en   in number
                                ,pnu_domn_cible      in number);
end afw_01_evenm_notfb_pkg;
/
