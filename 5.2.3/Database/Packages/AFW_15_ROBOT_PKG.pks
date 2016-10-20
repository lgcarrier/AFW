SET DEFINE OFF;
create or replace package afw_15_robot_pkg
is
  procedure extra_contn (pva_selct                 in varchar2
                        ,pnu_clob_index_csv_file   in afw_07_clob_pkg.typ_index);

  procedure obten_page_html (pva_url in varchar2);
end afw_15_robot_pkg;
/
