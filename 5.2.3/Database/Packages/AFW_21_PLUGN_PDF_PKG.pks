SET DEFINE OFF;
create or replace package afw_21_plugn_pdf_pkg
is
  procedure genrt_plugn_regn_pdf (pva_regn_statc_id   in varchar2
                                 ,pva_pdf_url         in varchar2);

  function obten_plugn_regn_pdf_html (pva_regn_statc_id   in varchar2
                                     ,pva_pdf_url         in varchar2)
    return varchar2;
end afw_21_plugn_pdf_pkg;
/
