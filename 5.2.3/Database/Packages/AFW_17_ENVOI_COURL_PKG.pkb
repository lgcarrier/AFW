SET DEFINE OFF;
create or replace package body afw_17_envoi_courl_pkg
as
  kva_crlf                     constant varchar2 (2)
                                          default    chr (13)
                                                  || chr (10) ;
  kva_prefx_multi_part_mixte   constant varchar2 (3) default 'mix';
  kva_prefx_multi_part_alter   constant varchar2 (3) default 'alt';

  gva_nls_chars                         varchar2 (100);

  type typ_destn_courl is record
  (
    nom                   varchar2 (100)
   ,adres                 varchar2 (100)
   ,type                  varchar2 (10)
   ,ref_fil_atent_destn   number (10)
  );

  type typ_arr_dest_courl is table of typ_destn_courl
    index by binary_integer;

  type typ_rec_atach is record
  (
    contn       blob
   ,mime_type   varchar2 (100)
   ,nom_fichr   varchar2 (100)
  );

  type typ_tab_atach is table of typ_rec_atach
    index by pls_integer;

  type typ_courl is record
  (
    servr            varchar2 (100)
   ,port             number default 25
   ,domn             varchar2 (100)
   ,nom_envoy        varchar2 (100)
   ,adres_envoy      varchar2 (100)
   ,sujet            varchar2 (1000)
   ,formt_html       boolean default false
   ,corps            owa.vc_arr
   ,evenm_ical       owa.vc_arr
   ,destn            typ_arr_dest_courl
   ,piece_joint      typ_tab_atach
   ,authe_methd      varchar2 (23)
   ,authe_usagr      varchar2 (100)
   ,authe_mdp        varchar2 (100)
   ,ssl              boolean
   ,empla_walt       varchar2 (100)
   ,mot_passe_walt   varchar2 (100)
  );

  type typ_arr_courl is table of typ_courl
    index by courl;

  gar_courl                             typ_arr_courl;

  gco_courn                             courl default null;

  function obten_mesg_courl_html_uniqm
    return varchar2
  is
  begin
    return afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SAF.000042'
                                                     ,'AFW');
  end obten_mesg_courl_html_uniqm;

  procedure defnr_servr (pva_servr   in varchar2
                        ,pnu_port    in number default 25
                        ,pva_domn    in varchar2 default null)
  is
  begin
    gar_courl (gco_courn).servr   := pva_servr;
    gar_courl (gco_courn).port    := nvl (pnu_port, 25);
    gar_courl (gco_courn).domn    := pva_domn;
  end defnr_servr;

  procedure creer (pva_nom_envoy        in varchar2
                  ,pva_adres_envoy      in varchar2
                  ,pva_sujet            in varchar2
                  ,pva_servr            in varchar2 default null
                  ,pnu_port             in number default 25
                  ,pva_domn             in varchar2 default null
                  ,pva_empla_walt       in varchar2 default null
                  ,pva_mot_passe_walt   in varchar2 default null
                  ,pbo_ssl              in boolean default false)
  is
  begin
    gco_courn                              := nvl (gar_courl.last (), 0) + 1;

    gar_courl (gco_courn).nom_envoy        := pva_nom_envoy;
    gar_courl (gco_courn).adres_envoy      := pva_adres_envoy;
    gar_courl (gco_courn).sujet            := pva_sujet;

    gar_courl (gco_courn).empla_walt       := pva_empla_walt;
    gar_courl (gco_courn).mot_passe_walt   := pva_mot_passe_walt;
    gar_courl (gco_courn).ssl              := pbo_ssl;

    defnr_servr (pva_servr
                ,pnu_port
                ,pva_domn);
  end creer;

  function creer (pva_nom_envoy        in varchar2
                 ,pva_adres_envoy      in varchar2
                 ,pva_sujet            in varchar2
                 ,pva_servr            in varchar2 default null
                 ,pnu_port             in number default 25
                 ,pva_domn             in varchar2 default null
                 ,pva_empla_walt       in varchar2 default null
                 ,pva_mot_passe_walt   in varchar2 default null
                 ,pbo_ssl              in boolean default false)
    return courl
  is
  begin
    creer (pva_nom_envoy
          ,pva_adres_envoy
          ,pva_sujet
          ,pva_servr
          ,pnu_port
          ,pva_domn
          ,pva_empla_walt
          ,pva_mot_passe_walt
          ,pbo_ssl);

    return gco_courn;
  end creer;

  procedure defnr_courn (pco_courl in courl)
  is
  begin
    if    pco_courl is null
       or gar_courl.exists (pco_courl)
    then
      gco_courn   := pco_courl;
    else
      raise no_data_found;
    end if;
  end defnr_courn;

  function obten_courn
    return courl
  is
  begin
    return gco_courn;
  end obten_courn;

  procedure defnr_authe_simpl (pva_usagr   in varchar2
                              ,pva_mdp     in varchar2)
  is
  begin
    gar_courl (gco_courn).authe_methd   := 'SIMPL';
    gar_courl (gco_courn).authe_usagr   := pva_usagr;
    gar_courl (gco_courn).authe_mdp     := pva_mdp;
  /*gar_courl (gco_courn).authe_usagr :=
    utl_raw.cast_to_varchar2 (utl_encode.base64_encode (utl_raw.cast_to_raw (pva_usagr)));
  gar_courl (gco_courn).authe_mdp :=
    utl_raw.cast_to_varchar2 (utl_encode.base64_encode (utl_raw.cast_to_raw (pva_mdp)));*/
  end defnr_authe_simpl;

  procedure formt_html
  is
  begin
    gar_courl (gco_courn).formt_html   := true;
  end formt_html;

  procedure ajout_destn (pva_nom     in varchar2
                        ,pva_adres   in varchar2
                        ,pva_type    in varchar2 default kva_destn_a)
  is
    vnu_index_destn   binary_integer;
  begin
    vnu_index_destn                                       := nvl (gar_courl (gco_courn).destn.last (), 0) + 1;

    gar_courl (gco_courn).destn (vnu_index_destn).nom     := pva_nom;
    gar_courl (gco_courn).destn (vnu_index_destn).adres   := pva_adres;
    gar_courl (gco_courn).destn (vnu_index_destn).type    := pva_type;
  end ajout_destn;

  procedure ajout_piece_joint (pbl_contn       in blob
                              ,pva_mime_type   in varchar2
                              ,pva_nom_fichr   in varchar2)
  is
    vnu_index_piece   binary_integer;
  begin
    vnu_index_piece                                                 := nvl (gar_courl (gco_courn).piece_joint.last (), 0) + 1;
    gar_courl (gco_courn).piece_joint (vnu_index_piece).nom_fichr   := pva_nom_fichr;
    gar_courl (gco_courn).piece_joint (vnu_index_piece).mime_type   := pva_mime_type;
    gar_courl (gco_courn).piece_joint (vnu_index_piece).contn       := pbl_contn;
  end ajout_piece_joint;

  procedure ajout_evenm_ical (pva_evenm_ical   in varchar2
                             ,pbo_saut_ligne   in boolean default true)
  is
    vnu_index_evenm_ical   binary_integer;
  begin
    vnu_index_evenm_ical                                      := nvl (gar_courl (gco_courn).evenm_ical.last (), 0) + 1;

    gar_courl (gco_courn).evenm_ical (vnu_index_evenm_ical)   := pva_evenm_ical;

    if pbo_saut_ligne
    then
      gar_courl (gco_courn).evenm_ical (vnu_index_evenm_ical)      :=
           gar_courl (gco_courn).evenm_ical (vnu_index_evenm_ical)
        || kva_crlf;
    end if;
  end;

  procedure ajout_ligne_corps (pva_ligne        in varchar2
                              ,pbo_saut_ligne   in boolean default true)
  is
    vnu_index_corps   binary_integer;
  begin
    vnu_index_corps                                 := nvl (gar_courl (gco_courn).corps.last (), 0) + 1;

    gar_courl (gco_courn).corps (vnu_index_corps)   := pva_ligne;

    if pbo_saut_ligne
    then
      if gar_courl (gco_courn).formt_html
      then
        gar_courl (gco_courn).corps (vnu_index_corps)      :=
             gar_courl (gco_courn).corps (vnu_index_corps)
          || '<br />';
      end if;

      gar_courl (gco_courn).corps (vnu_index_corps)      :=
           gar_courl (gco_courn).corps (vnu_index_corps)
        || kva_crlf;
    end if;
  end ajout_ligne_corps;

  procedure ajout_corps (par_corps in owa.vc_arr)
  is
    vnu_index_corps   binary_integer;
  begin
    vnu_index_corps   := nvl (gar_courl (gco_courn).corps.last (), 0) + 1;

    if par_corps.first () is not null
    then
      for i in par_corps.first () .. par_corps.last ()
      loop
        gar_courl (gco_courn).corps (vnu_index_corps)   := par_corps (i);
        vnu_index_corps                                 := vnu_index_corps + 1;
      end loop;
    end if;
  end ajout_corps;

  procedure debut_htp
  is
  begin
    afw_15_htp_pkg.ecrit_difr (true);
  end debut_htp;

  procedure fin_htp
  is
  begin
    ajout_corps (afw_15_htp_pkg.obten_arr ());
    afw_15_htp_pkg.ecrit_difr (false);
  end fin_htp;

  procedure anulr
  is
  begin
    if gco_courn is not null
    then
      gar_courl (gco_courn).destn.delete ();
      gar_courl (gco_courn).corps.delete ();
      gar_courl.delete (gco_courn);

      gco_courn   := gar_courl.last ();
    end if;
  end anulr;

  function placr_fil_atent (pbo_efacr in boolean default true)
    return fil_atent
  is
    vnu_fil_atent          number;
    vva_indic_formt_html   varchar2 (1);
    vcl_corps              clob;
    vbo_exist_non_uniq     boolean;

    procedure creer_fil
    is
    begin
      insert into afw_17_courl (servr
                               ,port
                               ,domn
                               ,nom_envoy
                               ,adres_envoy
                               ,sujet
                               ,indic_formt_html
                               ,authe_methd
                               ,authe_usagr
                               ,authe_mdp
                               ,corps
                               ,sens
                               ,stat_soums)
           values (gar_courl (gco_courn).servr
                  ,gar_courl (gco_courn).port
                  ,gar_courl (gco_courn).domn
                  ,gar_courl (gco_courn).nom_envoy
                  ,gar_courl (gco_courn).adres_envoy
                  ,gar_courl (gco_courn).sujet
                  ,vva_indic_formt_html
                  ,gar_courl (gco_courn).authe_methd
                  ,gar_courl (gco_courn).authe_usagr
                  ,gar_courl (gco_courn).authe_mdp
                  ,vcl_corps
                  ,'EMIS'
                  ,'A_ENVOY')
        returning seqnc
             into vnu_fil_atent;
    end creer_fil;

    procedure ajout_destn_fil (pnu_index in number)
    is
    begin
      insert into afw_17_courl_destn (ref_fil_atent
                                     ,nom
                                     ,adres
                                     ,type)
           values (vnu_fil_atent
                  ,gar_courl (gco_courn).destn (pnu_index).nom
                  ,gar_courl (gco_courn).destn (pnu_index).adres
                  ,gar_courl (gco_courn).destn (pnu_index).type);
    end ajout_destn_fil;

    procedure ajout_piece_joint_fil (pnu_index   in number
                                    ,pva_mode    in varchar2 default 'A')
    is
    begin
      insert into afw_17_courl_piece_joint (mime_type
                                           ,contn
                                           ,tail
                                           ,nom_fichr
                                           ,mode_atach)
           values (vnu_fil_atent
                  ,gar_courl (gco_courn).piece_joint (pnu_index).contn
                  ,dbms_lob.getlength (gar_courl (gco_courn).piece_joint (pnu_index).contn)
                  ,gar_courl (gco_courn).piece_joint (pnu_index).nom_fichr
                  ,pva_mode);
    end ajout_piece_joint_fil;
  begin
    vva_indic_formt_html   := case when gar_courl (gco_courn).formt_html then 'O' else 'N' end;

    afw_07_clob_pkg.creer_nouv ();

    if gar_courl (gco_courn).corps.first () is not null
    then
      for i in gar_courl (gco_courn).corps.first () .. gar_courl (gco_courn).corps.last ()
      loop
        afw_07_clob_pkg.ajout (gar_courl (gco_courn).corps (i));
      end loop;
    end if;

    vcl_corps              := afw_07_clob_pkg.obten ();

    vbo_exist_non_uniq     := false;

    if gar_courl (gco_courn).destn.first () is not null
    then
      for i in gar_courl (gco_courn).destn.first () .. gar_courl (gco_courn).destn.last ()
      loop
        if gar_courl (gco_courn).destn (i).type = kva_destn_uniq
        then
          creer_fil ();
          ajout_destn_fil (i);
        else
          vbo_exist_non_uniq   := true;
        end if;
      end loop;
    end if;

    if vbo_exist_non_uniq
    then
      creer_fil ();

      if gar_courl (gco_courn).destn.first () is not null
      then
        for i in gar_courl (gco_courn).destn.first () .. gar_courl (gco_courn).destn.last ()
        loop
          if gar_courl (gco_courn).destn (i).type <> kva_destn_uniq
          then
            ajout_destn_fil (i);
          end if;
        end loop;
      end if;

      if gar_courl (gco_courn).piece_joint.first () is not null
      then
        for i in gar_courl (gco_courn).piece_joint.first () .. gar_courl (gco_courn).piece_joint.last ()
        loop
          ajout_piece_joint_fil (i);
        end loop;
      end if;
    end if;


    if pbo_efacr
    then
      anulr ();
    end if;

    return vnu_fil_atent;
  end placr_fil_atent;

  procedure placr_fil_atent (pbo_efacr in boolean default true)
  is
    vfa_fil_atent   fil_atent;
  begin
    vfa_fil_atent   := placr_fil_atent (pbo_efacr);
  end placr_fil_atent;

  procedure envoy (pbo_envoi_difr in boolean default false)
  is
    vco_courl        courl default gco_courn;
    vbo_non_uniq     boolean default false;

    vnu_postn        pls_integer default 1;
    vnu_tail         pls_integer;
    vnu_tail_segmn   pls_integer default 54;
    vra_tampn        raw (54);

    procedure envoy_copie (pnu_uniq in binary_integer default null)
    is
      vbl_corps   blob;
      vcn_conct   utl_smtp.connection;
      vva_a       varchar2 (32000);
      vva_cc      varchar2 (32000);
      vva_cci     varchar2 (32000);
      vva_delmt   varchar2 (30) default 'a1b2c3d4e3f2g1';

      procedure ecrir (pva_contn in varchar2)
      is
        vra_contn   raw (32767) default utl_raw.cast_to_raw (pva_contn);
      begin
        if pbo_envoi_difr
        then
          dbms_lob.writeappend (vbl_corps
                               ,utl_raw.length (vra_contn)
                               ,vra_contn);
        else
          utl_smtp.write_raw_data (vcn_conct
                                  ,vra_contn);
        end if;
      end ecrir;

      procedure ecrir_raw (pra_contn in raw)
      is
      begin
        if pbo_envoi_difr
        then
          dbms_lob.writeappend (vbl_corps
                               ,utl_raw.length (pra_contn)
                               ,pra_contn);
        else
          utl_smtp.write_raw_data (vcn_conct
                                  ,pra_contn);
        end if;
      end ecrir_raw;

      function formt_entet_encd (pva_valr in varchar2)
        return varchar2
      is
      begin
        if pva_valr is not null
        then
          return replace (utl_encode.mimeheader_encode (pva_valr)
                         ,   chr (13)
                          || chr (10)
                         ,null);
        else
          return null;
        end if;
      end formt_entet_encd;

      procedure entet (pva_atrib   in varchar2
                      ,pva_valr    in varchar2)
      is
      begin
        ecrir (   pva_atrib
               || ': '
               || pva_valr
               || kva_crlf);
      end entet;

      procedure ligne_corps (pnu_ligne in binary_integer)
      is
        vva_ligne   varchar2 (32000);
      begin
        vva_ligne   := gar_courl (vco_courl).corps (pnu_ligne);

        -- TODO CARLO: trouver pourquoi on fait ça
        --vva_ligne := replace (vva_ligne, '=', '=3D');

        if gar_courl (vco_courl).formt_html
        then
          --utl_smtp.write_raw_data (vcn_conct, utl_raw.cast_to_raw(vva_ligne));
          ecrir (vva_ligne);
        else
          --utl_smtp.write_raw_data (vcn_conct, utl_raw.cast_to_raw(vva_ligne));
          ecrir (vva_ligne);
        end if;
      end ligne_corps;

      procedure ligne_evenm_ical (pnu_ligne in binary_integer)
      is
        vva_ligne   varchar2 (32000);
      begin
        vva_ligne   := gar_courl (vco_courl).evenm_ical (pnu_ligne);
        ecrir (vva_ligne);
      end ligne_evenm_ical;
    begin
      if pbo_envoi_difr
      then
        dbms_lob.createtemporary (vbl_corps
                                 ,true);
      else
        utl_tcp.close_all_connections;

        -- Ouvrir la connexion et débuter l'envoi
        if gar_courl (vco_courl).ssl
        then
          vcn_conct      :=
            utl_smtp.open_connection (host                            => gar_courl (vco_courl).servr
                                     ,port                            => gar_courl (vco_courl).port
                                     ,tx_timeout                      => 10
                                     ,wallet_path                     =>   'file:'
                                                                        || gar_courl (vco_courl).empla_walt
                                     ,wallet_password                 => gar_courl (vco_courl).mot_passe_walt
                                     ,secure_connection_before_smtp   => true);
        else
          vcn_conct      :=
            utl_smtp.open_connection (gar_courl (vco_courl).servr
                                     ,gar_courl (vco_courl).port);
        end if;

        utl_smtp.ehlo (vcn_conct
                      ,gar_courl (vco_courl).domn);

        case gar_courl (vco_courl).authe_methd
          when 'SIMPL'
          then
            utl_smtp.command (vcn_conct
                             ,'AUTH LOGIN');
            utl_smtp.command (vcn_conct
                             ,utl_encode.text_encode (gar_courl (vco_courl).authe_usagr
                                                     ,gva_nls_chars
                                                     ,1));
            utl_smtp.command (vcn_conct
                             ,utl_encode.text_encode (gar_courl (vco_courl).authe_mdp
                                                     ,gva_nls_chars
                                                     ,1));
          else
            -- Pas d'authentification, ou pas supportée
            null;
        end case;

        utl_smtp.mail (vcn_conct
                      ,gar_courl (vco_courl).adres_envoy);

        -- Initialiser le ou les destinataires
        if pnu_uniq is null
        then
          if gar_courl (vco_courl).destn.first () is not null
          then
            for i in gar_courl (vco_courl).destn.first () .. gar_courl (vco_courl).destn.last ()
            loop
              if gar_courl (vco_courl).destn (i).type != kva_destn_uniq
              then
                if gar_courl (vco_courl).destn (i).type = kva_destn_a
                then
                  utl_smtp.rcpt (vcn_conct
                                ,gar_courl (vco_courl).destn (i).adres);

                  if vva_a is not null
                  then
                    vva_a      :=
                         vva_a
                      || ', ';
                  end if;

                  vva_a      :=
                       vva_a
                    || '"'
                    || formt_entet_encd (gar_courl (vco_courl).destn (i).nom)
                    || '" <'
                    || gar_courl (vco_courl).destn (i).adres
                    || '>';
                elsif gar_courl (vco_courl).destn (i).type = kva_destn_cc
                then
                  utl_smtp.rcpt (vcn_conct
                                ,gar_courl (vco_courl).destn (i).adres);

                  if vva_cc is not null
                  then
                    vva_cc      :=
                         vva_cc
                      || ', ';
                  end if;

                  vva_cc      :=
                       vva_cc
                    || '"'
                    || formt_entet_encd (gar_courl (vco_courl).destn (i).nom)
                    || '" <'
                    || gar_courl (vco_courl).destn (i).adres
                    || '>';
                elsif gar_courl (vco_courl).destn (i).type = kva_destn_cci
                then
                  utl_smtp.rcpt (vcn_conct
                                ,gar_courl (vco_courl).destn (i).adres);

                  if vva_cci is not null
                  then
                    vva_cci      :=
                         vva_cci
                      || ', ';
                  end if;

                  vva_cci      :=
                       vva_cci
                    || '"'
                    || formt_entet_encd (gar_courl (vco_courl).destn (i).nom)
                    || '" <'
                    || gar_courl (vco_courl).destn (i).adres
                    || '>';
                end if;
              end if;
            end loop;
          end if;
        else
          utl_smtp.rcpt (vcn_conct
                        ,gar_courl (vco_courl).destn (pnu_uniq).adres);
          vva_a      :=
               '"'
            || formt_entet_encd (gar_courl (vco_courl).destn (pnu_uniq).nom)
            || '" <'
            || gar_courl (vco_courl).destn (pnu_uniq).adres
            || '>';
        end if;

        utl_smtp.open_data (vcn_conct);
      end if;

      if gar_courl (vco_courl).evenm_ical.first () is not null
      then
        ecrir (   'Content-class: urn:content-classes:calendarmessage'
               || kva_crlf);
      end if;

      ecrir (   'MIME-Version: 1.0'
             || kva_crlf);

      -- Écrire l'entête
      entet ('Date'
            ,to_char (systimestamp
                     ,'Dy, dd Mon YYYY hh24:mi:ss TZHTZM'
                     ,'NLS_DATE_LANGUAGE = AMERICAN'));

      entet ('Subject'
            ,formt_entet_encd (gar_courl (vco_courl).sujet));

      entet ('From'
            ,   '"'
             || formt_entet_encd (gar_courl (vco_courl).nom_envoy)
             || '" <'
             || gar_courl (vco_courl).adres_envoy
             || '>');

      entet ('To'
            ,vva_a);

      if vva_cc is not null
      then
        entet ('Cc'
              ,vva_cc);
      end if;

      if vva_cci is not null
      then
        entet ('Bcc'
              ,vva_cci);
      end if;

      ecrir (   'Content-Type: multipart/mixed; boundary="'
             || kva_prefx_multi_part_mixte
             || vva_delmt
             || '"'
             || kva_crlf
             || kva_crlf);

      ecrir (   '--'
             || kva_prefx_multi_part_mixte
             || vva_delmt
             || kva_crlf);

      ecrir (   'Content-Type: multipart/alternative; boundary="'
             || kva_prefx_multi_part_alter
             || vva_delmt
             || '"'
             || kva_crlf
             || kva_crlf);

      ecrir (   '--'
             || kva_prefx_multi_part_alter
             || vva_delmt
             || kva_crlf);

      ecrir ('Content-Type: text/plain; charset=ISO-8859-1');
      ecrir (   kva_crlf
             || kva_crlf);

      -- Écrire le corps (TEXTE)
      ecrir (obten_mesg_courl_html_uniqm);

      ecrir (   kva_crlf
             || kva_crlf);
      ecrir (   '--'
             || kva_prefx_multi_part_alter
             || vva_delmt
             || kva_crlf);

      ecrir ('Content-Type: text/html; charset=ISO-8859-1');
      ecrir (   kva_crlf
             || kva_crlf);

      -- Écrire le corps (HTML)
      if gar_courl (vco_courl).corps.first () is not null
      then
        for i in gar_courl (vco_courl).corps.first () .. gar_courl (vco_courl).corps.last ()
        loop
          ligne_corps (i);
        end loop;

        ecrir (   kva_crlf
               || kva_crlf);
      end if;

      ecrir (   '--'
             || kva_prefx_multi_part_alter
             || vva_delmt
             || '--'
             || kva_crlf);

      --gérer le fichier iCal
      if gar_courl (vco_courl).evenm_ical.first () is not null
      then
        ecrir (   '--'
               || kva_prefx_multi_part_mixte
               || vva_delmt
               || kva_crlf);

        ecrir ('Content-class: urn:content-classes:calendarmessage');
        ecrir (kva_crlf);
        ecrir ('Content-Type: text/calendar;');
        ecrir (kva_crlf);
        ecrir ('  method=REQUEST;');
        ecrir (kva_crlf);
        ecrir ('  name="meeting.ics"');
        ecrir (kva_crlf);
        ecrir ('Content-Transfer-Encoding: 8bit');
        ecrir (   kva_crlf
               || kva_crlf);

        for i in gar_courl (vco_courl).evenm_ical.first () .. gar_courl (vco_courl).evenm_ical.last ()
        loop
          ligne_evenm_ical (i);
        end loop;

        ecrir (   kva_crlf
               || kva_crlf);
      end if;

      --gérer les pièces jointes
      if gar_courl (vco_courl).piece_joint.count () != 0
      then
        for i in gar_courl (vco_courl).piece_joint.first () .. gar_courl (vco_courl).piece_joint.last ()
        loop
          ecrir (   '--'
                 || kva_prefx_multi_part_mixte
                 || vva_delmt
                 || kva_crlf);
          ecrir (   'Content-Type: '
                 || gar_courl (vco_courl).piece_joint (i).mime_type
                 || ';');
          ecrir (kva_crlf);
          ecrir ('Content-Disposition: attachment;');
          ecrir (kva_crlf);
          ecrir (   ' filename="'
                 || gar_courl (vco_courl).piece_joint (i).nom_fichr
                 || '"');
          ecrir (kva_crlf);
          ecrir ('Content-Transfer-Encoding: base64');
          ecrir (kva_crlf);
          ecrir (kva_crlf);

          vnu_tail         := dbms_lob.getlength (gar_courl (vco_courl).piece_joint (i).contn);
          vnu_postn        := 1;
          vnu_tail_segmn   := 54;

          while vnu_postn < vnu_tail
          loop
            dbms_lob.read (gar_courl (vco_courl).piece_joint (i).contn
                          ,vnu_tail_segmn
                          ,vnu_postn
                          ,vra_tampn);
            ecrir_raw (utl_encode.base64_encode (vra_tampn));
            ecrir (kva_crlf);
            vra_tampn   := null;
            vnu_postn   := vnu_postn + vnu_tail_segmn;
          end loop;

          ecrir (   kva_crlf
                 || kva_crlf);
        end loop;
      end if;

      if gar_courl (vco_courl).piece_joint.count () != 0
      then
        ecrir (   '--'
               || kva_prefx_multi_part_mixte
               || vva_delmt
               || kva_crlf);
      end if;

      ecrir (   '--'
             || kva_prefx_multi_part_mixte
             || vva_delmt
             || '--'
             || kva_crlf);

      if not pbo_envoi_difr
      then
        -- Terminer l'envoi et la connexion
        utl_smtp.close_data (vcn_conct);
        utl_smtp.quit (vcn_conct);
      end if;
    exception
      when    utl_smtp.transient_error
           or utl_smtp.permanent_error
      then
        begin
          utl_smtp.quit (vcn_conct);
        exception
          when    utl_smtp.transient_error
               or utl_smtp.permanent_error
          then
            null;
        end;

        ete ();
        raise;
    end envoy_copie;
  begin
    -- Chercher pour les destinataires uniques
    if gar_courl (vco_courl).destn.first () is not null
    then
      for i in gar_courl (vco_courl).destn.first () .. gar_courl (vco_courl).destn.last ()
      loop
        if gar_courl (vco_courl).destn (i).type = kva_destn_uniq
        then
          -- Envoyer a un destinataire unique
          envoy_copie (i);
        else
          vbo_non_uniq   := true;
        end if;
      end loop;

      -- Envoyer le courriel aux autres destinataires non-uniques
      if vbo_non_uniq
      then
        envoy_copie ();
      end if;
    end if;
  end envoy;

  procedure envoy_fil_atent (pfa_fil_atent in fil_atent)
  is
    vco_ancien_courn       courl;
    vva_indic_formt_html   varchar2 (1);
    vcl_corps              clob;
    vnu_index              pls_integer;
    var_segmn              afw_07_clob_pkg.typ_arr_segmn;

    cursor cur_fil_atent_destn
    is
      select nom
            ,adres
            ,type
        from afw_17_courl_destn
       where ref_fil_atent = pfa_fil_atent;

    cursor cur_fil_atent_piece_joint
    is
      select nom_fichr
            ,mime_type
            ,contn
        from afw_17_courl_piece_joint
       where ref_courl = pfa_fil_atent;

    procedure marqr_tentv_fil
    is
      pragma autonomous_transaction;
    begin
      afw_03_journ_pkg.ecrir_journ (   'Envoi d''un courriel (Seqnc = '
                                    || pfa_fil_atent
                                    || ', Erreur = '
                                    || sqlerrm
                                    || ')'
                                   ,'AFW_17_ENVOI_COURL_PKG');

      update afw_17_courl
         set nombr_tentv   = nombr_tentv + 1
       where seqnc = pfa_fil_atent;

      commit;
    end marqr_tentv_fil;

    procedure suprm_fil_atent
    is
    --pragma autonomous_transaction;
    begin
      update afw_17_courl
         set stat_soums   = 'ENVOY'
       where seqnc = pfa_fil_atent;
    --commit;
    end suprm_fil_atent;
  begin
    vco_ancien_courn              := gco_courn;
    gco_courn                     := nvl (gar_courl.last (), 0) + 1;
    gar_courl (gco_courn).servr   := null; -- Seulement pour créer l'entrée

    begin
        select servr
              ,port
              ,domn
              ,nom_envoy
              ,adres_envoy
              ,sujet
              ,indic_formt_html
              ,authe_methd
              ,authe_usagr
              ,authe_mdp
              ,corps
          into gar_courl (gco_courn).servr
              ,gar_courl (gco_courn).port
              ,gar_courl (gco_courn).domn
              ,gar_courl (gco_courn).nom_envoy
              ,gar_courl (gco_courn).adres_envoy
              ,gar_courl (gco_courn).sujet
              ,vva_indic_formt_html
              ,gar_courl (gco_courn).authe_methd
              ,gar_courl (gco_courn).authe_usagr
              ,gar_courl (gco_courn).authe_mdp
              ,vcl_corps
          from afw_17_courl
         where seqnc = pfa_fil_atent
      order by date_creat;

      gar_courl (gco_courn).formt_html   := (vva_indic_formt_html = 'O');

      if vcl_corps is not null
      then
        var_segmn   := afw_07_clob_pkg.clob_vers_table_segmn (vcl_corps);

        if var_segmn.first () is not null
        then
          for i in var_segmn.first () .. var_segmn.last ()
          loop
            gar_courl (gco_courn).corps (i)   := var_segmn (i);
          end loop;
        end if;
      end if;

      vnu_index                          := 0;

      for rec_fil_atent_destn in cur_fil_atent_destn
      loop
        vnu_index                                       := vnu_index + 1;
        gar_courl (gco_courn).destn (vnu_index).nom     := rec_fil_atent_destn.nom;
        gar_courl (gco_courn).destn (vnu_index).adres   := rec_fil_atent_destn.adres;
        gar_courl (gco_courn).destn (vnu_index).type    := rec_fil_atent_destn.type;
      end loop;

      vnu_index                          := 0;

      for rec_fil_atent_piece_joint in cur_fil_atent_piece_joint
      loop
        vnu_index                                                 := vnu_index + 1;
        gar_courl (gco_courn).piece_joint (vnu_index).nom_fichr   := rec_fil_atent_piece_joint.nom_fichr;
        gar_courl (gco_courn).piece_joint (vnu_index).mime_type   := rec_fil_atent_piece_joint.mime_type;
        gar_courl (gco_courn).piece_joint (vnu_index).contn       := rec_fil_atent_piece_joint.contn;
      end loop;
    exception
      when no_data_found
      then
        gco_courn   := vco_ancien_courn;
        raise;
    end;

    --    marqr_tentv_fil ();

    begin
      envoy ();
      anulr ();
      gco_courn   := vco_ancien_courn;

      -- S'il y a eu une erreur, la suppression sera sautée
      suprm_fil_atent ();
    end;
  exception
    when others
    then
      marqr_tentv_fil ();
      gco_courn   := vco_ancien_courn;
      raise;
  end envoy_fil_atent;

  procedure envoy_toute_fil_atent (pnu_envoi_max in number default 10)
  is
    cursor cur_fil_atent
    is
        select seqnc
          from afw_17_courl
         where     nombr_tentv < nombr_tentv_max
               and stat_soums = 'A_ENVOY'
               and sens = 'EMIS'
      order by date_creat asc;

    vnu_nb_envoy   number;
  begin
    vnu_nb_envoy   := 0;

    for rec_fil_atent in cur_fil_atent
    loop
      begin
        envoy_fil_atent (rec_fil_atent.seqnc);

        -- Ne sera pas compté si une erreur survient
        vnu_nb_envoy   := vnu_nb_envoy + 1;

        if     pnu_envoi_max is not null
           and vnu_nb_envoy >= pnu_envoi_max
           and pnu_envoi_max > 0
        then
          exit;
        end if;
      exception
        when others
        then
          ete ();
      end;
    end loop;
  exception
    when others
    then
      ete ();
  end envoy_toute_fil_atent;
begin
  select value
    into gva_nls_chars
    from nls_database_parameters
   where parameter = 'NLS_CHARACTERSET';
end afw_17_envoi_courl_pkg;
/
