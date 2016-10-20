SET DEFINE OFF;
create or replace package body afw_21_plugn_dialg_ifram_pkg
is
  gbo_mode_debug   boolean default false;

  procedure defnr_contx_apres_fermt_dialg
  is
    vnu_fa_courn   number;
  begin
    vnu_fa_courn   := afw_04_fil_arian_pkg.obten_seqnc_fa_de_page_dest (afw_13_page_pkg.obten_numr_apex_page);

    -- Supprimer les éléments du fil d'ariane qui suivent la
    afw_04_fil_arian_pkg.suprm_elemn_apres (vnu_fa_courn);

    -- Synchroniser les variables
    afw_07_util_pkg.defnr_etat_sesn ('SIDF'
                                    ,vnu_fa_courn);

    afw_07_polc_pkg.defnr_contx_sesn_sidf (vnu_fa_courn);

    afw_04_fil_arian_pkg.synch_varbl (pnu_fa_courn => vnu_fa_courn);
    afw_04_contx_pkg.synch_varbl (pnu_fa_courn => vnu_fa_courn);

    afw_12_dialg_ifram_pkg.fermr_dialg_ouver ();
  end defnr_contx_apres_fermt_dialg;

  procedure fermr_dialg
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('body');
    afw_15_htp_pkg.ouvri_bals ('script'
                              ,'type'
                              ,'text/javascript');

    if afw_11_prodt_pkg.obten_domn_docmn_html is not null
    then
      afw_15_htp_pkg.ecrir (   'document.domain="'
                            || afw_11_prodt_pkg.obten_domn_docmn_html
                            || '";');
    end if;

    --fermer le dialogue
    afw_15_htp_pkg.ecrir ('parent.afw.jQuery("#"+parent.afw.jQuery(frameElement).parent().attr("id")).trigger("dialogclose_procs");');

    afw_15_htp_pkg.fermr_bals ('script');
    afw_15_htp_pkg.fermr_bals ('body');
  end fermr_dialg;

  procedure redrg_page_acuei_js
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('body');
    afw_15_htp_pkg.ouvri_bals ('script'
                              ,'type'
                              ,'text/javascript');

    afw_15_htp_pkg.ecrir (   'document.domain="'
                          || afw_11_prodt_pkg.obten_domn_docmn_html
                          || '";');

    -- Rediriger vers la page d'accueil
    afw_15_htp_pkg.ecrir (   'parent.location.href = "'
                          || 'f?p='
                          || afw_11_prodt_pkg.obten_numr_apex_aplic_acuei
                          || ':'
                          || afw_11_prodt_pkg.obten_numr_apex_page_acuei
                          || ':'
                          || afw_12_sesn_pkg.obten_sesn
                          || '";');

    afw_15_htp_pkg.fermr_bals ('script');
    afw_15_htp_pkg.fermr_bals ('body');

    afw_07_util_pkg.aret_trait_page_apex;
  end redrg_page_acuei_js;
end afw_21_plugn_dialg_ifram_pkg;
/
