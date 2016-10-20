SET DEFINE OFF;
create or replace package afw_12_tutrl_pkg
as
  /******************************************************************************
     NAME:       AFW_12_TUTRL_PKG
     PURPOSE:

     REVISIONS:
     Ver        Date        Author           Description
     ---------  ----------  ---------------  ------------------------------------
     1.0        2014-10-20      sylvain.michaud       1. Created this package.
  ******************************************************************************/
  type gty_parmt_tutrl is record
  (
    seqnc             vd_i_afw_12_tutrl.seqnc%type
   ,ref_tutrl         vd_i_afw_12_tutrl.ref_tutrl%type
   ,ref_etape_tutrl   vd_i_afw_12_tutrl.ref_etape_tutrl%type
   ,ref_utils         vd_i_afw_12_tutrl.ref_utils%type
  );

  function exist_cedl (pnu_page    in vd_afw_13_page.seqnc%type
                      ,pnu_utils   in vd_afw_12_utils.seqnc%type)
    return boolean;

  function obten_cedl_tutrl (pnu_page    in vd_afw_13_page.seqnc%type
                            ,pnu_utils   in vd_afw_12_utils.seqnc%type)
    return gty_parmt_tutrl;

  procedure defnr_cedl (pnu_tutrl               in vd_afw_13_tutrl.seqnc%type
                       ,pnu_ordre_etape_tutrl   in vd_afw_13_etape_tutrl.ordre_presn%type
                       ,pnu_utils               in vd_afw_12_utils.seqnc%type);

  procedure suprm_cedl_tutrl (pnu_tutrl   in vd_afw_13_tutrl.seqnc%type
                             ,pnu_utils   in vd_afw_12_utils.seqnc%type);

  procedure ajout (pnu_tutrl         in vd_afw_13_tutrl.seqnc%type
                  ,pnu_etape_tutrl   in vd_afw_13_etape_tutrl.seqnc%type
                  ,pnu_utils         in vd_afw_12_utils.seqnc%type);
end afw_12_tutrl_pkg;
/
