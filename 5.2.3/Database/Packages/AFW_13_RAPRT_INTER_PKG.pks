SET DEFINE OFF;
create or replace package afw_13_raprt_inter_pkg
is
  type typ_seqnc_reprt_courn is table of number (10);

  type rec_page_ir_filtr is record
  (
    coln         varchar2 (30)
   ,code_filtr   varchar2 (23)
   ,valr         varchar2 (100)
  );

  type typ_page_ir_filtr is table of rec_page_ir_filtr;

  function obten_ir_page (pnu_numr_page       number default null
                         ,pva_code         in varchar2 default null
                         ,pnu_numr_aplic      number default null)
    return number;

  function obten_selct_ir (pnu_ir_id in number)
    return clob;

  function obten_selct_rpts (pnu_rpts_id          in number
                            ,pbo_inclu_order_by   in boolean default true
                            ,pva_coln_selct       in varchar2 default null)
    return clob;

  function obten_selct_rpts_base_id (pnu_base_report_id in number)
    return clob;

  function obten_repts_courn (pnu_numr_page_apex    in number default null
                             ,pva_code              in varchar2 default null
                             ,pnu_numr_aplic_apex      number default null)
    return number;

  function obten_works_id (pnu_app_id        in number default afw_07_util_pkg.nv ('APP_ID')
                          ,pnu_app_page_id   in number default afw_07_util_pkg.nv ('APP_PAGE_ID')
                          ,pva_code          in varchar2 default null)
    return number;

  function obten_seqnc_raprt_courn (pnu_numr_page_apex    in number default null
                                   ,pva_code              in varchar2 default null
                                   ,pnu_numr_aplic_apex      number default null)
    return typ_seqnc_reprt_courn
    pipelined;

  function genr_url_filtr (pnu_page_ir         in vd_afw_13_page_ir.seqnc%type
                          ,pty_page_ir_filtr   in typ_page_ir_filtr
                          ,pnu_page_ir_sauvg   in number default null)
    return varchar2;
end afw_13_raprt_inter_pkg;
/
