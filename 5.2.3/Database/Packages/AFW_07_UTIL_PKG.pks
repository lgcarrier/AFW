SET DEFINE OFF;
create or replace package afw_07_util_pkg
as
  --Types pour les fonctions pipelined--
  type typ_apex_lov_rang is record
  (
    d   varchar2 (2000)
   ,r   number (10)
  );

  type typ_tab_apex_lov_rang is table of typ_apex_lov_rang;

  --------------------------------------

  type typ_table_va is table of varchar2 (30);

  type typ_table_nu is table of number (10);

  type typ_table_va_ibpls is table of varchar2 (30)
    index by pls_integer;

  type typ_table_nu_ibpls is table of number (10)
    index by pls_integer;

  gnu_tablr_form_numbr   number;
  gva_tablr_form_varch   varchar2 (100);
  gda_tablr_form_date    date;

  gva_css_entet_page     varchar2 (32000);
  gva_javsc_entet_page   varchar2 (32000);

  function strin_to_table_nu (pva_list in varchar2)
    return typ_table_nu
    pipelined;

  function strin_to_table_va (pva_list in varchar2)
    return typ_table_va
    pipelined;

  function table_to_table (pta_list in apex_application_global.vc_arr2)
    return typ_table_nu
    pipelined;

  function table_to_table_01
    return typ_table_nu
    pipelined;

  function table_to_table_02
    return typ_table_nu
    pipelined;

  function table_to_table_nu (pta_list in typ_table_nu_ibpls)
    return typ_table_nu
    pipelined;

  function table_to_string (pcu_tabl       sys_refcursor
                           ,pva_seprt   in varchar2 default ':')
    return varchar2;

  function table_to_string (pta_tabl       apex_application_global.vc_arr2
                           ,pva_seprt   in varchar2 default ':')
    return varchar2;

  function string_to_table (pva_tabl    in varchar2
                           ,pva_seprt   in varchar2 default ':')
    return apex_application_global.vc_arr2;

  function string_to_table2 (pva_tabl    in varchar2
                            ,pva_seprt   in varchar2 default ':')
    return apex_application_global.vc_map;

  function suprm_elemn_liste (pva_elemn   in varchar2
                             ,pva_list    in varchar2)
    return varchar2;

  procedure genr_valr_audit (pbo_inser         in     boolean
                            ,pbo_updat         in     boolean
                            ,pva_utils_creat   in out varchar2
                            ,pda_date_creat    in out date
                            ,pva_utils_modfc   in out varchar2
                            ,pda_date_modfc    in out date);

  procedure genr_valr_audit_alter (pbo_inser         in     boolean
                                  ,pbo_updat         in     boolean
                                  ,pva_utils_creat   in out varchar2
                                  ,pda_date_creat    in out date
                                  ,pva_utils_modfc   in out varchar2
                                  ,pda_date_modfc    in out date);

  function v (pva_nom_item           in varchar2
             ,pva_indic_forcr_apex   in varchar2 default 'N')
    return varchar2;

  function vd (pva_nom_item           in varchar2
              ,pva_indic_forcr_apex   in varchar2 default 'N')
    return varchar2
    deterministic;

  function nv (pva_nom_item           in varchar2
              ,pva_indic_forcr_apex   in varchar2 default 'N')
    return number;

  function nvd (pva_nom_item           in varchar2
               ,pva_indic_forcr_apex   in varchar2 default 'N')
    return number
    deterministic;

  function dv (pva_nom_item           in varchar2
              ,pva_formt              in varchar2 default null
              ,pva_indic_forcr_apex   in varchar2 default 'N')
    return date;

  function dvd (pva_nom_item           in varchar2
               ,pva_formt              in varchar2 default null
               ,pva_indic_forcr_apex   in varchar2 default 'N')
    return date
    deterministic;

  function valr_numrq (pva_valr in varchar2)
    return number;

  function obten_date_syst
    return date;

  function vald_domn_date (pda_date_limt_infr   in date
                          ,pva_date_a_valdr     in date
                          ,pda_date_limt_supr   in date)
    return boolean;

  function vald_domn_date_trunc (pda_date_limt_infr   in date
                                ,pva_date_a_valdr     in date
                                ,pda_date_limt_supr   in date)
    return boolean;

  function obten_versn_sesn
    return number;

  function obten_sourc_shutl_selct (pva_selct in varchar2)
    return varchar2;

  function obten_sourc_shutl_selct (pre_selct in sys_refcursor)
    return varchar2;

  /*OBSOLETE - Utiliser DEFNR_ETAT_SESN*/
  procedure defnr_etat_sessn (pva_nom    in varchar2
                             ,pva_valr   in varchar2);

  procedure defnr_etat_sesn (pva_nom    in varchar2
                            ,pva_valr   in varchar2);

  procedure reint_etat_sesn_page (pnu_no_page in number);

  function exist_item (pva_nom_item in varchar2)
    return boolean;

  function echap_text (pva_text in varchar2)
    return varchar2;

  function echap_text_js (pva_text in varchar2)
    return varchar2;

  function echap_text_json (pva_text                    in varchar2
                           ,pva_indic_saut_ligne_html   in varchar2 default 'O'
                           ,pva_seprt_saut_ligne        in varchar2 default ' | ')
    return varchar2;

  function rognr (pva_chain   in varchar2
                 ,pva_seprt   in varchar2)
    return varchar2;

  function obten_furtr
    return varchar2;

  function obten_dad_url
    return varchar2;

  function obten_fonct_url
    return varchar2;

  function obten_ip
    return varchar2;

  function obten_parmt_url
    return varchar2;

  function obten_base_url
    return varchar2;

  function verfr_sesn_vald (pnu_sess in number)
    return boolean;

  function hash (pva_sourc in varchar2)
    return raw;

  function hash_hexa (pva_sourc in varchar2)
    return varchar2;

  function verif_nombr_pair (pnu_nombr in number)
    return varchar2;

  function obten_mesg_suprs
    return varchar2;

  function obten_nom_mois (pda_date in date)
    return varchar2;

  function obten_perd (pda_debut   in date
                      ,pda_fin     in date)
    return varchar2;

  function defnr_tablr_form_numbr (pnu_valr in number)
    return number;

  function defnr_tablr_form_varch (pva_valr in varchar2)
    return number;

  function defnr_tablr_form_date (pda_valr in date)
    return number;

  procedure gerer_seprt_decml_g_fxx (pva_liste_g_f varchar2);

  procedure gerer_seprt_decml_page;

  procedure gerer_seprt_decml_list_item (pva_liste_item varchar2);

  procedure gerer_seprt_decml_item (pva_item in varchar2);

  function encry_clob (pcl_clob   in clob
                      ,pra_cle    in raw)
    return blob;

  function decry_clob (pbl_blob   in blob
                      ,pra_cle    in raw)
    return clob;

  function multi_replc (pva_valr            in varchar2
                       ,pva_valr_rechr_1    in varchar2
                       ,pva_valr_rempl_1    in varchar2
                       ,pva_valr_rechr_2    in varchar2 default null
                       ,pva_valr_rempl_2    in varchar2 default null
                       ,pva_valr_rechr_3    in varchar2 default null
                       ,pva_valr_rempl_3    in varchar2 default null
                       ,pva_valr_rechr_4    in varchar2 default null
                       ,pva_valr_rempl_4    in varchar2 default null
                       ,pva_valr_rechr_5    in varchar2 default null
                       ,pva_valr_rempl_5    in varchar2 default null
                       ,pva_valr_rechr_6    in varchar2 default null
                       ,pva_valr_rempl_6    in varchar2 default null
                       ,pva_valr_rechr_7    in varchar2 default null
                       ,pva_valr_rempl_7    in varchar2 default null
                       ,pva_valr_rechr_8    in varchar2 default null
                       ,pva_valr_rempl_8    in varchar2 default null
                       ,pva_valr_rechr_9    in varchar2 default null
                       ,pva_valr_rempl_9    in varchar2 default null
                       ,pva_valr_rechr_10   in varchar2 default null
                       ,pva_valr_rempl_10   in varchar2 default null)
    return varchar2;

  function revrs_chain (pva_chain in varchar2)
    return varchar2;

  function obten_prefr (pva_nom_prefr in varchar2)
    return varchar2;

  function obten_carct_entre (pva_chain               in varchar2
                             ,pva_carct_rechr_debut   in varchar2
                             ,pnu_insta_debut         in number
                             ,pva_carct_rechr_fin     in varchar2
                             ,pnu_insta_fin           in number
                             ,pnu_debut_rechr         in number default 1)
    return varchar2;

  procedure procd_appel (pva_propr           out varchar2
                        ,pva_nom             out varchar2
                        ,pnu_numr_ligne      out number
                        ,pva_type            out varchar2
                        ,pnu_pile_suplm   in     number default 0);

  function procd_appel (pnu_pile_suplm in number default 0)
    return varchar2;

  function procd_courn
    return varchar2;

  function valid_numr_entr (pva_valr in varchar)
    return varchar2;

  procedure ajout_info_debug (pva_valr in varchar2);

  procedure valdr_date_formt (pva_date    in varchar2
                             ,pva_formt   in varchar2);


  function valid_si_modfc (pva_valr_1   in varchar2
                          ,pva_valr_2   in varchar2)
    return boolean;

  function valid_si_modfc (pnu_valr_1   in number
                          ,pnu_valr_2   in number)
    return boolean;

  function valid_si_modfc (pda_valr_1   in date
                          ,pda_valr_2   in date)
    return boolean;

  procedure ajout_libr_javsc (pva_nom          in varchar2
                             ,pva_reprt        in varchar2 default    afw_11_prodt_pkg.obten_dosr_fichr_afw
                                                                   || 'assets/js/'
                             ,pva_versn        in varchar2 default null
                             ,pbo_saut_extns   in boolean default false
                             ,pbo_exten_mini   in boolean default false);

  procedure ajout_code_javsc_charg (pva_code   in varchar2
                                   ,pva_cle    in varchar2 default null);

  procedure ajout_libr_css (pva_nom          in varchar2
                           ,pva_reprt        in varchar2 default    afw_11_prodt_pkg.obten_dosr_fichr_afw
                                                                 || 'assets/css/'
                           ,pva_versn        in varchar2 default null
                           ,pbo_saut_extns   in boolean default false);

  procedure ajout_css (pva_style            in varchar2
                      ,pbo_inser_en_ligne   in boolean default true);

  function verif_presn_role (pva_role in varchar2)
    return boolean;

  function obten_evalt_code_utils (pva_utils in varchar2)
    return varchar2;

  procedure genr_css_entet_page;

  procedure genr_javsc_entet_page;

  function nv_force (pva_item in varchar2)
    return number;

  procedure aret_trait_page_apex;

  function obten_reslt_expre_plsql (pva_expre_plsql in varchar2)
    return varchar2;

  function obten_reslt_expre_plsql_bool (pva_expre_plsql in varchar2)
    return boolean;

  function obten_schem_apex
    return varchar2;

  function obten_versn_apex
    return apex_release.version_no%type;

  function purgr_html (pva_chain in varchar2)
    return varchar2;

  function encry_valr (pva_valr in varchar2)
    return raw;

  function racrc_chain (pva_chain   in varchar2
                       ,pnu_longr   in number)
    return varchar2;

  function boln_vers_numrq (pbo_valr_boln in boolean)
    return number;

  function boln_vers_alpha (pbo_valr_boln in boolean)
    return varchar2;

  function obten_jeu_carct
    return varchar2;

  function obten_id_jeu_carct
    return number;

  function obten_date_fin_temps
    return date;

  function obten_carct_decml
    return varchar2;

  function obten_seprt_group
    return varchar2;

  function obten_ident_jeu_carct (pva_code_jeu_carct in varchar2)
    return number;

  procedure telvr_fichr (pcl_fichr              in clob
                        ,pva_nom_fichr          in varchar2
                        ,pva_contn_type         in varchar2 default 'text/plain'
                        ,pbo_atach              in boolean default true
                        ,pbo_arret_engin_apex   in boolean default false
                        ,pnu_chars_id           in number default 0);

  procedure telvr_fichr (pbl_fichr              in out nocopy blob
                        ,pva_nom_fichr          in            varchar2
                        ,pva_contn_type         in            varchar2
                        ,pbo_atach              in            boolean default true
                        ,pbo_arret_engin_apex   in            boolean default false
                        ,pnu_chars_id           in            number default 0);
end afw_07_util_pkg;
/
