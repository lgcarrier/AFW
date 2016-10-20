SET DEFINE OFF;
create or replace package afw_07_sql_noyau_pkg
as
  procedure obten_infor_coln_ir (pnu_ref_ir    in     number
                                ,pnu_rpts_id   in     number
                                ,pic_infor     in out afw_07_sql_pkg.typ_rec_infor_coln);
end afw_07_sql_noyau_pkg;
/
