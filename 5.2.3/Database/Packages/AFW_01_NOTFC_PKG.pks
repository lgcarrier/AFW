SET DEFINE OFF;
create or replace package afw_01_notfc_pkg
as
  procedure notfc_sms (pnu_config_evenm_notfb   in number
                      ,pta_destn                in afw_01_evenm_notfb_cu_pkg.typ_tab_destn
                      ,pva_mesg                 in varchar2);

  procedure notfc_courl (pnu_config_evenm_notfb   in number
                        ,pta_destn                in afw_01_evenm_notfb_cu_pkg.typ_tab_destn
                        ,pcl_mesg                 in clob
                        ,pva_objet                in varchar2
                        ,pta_piec_joint           in afw_01_evenm_notfb_cu_pkg.typ_tab_piec_joint);
end afw_01_notfc_pkg;
/
