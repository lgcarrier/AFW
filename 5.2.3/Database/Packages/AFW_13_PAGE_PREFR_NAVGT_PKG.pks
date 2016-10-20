SET DEFINE OFF;
create or replace package afw_13_page_prefr_navgt_pkg
as
  procedure ajout_prefr_navgt (pnu_page      in number
                              ,pnu_page_ir   in number);

  procedure suprm_prefr_navgt (pnu_seqnc in number);
end afw_13_page_prefr_navgt_pkg;
/
