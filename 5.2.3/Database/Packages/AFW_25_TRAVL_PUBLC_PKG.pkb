SET DEFINE OFF;
create or replace package body afw_25_travl_publc_pkg
as
  gnu_travl             number (10);
  gnu_publc_travl       number (10);
  gbl_travl_termn       blob;
  gva_mime_type_travl   varchar2 (100);
  gnu_tail_fichr        pls_integer;
  gva_nom_fichr         varchar2 (200);

  procedure maj_stat_travl (pnu_travl   in number
                           ,pnu_stat    in number)
  is
    pragma autonomous_transaction;
  begin
    update vd_i_afw_25_travl
       set ref_stat   = pnu_stat
     where seqnc = pnu_travl;

    commit;
  end maj_stat_travl;

  function exect_raprt_reprt (pva_indic_secrs      varchar2
                             ,pva_servr            varchar2
                             ,pva_parmt            varchar2
                             ,pnu_travl         in number)
    return varchar2
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
      || pva_servr;

    vva_url      :=
         vva_prefx_url
      || '?background=yes&statusformat=xml&'
      || pva_parmt;

    -- Etape 2. Demarrer l'execution
    begin
      begin
        vre_reqt   := utl_http.begin_request (vva_url);
      exception
        when others
        then
          ete ('Erreur'
              ,utl_http.get_detailed_sqlerrm);
          raise;
      end;

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
      maj_stat_travl (pnu_travl
                     ,afw_12_stat_pkg.obten_stat ('TRAVL'
                                                 ,'EREUR'
                                                 ,'AFW'));
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
      maj_stat_travl (pnu_travl
                     ,afw_12_stat_pkg.obten_stat ('TRAVL'
                                                 ,'TERMN'
                                                 ,'AFW'));

      vva_url      :=
           vva_prefx_url
        || '/getjobid'
        || vnu_id_raprt;

      return vva_url;
    elsif vnu_code_stat = 5
    then
      maj_stat_travl (pnu_travl
                     ,afw_12_stat_pkg.obten_stat ('TRAVL'
                                                 ,'EREUR'
                                                 ,'AFW'));
      raise_application_error (-20502
                              ,'Le rapport a termine en echec.');
    else
      maj_stat_travl (pnu_travl
                     ,afw_12_stat_pkg.obten_stat ('TRAVL'
                                                 ,'EREUR'
                                                 ,'AFW'));
      raise_application_error (-20503
                              ,   'Erreur a la verification du statut du rapport: '
                               || vnu_code_stat);
    end if;
  end exect_raprt_reprt;

  procedure lancr_travl (pnu_travl             in number
                        ,pnu_publc_travl       in number
                        ,pnu_formt             in varchar
                        ,pbo_redrg_web_reslt   in boolean default true)
  is
    vva_url_inter        varchar2 (256);
    vva_url_exter        varchar2 (256);
    vnu_engin            number (10);
    vnu_travl_publc      number (10);
    vbo_pdf              blob;
    vbo_pdf_travl        blob;
    vva_url              varchar2 (300);
    vva_imedt            varchar2 (1);
    vva_parmt            varchar2 (4000);
    vva_nom_raprt        varchar2 (60);
    vva_nom_fichr_sort   varchar2 (200);
    vnu_publc            number (10);
    vbo_premr_exect      boolean default true;

    cursor cur_parmt (pnu_publc_travl in number)
    is
      select ppt.ref_code_parmt_tp_formt
            ,coalesce (valr_varch
                      ,to_char (valr_numbr)
                      ,to_char (valr_date))
               valr
        from vd_afw_25_parmt_publc_travl ppt
       where     (ppt.ref_publc_travl = pnu_publc_travl)
             and indic_presn_appel = 'O';

    cursor cur_parmt_engin (pnu_engin in number)
    is
      select code
            ,valr_deft valr
        from vd_i_afw_25_parmt_type_publc
       where     ref_engin = pnu_engin
             and indic_presn_appel = 'O';

    cursor cur_publc_distn
    is
      select distinct pt.ref_versn_publc
                     ,e.code  code_engin
                     ,tp.code code_type_publc
                     ,p.code  code_publc
        from vd_i_afw_25_publc_travl       pt
            ,vd_i_afw_25_engin_versn_publc evp
            ,vd_i_afw_25_engin             e
            ,vd_i_afw_25_versn_publc       vp
            ,vd_i_afw_25_publc             p
            ,vd_afw_25_type_publc          tp
       where     pt.ref_travl = pnu_travl
             and (   pt.seqnc = pnu_publc_travl
                  or pnu_publc_travl is null)
             and evp.ref_engin = e.seqnc
             and evp.ref_versn_publc = pt.ref_versn_publc
             and vp.seqnc = pt.ref_versn_publc
             and vp.ref_publc = p.seqnc
             and p.ref_type_publc = tp.seqnc;

    cursor cur_publc_travl
    is
      select seqnc
        from vd_i_afw_25_publc_travl pt
       where pt.ref_travl = pnu_travl;


    vva_parmt_tp_pd4ml   varchar2 (32767);
  begin
    select t.indic_imedt
      into vva_imedt
      from vd_i_afw_25_travl t
     where t.seqnc = pnu_travl;

    if pnu_formt = 'PDF'
    then
      for rec_publc_distn in cur_publc_distn
      loop
        if rec_publc_distn.code_engin in ('PD4ML'
                                         ,'ORACL_REPRT')
        then
          select e.seqnc
                ,url_servl
                ,e.url_servl url_servl_exter
            into vnu_engin
                ,vva_url_inter
                ,vva_url_exter
            from vd_i_afw_25_engin e
           where e.code = rec_publc_distn.code_engin;
        end if;

        --Obtenir le nom du fichier reports à lancer
        select iden_acces
          into vva_nom_raprt
          from vd_i_afw_25_engin_versn_publc evp
         where evp.ref_versn_publc = rec_publc_distn.ref_versn_publc;

        case
          when rec_publc_distn.code_engin in ('ORACL_REPRT'
                                             ,'PD4ML')
          then
            for rec_parmt in cur_parmt_engin (vnu_engin)
            loop
              if rec_parmt.code = 'PNU_TRAVL'
              then
                vva_parmt      :=
                     vva_parmt
                  || '&'
                  || rec_parmt.code
                  || '='
                  || replace (rec_parmt.valr
                             ,'#SEQNC#'
                             ,pnu_travl);
              elsif rec_parmt.code = 'PNU_PUBLC_TRAVL'
              then
                vva_parmt      :=
                     vva_parmt
                  || '&'
                  || rec_parmt.code
                  || '='
                  || replace (rec_parmt.valr
                             ,'#SEQNC_PUBLC_TRAVL#'
                             ,pnu_publc_travl);
              elsif rec_parmt.code = 'report'
              then
                vva_parmt      :=
                     vva_parmt
                  || '&'
                  || rec_parmt.code
                  || '='
                  || rec_parmt.valr
                  || vva_nom_raprt;
              else
                vva_parmt      :=
                     vva_parmt
                  || '&'
                  || rec_parmt.code
                  || '='
                  || rec_parmt.valr;
              end if;
            end loop;

            if substr (vva_parmt
                      ,1
                      ,1) = '&'
            then
              vva_parmt      :=
                substr (vva_parmt
                       ,2);
            end if;

            for rec_parmt in cur_parmt (vnu_travl_publc)
            loop
              vva_parmt      :=
                   vva_parmt
                || '&'
                || rec_parmt.ref_code_parmt_tp_formt
                || '='
                || rec_parmt.valr;
            end loop;

            if substr (vva_parmt
                      ,1
                      ,1) = '&'
            then
              vva_parmt      :=
                substr (vva_parmt
                       ,2);
            end if;

            if rec_publc_distn.code_engin = 'ORACL_REPRT'
            then
              vva_url      :=
                exect_raprt_reprt (pva_indic_secrs   => 'N'
                                  ,pva_servr         => vva_url_inter
                                  ,pva_parmt         => vva_parmt
                                  ,pnu_travl         => pnu_travl);
            elsif rec_publc_distn.code_engin = 'PD4ML'
            then
              --Effectuer les substitutions

              for rec_publc_travl in cur_publc_travl
              loop
                vva_parmt_tp_pd4ml      :=
                     vva_parmt_tp_pd4ml
                  || ':'
                  || rec_publc_travl.seqnc;

                defnr_contx_exect_raprt (pnu_travl         => pnu_travl
                                        ,pnu_travl_publc   => rec_publc_travl.seqnc
                                        ,pva_type_publc    => rec_publc_distn.code_type_publc
                                        ,pva_code_publc    => rec_publc_distn.code_publc
                                        ,pva_code_engin    => rec_publc_distn.code_engin);
              end loop;

              vva_url      :=
                   'http://'
                || vva_url_inter
                || '?'
                || vva_parmt
                || '&pnu_publc_travl='
                || substr (vva_parmt_tp_pd4ml
                          ,2)
                || '&debug=1';

              vva_url   := lower (vva_url);
            end if;

            ete ('vva_url'
                ,vva_url);
            afw_08_url_pkg.obten_pdf_de_url (vva_url
                                            ,vbo_pdf);
          when rec_publc_distn.code_engin = 'PLPDF'
          then
            vbo_pdf      :=
              afw_25_travl_publc_cu_pkg.obten_pdf (pnu_travl
                                                  ,pnu_publc_travl
                                                  ,vva_nom_raprt);
        end case;

        --merger les pdf
        if vbo_premr_exect
        then
          vbo_premr_exect   := false;
          vbo_pdf_travl     := vbo_pdf;
        else
          vbo_pdf_travl      :=
            plpdf_toolkit.merge (vbo_pdf_travl
                                ,vbo_pdf);
        end if;
      end loop;

      if pnu_publc_travl is null
      then
        select nom
          into vva_nom_fichr_sort
          from vd_i_afw_25_travl t
         where t.seqnc = pnu_travl;

        if vva_nom_fichr_sort is null
        then
          vva_nom_fichr_sort      :=
               'Lot d''impression généré le '
            || to_char (sysdate
                       ,'yyyy-mm-dd hh24:mi:ss')
            || '.pdf';
        end if;
      else
        select nom
          into vva_nom_fichr_sort
          from vd_afw_25_publc_travl pt
         where pt.seqnc = pnu_publc_travl;
      end if;

      if pbo_redrg_web_reslt
      then
        afw_11_prodt_pkg.telvs_fichr (vbo_pdf_travl
                                     ,vva_nom_fichr_sort
                                     ,'application/pdf'
                                     ,true
                                     ,true);
      else
        gbl_travl_termn       := vbo_pdf_travl;
        gva_mime_type_travl   := 'application/pdf';
        gnu_tail_fichr        := dbms_lob.getlength (vbo_pdf_travl);
        gva_nom_fichr         := vva_nom_fichr_sort;
      end if;
    end if;
  exception
    when others
    then
      ete ();
      raise;
  end lancr_travl;

  procedure lancr_publc_travl (pnu_publc_travl       in number
                              ,pnu_formt             in varchar
                              ,pbo_redrg_web_reslt   in boolean default true)
  is
    vnu_travl   number (10);
  begin
    select ref_travl
      into vnu_travl
      from vd_i_afw_25_publc_travl pt
     where pt.seqnc = pnu_publc_travl;

    lancr_travl (vnu_travl
                ,pnu_publc_travl
                ,pnu_formt
                ,pbo_redrg_web_reslt);
  end lancr_publc_travl;

  procedure lancr_travl (pnu_travl             in number
                        ,pnu_formt             in varchar
                        ,pbo_redrg_web_reslt   in boolean default true)
  is
  begin
    lancr_travl (pnu_travl
                ,null
                ,pnu_formt
                ,pbo_redrg_web_reslt);
  end lancr_travl;

  procedure defnr_contx_exect_raprt (pnu_travl         in number
                                    ,pnu_travl_publc   in number
                                    ,pva_type_publc    in varchar2
                                    ,pva_code_publc    in varchar2
                                    ,pva_code_engin       varchar2 default null)
  is
    vva_varch         varchar2 (256);
    vda_date          date;
    vnu_numbr         number;
    vva_parmt_alimn   varchar2 (1);
    pragma autonomous_transaction;

    cursor cur_travl_publc
    is
      select seqnc
        from vd_afw_25_publc_travl pt
       where     pt.ref_travl = pnu_travl
             and pt.ref_code_type_publc = pva_type_publc
             and ref_code_publc = pva_code_publc
             and pt.ref_stat <> afw_12_stat_pkg.obten_stat ('PUBLC_TRAVL'
                                                           ,'ANUL'
                                                           ,'AFW');

    cursor cur_parmt (pnu_publc_travl in number)
    is
        select valr_varch
              ,valr_date
              ,valr_numbr
          from vd_afw_25_parmt_publc_travl
         where     ref_publc_travl = pnu_publc_travl
               and indic_presn_appel = 'N'
      order by ordre_presn asc;

    vnu_numr_elemn    pls_integer;

    procedure trans_ajout_parmt_table_ts (pnu_numr_elemn    in number
                                         ,pnu_travl_publc   in number
                                         ,pva_valr          in varchar2
                                         ,pva_numbr         in number
                                         ,pva_date          in date)
    is
      vva_enonc_updat   varchar2 (500)
        default 'update vd_i_afw_25_par_pub_tra_exect set  valr_numbr% = :1, valr_varch% = :2, valr_date% = :3 where ref_travl_publc = :4 and ref_travl = :5';
    begin
      if pnu_numr_elemn = 1
      then
        insert into vd_i_afw_25_par_pub_tra_exect (ref_travl
                                                  ,ref_travl_publc
                                                  ,valr_numbr1
                                                  ,valr_varch1
                                                  ,valr_date1)
             values (gnu_travl
                    ,pnu_travl_publc
                    ,pva_numbr
                    ,pva_valr
                    ,pva_date);
      else
        vva_enonc_updat      :=
          replace (vva_enonc_updat
                  ,'%'
                  ,pnu_numr_elemn);

        execute immediate vva_enonc_updat
          using pva_numbr
               ,pva_valr
               ,pva_date
               ,pnu_travl_publc
               ,gnu_travl;
      end if;
    end trans_ajout_parmt_table_ts;
  begin
    select indic_parmt_alimn
      into vva_parmt_alimn
      from vd_afw_25_publc_travl pt
     where     ref_code_publc = pva_code_publc
           and ref_travl = pnu_travl
           and rownum = 1;

    gnu_travl         := pnu_travl;
    gnu_publc_travl   := pnu_travl_publc;

    if vva_parmt_alimn = 'N'
    then
      --Alimenter la table temporaire des paramètres
      for rec_travl_publc in cur_travl_publc
      loop
        vnu_numr_elemn   := 0;

        for rec_parmt in cur_parmt (rec_travl_publc.seqnc)
        loop
          vnu_numr_elemn   := vnu_numr_elemn + 1;
          trans_ajout_parmt_table_ts (vnu_numr_elemn
                                     ,rec_travl_publc.seqnc
                                     ,rec_parmt.valr_varch
                                     ,rec_parmt.valr_numbr
                                     ,rec_parmt.valr_date);
        end loop;
      end loop;

      if pva_code_engin = 'PD4ML'
      then
        afw_25_fusn_don_pkg.exect_fusn (pnu_travl         => pnu_travl
                                       ,pnu_travl_publc   => pnu_travl_publc);
      end if;

      update vd_afw_25_publc_travl pt
         set indic_parmt_alimn   = 'O'
       where     ref_code_publc = pva_code_publc
             and ref_travl = pnu_travl;
    end if;

    commit;
  exception
    when others
    then
      ete ();
      raise;
  end defnr_contx_exect_raprt;

  function obten_domn_contx_exect
    return number
  is
    vnu_domn   number (10);
  begin
    select ref_domn
      into vnu_domn
      from vd_i_afw_25_travl t
     where t.seqnc = gnu_travl;

    return vnu_domn;
  exception
    when no_data_found
    then
      return null;
  end obten_domn_contx_exect;

  function obten_travl_exect
    return number
  is
  begin
    return gnu_travl;
  end obten_travl_exect;

  function obten_publc_travl_exect
    return number
  is
  begin
    return gnu_publc_travl;
  end obten_publc_travl_exect;

  function obten_utils_contx_exect
    return number
  is
    vnu_utils   number (10);
  begin
    select ref_utils
      into vnu_utils
      from vd_i_afw_25_travl t
     where t.seqnc = gnu_travl;

    return vnu_utils;
  exception
    when no_data_found
    then
      return null;
  end obten_utils_contx_exect;

  procedure vider_cache
  is
  begin
    gbl_travl_termn       := null;
    gva_mime_type_travl   := null;
    gnu_tail_fichr        := null;
    gva_nom_fichr         := null;
  end vider_cache;

  procedure obten_fichr_sort (pbl_travl_termn            out nocopy blob
                             ,pva_mime_type_travl        out        varchar2
                             ,pnu_tail_fichr             out        pls_integer
                             ,pva_nom_fichr              out        varchar2
                             ,pbo_suprm_fichr_cache   in            boolean default true)
  is
  begin
    pbl_travl_termn       := gbl_travl_termn;
    pva_mime_type_travl   := gva_mime_type_travl;
    pnu_tail_fichr        := gnu_tail_fichr;
    pva_nom_fichr         := gva_nom_fichr;

    if pbo_suprm_fichr_cache
    then
      vider_cache ();
    end if;
  end obten_fichr_sort;

  function obten_stat_publc_travl (pnu_publc_travl in number)
    return number
  is
    vnu_stat   number (10);
  begin
    select ref_stat
      into vnu_stat
      from vd_i_afw_25_publc_travl
     where seqnc = pnu_publc_travl;

    return vnu_stat;
  end obten_stat_publc_travl;

  function obten_versn_publc_courn (pnu_publc in number)
    return number
  is
    vnu_versn_publc   number (10);
  begin
    select seqnc
      into vnu_versn_publc
      from vd_afw_25_versn_publc
     where     date_debut_efect <= (select sysdate
                                      from dual)
           and (   date_fin_efect is null
                or date_fin_efect >= (select sysdate
                                        from dual))
           and ref_publc = pnu_publc;

    return vnu_versn_publc;
  end obten_versn_publc_courn;
end afw_25_travl_publc_pkg;
/
