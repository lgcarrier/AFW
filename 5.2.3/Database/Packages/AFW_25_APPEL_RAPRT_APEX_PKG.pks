SET DEFINE OFF;
create or replace package afw_25_appel_raprt_apex_pkg
as
  procedure exect_raprt (pva_indic_secrs      varchar2
                        , -- 'O' = https, 'N' = http
                         pva_servr            varchar2
                        , -- Nom du serveur (ex: www.domaine.com)
                         pnu_port             number
                        , -- Port (null = 80)
                         pva_chemn            varchar2
                        , -- /reports/rwservlet
                         pva_parmt            varchar2
                        , -- Tous les paramètres, incluant userid
                         pva_faml_motr     in varchar2 default 'reports');

  procedure defnr_url_impre (pnu_page    in number
                            ,pva_reqst   in varchar2);

  procedure obten_raprt_pdf (pva_nom_raprt    in varchar2
                            ,pva_nom_parmt1   in varchar2
                            ,pnu_parmt1       in number);
end afw_25_appel_raprt_apex_pkg;
/
