SET DEFINE OFF;
create or replace package body afw_08_url_pkg
as
  procedure redrg_page_postn (pva_url in varchar2)
  is
  begin
    owa_util.redirect_url (pva_url);
    afw_07_util_pkg.aret_trait_page_apex;
  end;

  procedure redrg_page_rendr (pva_url in varchar2)
  is
  begin
    htp.p (   ' <script type="text/javascript">
          <!-- Rediriger
          self.location.href="'
           || pva_url
           || '";
          //--></script>');
    afw_07_util_pkg.aret_trait_page_apex;
  end redrg_page_rendr;

  procedure redrg_page_acuei_postn
  is
  begin
    --Todo - Vérifier que la page d'accueil n'est pas la 0, si c'est le cas, remonter à la page d'accueil spécifiée au système, sinon, page de login de l'application en cours.
    redrg_page_postn (   'f?p='
                      || afw_11_prodt_pkg.obten_numr_apex_aplic_acuei
                      || ':'
                      || afw_11_prodt_pkg.obten_numr_apex_page_acuei
                      || ':'
                      || afw_12_sesn_pkg.obten_sesn);
  end redrg_page_acuei_postn;

  procedure redrg_page_acuei_rendr
  is
  begin
    --    redrg_page_rendr (   'f?p='
    --                      || afw_11_prodt_pkg.obten_numr_apex_aplic_acuei
    --                      || ':'
    --                      || afw_11_prodt_pkg.obten_numr_apex_page_acuei
    --                      || ':'
    --                      || afw_12_sesn_pkg.obten_sesn);

    redrg_page_postn (   'f?p='
                      || afw_11_prodt_pkg.obten_numr_apex_aplic_acuei
                      || ':'
                      || afw_11_prodt_pkg.obten_numr_apex_page_acuei
                      || ':'
                      || afw_12_sesn_pkg.obten_sesn);
  end redrg_page_acuei_rendr;

  procedure redrg_page_conxn_rendr
  is
  begin
    --    redrg_page_rendr (afw_11_prodt_pkg.obten_url_authe_cible_sesn);

    redrg_page_postn (afw_11_prodt_pkg.obten_url_authe_cible_sesn);
  end redrg_page_conxn_rendr;

  procedure redrg_navgt_ilegl
  is
  begin
    if afw_12_dialg_ifram_pkg.valdr_dialg_ouvert
    then
      afw_12_dialg_ifram_pkg.suprm_dialg_sesn;
      afw_21_plugn_dialg_ifram_pkg.redrg_page_acuei_js;
    else
      if afw_12_utils_pkg.obten_usagr_conct is not null
      then
        redrg_page_acuei_rendr;
      else
        redrg_page_conxn_rendr;
      end if;
    end if;
  end redrg_navgt_ilegl;

  function genr_url (pnu_numr_aplic              in number default afw_11_aplic_pkg.obten_numr_apex_aplic
                    ,pnu_numr_page               in number default afw_13_page_pkg.obten_numr_apex_page
                    ,pva_nom_varbl_1             in varchar2 default null
                    ,pva_valr_varbl_1            in varchar2 default null
                    ,pva_nom_varbl_2             in varchar2 default null
                    ,pva_valr_varbl_2            in varchar2 default null
                    ,pva_nom_varbl_3             in varchar2 default null
                    ,pva_valr_varbl_3            in varchar2 default null
                    ,pva_nom_varbl_4             in varchar2 default null
                    ,pva_valr_varbl_4            in varchar2 default null
                    ,pva_nom_varbl_5             in varchar2 default null
                    ,pva_valr_varbl_5            in varchar2 default null
                    ,pva_nom_varbl_6             in varchar2 default null
                    ,pva_valr_varbl_6            in varchar2 default null
                    ,pva_nom_varbl_7             in varchar2 default null
                    ,pva_valr_varbl_7            in varchar2 default null
                    ,pva_nom_varbl_8             in varchar2 default null
                    ,pva_valr_varbl_8            in varchar2 default null
                    ,pva_nom_varbl_9             in varchar2 default null
                    ,pva_valr_varbl_9            in varchar2 default null
                    ,pva_nom_varbl_10            in varchar2 default null
                    ,pva_valr_varbl_10           in varchar2 default null
                    ,pva_sesn                    in varchar2 default null
                    ,pva_optio_reqst             in varchar2 default null
                    ,pva_optio_clear_page        in varchar2 default null
                    ,pva_mode_debg               in varchar2 default 'NO'
                    ,pva_indic_afich_valr_sesn   in varchar2 default 'O')
    return varchar2
  is
    vva_url_const    varchar2 (5000) default 'f?p=';
    vva_list_parmt   varchar2 (2000);
    vva_list_valr    varchar2 (2000);
  begin
    -- Ajouter les numeros d'application de page
    vva_url_const      :=
         vva_url_const
      || pnu_numr_aplic
      || ':'
      || pnu_numr_page;

    -- Ajouter le numero de session et des parametres constants
    vva_url_const      :=
         vva_url_const
      || ':'
      || case pva_indic_afich_valr_sesn when 'O' then nvl (pva_sesn, afw_12_sesn_pkg.obten_sesn) else null end
      || ':%OPT_REQ%:'
      || pva_mode_debg
      || ':%OPT_CLR%:';
    vva_url_const      :=
      replace (vva_url_const
              ,'%OPT_REQ%'
              ,pva_optio_reqst);
    vva_url_const      :=
      replace (vva_url_const
              ,'%OPT_CLR%'
              ,pva_optio_clear_page);

    -- Construire la liste des variables
    if pva_nom_varbl_1 is not null
    then
      vva_list_parmt      :=
           vva_list_parmt
        || ','
        || apex_util.url_encode (pva_nom_varbl_1);

      if pva_valr_varbl_1 != '#SIDF#'
      then
        vva_list_valr      :=
             vva_list_valr
          || ','
          || apex_util.url_encode (pva_valr_varbl_1);
      else
        vva_list_valr      :=
             vva_list_valr
          || ','
          || pva_valr_varbl_1;
      end if;
    end if;

    if pva_nom_varbl_2 is not null
    then
      vva_list_parmt      :=
           vva_list_parmt
        || ','
        || apex_util.url_encode (pva_nom_varbl_2);
      vva_list_valr      :=
           vva_list_valr
        || ','
        || apex_util.url_encode (pva_valr_varbl_2);
    end if;

    if pva_nom_varbl_3 is not null
    then
      vva_list_parmt      :=
           vva_list_parmt
        || ','
        || apex_util.url_encode (pva_nom_varbl_3);
      vva_list_valr      :=
           vva_list_valr
        || ','
        || apex_util.url_encode (pva_valr_varbl_3);
    end if;

    if pva_nom_varbl_4 is not null
    then
      vva_list_parmt      :=
           vva_list_parmt
        || ','
        || apex_util.url_encode (pva_nom_varbl_4);
      vva_list_valr      :=
           vva_list_valr
        || ','
        || apex_util.url_encode (pva_valr_varbl_4);
    end if;

    if pva_nom_varbl_5 is not null
    then
      vva_list_parmt      :=
           vva_list_parmt
        || ','
        || apex_util.url_encode (pva_nom_varbl_5);
      vva_list_valr      :=
           vva_list_valr
        || ','
        || apex_util.url_encode (pva_valr_varbl_5);
    end if;

    if pva_nom_varbl_6 is not null
    then
      vva_list_parmt      :=
           vva_list_parmt
        || ','
        || apex_util.url_encode (pva_nom_varbl_6);
      vva_list_valr      :=
           vva_list_valr
        || ','
        || apex_util.url_encode (pva_valr_varbl_6);
    end if;

    if pva_nom_varbl_7 is not null
    then
      vva_list_parmt      :=
           vva_list_parmt
        || ','
        || apex_util.url_encode (pva_nom_varbl_7);
      vva_list_valr      :=
           vva_list_valr
        || ','
        || apex_util.url_encode (pva_valr_varbl_7);
    end if;

    if pva_nom_varbl_8 is not null
    then
      vva_list_parmt      :=
           vva_list_parmt
        || ','
        || apex_util.url_encode (pva_nom_varbl_8);
      vva_list_valr      :=
           vva_list_valr
        || ','
        || apex_util.url_encode (pva_valr_varbl_8);
    end if;

    if pva_nom_varbl_9 is not null
    then
      vva_list_parmt      :=
           vva_list_parmt
        || ','
        || apex_util.url_encode (pva_nom_varbl_9);
      vva_list_valr      :=
           vva_list_valr
        || ','
        || apex_util.url_encode (pva_valr_varbl_9);
    end if;

    if pva_nom_varbl_10 is not null
    then
      vva_list_parmt      :=
           vva_list_parmt
        || ','
        || apex_util.url_encode (pva_nom_varbl_10);
      vva_list_valr      :=
           vva_list_valr
        || ','
        || apex_util.url_encode (pva_valr_varbl_10);
    end if;

    -- Retirer le premier caractere superflu
    if vva_list_parmt is not null
    then
      vva_list_parmt      :=
        substr (vva_list_parmt
               ,2);
    end if;

    if vva_list_valr is not null
    then
      vva_list_valr      :=
        substr (vva_list_valr
               ,2);
    end if;

    -- Ajouter la liste des variables a l'URL
    vva_url_const      :=
         vva_url_const
      || vva_list_parmt
      || ':'
      || vva_list_valr;

    --return apex_util.prepare_url (vva_url_const);
    return vva_url_const;
  end genr_url;

  function genr_url_en_contx (pnu_numr_aplic            number default afw_11_aplic_pkg.obten_numr_apex_aplic
                             ,pnu_numr_page             number default afw_13_page_pkg.obten_numr_apex_page
                             ,pva_sesn                  varchar2 default afw_12_sesn_pkg.obten_sesn
                             ,pva_optio_reqst        in varchar2 default null
                             ,pva_mode_debg          in varchar2 default 'NO'
                             ,pva_optio_clear_page   in varchar2 default null
                             ,pva_sidf                  varchar2 default null
                             ,pnu_sspc                  number default null
                             ,pva_sapc                  varchar2 default null
                             ,pva_scpc                  varchar2 default null
                             ,pnu_sspi                  number default null
                             ,pva_sapi                  varchar2 default null
                             ,pva_scpi                  varchar2 default null
                             ,pnu_snpi                  number default null)
    return varchar2
  is
  begin
    return genr_url (pnu_numr_aplic         => pnu_numr_aplic
                    ,pnu_numr_page          => pnu_numr_page
                    ,pva_nom_varbl_1        => 'SIDF'
                    ,pva_valr_varbl_1       => pva_sidf
                    ,pva_nom_varbl_2        => 'SSPC'
                    ,pva_valr_varbl_2       => pnu_sspc
                    ,pva_nom_varbl_3        => 'SCPC'
                    ,pva_valr_varbl_3       => pva_scpc
                    ,pva_nom_varbl_4        => 'SAPC'
                    ,pva_valr_varbl_4       => pva_sapc
                    ,pva_nom_varbl_5        => 'SSPI'
                    ,pva_valr_varbl_5       => pnu_sspi
                    ,pva_nom_varbl_6        => 'SCPI'
                    ,pva_valr_varbl_6       => pva_scpi
                    ,pva_nom_varbl_7        => 'SAPI'
                    ,pva_valr_varbl_7       => pva_sapi
                    ,pva_nom_varbl_8        => 'SNPI'
                    ,pva_valr_varbl_8       => pnu_snpi
                    ,pva_sesn               => pva_sesn
                    ,pva_optio_reqst        => pva_optio_reqst
                    ,pva_mode_debg          => pva_mode_debg
                    ,pva_optio_clear_page   => pva_optio_clear_page);
  end;

  procedure decnt_et_redrg_page_login
  is
  begin
    --http://www.oracle.com/technetwork/developer-tools/apex/application-express/apex-423-patch-set-notes-2015119.html#BABBECAH
    /*
    The following logout procedures have been deprecated in the Oracle Application Express 4.2.2.00.11 patch set:
    - APEX_CUSTOM_AUTH.LOGOUT
    - APEX_CUSTOM_AUTH.LOGOUT_THEN_GO_TO_PAGE
    - APEX_CUSTOM_AUTH.LOGOUT_THEN_GO_TO_URL
    */

    apex_authentication.logout (afw_12_sesn_pkg.obten_sesn
                               ,afw_11_aplic_pkg.obten_numr_apex_aplic);

    /*DEPRECATED*/
    --    apex_custom_auth.logout (afw_11_aplic_pkg.obten_numr_apex_aplic,
    --                             afw_11_aplic_pkg.obten_numr_apex_aplic || ':' || afw_11_aplic_pkg.obten_page_conxn);

    afw_07_util_pkg.aret_trait_page_apex;
  end decnt_et_redrg_page_login;

  function genr_do_submt3 (pva_reqst   in varchar2
                          ,pnu_sidf    in number default knu_sidf
                          ,pnu_sspc    in number default null
                          ,pva_sapc    in varchar2 default null
                          ,pnu_sspi    in number default null
                          ,pva_sapi    in varchar2 default null)
    return varchar2
  is
  begin
    return    'javascript:doSubmit3('
           || case
                when pva_reqst is not null
                then
                     ''''
                  || pva_reqst
                  || ''''
                else
                  'null'
              end
           || ',null,'
           || nvl (to_char (pnu_sspc), 'null')
           || ','
           || nvl (pva_sapc, 'null')
           || ','
           || nvl (to_char (pnu_sspi), 'null')
           || ','
           || nvl (pva_sapi, 'null')
           || ');';
  end genr_do_submt3;

  procedure obten_pdf_de_url (pva_url    in            varchar2
                             ,pbo_blob   in out nocopy blob)
  is
    vre_http_reqt    utl_http.req;
    vre_http_repns   utl_http.resp;
    vra_piec         raw (32767);
  begin
    dbms_lob.createtemporary (pbo_blob
                             ,false);

    vre_http_reqt    := utl_http.begin_request (pva_url);
    vre_http_repns   := utl_http.get_response (vre_http_reqt);

    begin
      loop
        utl_http.read_raw (vre_http_repns
                          ,vra_piec
                          ,32767);
        dbms_lob.writeappend (pbo_blob
                             ,utl_raw.length (vra_piec)
                             ,vra_piec);
      end loop;
    exception
      when utl_http.end_of_body
      then
        utl_http.end_response (vre_http_repns);
    end;
  end obten_pdf_de_url;

  function obten_protc_reqt
    return varchar2
  is
  begin
    return owa_util.get_cgi_env ('REQUEST_PROTOCOL');
  end obten_protc_reqt;

  function obten_port_servr
    return number
  is
  begin
    return owa_util.get_cgi_env ('SERVER_PORT');
  end obten_port_servr;

  function obten_host_http
    return varchar2
  is
  begin
    return owa_util.get_cgi_env ('HTTP_HOST');
  end obten_host_http;

  function obten_nom_scrip
    return varchar2
  is
  begin
    return owa_util.get_cgi_env ('SCRIPT_NAME');
  end obten_nom_scrip;

  procedure obten_item_url (pva_url                 in     varchar2 default null
                           ,pvc_liste_item          in out apex_application_global.vc_arr2
                           ,pvc_liste_valeur_item   in out apex_application_global.vc_arr2)
  is
    vva_seprt             varchar2 (1) default ':';
    vvc_liste_sectn_url   apex_application_global.vc_arr2;
    vva_chain             varchar2 (32767);
    vnu_longr             pls_integer;
    vnu_debut             pls_integer;
    vnu_fin               pls_integer;
    vnu_dernr             pls_integer;
    vnu_postn             pls_integer;
    vbo_exist             boolean;
    i                     pls_integer;
    l_delimiter           varchar2 (1);
  begin
    vvc_liste_sectn_url      :=
      wwv_flow_utilities.string_to_table2 (str   => pva_url
                                          ,sep   => nvl (vva_seprt, ':'));

    for i in (vvc_liste_sectn_url.count + 1) .. 9
    loop
      vvc_liste_sectn_url (i)   := null;
    end loop;

    pvc_liste_item      :=
      wwv_flow_utilities.string_to_table2 (str   => upper (vvc_liste_sectn_url (7))
                                          ,sep   => ',');

    if instr (vvc_liste_sectn_url (8)
             ,'\') = 0
    then
      pvc_liste_valeur_item      :=
        wwv_flow_utilities.string_to_table2 (str   => vvc_liste_sectn_url (8)
                                            ,sep   => ',');
    --      cneumuel  10/30/2014 - Removed g_arg_values_delimited, added g_url_checksum_src (bug #17750471)
    --TODO à changer
    --wwv_flow.g_arg_values_delimited   := pvc_liste_valeur_item;
    else
      vva_chain   := vvc_liste_sectn_url (8);
      vnu_longr   := length (vva_chain);
      vnu_dernr   := 0;
      i           := 0;


      if vva_chain is not null
      then
        while (vnu_dernr < vnu_longr)
        loop
          vnu_debut   := vnu_dernr + 1;

          if substr (vva_chain
                    ,vnu_debut
                    ,1) = '\'
          then
            l_delimiter   := '\';


            vnu_debut     := vnu_debut + 1;

            vbo_exist     := false;
            vnu_postn     := vnu_debut;

            while (not vbo_exist)
            loop
              vnu_dernr      :=
                instr (vva_chain
                      ,'\'
                      ,vnu_postn);

              if vnu_dernr = 0
              then
                vbo_exist   := true;
              elsif vnu_dernr = vnu_longr
              then
                vbo_exist   := true;
              elsif substr (vva_chain
                           ,vnu_dernr + 1
                           ,1) = ','
              then
                vbo_exist   := true;
              else
                vnu_postn   := vnu_postn + 1;
              end if;
            end loop;

            if vnu_dernr = 0
            then
              vnu_fin     := vnu_debut;
              vnu_dernr   := vnu_longr;
            else
              vnu_fin   := vnu_dernr - 1;

              if substr (vva_chain
                        ,vnu_dernr + 1
                        ,1) = ','
              then
                vnu_dernr   := vnu_dernr + 1;
              end if;
            end if;
          else
            l_delimiter   := null;

            if substr (vva_chain
                      ,vnu_debut
                      ,1) = ','
            then
              vnu_fin     := vnu_debut - 1;
              vnu_dernr   := vnu_debut;
            elsif instr (vva_chain
                        ,','
                        ,vnu_debut + 1) = 0
            then
              vnu_fin     := vnu_longr;
              vnu_dernr   := vnu_longr;
            else
              vnu_fin      :=
                  instr (vva_chain
                        ,','
                        ,vnu_debut + 1)
                - 1;
              vnu_dernr   := vnu_fin + 1;
            end if;
          end if;

          i           := i + 1;

          if vnu_debut <= vnu_fin
          then
            pvc_liste_valeur_item (i)      :=
              substr (vva_chain
                     ,vnu_debut
                     , (vnu_fin - vnu_debut) + 1);
          else
            pvc_liste_valeur_item (i)   := null;
          end if;
        end loop;
      end if;
    end if;

    for i in pvc_liste_valeur_item.count + 1 .. pvc_liste_item.count
    loop
      pvc_liste_valeur_item (i)   := null;
    end loop;
  end obten_item_url;
end afw_08_url_pkg;
/
