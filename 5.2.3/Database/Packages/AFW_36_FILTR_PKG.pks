SET DEFINE OFF;
create or replace package afw_36_filtr_pkg
as
  --'P' || afw_08_url_pkg.knu_app_id || '_AFW_36_VUE_AFICH'
  --'P' || afw_08_url_pkg.knu_app_id || '_AFW_36_FILTR_PAGE'

  procedure initl_contx;

  procedure ajout_filtr (pnu_atrib   in number
                        ,pnu_opert   in number
                        ,pva_valr1      varchar2
                        ,pva_valr2      varchar2);

  procedure suprm_filtr (pnu_seqnc in number);

  procedure specf_tri (pnu_atrib in number);

  procedure initl_sql;
end afw_36_filtr_pkg;
/
