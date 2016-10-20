SET DEFINE OFF;
create or replace package body afw_01_notfc_pkg
as
  procedure notfc_sms (pnu_config_evenm_notfb   in number
                      ,pta_destn                in afw_01_evenm_notfb_cu_pkg.typ_tab_destn
                      ,pva_mesg                 in varchar2)
  is
  begin
    null;
  end notfc_sms;

  procedure notfc_courl (pnu_config_evenm_notfb   in number
                        ,pta_destn                in afw_01_evenm_notfb_cu_pkg.typ_tab_destn
                        ,pcl_mesg                 in clob
                        ,pva_objet                in varchar2
                        ,pta_piec_joint           in afw_01_evenm_notfb_cu_pkg.typ_tab_piec_joint)
  is
    cursor cur_profl_courl
    is
      select pc.nom_envoy
            ,pc.adres_envoy
            ,pc.servr_sortn
            ,pc.port_sortn
            ,pc.domn
            ,pc.indic_ssl_sortn
            ,pc.authe_methd_sortn
            ,pc.authe_mdp_sortn
            ,pc.authe_usagr_sortn
            ,pc.adres_suprt
            ,pc.nom_suprt
            ,pc.indic_ajout_suprt_cci
            ,cen.indic_envoi_difr
        from vd_afw_17_profl_courl       pc
            ,vd_afw_01_confg_evenm_notfb cen
       where     cen.seqnc = pnu_config_evenm_notfb
             and pc.seqnc = cen.ref_profl_courl;

    rec_profl_courl   cur_profl_courl%rowtype;

    vnu_nombr_itera   pls_integer;
    vnu_tail_mesg     pls_integer;

    vnu_index         number (10);

    vfa_fil_atent     afw_17_envoi_courl_pkg.fil_atent;
  begin
    open cur_profl_courl;

    fetch cur_profl_courl
      into rec_profl_courl;

    close cur_profl_courl;

    afw_17_envoi_courl_pkg.creer (pva_nom_envoy        => rec_profl_courl.nom_envoy
                                 ,pva_adres_envoy      => rec_profl_courl.adres_envoy
                                 ,pva_sujet            => pva_objet
                                 ,pva_servr            => rec_profl_courl.servr_sortn
                                 ,pnu_port             => rec_profl_courl.port_sortn
                                 ,pva_domn             => rec_profl_courl.domn
                                 ,pva_empla_walt       => null
                                 ,pva_mot_passe_walt   => null
                                 ,pbo_ssl              => rec_profl_courl.indic_ssl_sortn = 'O');

    if rec_profl_courl.authe_methd_sortn = 'SIMPL'
    then
      afw_17_envoi_courl_pkg.defnr_authe_simpl (rec_profl_courl.authe_usagr_sortn
                                               ,rec_profl_courl.authe_mdp_sortn);
    end if;

    afw_17_envoi_courl_pkg.formt_html ();

    if pta_destn.count () != 0
    then
      vnu_index   := pta_destn.first ();

      while vnu_index is not null
      loop
        op (   'vnu_index= '
            || vnu_index);
        op (pta_destn (vnu_index).nom_formt);
        op (pta_destn (vnu_index).adres_courl);
        op (pta_destn (vnu_index).type_destn);

        afw_17_envoi_courl_pkg.ajout_destn (pta_destn (vnu_index).nom_formt
                                           ,pta_destn (vnu_index).adres_courl
                                           ,pta_destn (vnu_index).type_destn);
        vnu_index   := pta_destn.next (vnu_index);
      end loop;

      if rec_profl_courl.indic_ajout_suprt_cci = 'O'
      then
        afw_17_envoi_courl_pkg.ajout_destn (rec_profl_courl.nom_suprt
                                           ,rec_profl_courl.adres_suprt
                                           ,afw_17_envoi_courl_pkg.kva_destn_cci);
      end if;
    end if;

    vnu_nombr_itera   := 0;
    vnu_tail_mesg     := dbms_lob.getlength (pcl_mesg);

    while vnu_tail_mesg >= (vnu_nombr_itera * 2000)
    loop
      afw_17_envoi_courl_pkg.ajout_ligne_corps (dbms_lob.substr (pcl_mesg
                                                                ,least (2000
                                                                       ,vnu_tail_mesg - (vnu_nombr_itera * 2000))
                                                                , (vnu_nombr_itera * 2000) + 1)
                                               ,false);
      vnu_nombr_itera   := vnu_nombr_itera + 1;
    end loop;

    if rec_profl_courl.indic_envoi_difr = 'O'
    then
      afw_17_envoi_courl_pkg.placr_fil_atent ();
    else
      vfa_fil_atent   := afw_17_envoi_courl_pkg.placr_fil_atent ();

      begin
        afw_17_envoi_courl_pkg.envoy_fil_atent (vfa_fil_atent);
      exception
        when afw_07_excep_pkg.exc_smtp_servc_not_avail
        then
          null;
      end;
    end if;
  end notfc_courl;
end afw_01_notfc_pkg;
/
