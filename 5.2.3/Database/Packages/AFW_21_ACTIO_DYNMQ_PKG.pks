SET DEFINE OFF;
create or replace package afw_21_actio_dynmq_pkg
  authid current_user
is
  type typ_code_plugn is table of varchar2 (30)
    index by varchar2 (30);

  gta_code_plugn                 typ_code_plugn;
  gva_redrc_url_dynmq            varchar2 (4000);
  kva_redrc_url_dynmq   constant varchar2 (30) default 'S_AFW_21_REDRC_URL_DYNMQ_FONCT';

  function valdr_prise_charg (pva_code_plugn in varchar2)
    return boolean;

  function obten_id_regn_afect (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
    return number;

  function obten_ident_regn_afect (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
    return varchar2;

  function obten_elemn_afect (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
    return varchar2;

  function obten_elemn_decln (pnu_actio_dynmq in apex_actio_dynmq_actio.id%type)
    return varchar2;

  function genr_plugn_confr_sauvg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                  ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_plugn_confr_sauvg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                  ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_plugn_confr_sauvg_reint (p_dynamic_action   in apex_plugin.t_dynamic_action
                                        ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_afw_18_depsm_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                        ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_afw_18_depsm_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                        ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_plugn_depsm_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_plugn_depsm_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_plugn_navgt_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_plugn_gestn_tablr_form (p_dynamic_action   in apex_plugin.t_dynamic_action
                                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_plugn_cliqr_selct_texte (p_dynamic_action   in apex_plugin.t_dynamic_action
                                        ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_matrc_raprt_sql (p_dynamic_action   in apex_plugin.t_dynamic_action
                                ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_group_entet_raprt_sql (p_dynamic_action   in apex_plugin.t_dynamic_action
                                      ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_group_entet_raprt_inter (p_dynamic_action   in apex_plugin.t_dynamic_action
                                        ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_boutn_jquer_ui (p_dynamic_action   in apex_plugin.t_dynamic_action
                               ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_raprt_sql_rang_drag (p_dynamic_action   in apex_plugin.t_dynamic_action
                                    ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_raprt_inter_rang_drag (p_dynamic_action   in apex_plugin.t_dynamic_action
                                      ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_afich_dialg_ifram (p_dynamic_action   in apex_plugin.t_dynamic_action
                                  ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_afich_dialg_ifram (p_dynamic_action   in apex_plugin.t_dynamic_action
                                  ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_fermr_dialg_ifram (p_dynamic_action   in apex_plugin.t_dynamic_action
                                  ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_afich_regn_dialg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_fermr_regn_dialg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_soumt_clob (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_soumt_clob (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_suprm_item_clob (p_dynamic_action   in apex_plugin.t_dynamic_action
                                ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_dml_obten_clob (p_dynamic_action   in apex_plugin.t_dynamic_action
                               ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_dml_obten_clob (p_dynamic_action   in apex_plugin.t_dynamic_action
                               ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_afich_mesg_procs (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_afich_mesg_procs (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_afich_mesg_infor (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_afich_mesg_infor (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_menu_redrc (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_menu_redrc (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_aide_page_item (p_dynamic_action   in apex_plugin.t_dynamic_action
                               ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_aide_page_item (p_dynamic_action   in apex_plugin.t_dynamic_action
                               ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_aide_page (p_dynamic_action   in apex_plugin.t_dynamic_action
                          ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_aide_page (p_dynamic_action   in apex_plugin.t_dynamic_action
                          ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_redrc_url (p_dynamic_action   in apex_plugin.t_dynamic_action
                          ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_redrc_url_dynmq (p_dynamic_action   in apex_plugin.t_dynamic_action
                                ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_redrc_url_dynmq (p_dynamic_action   in apex_plugin.t_dynamic_action
                                ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_trans_ident_coln_ir (p_dynamic_action   in apex_plugin.t_dynamic_action
                                    ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_pris_charg_navgt (p_dynamic_action   in apex_plugin.t_dynamic_action
                                 ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_afw_41_forml_repns (p_dynamic_action   in apex_plugin.t_dynamic_action
                                   ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_afw_41_forml_repns (p_dynamic_action   in apex_plugin.t_dynamic_action
                                   ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_afw_12_modfr_mot_passe (p_dynamic_action   in apex_plugin.t_dynamic_action
                                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_soumt_blob (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_soumt_blob (p_dynamic_action   in apex_plugin.t_dynamic_action
                           ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_initl_comps (p_dynamic_action   in apex_plugin.t_dynamic_action
                            ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function genr_afw_21_navgt_enreg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                   ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_afw_21_navgt_enreg (p_dynamic_action   in apex_plugin.t_dynamic_action
                                   ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_tutrl (p_dynamic_action   in apex_plugin.t_dynamic_action
                      ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_tutrl (p_dynamic_action   in apex_plugin.t_dynamic_action
                      ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;

  function genr_favr (p_dynamic_action   in apex_plugin.t_dynamic_action
                     ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_render_result;

  function ajax_favr (p_dynamic_action   in apex_plugin.t_dynamic_action
                     ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_dynamic_action_ajax_result;
end afw_21_actio_dynmq_pkg;
/
