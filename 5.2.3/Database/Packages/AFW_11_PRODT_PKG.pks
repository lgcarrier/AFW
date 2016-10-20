SET DEFINE OFF;
create or replace package afw_11_prodt_pkg
is
  gva_base_url   varchar2 (1000);

  function obten_prodt_sesn
    return number;

  function obten_prodt (pva_code_prodt in varchar2)
    return number;

  function obten_code_prodt (pnu_seqnc in number default null)
    return varchar2;

  function obten_aplic_acuei (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return vd_i_afw_11_prodt.ref_aplic_acuei%type;

  function obten_numr_apex_aplic_acuei (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return number;

  function obten_page_acuei (pnu_prodt in number default null)
    return number;

  function obten_numr_apex_page_acuei (pnu_prodt in number default null)
    return number;

  function obten_aplic_comnt_bogue (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return vd_i_afw_11_prodt.ref_aplic_comnt_bogue%type;

  function obten_numr_apex_aplic_cb (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return number;

  function obten_page_comnt_bogue (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return vd_i_afw_11_prodt.ref_page_comnt_bogue%type;

  function obten_numr_apex_page_cb (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return number;

  function obten_numr_versn (pnu_versn_niv_1   in number
                            ,pnu_versn_niv_2   in number
                            ,pnu_versn_niv_3   in number
                            ,pnu_versn_niv_4   in number)
    return number
    deterministic;

  function obten_versn (pnu_versn_niv_1   in number
                       ,pnu_versn_niv_2   in number
                       ,pnu_versn_niv_3   in number
                       ,pnu_versn_niv_4   in number)
    return varchar2
    deterministic;

  function obten_versn
    return varchar2;

  /*
    function obten_schem (pnu_seqnc in number default null)
      return varchar2;
  */

  function obten_schem_afw
    return varchar2;

  function obten_dosr_fichr_prodt (pnu_seqnc in number default null)
    return varchar2;

  procedure inser_prodt (pva_code           in varchar2
                        ,pva_nom            in varchar2
                        ,pnu_numr_versn_1   in number
                        ,pnu_numr_versn_2   in number
                        ,pnu_numr_versn_3   in number
                        ,pnu_numr_versn_4   in number);

  function maj_prodt (pva_code                in varchar2
                     ,pva_nom                 in varchar2
                     ,pva_procd_expor_metdn   in varchar2
                     ,pnu_tail_tabl_extra     in number
                     ,pva_indic_extra_tout    in varchar2
                     ,pnu_ref_versn_courn     in number default null)
    return number;

  procedure telvs_fichr (pcl_fichr              in clob
                        ,pva_nom_fichr          in varchar2
                        ,pbo_atach              in boolean default true
                        ,pva_contn_type         in varchar2 default 'text/plain'
                        ,pbo_arret_engin_apex   in boolean default false
                        ,pnu_chars_id           in number default 0);

  procedure telvs_fichr (pbl_fichr              in out nocopy blob
                        ,pva_nom_fichr          in            varchar2
                        ,pva_contn_type         in            varchar2
                        ,pbo_atach              in            boolean default true
                        ,pbo_arret_engin_apex   in            boolean default false
                        ,pnu_chars_id           in            number default 0);

  function obten_lang_deft (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn ())
    return vd_i_afw_01_lang.seqnc%type;

  function obten_code_lang_deft (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn ())
    return vd_i_afw_01_lang.code%type;

  function obten_lang (pva_code    in vd_i_afw_01_lang.code%type
                      ,pnu_prodt   in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn ())
    return vd_i_afw_01_lang.seqnc%type;

  function obten_lang_sesn (pva_code_deft in varchar2 default null)
    return number;

  function obten_code_lang_sesn (pva_code_deft in varchar2 default null)
    return varchar2;

  function obten_ident_envir (pnu_prodt in number default obten_prodt_sesn)
    return varchar2;

  function obten_versn_courn (pnu_prodt in number)
    return number;

  function obten_jquer_ui_css_scope (pnu_prodt in number default null)
    return varchar2;

  function obten_mesg_tout_droit_resrv (pnu_prodt in number default null)
    return varchar2;

  function obten_url_acuei (pnu_prodt in number default obten_prodt_sesn)
    return varchar2;

  function obten_url_authe_cible_sesn
    return varchar2;

  procedure defnr_item_aplic_apex;

  function obten_page_inexs_maj_refrn (pnu_prodt in vd_i_afw_11_prodt.seqnc%type)
    return boolean;

  function obten_mesg_sucs_prodt (pnu_prodt in number default null)
    return varchar2;

  function obten_mesg_echec_prodt (pnu_prodt in number default null)
    return varchar2;

  function obten_mesg_fetch_prodt (pnu_prodt in number default null)
    return varchar2;

  function obten_mesg_suprm_prodt (pnu_prodt in number default null)
    return varchar2;

  function obten_mesg_modf_prodt (pnu_prodt in number default null)
    return varchar2;

  function obten_mesg_inser_prodt (pnu_prodt in number default null)
    return varchar2;

  function obten_mesg_aucun_don_prodt (pnu_prodt in number default null)
    return varchar2;

  function obten_mesg_trop_don_prodt (pnu_prodt in number default null)
    return varchar2;

  procedure deplr_formt_resrc_prodt (pnu_prodt in number);

  function obten_dosr_fichr_afw (pnu_prodt in number default null)
    return varchar2
    result_cache;

  function obten_base_url (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2;

  function obten_procd_entet_plpdf (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return vd_i_afw_11_prodt.procd_impre_entet_pdf_ir%type;

  function obten_procd_pied_page_plpdf (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return vd_i_afw_11_prodt.procd_impre_pied_page_pdf_ir%type;

  function obten_procd_coulr_plpdf (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return vd_i_afw_11_prodt.procd_plpdf_coulr%type;

  function obten_numr_versn_prodt (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2;

  function obten_numr_versn_prodt_afw
    return varchar2;

  function obten_nom (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2;

  procedure creer_mesg_base_prodt (pnu_prodt   in vd_i_afw_11_prodt.seqnc%type
                                  ,pnu_lang    in vd_i_afw_01_lang.seqnc%type default null);

  function obten_domn_docmn_html (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2;

  function obten_initl_comps_javsc (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2;

  function obten_note_scrip_pre_migrt (pnu_prodt in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_11_prodt.note_scrip_pre_migrt%type;

  function obten_note_scrip_post_migrt (pnu_prodt in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_11_prodt.note_scrip_post_migrt%type;

  procedure activ_aplic (pnu_prodt         in vd_i_afw_11_prodt.seqnc%type
                        ,pbo_mode_debg     in boolean default false
                        ,pbo_barre_editn   in boolean default false);

  procedure deact_aplic (pnu_prodt in vd_i_afw_11_prodt.seqnc%type);

  function obten_fonct_migrt_persn (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2;
end afw_11_prodt_pkg;
/
