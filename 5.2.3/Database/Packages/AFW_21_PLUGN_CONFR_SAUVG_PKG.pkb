SET DEFINE OFF;
create or replace package body afw_21_plugn_confr_sauvg_pkg
is
  function obten_mesg_confr
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (kva_s_mesg);
  end obten_mesg_confr;

  procedure defnr_mesg_confr (pva_mesg in varchar2)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_mesg
                                    ,pva_mesg);
  end defnr_mesg_confr;

  function obten_reqt_sauvg
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (kva_s_reqt);
  end obten_reqt_sauvg;

  procedure defnr_reqt_sauvg (pva_liste_reqt in varchar2)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (kva_s_reqt
                                    ,replace (pva_liste_reqt
                                             ,','
                                             ,':'));
  end defnr_reqt_sauvg;

  procedure obten_json_item_confr
  is
    vnu_page_sesn        vd_i_afw_13_page.seqnc%type := afw_13_page_pkg.obten_page_sesn;
    vnu_page_zero_sesn   vd_i_afw_13_page.seqnc%type := afw_13_page_pkg.obten_page_zero_sesn;
  begin
    -- génère l'objet JSON
    afw_15_ajax_pkg.obten_json_sql (   'select  pi.nom_apex
                                       from  vd_afw_13_page_item pi,
                                             vd_afw_13_page p
                                      where       p.seqnc in ('
                                    || vnu_page_sesn
                                    || ', '
                                    || vnu_page_zero_sesn
                                    || ')
                                             and  p.seqnc = pi.ref_page
                                             and  pi.type_item = ''ITEM''
                                             and  pi.indic_confr_sauvg = ''O''
                                       order by 1');
  end obten_json_item_confr;

  procedure obten_json_reqt_sauvg
  is
    vnu_page_sesn        vd_i_afw_13_page.seqnc%type := afw_13_page_pkg.obten_page_sesn;
    vnu_page_zero_sesn   vd_i_afw_13_page.seqnc%type := afw_13_page_pkg.obten_page_zero_sesn;
  begin
    -- génère l'objet JSON
    afw_15_ajax_pkg.obten_json_sql (   'select  pi.nom_apex
                                       from  vd_afw_13_page_item pi,
                                             vd_afw_13_page p
                                      where       p.seqnc in ('
                                    || vnu_page_sesn
                                    || ', '
                                    || vnu_page_zero_sesn
                                    || ')
                                             and  p.seqnc = pi.ref_page
                                             and  pi.type_item = ''BOUTN''
                                             and  pi.indic_confr_sauvg = ''N''
                                     union all
                                     select aip.source nom_apex
                                     from   apex_item_page aip,
                                            vd_afw_13_page_item pi,
                                            vd_afw_13_page p
                                      where       aip.id = pi.id_apex
                                             and  aip.display_as = ''BUTTON''
                                             and  p.seqnc in ('
                                    || vnu_page_sesn
                                    || ', '
                                    || vnu_page_zero_sesn
                                    || ')
                                             and  p.seqnc = pi.ref_page
                                             and  pi.type_item = ''ITEM''
                                             and  pi.indic_confr_sauvg = ''N''
                                      union all
                                      select column_value nom_apex
                                       from table(afw_07_util_pkg.strin_to_table_va(afw_21_plugn_confr_sauvg_pkg.obten_reqt_sauvg))
                                       order by 1');
  end obten_json_reqt_sauvg;
end afw_21_plugn_confr_sauvg_pkg;
/
