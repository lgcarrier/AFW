SET DEFINE OFF;
create or replace package body afw_25_appel_raprt_apex_pkg
as
  --NOTE: Ajouter parametres pour serveur et port de telechargement du rapport
  --      puisque l'appel depuis le client et le serveur BD peuvent etre differents

  procedure exect_raprt (pva_indic_secrs      varchar2
                        ,pva_servr            varchar2
                        ,pnu_port             number
                        ,pva_chemn            varchar2
                        ,pva_parmt            varchar2
                        ,pva_faml_motr     in varchar2 default 'reports')
  is
    vva_prefx_url   varchar2 (2000);
    vva_url         varchar2 (2000);
    vnu_pos         number;
    vnu_id_raprt    number;
    vnu_code_stat   number default 1;

    vre_reqt        utl_http.req;
    vre_repns       utl_http.resp;
    vva_ligne       varchar2 (2000);
    vnu_compt       number;
  begin
    -- Etape 1. Construire l'URL pour commander l'execution
    vva_prefx_url      :=
         'http'
      || case when pva_indic_secrs = 'O' then 's' else null end
      || '://'
      || pva_servr
      || ':'
      || nvl (pnu_port, 80)
      || pva_chemn;

    vva_url      :=
         vva_prefx_url
      || '?background=yes&statusformat=xml&'
      || pva_parmt;

    -- Etape 2. Demarrer l'execution
    begin
      vre_reqt    := utl_http.begin_request (vva_url);
      utl_http.set_header (vre_reqt
                          ,'User-Agent'
                          ,'Oracle UTL_HTTP');

      vre_repns   := utl_http.get_response (vre_reqt);

      loop
        utl_http.read_line (vre_repns
                           ,vva_ligne
                           ,true);

        vnu_pos      :=
          instr (vva_ligne
                ,'<job id="');

        if vnu_pos > 0
        then
          vnu_id_raprt      :=
            substr (vva_ligne
                   ,vnu_pos + 9
                   ,  instr (vva_ligne
                            ,'"'
                            ,1
                            ,2)
                    - (vnu_pos + 9));
        end if;
      end loop;

      utl_http.end_response (vre_repns);
    exception
      when utl_http.end_of_body
      then
        utl_http.end_response (vre_repns);
    end;

    if vnu_id_raprt is null
    then
      raise_application_error (-20501
                              ,'Erreur au demarrage du rapport');
    end if;

    -- Etape 3. Verifier le statut de l'execution
    vva_url      :=
         vva_prefx_url
      || '/showjobid'
      || vnu_id_raprt
      || '?statusformat=xml';

    vnu_compt   := 0;

    while     vnu_code_stat > 0
          and vnu_code_stat < 4
    loop
      dbms_lock.sleep (1); -- Pause de 1/10 de seconde

      begin
        vre_reqt        := utl_http.begin_request (vva_url);
        utl_http.set_header (vre_reqt
                            ,'User-Agent'
                            ,'Oracle UTL_HTTP');

        vre_repns       := utl_http.get_response (vre_reqt);
        vnu_code_stat   := 0;

        loop
          utl_http.read_line (vre_repns
                             ,vva_ligne
                             ,true);

          vnu_pos      :=
            instr (vva_ligne
                  ,'<status code="');

          if vnu_pos > 0
          then
            vnu_code_stat      :=
              substr (vva_ligne
                     ,vnu_pos + 14
                     ,  instr (vva_ligne
                              ,'"'
                              ,1
                              ,2)
                      - (vnu_pos + 14));
          end if;
        end loop;

        utl_http.end_response (vre_repns);
      exception
        when utl_http.end_of_body
        then
          utl_http.end_response (vre_repns);
      end;

      vnu_compt   := vnu_compt + 1;
    end loop;

    if vnu_code_stat = 4
    then
      -- Etape 4. Transmettre l'adresse du rapport produit
      vva_url      :=
           vva_prefx_url
        || '/getjobid'
        || vnu_id_raprt;
      /*owa_util.redirect_url (vva_url);
      afw_07_util_pkg.aret_trait_page_apex;*/

      afw_07_util_pkg.defnr_etat_sessn ('A_AFW_25_URL_RAPRT'
                                       ,vva_url);
    elsif vnu_code_stat = 5
    then
      raise_application_error (-20502
                              ,'Le rapport a termine en echec.');
    else
      raise_application_error (-20503
                              ,   'Erreur a la verification du statut du rapport: '
                               || vnu_code_stat);
    end if;
  end exect_raprt;

  /*procedure genr_script_popup_raprt is
  begin
    --a = horizontal
    --e = vertical
    htp.prn('
    <script>
  $().ready(function(){
    html_PopUp("' ||
            afw_07_util_pkg.v ('A_AFW_25_URL_RAPRT') ||
            '","_blank","800","600");
  });
</script>');
    afw_07_util_pkg.defnr_etat_sessn ('A_AFW_25_URL_RAPRT',
                                      null);
  end genr_script_popup_raprt;*/

  procedure genr_script_popup_raprt
  is
  begin
    --a = horizontal
    --e = vertical
    htp.prn (   '
    <script>
  $().ready(function(){
    document.location.href = "'
             || afw_07_util_pkg.v ('A_AFW_25_URL_RAPRT')
             || '";
  });
</script>'    );
    afw_07_util_pkg.defnr_etat_sessn ('A_AFW_25_URL_RAPRT'
                                     ,null);
  end genr_script_popup_raprt;

  procedure defnr_url_impre (pnu_page    in number
                            ,pva_reqst   in varchar2)
  is
  begin
    afw_07_util_pkg.defnr_etat_sessn ('A_AFW_25_URL_RAPRT'
                                     ,aa.do_substitutions (   'f?p=&APP_ID.:'
                                                           || pnu_page
                                                           || ':&SESSION.:'
                                                           || pva_reqst
                                                           || ':::SIDF:&SIDF.'));
  end defnr_url_impre;

  procedure obten_raprt_pdf (pva_nom_raprt    in varchar2
                            ,pva_nom_parmt1   in varchar2
                            ,pnu_parmt1       in number)
  is
    vva_prefx_url    varchar2 (2000);
    vva_url          varchar2 (2000);
    vnu_pos          number;
    vnu_id_raprt     number;
    vnu_code_stat    number default 1;

    vre_reqt         utl_http.req;
    vre_repns        utl_http.resp;
    vva_ligne        varchar2 (2000);
    vnu_compt        number;
    vbl_raprt        blob;
    vra_morc_raprt   raw (2000);
  begin
    -- Etape 1. Construire l'URL pour commander l'execution
    vva_url   := 'http://192.168.1.62:8080/birt-viewer/run?__report=report\test.rptdesign&__format=pdf';

    -- Etape 2. Demarrer l'execution
    dbms_lob.createtemporary (vbl_raprt
                             ,true);

    begin
      vre_reqt   := utl_http.begin_request (vva_url);
      utl_http.set_header (vre_reqt
                          ,'User-Agent'
                          ,'Oracle UTL_HTTP');


      loop
        utl_http.read_raw (vre_repns
                          ,vra_morc_raprt
                          ,1000);
        dbms_lob.writeappend (vbl_raprt
                             ,utl_raw.length (vra_morc_raprt)
                             ,vra_morc_raprt);
      end loop;
    exception
      when utl_http.end_of_body
      then
        utl_http.end_response (vre_repns);
    end;


    -- Etape 3. Verifier le statut de l'execution
    --afw_07_util_pkg.aret_trait_page_apex;
    owa_util.mime_header ('application/pdf'
                         ,false);
    htp.p (   'Content-length: '
           || dbms_lob.getlength (vbl_raprt));
    htp.p ('Content-Disposition: attachment; filename="test1.pdf"');

    owa_util.http_header_close;

    wpg_docload.download_file (vbl_raprt);
  --dbms_lob.freetemporary(vbl_raprt);
  /*
      if vnu_code_stat = 4 then
        -- Etape 4. Transmettre l'adresse du rapport produit
        vva_url := vva_prefx_url || '/getjobid' || vnu_id_raprt;
        /*owa_util.redirect_url (vva_url);
        afw_07_util_pkg.aret_trait_page_apex;*/
                                                   /*

  afw_07_util_pkg.defnr_etat_sessn ('A_AFW_25_URL_RAPRT',
                                    vva_url);
elsif vnu_code_stat = 5 then
  raise_application_error (-20502,
                           'Le rapport a termine en echec.');
else
  raise_application_error (-20503,
                           'Erreur a la verification du statut du rapport: ' || vnu_code_stat);
end if;*/

  exception
    when others
    then
      raise;
  end obten_raprt_pdf;
end afw_25_appel_raprt_apex_pkg;
/
