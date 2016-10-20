SET DEFINE OFF;
create or replace package body afw_21_plugn_tutrl_pkg
as
  function obten_tutrl (pva_code in vd_afw_13_tutrl.code%type)
    return vd_afw_13_tutrl.seqnc%type
  is
    vnu_tutrl   vd_afw_13_tutrl.seqnc%type;
  begin
    select st.seqnc
      into vnu_tutrl
      from vd_afw_13_tutrl st
     where st.code = pva_code;

    return vnu_tutrl;
  exception
    when no_data_found
    then
      return null;
  end obten_tutrl;

  function obten_etape_tutrl (pnu_tutrl         in vd_afw_13_tutrl.seqnc%type
                             ,pnu_ordre_presn   in vd_afw_13_etape_tutrl.ordre_presn%type)
    return vd_afw_13_etape_tutrl.seqnc%type
  is
    vnu_etape_tutrl   vd_afw_13_etape_tutrl.seqnc%type;
  begin
    select seqnc
      into vnu_etape_tutrl
      from vd_i_afw_13_etape_tutrl
     where     ref_tutrl = pnu_tutrl
           and ordre_presn = pnu_ordre_presn;

    return vnu_etape_tutrl;
  exception
    when no_data_found
    then
      return null;
  end obten_etape_tutrl;

  function obten_ordre_presn_etape_tutrl (pnu_etape_tutrl in vd_afw_13_etape_tutrl.seqnc%type)
    return vd_afw_13_etape_tutrl.ordre_presn%type
  is
    vnu_ordre_presn   vd_afw_13_etape_tutrl.ordre_presn%type;
  begin
    select ordre_presn
      into vnu_ordre_presn
      from vd_i_afw_13_etape_tutrl et
     where et.seqnc = pnu_etape_tutrl;

    return vnu_ordre_presn;
  exception
    when no_data_found
    then
      return 0;
  end obten_ordre_presn_etape_tutrl;

  function obten_tutrl_premr_charg (pnu_page in vd_afw_13_etape_tutrl.ref_page%type)
    return vd_afw_13_tutrl.seqnc%type
  is
    vnu_tutrl   vd_afw_13_tutrl.seqnc%type;
  begin
    select st.seqnc
      into vnu_tutrl
      from vd_afw_13_tutrl       st
          ,vd_afw_13_etape_tutrl et
     where     st.indic_premr_charg = 'O'
           and et.ordre_presn = 0
           and et.ref_tutrl = st.seqnc
           and et.ref_page = pnu_page;

    return vnu_tutrl;
  exception
    when no_data_found
    then
      return null;
    when too_many_rows
    then
      ete ('ERREUR TUTORIEL');
      return null;
  end obten_tutrl_premr_charg;

  function obten_indic_premr_charg (pnu_tutrl in vd_afw_13_tutrl.seqnc%type)
    return varchar2
  is
    vva_indic_premr_charg   vd_afw_13_tutrl.indic_premr_charg%type default null;
  begin
    select indic_premr_charg
      into vva_indic_premr_charg
      from vd_afw_13_tutrl
     where seqnc = pnu_tutrl;

    return vva_indic_premr_charg;
  end obten_indic_premr_charg;

  function ouvri_liste_etape
    return varchar2
  is
  begin
    return ('[');
  end ouvri_liste_etape;

  function fermr_liste_etape
    return varchar2
  is
  begin
    return (']');
  end fermr_liste_etape;

  function ouvri_etape
    return varchar2
  is
  begin
    return ('{');
  end ouvri_etape;

  function fermr_etape
    return varchar2
  is
  begin
    return ('}');
  end fermr_etape;

  function sepr_etape
    return varchar2
  is
  begin
    return (',');
  end sepr_etape;

  function obten_liste_etape (pnu_tutrl in vd_afw_13_tutrl.seqnc%type)
    return number
  is
    cursor cur_etape_tutrl
    is
        select ref_page_item
              ,selct_jquer_elemn_html
              ,ref_mesg_titre
              ,ref_mesg_descr
              ,ref_dv_postn_afich
              ,indic_afich_toile_fond
              ,indic_mode_reflx
              ,indic_afich_orphe
              ,templ_html
              ,on_next
              ,on_prev
              ,on_show
              ,on_shown
              ,on_hide
              ,on_hidn
              ,ref_tutrl_suivn
              ,ref_etape_tutrl_suivn
          from vd_afw_13_etape_tutrl et
         where et.ref_tutrl = pnu_tutrl
      order by et.ordre_presn;

    vnu_i       number := 1;
    vnu_index   number;
  begin
    vnu_index   := afw_07_clob_pkg.creer_nouv ();

    afw_07_clob_pkg.ajout (ouvri_liste_etape
                          ,vnu_index);

    for rec_etape_tutrl in cur_etape_tutrl
    loop
      afw_07_clob_pkg.ajout (   case when vnu_i = 1 then null else sepr_etape end
                             || ouvri_etape
                             || apex_javascript.add_attribute ('element'
                                                              ,rec_etape_tutrl.selct_jquer_elemn_html)
                             || apex_javascript.add_attribute ('placement'
                                                              ,afw_14_domn_valr_pkg.obten_valr_organ (rec_etape_tutrl.ref_dv_postn_afich))
                             || apex_javascript.add_attribute ('title'
                                                              ,afw_01_gestn_mesg_pkg.obten_mesg (rec_etape_tutrl.ref_mesg_titre))
                             || apex_javascript.add_attribute ('content'
                                                              ,afw_01_gestn_mesg_pkg.obten_mesg (rec_etape_tutrl.ref_mesg_descr))
                             || apex_javascript.add_attribute ('backdrop'
                                                              ,afw_21_util_pkg.formt_plugn_atrib_boln (rec_etape_tutrl.indic_afich_toile_fond))
                             || apex_javascript.add_attribute ('reflex'
                                                              ,afw_21_util_pkg.formt_plugn_atrib_boln (rec_etape_tutrl.indic_mode_reflx))
                             || apex_javascript.add_attribute ('orphan'
                                                              ,afw_21_util_pkg.formt_plugn_atrib_boln (rec_etape_tutrl.indic_afich_orphe))
                             || apex_javascript.add_attribute ('template'
                                                              ,to_char (rec_etape_tutrl.templ_html))
                             || afw_21_util_pkg.ajout_atrib_fonct_javsc ('onNext'
                                                                        ,to_char (rec_etape_tutrl.on_next))
                             || afw_21_util_pkg.ajout_atrib_fonct_javsc ('onPrev'
                                                                        ,to_char (rec_etape_tutrl.on_prev))
                             || afw_21_util_pkg.ajout_atrib_fonct_javsc ('onShow'
                                                                        ,to_char (rec_etape_tutrl.on_show))
                             || afw_21_util_pkg.ajout_atrib_fonct_javsc ('onShown'
                                                                        ,to_char (rec_etape_tutrl.on_shown))
                             || afw_21_util_pkg.ajout_atrib_fonct_javsc ('onHide'
                                                                        ,to_char (rec_etape_tutrl.on_hide))
                             || afw_21_util_pkg.ajout_atrib_fonct_javsc ('onHidden'
                                                                        ,to_char (rec_etape_tutrl.on_hidn))
                             || apex_javascript.add_attribute ('vva_plugn_ajax'
                                                              ,apex_plugin.get_ajax_identifier
                                                              ,p_add_comma   => false)
                             || fermr_etape
                            ,vnu_index);

      vnu_i   := vnu_i + 1;
    end loop;

    afw_07_clob_pkg.ajout (fermr_liste_etape
                          ,vnu_index);

    return vnu_index;
  end obten_liste_etape;

  function exist_histr_charg (pnu_tutrl   in vd_afw_13_tutrl.seqnc%type
                             ,pnu_utils   in vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct)
    return boolean
  is
    vnu_exist   number;
    vbo_exist   boolean default false;
  begin
    select count (*)
      into vnu_exist
      from vd_afw_12_histr_tutrl sht
     where     sht.ref_tutrl = pnu_tutrl
           and sht.ref_utils = pnu_utils;

    if vnu_exist > 0
    then
      vbo_exist   := true;
    end if;

    return vbo_exist;
  end exist_histr_charg;

  procedure ajout_histr (pnu_tutrl   in vd_afw_13_tutrl.seqnc%type
                        ,pnu_utils   in vd_afw_12_utils.seqnc%type)
  is
  begin
    insert into vd_afw_12_histr_tutrl (ref_tutrl
                                      ,ref_utils)
         values (pnu_tutrl
                ,pnu_utils);
  end ajout_histr;

  function exist_tutrl_cedl (pnu_page    in vd_afw_13_page.seqnc%type
                            ,pnu_utils   in vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct)
    return boolean
  is
  begin
    return afw_12_tutrl_pkg.exist_cedl (pnu_page
                                       ,pnu_utils);
  end exist_tutrl_cedl;

  function obten_tutrl_cedl (pnu_page    in vd_afw_13_page.seqnc%type
                            ,pnu_utils   in vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct)
    return afw_12_tutrl_pkg.gty_parmt_tutrl
  is
  begin
    return afw_12_tutrl_pkg.obten_cedl_tutrl (pnu_page
                                             ,pnu_utils);
  end obten_tutrl_cedl;

  procedure defnr_etape_suivn_cedl (pnu_tutrl               in vd_afw_13_tutrl.seqnc%type
                                   ,pnu_ordre_etape_tutrl   in vd_afw_13_etape_tutrl.ordre_presn%type
                                   ,pnu_utils               in vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct)
  is
  begin
    afw_12_tutrl_pkg.defnr_cedl (pnu_tutrl
                                ,pnu_ordre_etape_tutrl
                                ,pnu_utils);
  end defnr_etape_suivn_cedl;

  procedure termn_cedl_tutrl (pnu_tutrl   in vd_afw_13_tutrl.seqnc%type
                             ,pnu_utils   in vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct)
  is
  begin
    afw_12_tutrl_pkg.suprm_cedl_tutrl (pnu_tutrl
                                      ,pnu_utils);
  end termn_cedl_tutrl;
end afw_21_plugn_tutrl_pkg;
/
