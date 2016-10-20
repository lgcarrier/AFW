SET DEFINE OFF;
create or replace package body afw_15_robot_pkg
is
  procedure extra_contn (pva_selct                 in varchar2
                        ,pnu_clob_index_csv_file   in afw_07_clob_pkg.typ_index)
  is
    vcl_page_html          clob;
    vnu_debut              number;
    vnu_fin                number;
    vcl_contn              clob;
    vnu_clob_index_contn   afw_07_clob_pkg.typ_index;
  begin
    vnu_clob_index_contn   := afw_07_clob_pkg.creer_nouv ();

    vcl_page_html          := afw_07_clob_pkg.obten (pnu_clob_index_csv_file);

    vnu_debut              :=
      dbms_lob.instr (vcl_page_html
                     ,'<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF">'
                     ,1
                     ,1);

    vnu_fin                :=
      dbms_lob.instr (vcl_page_html
                     ,   '</table>'
                      || chr (10)
                      || '</td>'
                     ,1
                     ,1);

    vcl_contn              :=
      afw_07_clob_pkg.extra_clob (vcl_page_html
                                 ,vnu_debut
                                 ,vnu_fin);

    ete ('contn page'
        ,pcl_clob   => vcl_contn);
  end extra_contn;

  procedure obten_page_html (pva_url in varchar2)
  is
    req                       utl_http.req;
    resp                      utl_http.resp;
    pva_ligne                 varchar2 (1024);

    vnu_clob_index_csv_file   afw_07_clob_pkg.typ_index;
  begin
    vnu_clob_index_csv_file   := afw_07_clob_pkg.creer_nouv ();

    --Catégorie Moustique AA
    req                       := utl_http.begin_request (pva_url);
    --utl_http.set_header (req, 'User-Agent', 'Mozilla/4.0');
    resp                      := utl_http.get_response (req);

    loop
      utl_http.read_line (resp
                         ,pva_ligne
                         ,true);
      dbms_output.put_line (pva_ligne);

      afw_07_clob_pkg.ajout_ligne (pva_ligne
                                  ,vnu_clob_index_csv_file);
    end loop;

    utl_http.end_response (resp);

    ete ('page html'
        ,pcl_clob   => afw_07_clob_pkg.obten (vnu_clob_index_csv_file));
  exception
    when utl_http.end_of_body
    then
      ete ('page html'
          ,pcl_clob   => afw_07_clob_pkg.obten (vnu_clob_index_csv_file));

      utl_http.end_response (resp);

      extra_contn (''
                  ,vnu_clob_index_csv_file);
  end obten_page_html;
end afw_15_robot_pkg;
/
