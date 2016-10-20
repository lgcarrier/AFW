SET DEFINE OFF;
create or replace package afw_29_asurn_qualt_pkg
as
  procedure exect_reqt (pva_liste_contrl   in varchar2
                       ,pnu_page           in number default null);
end afw_29_asurn_qualt_pkg;
/
