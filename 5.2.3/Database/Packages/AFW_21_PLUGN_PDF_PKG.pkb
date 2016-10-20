SET DEFINE OFF;
create or replace package body afw_21_plugn_pdf_pkg
is
  procedure genrt_plugn_regn_pdf (pva_regn_statc_id   in varchar2
                                 ,pva_pdf_url         in varchar2)
  is
  begin
    --Ajout de la section.
    afw_15_htp_pkg.ecrir (obten_plugn_regn_pdf_html (pva_regn_statc_id
                                                    ,pva_pdf_url));
  end genrt_plugn_regn_pdf;

  function obten_plugn_regn_pdf_html (pva_regn_statc_id   in varchar2
                                     ,pva_pdf_url         in varchar2)
    return varchar2
  is
    pva_ifram_url   varchar2 (1000)
                      :=    afw_11_prodt_pkg.obten_dosr_fichr_afw
                         || 'assets/plugins/pdfjs/1.0.712/web/viewer.html?file=';
    vva_reslt       varchar2 (5000);
  begin
    --Ajout de la section.
    vva_reslt      :=
      afw_15_htp_pkg.ouvri_bals ('iframe'
                                ,'id'
                                ,   'pdf_'
                                 || pva_regn_statc_id
                                ,'class'
                                ,'pdf-viewer'
                                ,'src'
                                ,   pva_ifram_url
                                 || pva_pdf_url);
    vva_reslt      :=
         vva_reslt
      || afw_15_htp_pkg.fermr_bals ('iframe');

    return vva_reslt;
  end;
end afw_21_plugn_pdf_pkg;
/
