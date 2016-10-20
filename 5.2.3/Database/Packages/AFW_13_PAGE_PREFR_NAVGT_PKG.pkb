SET DEFINE OFF;
create or replace package body afw_13_page_prefr_navgt_pkg
as
  procedure ajout_prefr_navgt (pnu_page      in number
                              ,pnu_page_ir   in number)
  is
  begin
    insert into vd_i_afw_13_page_prefr_navgt (ref_page
                                             ,ref_page_ir)
         values (pnu_page
                ,pnu_page_ir);
  end ajout_prefr_navgt;

  procedure suprm_prefr_navgt (pnu_seqnc in number)
  is
  begin
    delete from vd_i_afw_13_page_prefr_navgt
          where seqnc = pnu_seqnc;
  end suprm_prefr_navgt;
end afw_13_page_prefr_navgt_pkg;
/
