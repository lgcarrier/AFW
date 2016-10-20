SET DEFINE OFF;
create or replace package afw_04_histr_navgt_pkg
as
  procedure genr_histr;

  procedure creer_histr_de_page_acuei;

  procedure creer_fil_arian_de_histr (pnu_histr_navgt in number);
end afw_04_histr_navgt_pkg;
/
