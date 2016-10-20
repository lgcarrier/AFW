SET DEFINE OFF;
create or replace package afw_25_raprt_inter_expor_pkg
  authid current_user
as
  kva_seprt_coln   constant varchar2 (1) default ',';

  gnu_largr_logo            number;
  gbl_logo                  blob;

  procedure afich_pdf (pnu_aplic   in number default afw_07_util_pkg.v ('APP_ID')
                      ,pnu_page    in number default afw_07_util_pkg.v ('APP_PAGE_ID'));

  procedure afich_csv (pnu_aplic        in number default afw_07_util_pkg.v ('APP_ID')
                      ,pnu_page         in number default afw_07_util_pkg.v ('APP_PAGE_ID')
                      ,pva_seprt_coln   in varchar2 default kva_seprt_coln);
end afw_25_raprt_inter_expor_pkg;
/
