SET DEFINE OFF;
create or replace package body afw_21_plugn_calnd_pkg
as
  function obten_enreg_config_plugn (pnu_numr_apex_regn in number)
    return typ_rec_config_plugn
  is
    cursor cur_config_plugn
    is
      select enonc_pre_reqt
            ,ref_dv_vue_deft
            ,conct_propr_entet_gauch
            ,conct_propr_entet_centr
            ,conct_propr_entet_droit
            ,conct_propr_entet_gauch_formt
            ,conct_propr_entet_centr_formt
            ,conct_propr_entet_droit_formt
            ,indic_evenm_modfb
            ,nombr_mints_inter
            ,heure_debut_norml
            ,heure_fin_norml
            ,heure_debut_exten
            ,heure_fin_exten
            ,nom_table
            ,coln_ident
            ,coln_agend
            ,coln_indic_journ_compl
            ,coln_indic_evenm_modfb
            ,coln_date_journ_compl
            ,coln_date_fin_journ_compl
            ,coln_date_debut
            ,coln_date_fin
            ,coln_titre
            ,coln_descr
            ,coln_type
            ,coln_titre_aide_insta
            ,coln_aide_insta
            ,coln_lien
            ,pc.largr_regn_calnd
            ,agend_nom_table
        from vd_afw_21_plugn_calnd pc
            ,apex_regn             ar
       where     pc.code = ar.attribute_01
             and ar.id = pnu_numr_apex_regn
             and ar.flow_id in (select numr_aplic_apex
                                  from vd_afw_11_aplic
                                 where ref_prodt = pc.ref_prodt);

    rec_config_plugn   typ_rec_config_plugn;
  begin
    open cur_config_plugn;

    fetch cur_config_plugn
      into rec_config_plugn;

    close cur_config_plugn;

    return rec_config_plugn;
  end obten_enreg_config_plugn;

  function formt_chain (pva_valr in varchar2)
    return varchar2
  is
  begin
    if pva_valr is null
    then
      return 'null';
    else
      return pva_valr;
    end if;
  end formt_chain;

  function formt_chain_2 (pva_valr in varchar2)
    return varchar2
  is
  begin
    if pva_valr is null
    then
      return 'null';
    else
      return    ''''
             || pva_valr
             || '''';
    end if;
  end formt_chain_2;

  function formt_date (pda_date in date)
    return varchar2
  is
  begin
    if pda_date is null
    then
      return 'null';
    else
      return    to_char (pda_date
                        ,'YYYY-MM-DD')
             || 'T'
             || to_char (pda_date
                        ,'HH24:MI');
    end if;
  end formt_date;

  function formt_chain_json (pva_chain in varchar2)
    return varchar2
  is
  begin
    return afw_07_util_pkg.multi_replc (pva_chain
                                       ,''''
                                       ,'''''');
  end formt_chain_json;

  procedure ouvri_table_javsc
  is
  begin
    htp.prn ('[');
  end ouvri_table_javsc;

  procedure fermr_table_javsc
  is
  begin
    htp.prn (']');
  end fermr_table_javsc;

  procedure ouvri_objet_javsc
  is
  begin
    htp.prn ('{');
  end ouvri_objet_javsc;

  procedure fermr_objet_javsc
  is
  begin
    htp.prn ('}');
  end fermr_objet_javsc;

  procedure sepr_objet
  is
  begin
    htp.prn (',');
  end sepr_objet;

  function obten_clas_css (pnu_numr_apex_regn   in number
                          ,pva_agend            in varchar2)
    return varchar2
  is
    rec_config_plugn   typ_rec_config_plugn;
    cur_agend          sys_refcursor;
    vva_agend          varchar2 (100);
    vnu_rownum         number;
    vnu_ordre_presn    number;

    function genr_reqt_sql (pty_rec_config_plugn in typ_rec_config_plugn)
      return varchar2
    is
      vva_reqt_sql     varchar2 (32767);
      vva_type_agend   varchar2 (30);
    begin
      vva_type_agend   := afw_12_calnd_pkg.obten_type_agend;

      vva_reqt_sql      :=
           'select agend, rownum '
        || '  from '
        || pty_rec_config_plugn.agend_nom_table
        || case
             when vva_type_agend is not null
             then
                  ' where type_agend = '''
               || vva_type_agend
               || ''''
             else
               null
           end;

      return vva_reqt_sql;
    end genr_reqt_sql;
  begin
    rec_config_plugn   := obten_enreg_config_plugn (pnu_numr_apex_regn);

    open cur_agend for genr_reqt_sql (rec_config_plugn);

    loop
      fetch cur_agend
        into vva_agend
            ,vnu_rownum;

      if pva_agend = vva_agend
      then
        vnu_ordre_presn   := vnu_rownum;
        exit;
      end if;

      exit when cur_agend%notfound;
    end loop;

    close cur_agend;

    return    'agend_'
           || to_char (vnu_ordre_presn);
  end obten_clas_css;

  procedure obten_json_evenm_agend (pnu_numr_apex_regn     in number
                                   ,pnu_date_debut_milsc   in number
                                   ,pnu_date_fin_milsc     in number
                                   ,pva_agend              in varchar2)
  is
    cur_calnd               sys_refcursor;
    rec_config_plugn        typ_rec_config_plugn;
    vta_tab_rec_evenm       typ_tab_rec_evenm;
    vnu_nombr_evenm_calnd   number;

    function genr_reqt_sql (pty_rec_config_plugn in typ_rec_config_plugn)
      return varchar2
    is
      vva_reqt_sql   varchar2 (32767);
      vva_clas_css   varchar2 (100);
    begin
      vva_clas_css      :=
        obten_clas_css (pnu_numr_apex_regn
                       ,pva_agend);

      vva_reqt_sql      :=
           'select '
        || pty_rec_config_plugn.coln_ident
        || ' ident,'
        || pty_rec_config_plugn.coln_agend
        || ' agend,'
        || formt_chain (pty_rec_config_plugn.coln_indic_journ_compl)
        || ' indic_journ_compl,'
        || formt_chain (pty_rec_config_plugn.coln_indic_evenm_modfb)
        || ' indic_modfb,'
        || formt_chain (pty_rec_config_plugn.coln_date_journ_compl)
        || ' date_journ_compl,'
        || formt_chain (pty_rec_config_plugn.coln_date_fin_journ_compl)
        || ' date_fin_journ_compl,'
        || formt_chain (pty_rec_config_plugn.coln_date_debut)
        || ' date_debut,'
        || formt_chain (pty_rec_config_plugn.coln_date_fin)
        || ' date_fin,'
        || pty_rec_config_plugn.coln_titre
        || ' titre,'
        || formt_chain (pty_rec_config_plugn.coln_descr)
        || ' descr,'
        --|| pty_rec_config_plugn.coln_type
        || ''''
        || vva_clas_css
        || ''''
        || ' clas_css,'
        || formt_chain (pty_rec_config_plugn.coln_titre_aide_insta)
        || ' titre_aide_insta,'
        || formt_chain (pty_rec_config_plugn.coln_aide_insta)
        || ' aide_insta,'
        || formt_chain (pty_rec_config_plugn.coln_lien)
        || ' lien'
        || '  from '
        || pty_rec_config_plugn.nom_table
        || '  where '
        || pty_rec_config_plugn.coln_agend
        || ' = :pva_agend'
        || ' and trunc('
        || formt_chain (pty_rec_config_plugn.coln_date_debut)
        || ') >= :pda_date_debut'
        || ' and trunc('
        || formt_chain (pty_rec_config_plugn.coln_date_fin)
        || ') < :pda_date_fin';

      return vva_reqt_sql;
    end genr_reqt_sql;

    procedure formt_objet_javsc (p_rec_evenm in typ_rec_evenm)
    is
    begin
      ouvri_objet_javsc ();

      htp.prn (   '"ident":"'
               || p_rec_evenm.vva_ident
               || '","agend":"'
               || p_rec_evenm.vva_agend
               || '","indic_journ_compl":'
               || case
                    when p_rec_evenm.vva_indic_journ_compl in ('O'
                                                              ,'Y')
                    then
                      'true'
                    else
                      'false'
                  end
               || ',"indic_modfb":'
               || case
                    when p_rec_evenm.vva_indic_modfb in ('O'
                                                        ,'Y')
                    then
                      'true'
                    else
                      'false'
                  end
               || ',"date_journ_compl":"'
               || formt_date (p_rec_evenm.vda_date_journ_compl)
               || '","date_fin_journ_compl":"'
               || formt_date (p_rec_evenm.vda_date_fin_journ_compl)
               || '","date_debut":"'
               || formt_date (p_rec_evenm.vda_date_debut)
               || '","date_fin":"'
               || formt_date (p_rec_evenm.vda_date_fin)
               || '","titre":"'
               || afw_07_util_pkg.echap_text_json (p_rec_evenm.vva_titre)
               || '","descr":"'
               || afw_07_util_pkg.echap_text_json (p_rec_evenm.vva_descr)
               || '","clas_css":"'
               || p_rec_evenm.vva_clas_css
               || '","titre_aide_insta":"'
               || afw_07_util_pkg.echap_text_json (p_rec_evenm.vva_titre_aide_insta)
               || '","aide_insta":"'
               || afw_07_util_pkg.echap_text_json (p_rec_evenm.vva_aide_insta)
               || '","lien":"'
               || '"');

      fermr_objet_javsc ();
    end formt_objet_javsc;
  begin
    rec_config_plugn        := obten_enreg_config_plugn (pnu_numr_apex_regn);

    if length (rec_config_plugn.enonc_pre_reqt) > 0
    then
      execute immediate rec_config_plugn.enonc_pre_reqt;
    end if;

    open cur_calnd for genr_reqt_sql (rec_config_plugn)
      using pva_agend
           ,trunc (afw_07_javsc_pkg.obten_date_oracl_calnd_javsc (pnu_date_debut_milsc))
           ,trunc (afw_07_javsc_pkg.obten_date_oracl_calnd_javsc (pnu_date_fin_milsc));

    fetch cur_calnd
      bulk collect into vta_tab_rec_evenm;

    close cur_calnd;

    vnu_nombr_evenm_calnd   := vta_tab_rec_evenm.count ();

    if vnu_nombr_evenm_calnd > 0
    then
      ouvri_objet_javsc ();
      htp.prn ('"row":');
      ouvri_table_javsc ();

      for i in 1 .. vta_tab_rec_evenm.count
      loop
        formt_objet_javsc (vta_tab_rec_evenm (i));

        if i < vta_tab_rec_evenm.count
        then
          sepr_objet ();
        end if;
      end loop;

      fermr_table_javsc ();

      fermr_objet_javsc ();
    else
      ouvri_objet_javsc ();
      htp.prn ('"row":');
      ouvri_table_javsc ();
      fermr_table_javsc ();
      fermr_objet_javsc ();
    end if;
  exception
    when others
    then
      ouvri_objet_javsc ();
      htp.prn ('"row":');
      ouvri_table_javsc ();
      fermr_table_javsc ();
      fermr_objet_javsc ();
  end obten_json_evenm_agend;

  procedure obten_json_evenm (pnu_numr_apex_regn   in number
                             ,pva_ident            in varchar2)
  is
    cur_calnd               sys_refcursor;
    rec_config_plugn        typ_rec_config_plugn;
    vta_tab_rec_evenm       typ_tab_rec_evenm;
    vnu_nombr_evenm_calnd   number;

    function genr_reqt_sql (pty_rec_config_plugn in typ_rec_config_plugn)
      return varchar2
    is
      vva_reqt_sql   varchar2 (32767);
    begin
      vva_reqt_sql      :=
           'select '
        || pty_rec_config_plugn.coln_ident
        || ' ident,'
        || pty_rec_config_plugn.coln_agend
        || ' agend,'
        || formt_chain (pty_rec_config_plugn.coln_indic_journ_compl)
        || ' indic_journ_compl,'
        || formt_chain (pty_rec_config_plugn.coln_indic_evenm_modfb)
        || ' indic_modfb,'
        || formt_chain (pty_rec_config_plugn.coln_date_journ_compl)
        || ' date_journ_compl,'
        || formt_chain (pty_rec_config_plugn.coln_date_fin_journ_compl)
        || ' date_fin_journ_compl,'
        || formt_chain (pty_rec_config_plugn.coln_date_debut)
        || ' date_debut,'
        || formt_chain (pty_rec_config_plugn.coln_date_fin)
        || ' date_fin,'
        || pty_rec_config_plugn.coln_titre
        || ' titre,'
        || formt_chain (pty_rec_config_plugn.coln_descr)
        || ' descr,'
        --|| pty_rec_config_plugn.coln_type
        || ' afw_21_plugn_calnd_pkg.obten_clas_css (:pnu_numr_apex_regn, '
        || pty_rec_config_plugn.coln_agend
        || ')'
        || ' clas_css,'
        || formt_chain (pty_rec_config_plugn.coln_titre_aide_insta)
        || ' titre_aide_insta,'
        || formt_chain (pty_rec_config_plugn.coln_aide_insta)
        || ' aide_insta,'
        || formt_chain (pty_rec_config_plugn.coln_lien)
        || ' lien'
        || '  from '
        || pty_rec_config_plugn.nom_table
        || '  where '
        || pty_rec_config_plugn.coln_ident
        || ' = :pva_ident';

      return vva_reqt_sql;
    end genr_reqt_sql;

    procedure formt_objet_javsc (p_rec_evenm in typ_rec_evenm)
    is
    begin
      ouvri_objet_javsc ();

      htp.prn (   '"ident":"'
               || p_rec_evenm.vva_ident
               || '","agend":"'
               || p_rec_evenm.vva_agend
               || '","indic_journ_compl":'
               || case
                    when p_rec_evenm.vva_indic_journ_compl in ('O'
                                                              ,'Y')
                    then
                      'true'
                    else
                      'false'
                  end
               || ',"indic_modfb":'
               || case
                    when p_rec_evenm.vva_indic_modfb in ('O'
                                                        ,'Y')
                    then
                      'true'
                    else
                      'false'
                  end
               || ',"date_journ_compl":"'
               || formt_date (p_rec_evenm.vda_date_journ_compl)
               || '","date_fin_journ_compl":"'
               || formt_date (p_rec_evenm.vda_date_fin_journ_compl)
               || '","date_debut":"'
               || formt_date (p_rec_evenm.vda_date_debut)
               || '","date_fin":"'
               || formt_date (p_rec_evenm.vda_date_fin)
               || '","titre":"'
               || afw_07_util_pkg.echap_text_json (p_rec_evenm.vva_titre)
               || '","descr":"'
               || afw_07_util_pkg.echap_text_json (p_rec_evenm.vva_descr)
               || '","clas_css":"'
               || p_rec_evenm.vva_clas_css
               || '","titre_aide_insta":"'
               || afw_07_util_pkg.echap_text_json (p_rec_evenm.vva_titre_aide_insta)
               || '","aide_insta":"'
               || afw_07_util_pkg.echap_text_json (p_rec_evenm.vva_aide_insta)
               || '","lien":"'
               || p_rec_evenm.vva_lien
               || '"');

      fermr_objet_javsc ();
    end formt_objet_javsc;
  begin
    rec_config_plugn        := obten_enreg_config_plugn (pnu_numr_apex_regn);

    if length (rec_config_plugn.enonc_pre_reqt) > 0
    then
      execute immediate rec_config_plugn.enonc_pre_reqt;
    end if;

    open cur_calnd for genr_reqt_sql (rec_config_plugn)
      using pnu_numr_apex_regn
           ,pva_ident;

    fetch cur_calnd
      bulk collect into vta_tab_rec_evenm;

    close cur_calnd;

    vnu_nombr_evenm_calnd   := vta_tab_rec_evenm.count ();

    if vnu_nombr_evenm_calnd > 0
    then
      ouvri_objet_javsc ();
      htp.prn ('"row":');
      ouvri_table_javsc ();

      for i in 1 .. vta_tab_rec_evenm.count
      loop
        formt_objet_javsc (vta_tab_rec_evenm (i));

        if i < vta_tab_rec_evenm.count
        then
          sepr_objet ();
        end if;
      end loop;

      fermr_table_javsc ();

      fermr_objet_javsc ();
    else
      ouvri_objet_javsc ();
      htp.prn ('"row":');
      ouvri_table_javsc ();
      fermr_table_javsc ();
      fermr_objet_javsc ();
    end if;
  exception
    when others
    then
      ouvri_objet_javsc ();
      htp.prn ('"row":');
      ouvri_table_javsc ();
      fermr_table_javsc ();
      fermr_objet_javsc ();
  end obten_json_evenm;

  function obten_prop_entet_formt (pva_conct_enten in varchar2)
    return varchar2
  is
    vta_elemn       apex_application_global.vc_arr2;
    vva_retr        varchar2 (500);
    vva_code_domn   varchar2 (23);
    vva_code_detl   varchar2 (23);

    function est_nombr (pva_valr in varchar2)
      return boolean
    is
      vnu_void   number;
    begin
      vnu_void   := to_number (pva_valr);
      return true;
    exception
      when others
      then
        return false;
    end est_nombr;

    procedure obten_domn_valr (pva_valr        in     varchar2
                              ,pva_code_domn      out varchar2
                              ,pva_code_detl      out varchar2)
    is
      vta_elemn_valr   apex_application_global.vc_arr2;
    begin
      vta_elemn_valr      :=
        afw_07_util_pkg.string_to_table (pva_valr
                                        ,',');

      if vta_elemn_valr.count () != 0
      then
        pva_code_domn   := vta_elemn_valr (1);
        pva_code_detl   := vta_elemn_valr (2);
      end if;
    end obten_domn_valr;
  begin
    vta_elemn   := afw_07_util_pkg.string_to_table (pva_conct_enten);

    if vta_elemn.count () != 0
    then
      for i in vta_elemn.first () .. vta_elemn.last ()
      loop
        obten_domn_valr (vta_elemn (i)
                        ,vva_code_domn
                        ,vva_code_detl);

        if     est_nombr (vva_code_detl)
           and to_number (vva_code_detl) < 0
           and i != vta_elemn.first ()
           and i != vta_elemn.last ()
        then
          vva_retr      :=
               rtrim (rtrim (vva_retr
                            ,',')
                     ,' ')
            || ' ';
        elsif not est_nombr (vva_code_detl)
        then
          vva_retr      :=
               vva_retr
            || afw_14_domn_valr_pkg.obten_valr_organ (afw_14_domn_valr_pkg.obten_seqnc (vva_code_domn
                                                                                       ,vva_code_detl
                                                                                       ,'AFW'))
            || ',';
        end if;
      end loop;
    end if;

    return ltrim (rtrim (vva_retr
                        ,', ')
                 ,', ');
  exception
    when others
    then
      raise;
  end obten_prop_entet_formt;

  procedure defnr_etat_calnd (pnu_numr_apex_regn     in number
                             ,pva_mode               in varchar2
                             ,pnu_date_debut_milsc   in number)
  is
  begin
    afw_12_calnd_pkg.defnr_mode (pnu_numr_apex_regn
                                ,pva_mode);

    afw_12_calnd_pkg.defnr_date (pnu_numr_apex_regn
                                ,to_char (afw_07_javsc_pkg.obten_date_oracl_calnd_javsc (pnu_date_debut_milsc)
                                         ,'YYYY/MM/DD'));
  end defnr_etat_calnd;

  procedure initl_actio_sesn
  is
  begin
    afw_07_sesn_pkg.suprm_valr_sesn (kva_s_selct_indic_journ_compl);
    afw_07_sesn_pkg.suprm_valr_sesn (kva_s_selct_date_debut);
    afw_07_sesn_pkg.suprm_valr_sesn (kva_s_selct_date_fin);
    afw_07_sesn_pkg.suprm_valr_sesn (kva_s_choix_evenm_ident);
  end initl_actio_sesn;

  procedure defnr_actio_selct (pva_indic_journ_compl   in varchar2
                              ,pva_date_debut          in varchar2
                              ,pva_date_fin            in varchar2)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_selct_indic_journ_compl
                                    ,pva_indic_journ_compl);
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_selct_date_debut
                                    ,pva_date_debut);
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_selct_date_fin
                                    ,pva_date_fin);
  end defnr_actio_selct;

  procedure defnr_actio_choix_evenm (pva_ident in varchar2)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_choix_evenm_ident
                                    ,pva_ident);
  end defnr_actio_choix_evenm;

  procedure defnr_actio_deplc_evenm (pva_ident               in varchar2
                                    ,pva_indic_journ_compl   in varchar2
                                    ,pva_date_debut          in varchar2
                                    ,pva_date_fin            in varchar2)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_deplc_ident
                                    ,pva_ident);
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_deplc_indic_journ_compl
                                    ,pva_indic_journ_compl);
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_deplc_date_debut
                                    ,pva_date_debut);
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_deplc_date_fin
                                    ,pva_date_fin);
  end defnr_actio_deplc_evenm;

  procedure defnr_actio_ajust_evenm (pva_ident      in varchar2
                                    ,pva_date_fin   in varchar2)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_ajust_ident
                                    ,pva_ident);
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_ajust_date_fin
                                    ,pva_date_fin);
  end defnr_actio_ajust_evenm;

  procedure genr_json_evenm
  is
  begin
    -- Objet JSON qui permet de générer le nouvel événement dans le calendrier
    afw_15_ajax_pkg.obten_json_sql (   'select '
                                    || ''''
                                    || gre_evenm.vva_ident
                                    || ''' ident,'
                                    || ''''
                                    || gre_evenm.vva_agend
                                    || ''' agend,'
                                    || ''''
                                    || case when gre_evenm.vva_indic_journ_compl is not null then 'true' else 'false' end
                                    || ''' indic_journ_compl,'
                                    || ''''
                                    || to_char (gre_evenm.vda_date_journ_compl
                                               ,'YYYY-MM-DD')
                                    || ''' date_journ_compl,'
                                    || ''''
                                    || to_char (gre_evenm.vda_date_fin_journ_compl
                                               ,'YYYY-MM-DD')
                                    || ''' date_fin_journ_compl,'
                                    || ''''
                                    || to_char (gre_evenm.vda_date_debut
                                               ,'YYYY-MM-DD')
                                    || 'T'
                                    || to_char (gre_evenm.vda_date_debut
                                               ,'HH24:MI')
                                    || ''' date_debut,'
                                    || ''''
                                    || to_char (gre_evenm.vda_date_fin
                                               ,'YYYY-MM-DD')
                                    || 'T'
                                    || to_char (gre_evenm.vda_date_fin
                                               ,'HH24:MI')
                                    || ''' date_fin,'
                                    || ''''
                                    || formt_chain_json (gre_evenm.vva_titre)
                                    || ''' titre,'
                                    || ''''
                                    || formt_chain_json (gre_evenm.vva_descr)
                                    || ''' descr,'
                                    || ''''
                                    || formt_chain_json (gre_evenm.vva_clas_css)
                                    || ''' clas_css,'
                                    || ''''
                                    || formt_chain_json (gre_evenm.vva_titre_aide_insta)
                                    || ''' titre_aide_insta,'
                                    || ''''
                                    || formt_chain_json (gre_evenm.vva_aide_insta)
                                    || ''' aide_insta,'
                                    || ''''
                                    || gre_evenm.vva_lien
                                    || ''' lien'
                                    || ' from dual');
  end genr_json_evenm;

  procedure valdr_heure (pva_heure_debut         in varchar2
                        ,pva_heure_fin           in varchar2
                        ,pva_heure_debut_exten   in varchar2 default null
                        ,pva_heure_fin_exten     in varchar2 default null)
  is
    vnu_heure_debut         number;
    vnu_heure_fin           number;
    vnu_heure_debut_exten   number;
    vnu_heure_fin_exten     number;
    vnu_mints_debut         number;
    vnu_mints_fin           number;
    vnu_mints_debut_exten   number;
    vnu_mints_fin_exten     number;

    function detrm_champ_ern (pbo_indic_fin     in boolean default false
                             ,pbo_indic_exten   in boolean default false)
      return varchar2
    is
      vva_libl_champ   varchar2 (30);
    begin
      vva_libl_champ   := 'Heure';

      if not pbo_indic_fin
      then
        vva_libl_champ      :=
             vva_libl_champ
          || ' début';
      else
        vva_libl_champ      :=
             vva_libl_champ
          || ' fin';
      end if;

      if pbo_indic_exten
      then
        vva_libl_champ      :=
             vva_libl_champ
          || ' extensionnée';
      end if;

      return vva_libl_champ;
    end detrm_champ_ern;

    function obten_heure (pva_valr          in varchar2
                         ,pbo_indic_fin     in boolean default false
                         ,pbo_indic_exten   in boolean default false)
      return number
    is
      vnu_heure      number (2);
      vva_valr       varchar2 (10) default pva_valr;
      vbo_presn_24   boolean; --Déterminer si on est en 24 ou 12am/pm
      vva_mode       varchar2 (2);
    begin
      --Déterminer le bon mode
      if pva_valr is null
      then
        return null;
      end if;

      vva_mode      :=
        substr (vva_valr
               ,-2);

      if vva_mode in ('am'
                     ,'pm')
      then
        vbo_presn_24   := false;
      else
        vbo_presn_24   := true;
        vva_mode       := ' ';
      end if;

      if instr (vva_valr
               ,':') > 0
      then
        vva_valr      :=
          substr (vva_valr
                 ,1
                 ,  instr (vva_valr
                          ,':')
                  - 1);
      else
        vva_valr      :=
          rtrim (vva_valr
                ,vva_mode);
      end if;

      vnu_heure   := to_number (vva_valr);

      --Valider si l'heure est invalide
      if        (   vnu_heure > 24
                 or vnu_heure < 0)
            and vbo_presn_24
         or     (   vnu_heure > 12
                 or vnu_heure < 0)
            and not vbo_presn_24
      then
        --Déterminer le champs erroné
        afw_01_err_apex_pkg.lever_err_apex_code ('CAL.000001'
                                                ,detrm_champ_ern (pbo_indic_fin
                                                                 ,pbo_indic_exten)
                                                ,pva_code_prodt   => 'AFW');
      end if;

      --Transformer les heures en 24 si elles sont en 12
      if     not vbo_presn_24
         and vva_mode = 'pm'
      then
        vnu_heure   := vnu_heure + 12;
      end if;

      return vnu_heure;
    end obten_heure;

    function obten_mints (pva_valr          in varchar2
                         ,pbo_indic_fin     in boolean default false
                         ,pbo_indic_exten   in boolean default false)
      return number
    is
      vnu_mints   number (2) default 0;
      vva_valr    varchar2 (10)
                    default rtrim (pva_valr
                                  ,'apm');
    begin
      if pva_valr is null
      then
        return null;
      end if;

      if instr (vva_valr
               ,':') > 0
      then
        vnu_mints      :=
          to_number (substr (vva_valr
                            ,  instr (vva_valr
                                     ,':')
                             + 1));
      end if;

      if    vnu_mints < 0
         or vnu_mints > 59
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('CAL.000002'
                                                ,detrm_champ_ern (pbo_indic_fin
                                                                 ,pbo_indic_exten)
                                                ,pva_code_prodt   => 'AFW'); --Raise message d'erreur
      end if;

      return vnu_mints;
    end obten_mints;
  begin
    vnu_heure_debut   := obten_heure (pva_heure_debut);
    vnu_heure_fin      :=
      obten_heure (pva_heure_fin
                  ,true);
    vnu_heure_debut_exten      :=
      obten_heure (pva_heure_debut_exten
                  ,false
                  ,true);
    vnu_heure_fin_exten      :=
      obten_heure (pva_heure_fin_exten
                  ,true
                  ,true);
    vnu_mints_debut   := obten_mints (pva_heure_debut);
    vnu_mints_fin      :=
      obten_mints (pva_heure_fin
                  ,true);
    vnu_mints_debut_exten      :=
      obten_mints (pva_heure_debut_exten
                  ,false
                  ,true);
    vnu_mints_fin_exten      :=
      obten_mints (pva_heure_fin_exten
                  ,true
                  ,true);

    --Valider si l'heure de début est inférieure à l'heure de fin
    if    (vnu_heure_fin < vnu_heure_debut)
       or (    vnu_heure_fin = vnu_heure_debut
           and vnu_mints_fin <= vnu_mints_debut)
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('CAL.000004'
                                              ,'heure de fin'
                                              ,'heure de début'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    --Valider si l'heure de début extensionnée est inférieure à l'heure de fin extensionnée, à condition que les deux soient présente
    if     vnu_heure_debut_exten is not null
       and vnu_heure_fin_exten is not null
       and (   (vnu_heure_fin_exten < vnu_heure_debut_exten)
            or (    vnu_heure_fin_exten = vnu_heure_debut_exten
                and vnu_mints_fin_exten <= vnu_mints_debut_exten))
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('CAL.000004'
                                              ,'heure de fin extensionnée'
                                              ,'heure de début extensionnée'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    --Valider si l'heure de début extensionnée est inférieure à l'heure de début normale, à condition que
    --l'heure de début extensionnée n'est pas vide
    if     vnu_heure_debut_exten is not null
       and (   (vnu_heure_debut < vnu_heure_debut_exten)
            or (    vnu_heure_debut = vnu_heure_debut_exten
                and vnu_mints_debut <= vnu_mints_debut_exten))
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('CAL.000004'
                                              ,'heure de début'
                                              ,'heure de début extensionnée'
                                              ,pva_code_prodt   => 'AFW');
    end if;

    --Valider si l'heure de fin est inférieure à l'heure de fin extensionnée, à condition que
    --l'heure de fin extensionnée n'est pas vide
    if     vnu_heure_fin_exten is not null
       and (   (vnu_heure_fin_exten < vnu_heure_fin)
            or (    vnu_heure_fin_exten = vnu_heure_fin
                and vnu_mints_fin_exten <= vnu_mints_fin))
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('CAL.000004'
                                              ,'heure de fin extensionnée'
                                              ,'heure de fin'
                                              ,pva_code_prodt   => 'AFW');
    end if;
  end valdr_heure;

  function obten_vue (pva_code in varchar2)
    return varchar2
  is
  begin
    return afw_14_domn_valr_pkg.obten_valr_organ (afw_14_domn_valr_pkg.obten_seqnc ('VUE_DISPN_CALND'
                                                                                   ,pva_code
                                                                                   ,'AFW'));
  end obten_vue;

  function obten_vue_jour
    return varchar2
  is
  begin
    return obten_vue ('JOUR');
  end obten_vue_jour;

  function obten_vue_jour_simpl
    return varchar2
  is
  begin
    return obten_vue ('JOUR_SIMPL');
  end obten_vue_jour_simpl;

  function obten_vue_semn
    return varchar2
  is
  begin
    return obten_vue ('SEMN');
  end obten_vue_semn;

  function obten_vue_semn_simpl
    return varchar2
  is
  begin
    return obten_vue ('SEMN_SIMPL');
  end obten_vue_semn_simpl;

  function obten_vue_mois
    return varchar2
  is
  begin
    return obten_vue ('MOIS');
  end obten_vue_mois;
end afw_21_plugn_calnd_pkg;
/
