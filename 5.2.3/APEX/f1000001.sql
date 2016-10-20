set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.3.00.03'
,p_default_workspace_id=>1248716320362712
,p_default_application_id=>1000001
,p_default_owner=>'APEXFRAMEWORK'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 1000001 - Accueil
--
-- Application Export:
--   Application:     1000001
--   Name:            Accueil
--   Date and Time:   09:36 Jeudi Octobre 20, 2016
--   Exported By:     LGCARRIER
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.3.00.03
--   Instance ID:     69411815032911
--

-- Application Statistics:
--   Pages:                      4
--     Items:                   27
--     Processes:               10
--     Regions:                  9
--     Buttons:                  2
--     Dynamic Actions:          5
--   Shared Components:
--     Logic:
--       Items:                 89
--       Processes:             35
--       Computations:           1
--     Navigation:
--       Lists:                  1
--     Security:
--       Authentication:         2
--       Authorization:          8
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 5
--         Region:              13
--         Label:                5
--         List:                 2
--         Popup LOV:            1
--         Calendar:             1
--         Button:               6
--         Report:               3
--       Shortcuts:              4
--       Plug-ins:              75
--     Globalization:
--       Messages:             407
--     Reports:
--   Supporting Objects:  Excluded

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,1000001)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APEXFRAMEWORK')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Accueil')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'1000001')
,p_application_group=>19694313105945939
,p_application_group_name=>'AFW'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'04F9DCE96AAAE7B4F8E289A9EE18F5193DD8F0D953B6238BD82884B199A17F75'
,p_checksum_salt_last_reset=>'20081009112110'
,p_bookmark_checksum_function=>'MD5'
,p_max_session_length_sec=>28800
,p_compatibility_mode=>'4.2'
,p_flow_language=>'fr-ca'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(3710800025862497)
,p_application_tab_set=>0
,p_logo_image=>'&A_AFW_11_DOSR_FICHR_AFW.images/afw_logo_header.png'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'4.4'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_deep_linking=>'Y'
,p_vpd=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin null; end;',
'afw_07_polc_pkg.initl_contx();'))
,p_runtime_api_usage=>'T:O:W'
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'afw_01_err_apex_pkg.gestn_mesg_err_apex'
,p_substitution_string_01=>'APEX_DML_LOCK_WAIT_TIME'
,p_substitution_value_01=>'5'
,p_substitution_string_02=>'DIR'
,p_substitution_value_02=>'ltr'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160515144522'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(434545322556318371)
,p_name=>'MENU_ACUEI_SAF'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(434545525421318371)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Méthodologie'
,p_list_item_link_target=>'f?p=&P1_NUMR_APLIC_SAFM.:1:&SESSION.::::SIDF:&SIDF.'
,p_list_item_icon=>'menu/form_wiz_page_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(434545840719318373)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Produits'
,p_list_item_link_target=>'f?p=&P1_NUMR_APLIC_SAFP.:8011:&SESSION.::::SIDF:&SIDF.'
,p_list_item_icon=>'menu/application_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(434546130150318373)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Domaines'
,p_list_item_link_target=>'f?p=&P1_NUMR_APLIC_SAFD.:12200:&SESSION.::::SIDF:&SIDF.'
,p_list_item_icon=>'menu/global_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(456926126575679918)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Assurance qualité'
,p_list_item_link_target=>'f?p=&P1_NUMR_APLIC_SAFA.:1:&SESSION.::::SIDF:&SIDF.'
,p_list_item_icon=>'menu/bug_new_64.png'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(438942534118302877)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Déploiement'
,p_list_item_link_target=>'f?p=&P1_NUMR_APLIC_SAFP.:1080:&SESSION.::::SIDF:&SIDF.'
,p_list_item_icon=>'menu/download_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(455867543723797592)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Pilotage'
,p_list_item_link_target=>'f?p=&P1_NUMR_APLIC_SAFC.:1:&SESSION.::::SIDF:&SIDF.'
,p_list_item_icon=>'menu/logic_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(111119831578067)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3520232728280751)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(7773306362024370)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_IO_AFW_21_SELCT_2'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(22071625623441364)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'PLUGIN_IO_AFW_21_FAVR'
,p_attribute_01=>'icon-star'
,p_attribute_02=>'Supprimer de vos favoris'
,p_attribute_03=>'icon-star-empty'
,p_attribute_04=>'Ajouter aux favoris'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(23093306410735412)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_IO_AFW_21_BASCL_FAVR'
,p_attribute_02=>'Show everything'
,p_attribute_04=>'Show favorites'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(448065359416100589)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_IO_AFW_21_ITEM_POPUP_ARBOR'
,p_attribute_01=>'&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
,p_attribute_02=>'&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(453881842899658780)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_COM_SKILLBUILDERS_SBIP_PASSWORD'
,p_attribute_01=>'cupertino'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(452063652382127240)
,p_name=>'Administrateur SAF'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''SUPER_UTILS'');'
,p_error_message=>'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(452064360824139194)
,p_name=>'Administrateur produit'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''ADMIN'');'
,p_error_message=>'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(452064571560142249)
,p_name=>'Développeur'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''DEVLP'');'
,p_error_message=>'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(645488350517700808)
,p_name=>'Création'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTOR_CREAT'
,p_error_message=>'Accès refusé.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(647489464565244167)
,p_name=>'Modification'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTOR_MODFC'
,p_error_message=>'Accès refusé.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(647501337685245841)
,p_name=>'Suppression'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTOR_SUPRS'
,p_error_message=>'Accès refusé.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(647517143226247471)
,p_name=>'Opération DML'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTOR_OPERT_DML'
,p_error_message=>'Accès refusé.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(648421266474632666)
,p_name=>'Accès page'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTOR_ACCES_PAGE'
,p_error_message=>'Accès refusé.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(479667890027289152)
,p_process_sequence=>1000000000
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Réinitialiser la variable d''exclusion'
,p_process_sql_clob=>'afw_13_page_pkg.reint_exclu_liste_navgt();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(479667478252285728)
,p_process_sequence=>1000000000.1
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Initialiser le contexte d''exécution d''une page'
,p_process_sql_clob=>'afw_13_condt_piltb_pkg.defn_contx_exect_page();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(488819069356269779)
,p_process_sequence=>1000000000.3
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 19 - Definir les variables de sessions'
,p_process_sql_clob=>'afw_19_boutn_pkg.defnr_varbl_sesn();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(485944577159286784)
,p_process_sequence=>1000000000.4
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - JavaScript au chargement'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'afw_01_javsc_pkg.ajout_scrip_charg ();',
'afw_07_javsc_pkg.ajout_scrip_charg ();',
'--afw_19_javsc_pkg.ajout_scrip_charg ();',
'afw_25_javsc_pkg.ajout_scrip_charg ();'))
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(480262476452532528)
,p_process_sequence=>1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Synchroniser variables fil d''Ariane'
,p_process_sql_clob=>'afw_04_fil_arian_pkg.synch_varbl();'
,p_process_when=>'afw_13_page_pkg.obten_page_sesn <>  afw_11_aplic_pkg.obten_page_conxn'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(479864684452057446)
,p_process_sequence=>1000000000.1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Mettre à jour le contexte'
,p_process_sql_clob=>'afw_04_contx_pkg.maj_seqnc_contx();'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(521420054338051102)
,p_process_sequence=>1000000000.2
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Sauvegarde des préférences'
,p_process_sql_clob=>'afw_13_prefr_pkg.sauvg_prefr_page();'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(448534762052634731)
,p_process_sequence=>20
,p_process_point=>'BEFORE_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Script mode recherche'
,p_process_sql_clob=>'afw_13_navgt_pkg.script_mode_rechr ();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(465057853204408113)
,p_process_sequence=>1000000000
,p_process_point=>'BEFORE_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 25_Générer le script d''affichage du rapport'
,p_process_sql_clob=>'afw_25_appel_raprt_apex_pkg.genr_script_popup_raprt();'
,p_process_when=>'A_AFW_25_URL_RAPRT'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(464873458819315076)
,p_process_sequence=>1.1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 07 - Libérer les sémaphores hors persistances'
,p_process_sql_clob=>'afw_07_semph_pkg.libr_semph_perst_page();'
,p_process_error_message=>'Error'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(480479675426220493)
,p_process_sequence=>1.2
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 11 - Définir la langue'
,p_process_sql_clob=>'afw_01_lang_pkg.defnr_lang_sesn();'
,p_process_when=>':FSP_LANGUAGE_PREFERENCE is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(539957298964054690)
,p_process_sequence=>1.3
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 11 - Définir items application'
,p_process_sql_clob=>'afw_11_prodt_pkg.defnr_item_aplic_apex();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(505028649454833879)
,p_process_sequence=>1.4
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 12 - Définir items application'
,p_process_sql_clob=>'afw_12_utils_pkg.defnr_item_aplic_apex();'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(583067153396685479)
,p_process_sequence=>1.5
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Définir items application'
,p_process_sql_clob=>'afw_13_page_pkg.defnr_item_aplic_apex;'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(490636752988371528)
,p_process_sequence=>5
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Aller au dernier enregistrement'
,p_process_sql_clob=>'afw_13_navgt_pkg.obten_dernr_enreg();'
,p_process_error_message=>'Erreur'
,p_process_when=>':SAPC = ''XDE'''
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(479746384940025049)
,p_process_sequence=>8
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Synchroniser fil d''Ariane'
,p_process_sql_clob=>'afw_04_fil_arian_pkg.synch;'
,p_process_error_message=>'Erreur lors de la synchronisation du fil d''Ariane.'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(479745877668022897)
,p_process_sequence=>9
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Synchroniser le contexte'
,p_process_sql_clob=>'afw_04_contx_pkg.synch;'
,p_process_error_message=>'#SQLERRM#'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(448527054920367712)
,p_process_sequence=>9.1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Gérer le mode recherche'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'afw_13_navgt_pkg.trait_mode_rechr ();',
':A_AFW_13_MODE_RECHR := afw_13_navgt_pkg.est_en_mode_rechr_va();'))
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(490637162469383764)
,p_process_sequence=>9.2
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Définir contexte navigation'
,p_process_sql_clob=>'afw_13_navgt_pkg.defnr_contx_navgt();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(521404243603047960)
,p_process_sequence=>9.5
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Charger les préférences'
,p_process_sql_clob=>'afw_13_prefr_pkg.charg_prefr_page();'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(483807876119520504)
,p_process_sequence=>12.1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 25 - Export CSV'
,p_process_sql_clob=>'afw_25_spx_expor_ir_pkg.afich_csv ();'
,p_process_when=>'CSV'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(483807569539518625)
,p_process_sequence=>12.2
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 25 - Export PDF'
,p_process_sql_clob=>'afw_25_plpdf_expor_ir_pkg.afich_pdf ();'
,p_process_when=>'PDF'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(447267781981761337)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE_SESSION_STATE'
,p_process_sql_clob=>'null;'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(479435678818000624)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Autoriser la duplication de la page dans le fil d''Ariane'
,p_process_sql_clob=>':A_AFW_04_AUTOR_DUPLQ_PAGE := ''O'';'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(479667101670283050)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Cacher la liste de navigation'
,p_process_sql_clob=>'afw_13_page_pkg.cachr_liste_navgt();'
,p_process_error_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Erreur',
''))
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(480260785409506669)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Retourner valeurs modales'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :A_AFW_04_ACTIO = ''XRM'' then',
'  afw_04_contx_pkg.retr_modl;',
'end if;'))
,p_process_when=>'A_AFW_04_ACTIO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'XRM'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(480379676430831803)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Réinitialiser la séquence'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  vnu_page           number default afw_07_util_pkg.nv (''APP_PAGE_ID'');',
'  vvc_nom_item_seqnc varchar2 (30) default ''P'' || to_char (vnu_page) || ''_SEQNC'';',
'begin',
'  if afw_07_util_pkg.exist_item (vvc_nom_item_seqnc) then',
'    afw_07_util_pkg.defnr_etat_sessn (vvc_nom_item_seqnc, null);',
'  end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(485951658383376045)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INFO_TRI_ALTER'
,p_process_sql_clob=>'afw_25_tri_alter_pkg.afich_info_tri_alter ();'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(490637552557390343)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Gérer touches haut/bas'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'htp.p(''<script type="text/javascript">',
'apex.jQuery(document).keydown(checkUpDownKey);',
'</script>'');'))
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(490637762946393326)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Cacher tous les boutons'
,p_process_sql_clob=>'afw_13_condt_piltb_pkg.cachr_tous_boutn;'
,p_process_error_message=>'#SQLERRM#'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(490638480739407925)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 -  Tout lecture seule'
,p_process_sql_clob=>'afw_13_condt_piltb_pkg.lectr_seule_tout;'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(480072676159287270)
,p_process_sequence=>1.2
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 11 - Alimenter les variables des numéros de produits'
,p_process_sql_clob=>'afw_11_aplic_pkg.defnr_varbl_numr_aplic();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(479436193363004783)
,p_process_sequence=>1.1
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Valider info de provenance avant Submit'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if not afw_04_fil_arian_pkg.est_valid_sidf(true) then',
'  afw_08_url_pkg.redrg_page_acuei_postn;',
'end if;'))
,p_process_error_message=>'Erreur lors de la validation de la provenance.'
,p_process_when=>'afw_13_page_pkg.obten_page_sesn <>  afw_11_aplic_pkg.obten_page_conxn'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(480262197099528991)
,p_process_sequence=>1.2
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Synchroniser variables contexte'
,p_process_sql_clob=>'afw_04_contx_pkg.synch_varbl;'
,p_process_error_message=>'#SQLERRM#'
,p_process_when=>'afw_13_page_pkg.obten_page_sesn <>  afw_11_aplic_pkg.obten_page_conxn'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(448534578890630135)
,p_process_sequence=>1.3
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Recherche'
,p_process_sql_clob=>'afw_13_navgt_pkg.efect_rechr ();'
,p_process_error_message=>'Erreur'
,p_process_when=>'AFW_13_RECHR_FORML'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(479719584884220722)
,p_name=>'A_AFW_04_ACTIO'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(479433276992943336)
,p_name=>'A_AFW_04_AUTOR_DUPLQ_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(479719793888223322)
,p_name=>'A_AFW_04_CONTX'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(563712249825070703)
,p_name=>'A_AFW_04_CONTX_FORMT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(479719997005224183)
,p_name=>'A_AFW_04_SEQNC_CONTX'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(479720402199225691)
,p_name=>'A_AFW_04_SOURC_ACTIO'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(479720199429224943)
,p_name=>'A_AFW_04_SOURC_CONTX'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(563720257098072810)
,p_name=>'A_AFW_04_SOURC_CONTX_FORMT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(440378516788345183)
,p_name=>'A_AFW_04_SOURC_NUMR_APLIC'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(480111383651861235)
,p_name=>'A_AFW_04_SOURC_NUMR_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(479720604623226468)
,p_name=>'A_AFW_04_SOURC_SEQNC_CONTX'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(480799181348725274)
,p_name=>'A_AFW_04_SOURC_URL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(533561989108475486)
,p_name=>'A_AFW_04_SUPRM_FIL_COURN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(479527489389186672)
,p_name=>'A_AFW_04_SUR_SOUMS'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(9237617979980371)
,p_name=>'A_AFW_11_ACRON_APLIC'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(465155561777429467)
,p_name=>'A_AFW_11_ACRON_PRODT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(454746120447680079)
,p_name=>'A_AFW_11_DEPLC_RANGE_RAPRT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(448994775625437082)
,p_name=>'A_AFW_11_DOSR_FICHR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(448993479472390918)
,p_name=>'A_AFW_11_DOSR_FICHR_AFW'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(465147554505427352)
,p_name=>'A_AFW_11_ENVIR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(509933947995636636)
,p_name=>'A_AFW_11_JQUER_UI_CSS_SCOPE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(554354462382718873)
,p_name=>'A_AFW_11_MESG_SUPRS'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(509925943147635284)
,p_name=>'A_AFW_11_MESG_TOUT_DROIT_RESRV'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(9237822651980371)
,p_name=>'A_AFW_11_NOM_APLIC'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(9238118546980371)
,p_name=>'A_AFW_11_NOM_PRODT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(79667115647940764)
,p_name=>'A_AFW_11_NUMR_VERSN_PRODT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(79725523701619140)
,p_name=>'A_AFW_11_NUMR_VERSN_PRODT_AFW'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(454012016749649046)
,p_name=>'A_AFW_11_TEMPL_CUSTM'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(552849058293847186)
,p_name=>'A_AFW_11_TEMPL_JAVSC_CORE_1'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(552865064180848885)
,p_name=>'A_AFW_11_TEMPL_JAVSC_CORE_2'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(552873066604849613)
,p_name=>'A_AFW_11_TEMPL_JAVSC_JQUER'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(552857060717847923)
,p_name=>'A_AFW_11_TEMPL_THEME_JQUER_UI'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(690194555778274537)
,p_name=>'A_AFW_11_TRAIT_MESGS_ERR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(454011926310649046)
,p_name=>'A_AFW_11_URL_ACUEI'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(456444418029488318)
,p_name=>'A_AFW_11_URL_AUTHE_CIBLE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(465171367664431137)
,p_name=>'A_AFW_11_VERSN_PRODT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(477689157928264597)
,p_name=>'A_AFW_12_UTILS'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(436915847113512733)
,p_name=>'A_AFW_12_UTILS_CODE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(539956485458050788)
,p_name=>'A_AFW_12_UTILS_NOM_FORMT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(666449265689805646)
,p_name=>'A_AFW_13_LIEN_EDITN_RAPRT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(684872948499078873)
,p_name=>'A_AFW_13_MESG_AUCUN_DON_TROUV'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(14459507654804830)
,p_name=>'A_AFW_13_MESG_CONFR_SUPRS'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(582997255988648464)
,p_name=>'A_AFW_13_MESG_ECHEC_SPECF'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(682267044531491079)
,p_name=>'A_AFW_13_MESG_IMPOS_FETCH'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(682177954181465460)
,p_name=>'A_AFW_13_MESG_RANGE_INSER'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(682154746562463272)
,p_name=>'A_AFW_13_MESG_RANGE_MODF'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(681951161359410821)
,p_name=>'A_AFW_13_MESG_RANGE_SUPRM'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(582989251140647010)
,p_name=>'A_AFW_13_MESG_SUCS_SPECF'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(692937644320862143)
,p_name=>'A_AFW_13_MESG_TROP_DON_TROUV'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(448526269203352950)
,p_name=>'A_AFW_13_MODE_RECHR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(480480381445231648)
,p_name=>'A_AFW_13_PAGE_META'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(480480177635230537)
,p_name=>'A_AFW_13_PAGE_TITRE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(490640165380469732)
,p_name=>'A_AFW_13_PAGNT_NAVGT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(505844457095132676)
,p_name=>'A_AFW_14_POPUP_LOV_IR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(508593174740611046)
,p_name=>'A_AFW_14_POPUP_LOV_IR_RETR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487881157271501742)
,p_name=>'A_AFW_19_AFICH_EREUR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487885964674513376)
,p_name=>'A_AFW_19_AFICH_LOV'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487885763289512932)
,p_name=>'A_AFW_19_AIDE_CLE_FONCT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487882068699505103)
,p_name=>'A_AFW_19_AIDE_ITEM'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487882370776505709)
,p_name=>'A_AFW_19_AIDE_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487879975840497629)
,p_name=>'A_AFW_19_ANULR_REQT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487880381727499384)
,p_name=>'A_AFW_19_COUNT_QUERY'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487881359002502307)
,p_name=>'A_AFW_19_DUPLQ_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487880177918498279)
,p_name=>'A_AFW_19_EFACR_CHAMP'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487881561080502843)
,p_name=>'A_AFW_19_ENTRE_REQT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487881763850503682)
,p_name=>'A_AFW_19_EXECT_REQT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487885359826511971)
,p_name=>'A_AFW_19_IMPRI'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487882672508506218)
,p_name=>'A_AFW_19_INSER_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(488816372201176018)
,p_name=>'A_AFW_19_NAVGT_BAS_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487884552900509982)
,p_name=>'A_AFW_19_NAVGT_CHAMP_PRECD'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487883074240506686)
,p_name=>'A_AFW_19_NAVGT_CHAMP_SUIVN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487880753808500796)
,p_name=>'A_AFW_19_NAVGT_DERNR_CHAMP'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487880955539501264)
,p_name=>'A_AFW_19_NAVGT_DERNR_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487884754977510553)
,p_name=>'A_AFW_19_NAVGT_ENREG_PRECD'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487883375971507154)
,p_name=>'A_AFW_19_NAVGT_ENREG_SUIVN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487884956709511040)
,p_name=>'A_AFW_19_NAVGT_GROUP_ENREG_PRECD'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487883577703507651)
,p_name=>'A_AFW_19_NAVGT_GROUP_ENREG_SUIVN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(488816574972176789)
,p_name=>'A_AFW_19_NAVGT_HAUT_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487885158094511475)
,p_name=>'A_AFW_19_NAVGT_ONGLE_PRECD'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487883779434508137)
,p_name=>'A_AFW_19_NAVGT_ONGLE_SUIVN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487883980819508540)
,p_name=>'A_AFW_19_NAVGT_PAGE_PRECD'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487884149437508968)
,p_name=>'A_AFW_19_NAVGT_PREMR_CHAMP'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487884351168509514)
,p_name=>'A_AFW_19_NAVGT_PREMR_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487885561557512439)
,p_name=>'A_AFW_19_SAUVG_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(487880551037499987)
,p_name=>'A_AFW_19_SUPRM_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(465179468834440937)
,p_name=>'A_AFW_25_URL_RAPRT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(539956080263049219)
,p_name=>'A_DATE_SYSTM'
,p_protection_level=>'I'
,p_required_patch=>wwv_flow_api.id(495511497421940322)
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(478677183058514016)
,p_name=>'FSP_AFTER_LOGIN_URL'
,p_protection_level=>'N'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(480479480359203018)
,p_name=>'FSP_LANGUAGE_PREFERENCE'
,p_protection_level=>'I'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(539957582472059399)
,p_computation_sequence=>10
,p_computation_item=>'A_DATE_SYSTM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'to_char(sysdate, ''Day dd month yyyy'') || '' (semaine '' ||to_number(to_char(sysdate, ''iw'')) || ''/52)'''
);
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
null;
end;
/
prompt --application/shared_components/navigation/trees
begin
null;
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(478682081282452366)
,p_group_name=>'1000 - Gestion des messages d''erreur'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(478682399982457703)
,p_group_name=>'9000 - Généraux - Communs'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(524947027725821677)
,p_theme_id=>313
,p_name=>'Without tab'
,p_is_popup=>false
,p_javascript_file_urls=>'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/js/bootstrap.min.js?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/bootstrap#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/afw/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/font-awesome/4.6.3/css/font-awesome#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'))
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="en">',
'	<head>',
'		<meta charset="utf-8">',
'		<meta name="viewport" content="width=device-width, initial-scale=1.0">',
'                <meta http-equiv="X-UA-Compatible" content="IE=edge">',
'		<meta name="description" content="">',
'		<meta name="author" content="">',
'',
'		<title>&A_AFW_11_ACRON_PRODT. - #TITLE#</title>',
'		<!-- AFW - JavaScript - Core -->',
'		&A_AFW_11_TEMPL_JAVSC_CORE_1.',
'		#APEX_CSS#',
'		#THEME_CSS#',
'#TEMPLATE_CSS#',
'		#THEME_STYLE_CSS#',
'		#APPLICATION_CSS#',
'#PAGE_CSS#',
'		#APEX_JAVASCRIPT#',
'		#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'		#APPLICATION_JAVASCRIPT#',
'		#HEAD#',
'',
'		&A_AFW_11_TEMPL_THEME_JQUER_UI.',
'		<!-- AFW - JavaScript - Core -->',
'		&A_AFW_11_TEMPL_JAVSC_CORE_2. ',
'		&A_AFW_11_TEMPL_JAVSC_JQUER.',
'		#PAGE_JAVASCRIPT#',
'        <!-- Le fav and touch icons -->',
'		<link rel="apple-touch-icon" sizes="57x57" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-57x57.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="60x60" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-60x60.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="72x72" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-72x72.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="76x76" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-76x76.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="114x114" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-114x114.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="120x120" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-120x120.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="144x144" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-144x144.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="152x152" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-152x152.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="180x180" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-180x180.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="192x192" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/android-icon-192x192.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="32x32" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-32x32.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="96x96" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-96x96.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="16x16" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-16x16.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="manifest" href="assets/img/ico/manifest.json">',
'		<meta name="msapplication-TileColor" content="#ffffff">',
'		<meta name="msapplication-TileImage" content="assets/img/ico/ms-icon-144x144.png">',
'		<meta name="theme-color" content="#ffffff">',
'	</head>',
'	<body class="&A_AFW_11_JQUER_UI_CSS_SCOPE." #ONLOAD#>',
'		<div class="container-main">',
'			#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'				<div class="navbar navbar-fixed-top navbar-sub1">',
'				   <div class="navbar-inner">',
'					<button data-target=".sub-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">',
'						<span class="icon-bar"></span>',
'						<span class="icon-bar"></span>',
'						<span class="icon-bar"></span>',
'					</button>',
'					<div class="navbar-collapse collapse sub-navbar-collapse">',
'						#REGION_POSITION_01# #REGION_POSITION_05#',
'					</div><!--/.navbar-collapse -->',
'				   </div>',
'				</div>',
'',
'				<div class="navbar navbar-fixed-top navbar-sub2">',
'				   <div class="navbar-inner">',
'					<div id="afw_mesg_apex">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>',
'					<div id="afw_01_mesg">#REGION_POSITION_07#</div>',
'				   </div>',
'				</div>',
'				',
'				<div class="navbar navbar-fixed-top navbar-main">',
'				   <div class="navbar-inner">',
'						<button data-target=".main-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">',
'							<span class="icon-bar"></span>',
'							<span class="icon-bar"></span>',
'							<span class="icon-bar"></span>',
'						</button>',
'						<a class="navbar-brand" href="&A_AFW_11_URL_ACUEI.">&A_AFW_11_ACRON_PRODT.</a>',
'						<div class="navbar-collapse collapse main-navbar-collapse">',
'							#REGION_POSITION_02#',
'						</div><!--/.navbar-collapse -->',
'				   </div>',
'				</div>',
'				',
'				<div class="container">',
'					<div class="row">',
'					 <div class="col-lg-12">',
'					   <div class="hero-unit">',
'						 #REGION_POSITION_03#',
'					   </div>',
'					   <div class="row">',
'						 #BODY#',
'					   </div><!--/row-->',
'					   <div class="row">',
'						 #REGION_POSITION_06#',
'					   </div><!--/row-->',
'					 </div><!--/col-->',
'					</div><!--/row-->',
'				 ',
'					<hr>',
'',
'					<footer>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'						<p>&A_AFW_11_VERSN_PRODT. - &A_AFW_11_MESG_TOUT_DROIT_RESRV.</p>',
'						<div class="container">#REGION_POSITION_08#</div>',
'					</footer>',
'				</div><!--/.fluid-container-->',
'			#FORM_CLOSE#',
'		</div> <!-- /container -->',
'		#DEVELOPER_TOOLBAR#',
'		#GENERATED_CSS#',
'		#GENERATED_JAVASCRIPT#',
'	</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_sucs_mesg" class="alert alert-success">',
'  <button type="button" class="close" data-dismiss="alert">&times;</button>',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_notfc_mesg" class="alert alert-danger">',
'  <button type="button" class="close" data-dismiss="alert">&times;</button>',
'  #MESSAGE#',
'</div>'))
,p_sidebar_def_reg_pos=>'REGION_POSITION_04'
,p_theme_class_id=>3
,p_grid_type=>'TABLE'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>false
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col-md-#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'col-first'
,p_grid_last_column_attributes=>'col-last'
,p_grid_javascript_debug_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex.jQuery(document)',
'    .on("apex-devbar-grid-debug-on", showGrid)',
'    .on("apex-devbar-grid-debug-off", hideGrid);'))
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(524947245970821677)
,p_theme_id=>313
,p_name=>'Without tab with one frame'
,p_is_popup=>false
,p_javascript_file_urls=>'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/js/bootstrap.min.js?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/bootstrap#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/afw/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/font-awesome/4.6.3/css/font-awesome#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'))
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="en">',
'	<head>',
'		<meta charset="utf-8">',
'		<meta name="viewport" content="width=device-width, initial-scale=1.0">',
'		<meta name="description" content="">',
'		<meta name="author" content="">',
'',
'		<title>&A_AFW_11_ACRON_PRODT. - #TITLE#</title>',
'		<!-- AFW - JavaScript - Core -->',
'		&A_AFW_11_TEMPL_JAVSC_CORE_1.',
'		#APEX_CSS#',
'		#THEME_CSS#',
'#TEMPLATE_CSS#',
'		#THEME_STYLE_CSS#',
'		#APPLICATION_CSS#',
'#PAGE_CSS#',
'		#APEX_JAVASCRIPT#',
'		#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'		#APPLICATION_JAVASCRIPT#',
'		#HEAD#',
'',
'		&A_AFW_11_TEMPL_THEME_JQUER_UI.',
'		<!-- AFW - JavaScript - Core -->',
'		&A_AFW_11_TEMPL_JAVSC_CORE_2. ',
'		&A_AFW_11_TEMPL_JAVSC_JQUER.',
'		#PAGE_JAVASCRIPT#',
'        <!-- Le fav and touch icons -->',
'		<link rel="apple-touch-icon" sizes="57x57" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-57x57.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="60x60" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-60x60.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="72x72" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-72x72.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="76x76" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-76x76.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="114x114" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-114x114.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="120x120" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-120x120.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="144x144" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-144x144.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="152x152" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-152x152.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="180x180" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-180x180.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="192x192" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/android-icon-192x192.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="32x32" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-32x32.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="96x96" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-96x96.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="16x16" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-16x16.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="manifest" href="assets/img/ico/manifest.json">',
'		<meta name="msapplication-TileColor" content="#ffffff">',
'		<meta name="msapplication-TileImage" content="assets/img/ico/ms-icon-144x144.png">',
'		<meta name="theme-color" content="#ffffff">',
'	</head>',
'	<body class="&A_AFW_11_JQUER_UI_CSS_SCOPE." #ONLOAD#>',
'		<div class="container">',
'			#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'				<div class="navbar navbar-fixed-top navbar-sub1">',
'				   <div class="navbar-inner">',
'					 <div class="container">',
'					   <button data-target=".sub-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">',
'							<span class="icon-bar"></span>',
'							<span class="icon-bar"></span>',
'							<span class="icon-bar"></span>',
'						</button>',
'						<div class="navbar-collapse collapse sub-navbar-collapse">',
'							#REGION_POSITION_01# #REGION_POSITION_05#',
'						</div><!--/.navbar-collapse -->',
'					 </div>',
'				   </div>',
'				</div>',
'',
'				<div class="navbar navbar-fixed-top navbar-sub2">',
'				   <div class="navbar-inner">',
'					 <div class="container">',
'						<div id="afw_mesg_apex">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>',
'						<div id="afw_01_mesg">#REGION_POSITION_07#</div>',
'					 </div>',
'				   </div>',
'				</div>',
'				',
'				<div class="navbar navbar-fixed-top navbar-main">',
'				   <div class="navbar-inner">',
'					 <div class="container">',
'						<button data-target=".main-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">',
'							<span class="icon-bar"></span>',
'							<span class="icon-bar"></span>',
'							<span class="icon-bar"></span>',
'						</button>',
'						<a class="navbar-brand" href="&A_AFW_11_URL_ACUEI.">&A_AFW_11_ACRON_PRODT.</a>',
'						<div class="navbar-collapse collapse main-navbar-collapse">',
'							#REGION_POSITION_02#',
'						</div><!--/.navbar-collapse -->',
'					 </div>',
'				   </div>',
'				</div>',
'				',
'				<div class="container">',
'					<div class="row">',
'					 <div class="col-lg-3">',
'					   <div class="well sidebar-nav sidebar-nav-fixed">',
'						 #REGION_POSITION_04#',
'					   </div><!--/.well -->',
'					 </div><!--/span-->',
'					 <div class="col-lg-9">',
'					   <div class="hero-unit">',
'						 #REGION_POSITION_03#',
'					   </div>',
'					   <div class="row">',
'						 #BODY#',
'					   </div><!--/row-->',
'					   <div class="row">',
'						 #REGION_POSITION_06#',
'					   </div><!--/row-->',
'					 </div><!--/span-->',
'					</div><!--/row-->',
'				 ',
'					<hr>',
'',
'					<footer>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'						<p>&A_AFW_11_VERSN_PRODT. - &A_AFW_11_MESG_TOUT_DROIT_RESRV.</p>',
'						<div class="container">#REGION_POSITION_08#</div>',
'					</footer>',
'				</div><!--/.fluid-container-->',
'			#FORM_CLOSE#',
'		</div> <!-- /container -->',
'		#DEVELOPER_TOOLBAR#',
'		#GENERATED_CSS#',
'		#GENERATED_JAVASCRIPT#',
'	</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_sucs_mesg" class="alert alert-success">',
'  <button type="button" class="close" data-dismiss="alert">&times;</button>',
'  #SUCCESS_MESSAGE#',
'</div>',
''))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_notfc_mesg" class="alert alert-danger">',
'  <button type="button" class="close" data-dismiss="alert">&times;</button>',
'  #MESSAGE#',
'</div>',
''))
,p_sidebar_def_reg_pos=>'REGION_POSITION_04'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_02'
,p_theme_class_id=>17
,p_grid_type=>'TABLE'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'<div>#ROWS#</div>'
,p_grid_row_template=>'<div class="row">#COLUMNS#</div>'
,p_grid_column_template=>'<div class="col-md-#COLUMN_SPAN_NUMBER#">#CONTENT#</div>'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(524947827269821678)
,p_theme_id=>313
,p_name=>'Login'
,p_is_popup=>false
,p_javascript_file_urls=>'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/js/bootstrap.min.js?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/bootstrap#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/afw/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/font-awesome/4.6.3/css/font-awesome#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'))
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="en">',
'	<head>',
'		<meta charset="utf-8">',
'		<meta name="viewport" content="width=device-width, initial-scale=1.0">',
'		<meta http-equiv="X-UA-Compatible" content="IE=edge">',
'                <meta name="description" content="">',
'		<meta name="author" content="">',
'          ',
'		<title>&A_AFW_11_ACRON_PRODT. - #TITLE#</title>',
'		<!-- AFW - JavaScript - Core -->',
'		&A_AFW_11_TEMPL_JAVSC_CORE_1.',
'		#APEX_CSS#',
'		#THEME_CSS#',
'#TEMPLATE_CSS#',
'		#THEME_STYLE_CSS#',
'		#APPLICATION_CSS#',
'#PAGE_CSS#',
'		#APEX_JAVASCRIPT#',
'		#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'		#APPLICATION_JAVASCRIPT#',
'		#HEAD#',
'',
'		&A_AFW_11_TEMPL_THEME_JQUER_UI.',
'		<!-- AFW - JavaScript - Core -->',
'		&A_AFW_11_TEMPL_JAVSC_CORE_2. ',
'		&A_AFW_11_TEMPL_JAVSC_JQUER.',
'		#PAGE_JAVASCRIPT#',
'        <!-- Le fav and touch icons -->',
'		<link rel="apple-touch-icon" sizes="57x57" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-57x57.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="60x60" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-60x60.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="72x72" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-72x72.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="76x76" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-76x76.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="114x114" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-114x114.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="120x120" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-120x120.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="144x144" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-144x144.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="152x152" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-152x152.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="180x180" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-180x180.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="192x192" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/android-icon-192x192.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="32x32" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-32x32.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="96x96" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-96x96.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="16x16" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-16x16.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="manifest" href="assets/img/ico/manifest.json">',
'		<meta name="msapplication-TileColor" content="#ffffff">',
'		<meta name="msapplication-TileImage" content="assets/img/ico/ms-icon-144x144.png">',
'		<meta name="theme-color" content="#ffffff">',
'	</head>',
'	<body class="login &A_AFW_11_JQUER_UI_CSS_SCOPE." #ONLOAD#>',
'		<div class="container-main">',
'			#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'				<div class="navbar navbar-fixed-top navbar-sub1">',
'				   <div class="navbar-inner">',
'					   <button data-target=".sub-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">',
'							<span class="icon-bar"></span>',
'							<span class="icon-bar"></span>',
'							<span class="icon-bar"></span>',
'						</button>',
'						<div class="navbar-collapse collapse sub-navbar-collapse">',
'							#REGION_POSITION_01# #REGION_POSITION_05#',
'						</div><!--/.navbar-collapse -->',
'				   </div>',
'				</div>',
'',
'				<div class="navbar navbar-fixed-top navbar-sub2">',
'				   <div class="navbar-inner">',
'						<div id="afw_mesg_apex">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>',
'						<div id="afw_01_mesg">#REGION_POSITION_07#</div>',
'				   </div>',
'				</div>',
'				',
'				<div class="navbar navbar-fixed-top navbar-main">',
'				   <div class="navbar-inner">',
'						<button data-target=".main-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">',
'							<span class="icon-bar"></span>',
'							<span class="icon-bar"></span>',
'							<span class="icon-bar"></span>',
'						</button>',
'						<a class="navbar-brand" href="#">&A_AFW_11_ACRON_PRODT.</a>',
'						<div class="navbar-collapse collapse main-navbar-collapse">',
'							#REGION_POSITION_02#',
'						</div><!--/.navbar-collapse -->',
'				   </div>',
'				</div>',
'		                <div class="hero-unit">#REGION_POSITION_03#</div>',
'		                #BODY#',
'				#REGION_POSITION_06#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'	                                <hr>',
'                                        <div class="container">',
'                                            <div class="row">',
'                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">',
'                                                    <footer>',
'                                                        <p>&A_AFW_11_VERSN_PRODT. - &A_AFW_11_MESG_TOUT_DROIT_RESRV.</p>',
'					            </footer>',
'                                                </div>',
'                                            </div>',
'                                        </div>',
'                                        #REGION_POSITION_08#',
'			#FORM_CLOSE#',
'		</div> <!-- /container -->',
'		#DEVELOPER_TOOLBAR#',
'		#GENERATED_CSS#',
'		#GENERATED_JAVASCRIPT#',
'	</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_sucs_mesg" class="alert alert-success">',
'  <button type="button" class="close" data-dismiss="alert">&times;</button>',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_notfc_mesg" class="alert alert-danger">',
'  <button type="button" class="close" data-dismiss="alert">&times;</button>',
'  #MESSAGE#',
'</div>'))
,p_sidebar_def_reg_pos=>'REGION_POSITION_04'
,p_theme_class_id=>6
,p_grid_type=>'VARIABLE'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>false
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'<div class="container">#ROWS#</div>'
,p_grid_row_template=>'<div class="row">#COLUMNS#</div>'
,p_grid_column_template=>'<div class="col-md-#COLUMN_SPAN_NUMBER#">#CONTENT#</div>'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(524949052253821681)
,p_theme_id=>313
,p_name=>'Popup'
,p_is_popup=>false
,p_javascript_file_urls=>'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/js/bootstrap.min.js?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/bootstrap#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/afw/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/font-awesome/4.6.3/css/font-awesome#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'))
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="en">',
'	<head>',
'		<meta charset="utf-8">',
'		<meta name="viewport" content="width=device-width, initial-scale=1.0">',
'		<meta name="description" content="">',
'		<meta name="author" content="">',
'',
'		<title>&A_AFW_11_ACRON_PRODT. - #TITLE#</title>',
'		<!-- AFW - JavaScript - Core -->',
'		&A_AFW_11_TEMPL_JAVSC_CORE_1.',
'		#APEX_CSS#',
'		#THEME_CSS#',
'#TEMPLATE_CSS#',
'		#THEME_STYLE_CSS#',
'		#APPLICATION_CSS#',
'#PAGE_CSS#',
'		#APEX_JAVASCRIPT#',
'		#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'		#APPLICATION_JAVASCRIPT#',
'		#HEAD#',
'',
'		&A_AFW_11_TEMPL_THEME_JQUER_UI.',
'		<!-- AFW - JavaScript - Core -->',
'		&A_AFW_11_TEMPL_JAVSC_CORE_2. ',
'		&A_AFW_11_TEMPL_JAVSC_JQUER.',
'		#PAGE_JAVASCRIPT#',
'        <!-- Le fav and touch icons -->',
'		<link rel="apple-touch-icon" sizes="57x57" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-57x57.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="60x60" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-60x60.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="72x72" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-72x72.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="76x76" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-76x76.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="114x114" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-114x114.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="120x120" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-120x120.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="144x144" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-144x144.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="152x152" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-152x152.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="180x180" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-180x180.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="192x192" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/android-icon-192x192.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="32x32" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-32x32.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="96x96" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-96x96.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="16x16" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-16x16.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="manifest" href="assets/img/ico/manifest.json">',
'		<meta name="msapplication-TileColor" content="#ffffff">',
'		<meta name="msapplication-TileImage" content="assets/img/ico/ms-icon-144x144.png">',
'		<meta name="theme-color" content="#ffffff">',
'	</head>',
'	<body class="dialog &A_AFW_11_JQUER_UI_CSS_SCOPE." #ONLOAD#>',
'		<div class="container">',
'			#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'				<div class="container">',
'						<div id="afw_mesg_apex">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>',
'						<div id="afw_01_mesg">#REGION_POSITION_07#</div>',
'				</div>',
'',
'				<div class="container">',
'					 <div>',
'                                           <div class="row">',
'						 #REGION_POSITION_05#',
'					   </div>',
'                                           <div class="row">',
'						 #BODY#',
'					   </div>',
'					 </div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'				</div><!--/.fluid-container-->',
'			#FORM_CLOSE#',
'		</div> <!-- /container -->',
'		#DEVELOPER_TOOLBAR#',
'		#GENERATED_CSS#',
'		#GENERATED_JAVASCRIPT#',
'	</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_sucs_mesg" class="alert alert-success">',
'  <button type="button" class="close" data-dismiss="alert">&times;</button>',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_notfc_mesg" class="alert alert-danger">',
'  <button type="button" class="close" data-dismiss="alert">&times;</button>',
'  #MESSAGE#',
'</div>'))
,p_sidebar_def_reg_pos=>'REGION_POSITION_04'
,p_theme_class_id=>4
,p_grid_type=>'TABLE'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'<div>#ROWS#</div>'
,p_grid_row_template=>'<div class="row">#COLUMNS#</div>'
,p_grid_column_template=>'<div class="col-md-#COLUMN_SPAN_NUMBER#">#CONTENT#</div>'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'* APEX Themes - Themes, Templates & Skins for Oracle APEX Applications',
'* http://www.apex-themes.com',
'* Copyright (c) 2011 Creative Mode',
'* This file is protected by copyright law and provided under license.',
'* Unauthorised copying of this file is strictly prohibited.'))
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(524949340311821681)
,p_theme_id=>313
,p_name=>'Error (class= Custom 1)'
,p_is_popup=>false
,p_javascript_file_urls=>'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/js/bootstrap.min.js?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/bootstrap#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/afw/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.',
'&A_AFW_11_DOSR_FICHR_AFW.theme/font-awesome/4.6.3/css/font-awesome#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'))
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="en">',
'	<head>',
'		<meta charset="utf-8">',
'		<meta name="viewport" content="width=device-width, initial-scale=1.0">',
'		<meta name="description" content="">',
'		<meta name="author" content="">',
'',
'		<title>&A_AFW_11_ACRON_PRODT. - #TITLE#</title>',
'		<!-- AFW - JavaScript - Core -->',
'		&A_AFW_11_TEMPL_JAVSC_CORE_1.',
'		#APEX_CSS#',
'		#THEME_CSS#',
'#TEMPLATE_CSS#',
'		#THEME_STYLE_CSS#',
'		#APPLICATION_CSS#',
'#PAGE_CSS#',
'		#APEX_JAVASCRIPT#',
'		#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'		#APPLICATION_JAVASCRIPT#',
'		#HEAD#',
'',
'		&A_AFW_11_TEMPL_THEME_JQUER_UI.',
'		<!-- AFW - JavaScript - Core -->',
'		&A_AFW_11_TEMPL_JAVSC_CORE_2. ',
'		&A_AFW_11_TEMPL_JAVSC_JQUER.',
'		#PAGE_JAVASCRIPT#',
'        <!-- Le fav and touch icons -->',
'		<link rel="apple-touch-icon" sizes="57x57" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-57x57.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="60x60" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-60x60.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="72x72" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-72x72.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="76x76" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-76x76.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="114x114" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-114x114.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="120x120" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-120x120.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="144x144" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-144x144.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="152x152" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-152x152.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="apple-touch-icon" sizes="180x180" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-180x180.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="192x192" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/android-icon-192x192.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="32x32" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-32x32.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="96x96" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-96x96.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="icon" type="image/png" sizes="16x16" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-16x16.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">',
'		<link rel="manifest" href="assets/img/ico/manifest.json">',
'		<meta name="msapplication-TileColor" content="#ffffff">',
'		<meta name="msapplication-TileImage" content="assets/img/ico/ms-icon-144x144.png">',
'		<meta name="theme-color" content="#ffffff">',
'	</head>',
'	<body class="error &A_AFW_11_JQUER_UI_CSS_SCOPE." #ONLOAD#>',
'		<div class="container-main">',
'			#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_bloc_err" class="afw_bloc_err">',
'#BODY#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    #FORM_CLOSE#',
'    </div>',
'  #DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_sucs_mesg" class="alert alert-success">',
'  <button type="button" class="close" data-dismiss="alert">&times;</button>',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_notfc_mesg" class="alert alert-danger">',
'  <button type="button" class="close" data-dismiss="alert">&times;</button>',
'  #MESSAGE#',
'</div>'))
,p_sidebar_def_reg_pos=>'REGION_POSITION_04'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_02'
,p_theme_class_id=>8
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="afw_mesg_err" class="afw_mesg_err">#MESSAGE#</div>',
'</div>',
'<script language="javascript">',
'afw.afw_01.mesg.trait_err_apex(&A_AFW_11_TRAIT_MESGS_ERR.);',
'</script>'))
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'* APEX Themes - Themes, Templates & Skins for Oracle APEX Applications',
'* http://www.apex-themes.com',
'* Copyright (c) 2011 Creative Mode',
'* This file is protected by copyright law and provided under license.',
'* Unauthorised copying of this file is strictly prohibited.'))
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(125497294578248)
,p_template_name=>'HTML button (legacy - APEX 5 migration)'
,p_template=>' <input type="button" value="#LABEL#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_hot_template=>' <input type="button" value="#LABEL#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_translate_this_template=>'N'
,p_theme_class_id=>13
,p_theme_id=>313
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(524969030218821703)
,p_template_name=>'Text only'
,p_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_hot_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>9
,p_theme_id=>313
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(524969837493821704)
,p_template_name=>'Icon only'
,p_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" title="#LABEL#"><i class="fa #BUTTON_ATTRIBUTES#"></i></button>'
,p_hot_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" title="#LABEL#"><i class="fa #BUTTON_ATTRIBUTES#"></i></button>'
,p_theme_class_id=>8
,p_theme_id=>313
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(524970630177821704)
,p_template_name=>'Right icon'
,p_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#">#LABEL# <i class="fa #BUTTON_ATTRIBUTES#"></i></button>'
,p_hot_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#">#LABEL# <i class="fa #BUTTON_ATTRIBUTES#"></i></button>'
,p_theme_class_id=>2
,p_theme_id=>313
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(524970845014821704)
,p_template_name=>'Left icon'
,p_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#"><i class="fa #BUTTON_ATTRIBUTES#"></i> #LABEL#</button>'
,p_hot_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#"><i class="fa #BUTTON_ATTRIBUTES#"></i> #LABEL#</button>'
,p_theme_class_id=>5
,p_theme_id=>313
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(524971038247821704)
,p_template_name=>'Dropdown option'
,p_template=>'<li><a id="#BUTTON_ID#" href="#LINK#" alt="#LABEL#"><i class="fa #BUTTON_ATTRIBUTES#"></i> #LABEL#</a></li>'
,p_hot_template=>'<li><a id="#BUTTON_ID#" href="#LINK#" alt="#LABEL#"><i class="fa #BUTTON_ATTRIBUTES#"></i> #LABEL#</a></li>'
,p_theme_class_id=>1
,p_theme_id=>313
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(84177630984497877)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_ID#" class="btn-toolbar regn-toolbar-action-dropdown #REGION_CSS_CLASSES#">',
'	<div class="pull-left">#PREVIOUS#</div>',
'	<div class="pull-right">#NEXT#</div>',
'	<div class="btn-group #REGION_ATTRIBUTES#">',
'		<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">',
'			Actions',
'			<span class="caret"></span>',
'		</button>',
'		<ul class="dropdown-menu pull-right">',
'			#DELETE#',
'			#SUB_REGIONS#',
'		</ul>',
'	</div>',
'	<div class="pull-right">#EXPAND##COPY##HELP##CLOSE##EDIT##CHANGE##CREATE2#</div>',
'	#BODY#',
'</div>'))
,p_page_plug_template_name=>'Button Toolbar with Actions Dropdown'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>313
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524950844264821684)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div id="#REGION_STATIC_ID#_acord">',
'    #BODY#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'AFW - Accordion Menu 2'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>313
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524951730802821684)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="afw_13_cadre_menu">',
'  <tr>',
'    <td class="afw_13_cadre_menu_entet">',
'      #TITLE#',
'    </td>',
'  </tr>',
'  <tr>',
'    <td class="afw_13_cadre_menu_corps">',
'      #BODY#',
'    </td>',
'  </tr>',
'  <tr>',
'    <td class="afw_13_cadre_menu_pied">',
'      <img src="/res/afw/theme/1px_trans.gif" width="1" height="1" />',
'    </td>',
'  </tr>',
'</table>'))
,p_page_plug_template_name=>'AFW - 13 Menu (class= Custom 7)'
,p_theme_id=>313
,p_theme_class_id=>27
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524952650231821685)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'#BODY#',
'</div>'))
,p_page_plug_template_name=>'Without template  (Custom 7)'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>313
,p_theme_class_id=>27
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'* APEX Themes - Themes, Templates & Skins for Oracle APEX Applications',
'* http://www.apex-themes.com',
'* Copyright (c) 2011 Creative Mode',
'* This file is protected by copyright law and provided under license.',
'* Unauthorised copying of this file is strictly prohibited.'))
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524953239055821686)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_ID#" class="btn-toolbar regn-toolbar-dropdown #REGION_CSS_CLASSES#">',
'	<div class="pull-left">#PREVIOUS#</div>',
'	<div class="pull-right">#NEXT#</div>',
'	<div class="btn-group #REGION_ATTRIBUTES#">',
'		#CREATE#',
'		<div class="btn-group">',
'			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">',
'				Actions',
'				<span class="caret"></span>',
'			</button>',
'			<ul class="dropdown-menu pull-right">',
'				#DELETE#',
'				#SUB_REGIONS#',
'				"AFW_13_LISTE_NAVGT"',
'			</ul>',
'		</div>',
'	</div>',
'	<div class="pull-right">#EXPAND##COPY##HELP##CLOSE##EDIT##CHANGE##CREATE2#</div>',
'	#BODY#',
'</div>'))
,p_page_plug_template_name=>'Button Toolbar with Dropdown'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>313
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524955650219821688)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default panel-no-title #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'	<div class="panel-heading">',
'		<h3 class="panel-title">#TITLE#</h3>',
'		<div class="btn-toolbar">',
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>',
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>',
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>',
'		</div>',
'	</div>',
'	<div class="panel-body">',
'	#BODY#',
'        </div>',
'</div>'))
,p_page_plug_template_name=>'100% width form without title (class= Custom 2)'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>313
,p_theme_class_id=>22
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524955935649821688)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'	<div class="panel-heading">',
'		<h3 class="panel-title">#TITLE#</h3>',
'		<div class="btn-toolbar">',
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>',
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>',
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>',
'		</div>',
'	</div>',
'	<div class="panel-body">',
'	#BODY#',
'        </div>',
'</div>'))
,p_page_plug_template_name=>'100% width boxed form'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>313
,p_theme_class_id=>8
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'* APEX Themes - Themes, Templates & Skins for Oracle APEX Applications',
'* http://www.apex-themes.com',
'* Copyright (c) 2011 Creative Mode',
'* This file is protected by copyright law and provided under license.',
'* Unauthorised copying of this file is strictly prohibited.'))
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524956232265821688)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'	<div class="panel-heading">',
'		<h3 class="panel-title">#TITLE#</h3>',
'		<div class="btn-toolbar">',
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>',
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>',
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>',
'		</div>',
'	</div>',
'	<div class="panel-body">',
'	#BODY#',
'        </div>',
'</div>'))
,p_page_plug_template_name=>'100% width form with underlined title (class= Custom 1)'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>313
,p_theme_class_id=>21
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524958652348821690)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'	<div class="panel-heading">',
'		<h3 class="panel-title">#TITLE#</h3>',
'		<div class="btn-toolbar">',
'			<div class="btn-group">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>',
'			<div class="btn-group">#DELETE##EDIT##CREATE#</div>',
'			<div class="btn-group">#CHANGE##CREATE2##NEXT#</div>',
'		</div>',
'	</div>',
'        <div class="panel-body">',
'	#BODY#',
'        </div>',
'</div>'))
,p_page_plug_template_name=>'Report'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>313
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524958940433821690)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default panel-no-title #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'	<div class="panel-body">',
'	#BODY#',
'        </div>',
'</div>'))
,p_page_plug_template_name=>'100% width report without title (Custom 5)'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>313
,p_theme_class_id=>25
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default panel-no-title #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'	<div class="panel-heading">',
'		<h3 class="panel-title">#TITLE#</h3>',
'		<div class="btn-toolbar">',
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>',
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>',
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>',
'		</div>',
'	</div>',
'	<div class="panel-body">',
'	#BODY#',
'        </div>',
'</div>'))
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524959239204821690)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'	<div class="panel-heading">',
'		<h3 class="panel-title">#TITLE#</h3>',
'		<div class="btn-toolbar">',
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>',
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>',
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>',
'		</div>',
'	</div>',
'	<div class="panel-body">',
'	#BODY#',
'        </div>',
'</div>'))
,p_page_plug_template_name=>'100% width boxed report'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>313
,p_theme_class_id=>13
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524959526141821690)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'	<div class="panel-heading">',
'		<h3 class="panel-title">#TITLE#</h3>',
'		<div class="btn-toolbar">',
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>',
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>',
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>',
'		</div>',
'	</div>',
'	<div class="panel-body">',
'	#BODY#',
'        </div>',
'</div>'))
,p_page_plug_template_name=>'100% width report with underlined title (Custom 4)'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>313
,p_theme_class_id=>24
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524959831893821691)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default panel-alternative #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'	<div class="panel-heading">',
'		<h3 class="panel-title">#TITLE#</h3>',
'		<div class="btn-toolbar">',
'			<div class="btn-group">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>',
'			<div class="btn-group">#DELETE##EDIT##CREATE#</div>',
'			<div class="btn-group">#CHANGE##CREATE2##NEXT#</div>',
'		</div>',
'	</div>',
'	<div class="panel-body">',
'	#BODY#',
'        </div>',
'</div>'))
,p_page_plug_template_name=>'Report, alternative 1'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>313
,p_theme_class_id=>10
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(524965836798821698)
,p_list_template_current=>'<li class="active"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Navigation tab'
,p_theme_id=>313
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul class="nav nav-tabs">'
,p_list_template_after_rows=>'</ul>'
,p_list_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'* APEX Themes - Themes, Templates & Skins for Oracle APEX Applications',
'* http://www.apex-themes.com',
'* Copyright (c) 2011 Creative Mode',
'* This file is protected by copyright law and provided under license.',
'* Unauthorised copying of this file is strictly prohibited.'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(524966443896821699)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="afw_13_menu_sectn">',
'  <div class="afw_13_menu_infor">',
'    <i class="#IMAGE#"></i>',
'  </div>',
'  <div class="afw_13_menu_detls">',
'    <a href="#LINK#">',
'      #TEXT#',
'    </a>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="afw_13_menu_sectn">',
'  <div class="afw_13_menu_infor">',
'    <i class="#IMAGE#"></i>',
'  </div>',
'  <div class="afw_13_menu_detls">',
'    <a href="#LINK#" class="titre #IMAGE_ATTR#">',
'      #TEXT#',
'    </a>'))
,p_list_template_name=>'AFW - AFW 13 Menu (Custom 3)'
,p_theme_id=>313
,p_theme_class_id=>11
,p_list_template_before_rows=>'<div class="afw_13_menu">'
,p_list_template_after_rows=>'</div><div class="clear"></div>'
,p_between_items=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
'<div class="clear"></div>',
'</div>'))
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="afw_13_menu_choix"><a href="#LINK#" class="">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'<li class="afw_13_menu_choix"><a href="#LINK#" class="">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="afw_13_menu_sectn">',
'  <div class="afw_13_menu_infor">',
'    <i class="#IMAGE#"></i>',
'  </div>',
'  <div class="afw_13_menu_detls">',
'    <a href="#LINK#">',
'      #TEXT#',
'    </a>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="afw_13_menu_sectn">',
'  <div class="afw_13_menu_infor">',
'    <i class="#IMAGE#"></i>',
'  </div>',
'  <div class="afw_13_menu_detls">',
'    <a href="#LINK#" class="titre #IMAGE_ATTR#">',
'      #TEXT#',
'    </a>'))
,p_sub_templ_curr_w_child=>'<li class="afw_13_menu_choix"><a href="#LINK#" class="">#TEXT#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li class="afw_13_menu_choix"><a href="#LINK#" class="">#TEXT#</a></li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(524960728083821695)
,p_row_template_name=>'Without border with highlight'
,p_row_template1=>'<td class="grid-data" headers="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="grid grid-borderless">',
'<table class="grid-table" #REPORT_ATTRIBUTES#>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="pagination">',
'#PAGINATION#',
'</ul>',
'</table>',
'<div class="report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'</div>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th class="grid-header grid-default" #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="text">#TEXT#</span>'
,p_next_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT#"><i class="fa fa-arrow-right"></i></a></li>'
,p_previous_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS#"><i class="fa fa-arrow-left"></i></a></li>'
,p_next_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT_SET#"><i class="fa fa-arrow-right"></i></a></li>'
,p_previous_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS_SET#"><i class="fa fa-arrow-left"></i></a></li>'
,p_theme_id=>313
,p_theme_class_id=>1
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(524960728083821695)
,p_row_template_before_first=>'<tr class="grid-row highl">'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(524961636659821696)
,p_row_template_name=>'Standard'
,p_row_template1=>'<td class="grid-data" headers="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="grid grid-borderless">',
'<table class="grid-table" #REPORT_ATTRIBUTES#>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="pagination">',
'#PAGINATION#',
'</ul>',
'</table>',
'<div class="report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'</div>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th class="grid-header grid-default" #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="text">#TEXT#</span>'
,p_next_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT#"><i class="fa fa-arrow-right"></i></a></li>'
,p_previous_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS#"><i class="fa fa-arrow-left"></i></a></li>'
,p_next_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT_SET#"><i class="fa fa-arrow-right"></i></a></li>'
,p_previous_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS_SET#"><i class="fa fa-arrow-left"></i></a></li>'
,p_theme_id=>313
,p_theme_class_id=>4
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(524961636659821696)
,p_row_template_before_first=>'<tr class="grid-row highl">'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(524961927636821696)
,p_row_template_name=>'Standard, Alternating Row Colors'
,p_row_template1=>'<td class="grid-data odd" headers="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template2=>'<td class="grid-data even" headers="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="grid grid-borderless alternating-row-colors">',
'<table class="grid-table" #REPORT_ATTRIBUTES#>'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="pagination">',
'#PAGINATION#',
'</ul>',
'</table>',
'<div class="report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'</div>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th class="grid-header grid-default" #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'ODD_ROW_NUMBERS'
,p_row_template_display_cond2=>'EVEN_ROW_NUMBERS'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'ODD_ROW_NUMBERS'
,p_pagination_template=>'<span class="text">#TEXT#</span>'
,p_next_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT#"><i class="fa fa-arrow-right"></i></a></li>'
,p_previous_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS#"><i class="fa fa-arrow-left"></i></a></li>'
,p_next_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT_SET#"><i class="fa fa-arrow-right"></i></a></li>'
,p_previous_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS_SET#"><i class="fa fa-arrow-left"></i></a></li>'
,p_theme_id=>313
,p_theme_class_id=>5
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(524961927636821696)
,p_row_template_before_first=>'<tr class="grid-row highl">'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(524967923723821701)
,p_template_name=>'Without label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'</label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">'
,p_after_item=>'</div>'
,p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>'
,p_theme_id=>313
,p_theme_class_id=>13
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(524968048637821701)
,p_template_name=>'Optional label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'</label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">'
,p_after_item=>'</div>'
,p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>'
,p_theme_id=>313
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(524968135672821701)
,p_template_name=>'Optional label with help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><a href="javascript:afw.afw_21.actio_dynmq.aide_page_item.afich(''#CURRENT_ITEM_ID#'');" tabindex="-1">'
,p_template_body2=>'</a></label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">'
,p_after_item=>'</div>'
,p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>'
,p_theme_id=>313
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(524968230407821701)
,p_template_name=>'Required label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><span class="indic_champ_oblig">*</span><span class="texte_champ_oblig">'
,p_template_body2=>'</span></label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">'
,p_after_item=>'</div>'
,p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>'
,p_theme_id=>313
,p_theme_class_id=>4
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'* APEX Themes - Themes, Templates & Skins for Oracle APEX Applications',
'* http://www.apex-themes.com',
'* Copyright (c) 2011 Creative Mode',
'* This file is protected by copyright law and provided under license.',
'* Unauthorised copying of this file is strictly prohibited.'))
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(524968334267821701)
,p_template_name=>'Required label with help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><span class="indic_champ_oblig">*</span><span class="texte_champ_oblig"><a href="javascript:afw.afw_21.actio_dynmq.aide_page_item.afich(''#CURRENT_ITEM_ID#'')" tabindex="-1">'
,p_template_body2=>'</a></span></label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">'
,p_after_item=>'</div>'
,p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>'
,p_theme_id=>313
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(524971740589821705)
,p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif'
,p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"'
,p_page_name=>'winlov'
,p_page_title=>'Recherche'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#APEX_JAVASCRIPT#',
'<!-- AFW - JavaScript - Core -->',
'&A_AFW_11_TEMPL_JAVSC_CORE_1.',
'',
'&A_AFW_11_TEMPL_THEME_JQUER_UI.',
'<!-- AFW - JavaScript - Core -->',
'&A_AFW_11_TEMPL_JAVSC_CORE_2. ',
'&A_AFW_11_TEMPL_JAVSC_JQUER.',
'</head>'))
,p_page_body_attr=>'class="&A_AFW_11_JQUER_UI_CSS_SCOPE."'
,p_before_field_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default">',
'<div class="panel-heading">'))
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_find_button_text=>'Rechercher'
,p_close_button_text=>'Fermer'
,p_next_button_text=>'Suivant >'
,p_prev_button_text=>'< Précédent'
,p_after_field_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
'</div>'))
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'<div class="pagination"><span class="text">Rangée(s) #FIRST_ROW# - #LAST_ROW#</span></div>'
,p_result_rows_per_pg=>500
,p_before_result_set=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="panel panel-default">',
'<div class="panel-heading">'))
,p_theme_id=>313
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_after_result_set=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
'</div>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(524971426826821705)
,p_cal_template_name=>'Calendar'
,p_day_of_week_format=>'<th id="#DY#" scope="col" class="uCalDayCol">#IDAY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal">',
'<h1 class="uMonth">#IMONTH# <span>#YYYY#</span></h1>'))
,p_month_open_format=>'<table class="uCal" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>',
''))
,p_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_day_open_format=>'<td class="uDay" headers="#DY#">#TITLE_FORMAT#<div class="uDayData">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="uDay today" headers="#DY#">#TITLE_FORMAT#<div class="uDayData">#DATA#</div>'
,p_weekend_title_format=>'<span class="uDayTitle weekendday">#DD#</span>'
,p_weekend_open_format=>'<td class="uDay" headers="#DY#">#TITLE_FORMAT#<div class="uDayData">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_nonday_open_format=>'<td class="uDay nonday" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr>'
,p_daily_title_format=>'<th width="14%" class="calheader">#IDAY#</th>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal uCalWeekly">',
'<h1 class="uMonth">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="aCalDayCol" id="#DY#">',
'  <span class="visible-desktop">#DD# #IDAY#</span>',
'  <span class="hidden-desktop">#DD# <em>#IDY#</em></span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="uCal">'
,p_weekly_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>'))
,p_weekly_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="uDay today" headers="#DY#"><div class="uDayData">'
,p_weekly_weekend_open_format=>'<td class="uDay weekend" headers="#DY#"><div class="uDayData">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="uCalHour">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="aCalDayCol">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal uCalWeekly uCalDaily">',
'<h1 class="uMonth">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="uCal">'
,p_daily_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>'))
,p_daily_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="uDay today" headers="#DY#"><div class="uDayData">'
,p_daily_time_open_format=>'<th scope="row" class="uCalHour" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_agenda_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="listCalendar">',
'  <li class="monthHeader">',
'    <h1>#IMONTH# #YYYY#</h1>',
'  </li>',
'  #DAYS#',
'  <li class="listEndCap"></li>',
'</ul>'))
,p_agenda_past_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="dayHeader past">',
'    <h2>#IDAY# <span>#IMONTH# #DD#</span></h2>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="dayHeader today">',
'    <h2>#IDAY# <span>#IMONTH# #DD#</span></h2>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="dayHeader future">',
'    <h2>#IDAY# <span>#IMONTH# #DD#</span></h2>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="dayData past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="dayData today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="dayData future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>313
,p_theme_class_id=>1
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(524971926262821706)
,p_theme_id=>313
,p_theme_name=>'AFW - Bootstrap 3.0.0'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(524947027725821677)
,p_error_template=>wwv_flow_api.id(524949340311821681)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(524947827269821678)
,p_default_button_template=>wwv_flow_api.id(524971038247821704)
,p_default_region_template=>wwv_flow_api.id(524959239204821690)
,p_default_form_template=>wwv_flow_api.id(524955935649821688)
,p_default_reportr_template=>wwv_flow_api.id(524958940433821690)
,p_default_tabform_template=>wwv_flow_api.id(524955650219821688)
,p_default_listr_template=>wwv_flow_api.id(524958940433821690)
,p_default_irr_template=>wwv_flow_api.id(524959526141821690)
,p_default_report_template=>wwv_flow_api.id(524960728083821695)
,p_default_label_template=>wwv_flow_api.id(524968048637821701)
,p_default_calendar_template=>wwv_flow_api.id(524971426826821705)
,p_default_option_label=>wwv_flow_api.id(524968135672821701)
,p_default_required_label=>wwv_flow_api.id(524968334267821701)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(313),'')
,p_css_file_urls=>'#IMAGE_PREFIX#legacy_ui/css/5.0#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '89504E470D0A1A0A0000000D494844520000004000000033080600000027DF0EB1000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793000000097048597300000B1300000B1301009A9C180000000774494D4507D90C0411260F';
wwv_flow_api.g_varchar2_table(2) := 'FDF2CAE30000001974455874436F6D6D656E74004372656174656420776974682047494D5057810E1700000F7B4944415468DEE59B4B6C5CD779C77FDF39F7CE8BC3D7F02589144549B125DBB2604779D8B213A4B19DC449164580162D50C09BB6D974D3';
wwv_flow_api.g_varchar2_table(3) := '02458CAC0AB428D25D3705DAA068B34917EDA2689B206DEC200F340F2572EC44B665CBA6A807258AE4881C0E67EECC7D9CF375718714258B941D9B72825EE0828BB933F79EFFF7F8FFBFFFB914E73D77EB505544E41D7FB69B87B99B37DB58A05725751E';
wwv_flow_api.g_varchar2_table(4) := 'EF15546FFA6C2B2077E308EE56D405C8BCD28CDD1F9F598CFEE1D47C9B6323250E8E96A855020A569E0A8C3C5FB44260042B82BF0B992199DBAD12C81FDC08C4A96729CAF46757DAFCFD4BD779FE528B92153A699E0163FD21C7468A1C1929F1E1D11207';
wwv_flow_api.g_varchar2_table(5) := '6A45A6878A8C94EC5343E5E0F9DD4C06D9AD1E2040947AAE3413FDCE5C93AF9E59E1A5850E84866260A80A5C770A56F2AB554101E7C12B33D5025F3C36C4B39F9814BF8B0804B28BF5FEEDD9A6FEEDA9257EBE966044A8F48774324551BCCAC685582B58';
wwv_flow_api.g_varchar2_table(6) := '63C040A09647868BCC94432E37B34D3077AF07EC16B802DFBBD8C2152C9F99AC82072FD0F6CAC5B598F56EC65AAA780163C05A08107E7BAA8F4746CB9C5A882817ED4635ED2200BB086FB560C8142E7433460B960395907B4A96A30321EBB1E3EC5AC27C';
wwv_flow_api.g_varchar2_table(7) := 'EC58572534C2E323257EEF9E41BE35BBCE72E218295B763B057695052AA1417AE5504F1C8BB14381BE82612CB4ECEB0BA9160C4B89A7161A1E1E2AF1C672CCF9564A4721B90B5418EC16DF8A0883458B08E015D3A3C296577E71BD8B51B8BFBFC0602054';
wwv_flow_api.g_varchar2_table(8) := '03614F31E07A9471CD2BB12A915336D84F77B509EE22C7667A7B76281841141C9028A042EA955421F64A3DF5240A9582B9AD48FA8D01A0E53C6E87E8C91639EA1562A7788515E7F3BE67E5AD00A8C27BF8CCC12E920099423351FA43D9110111C854E93A';
wwv_flow_api.g_varchar2_table(9) := '8F005DAF2842AAB79480487EEA0E8DF11D02B4AB000C95031A8963A010F61671FB07B3021DAF044E51AF641E142530F9F5DAEB1F9A44E8ECBFA92E7C17D23A523900FD0791A17B61E07EA4FF8010866F9D29760024D84D9151088495C4B3D729A1156E5F';
wwv_flow_api.g_varchar2_table(10) := '0D8A1583D7BC41C69923F3F943970A39494967F5903FF7CFB33AFF5F102F825451DF81F573B01CA2260409C1044A711C197800468F21934F1F96F2F0F9F72D03F2E5298B9D8CFDD5705B3D2340AC4AEA94C4E5198028FBDD02FCFCEFD45DFC06F816EA1D';
wwv_flow_api.g_varchar2_table(11) := 'E021A8226250EFC1C5F9B9F15BDD6534BA8234CF4010CC32F3BBA2EF8714DE5898202C761D7BCB01D6CACD00E90DA822AF440A89D3BC71AAF247579EC155FA91B08CBA10B216B8760FD6DE37B7A4B7AA22B50F22B5E3E8C2BF834BEFA8A17605808DBA1B';
wwv_flow_api.g_varchar2_table(12) := 'B279ED3A55E65A29F70C1636AF299A88F1D25542B194982672059A99475D3E36E700AD421281AD62AAD3C8E051D439B4398BB6E73641C8FB8B62269EC0CC7C1EFFC6D7800CC2EA1D8564F04E17B64149EA3D64492F9C2617F4C6E6B37FEF9A997240DEC7';
wwv_flow_api.g_varchar2_table(13) := '8495D453EFC40C57623E5AFB294707BE47A5308F570BE298CCC639924E518F27B8164DD38CF7904A910C415C0BBBFA32ACBC0203F7636A0F624A35B475118DEB90AD63FAA63087BF805EFD06AC9F81601809CAEF8114D65EBAF516A62E433B6DDCC5D734';
wwv_flow_api.g_varchar2_table(14) := 'FEF63F41DCC1EC3B8CDD7F1F76EA5ECCC81E2894C41442248D29A8C3D994C1A0C581FE533C30F243ACB98ED302992FE5ACE64302DB60D8AE522BFD9223431E41F9333FCDFE2C6552531E4EDADC9F442457CE10BFF273EC68193B94F7024C3F66A082CCFD';
wwv_flow_api.g_varchar2_table(15) := '21DA1D43BB0952CE9BAEBC1B00B6BA399AC468BBB192BDF6C270FCDDAFE3CEFE008A95FC0E6FFC18BC039741B11FB3E7031AEE9D66B87C90A74D8DF53DB37C60E867206D9C0FC87C7193D26F94B14137DA826EA4B5A75E1CE49A4FE820DC9FB4F24C7321';
wwv_flow_api.g_varchar2_table(16) := 'C40E92667EFFA08A765E82A2A259824FC0848ABC0DAB23B8939E57EFD1FA82A6677E48F2FD7FC15D7C1182102A0337549ABD1934BF70966CE1753A9323ECFF58484288D73E0AC6520A8B74B236996618FC8D9252B949FB1BB1EC2DED63A2B29FB36B3FA5';
wwv_flow_api.g_varchar2_table(17) := '683C6C7A085B44118A480859013529641ECD049F09C699775F027EBD45F76B7F815FBE8454FAB1FB8FA14917ED34C125681AE751A157FBAA101429DEF308ED032364F2222A4AD978AA418DB1F20C916BD1CA9AAC274B74B22E82225BC8CAABE7DEE1137C';
wwv_flow_api.g_varchar2_table(18) := '62F2F33C77F1EBA84FC8FC366E3220B6883A8364169CA2198837A894DE831E1045EAD7AE40D6464A7BB0C31FC0F48DE09335FCCA157C7D1EDF5943E336EA32C486040F7C9CC2C39FA6EFCD6F22431E44E9B888286BD3711187071F64A434CE7254A2DE5D';
wwv_flow_api.g_varchar2_table(19) := '2276114E53148FE299A81CE4C3E38F7169FD2C0BAD37706A717E87766E2C2406158BEF2AEA14CD849B52F3570540FAAA2285A2BAE53A7EAE8E2C8E104C1CC68CCE600766B0B543F8E635FCDA357C73193B364D38F320EECA79E4F239D86751239B19BB9E';
wwv_flow_api.g_varchar2_table(20) := '3538B5F83DDAAE42291C622834586370DE8042C158A6FB6ACCADFE378BDD94D8834108FC4E7A43F019881A34D63C0BB658EEEF0E80725F8EB0985C7D755649DF3805BF3C0DF11866A286D95F061B60FAC61053203DFD4D7C718C207639CDE986EF99BBC4';
wwv_flow_api.g_varchar2_table(21) := '810D59493C57A315664A8EE9B2627AD5D31714596AFD9482C968EA5E526F08EEF0A0AAA0A98207CDF2539CC97BC31D365E823B32402010E70A944010B1600DAA19FEE23C7EF132C61541C00E4EE39A2B68F73A66728072E6899C500CB676FB1B23B01141';
wwv_flow_api.g_varchar2_table(22) := '8CA1B7039053A27ABC5ABC0AEBC91A99CFD9C1E90E92DBE78D0FED8DA04EF0CED0C92C050FA1614BB3BD1908735B15B7C1004027EA905DCF72006EA6889E93192266C3BBB36042D41BD475A93AC7722A779C176ED94D20D3FC4C1D24E4A3F2768384F69E';
wwv_flow_api.g_varchar2_table(23) := '459D45334193DC69F11974BA196B6B6B5F595B6BD2EDC66FF11654F506007ACB16551CC7341A8D434DE756DCAA6E1F829BE6DA00D4206AD1342150CF522288286FCFD53278944C21F142E484C40B99138244B7DF8031057082A68AC6B99CC6817A2549D2';
wwv_flow_api.g_varchar2_table(24) := '2F4551A4CD66F3F4CACACA93AD568B2CCB36D76A6E5D789A66341A6BACAD354F773BDD591FD8615D210FC5E618B24D28C5E499A2012409A24A3D13522F37D1DC4E00C4CE91F81C80C40B490FFB60DDC375DD3A66DE504DC50134C97D774D1471927BF05B';
wwv_flow_api.g_varchar2_table(25) := '64B973EE441C27CF4551E7F4FA7AEBD0E9D32F681CC7372C31E71CEBEB2D92243EEDBD9EB8E1C2E47E952E79E857C4C8F646BD0DF21B7B816E172D78BCC2D5D870A0EC6E6BE46CCD0C45F140EA052FE0548815C25E93734B1ED76FDEF203521A45B3FCD7';
wwv_flow_api.g_varchar2_table(26) := '3511C428521474CBDD4484200858595939317BFEFCEC7D478F12862141922444514492A4A7BDF7276ECD08ED750A7FC1610F853B3386911EFD04381733D04930C06CC770B0ECF22A926DC40C608CE0520F46F00A89CFC1885571807845BB8A9AAD868387';
wwv_flow_api.g_varchar2_table(27) := '8183901A34F31080588FD402DCF00C7887310655E5D5575F2508424E9E7C54FAAB558C3104AD56EBC9B3675F7BCE18C3D4D41485420155BDE1C3A942B9883641EB1EC6CDF60386319BF5874F31BD18AC79A19E1A4642BFE3268F203804E720344AE48554';
wwv_flow_api.g_varchar2_table(28) := '05EFA02C19F479A4288855A4206C72676100CDF299C5F479D87B84F5E37F05816005EAF53AF3F3F31C397A84C97DFB24086E905F303C3CFCFCC9938F4AA7D3E1F573E7346A450CD76A8C8CD47220BCC2680D090CFE95143B5ADC9E8CAD45BCE0638F5435';
wwv_flow_api.g_varchar2_table(29) := 'DFE8EC7DF46A64F8F8E0CE00A87A3CE48E1042CBE50CE06C093B7C2FF81813AC238101E3736D620113A03110829F7E94F687FE1A2DF6E1B384D9B939C4088F3FFE98542A95B7D07CB091EE954A85871F7A48B22C637E7E5E5F7FFD75AAD57EC627C6912F';
wwv_flow_api.g_varchar2_table(30) := '3F8B79F293C88F4E234B3FC20CB54094CD714B416C01094B90097433D405244FFD09E87F0009F554988F0D53C5ED259D15C18BA1A31EF54AD30B1625B525FCBDCFD018FE10BA748AE2C2FF508C7E04A60156C9D30ED2A94F133DFE97E012D61A0DCE9F3F';
wwv_flow_api.g_varchar2_table(31) := 'CF7DF71DE5E0CC8CDCAA0136FE06B7F2621004CCCCCCC8CCCC0CF57AFD2BE7E7E6BE94C429538F9D247CE2B7484D80BD308739F3034CE1279885D7D0C02018108B6690D5F6937DF1CBC8CC11FA7EF01CED3445155E6E5B4643BDED6B29790219AC04747D';
wwv_flow_api.g_varchar2_table(32) := '0C22C43E4FE14405AF1EAC2599F828C9DE93B49CA770FD271456BE43B1D5213EF9E7C40F7E81B4DBE6F2E5CB38E7F8F4A73E25D69AB750FC4D6577BB6DA75BBFE09DE395B3677575A5C1C8488D81A121B00141B180349BD8977F8C9D7B81308574EA38C9';
wwv_flow_api.g_varchar2_table(33) := '873F8656FAA848C0EF9F7A9697A34B3DBB5E9908951355C77CD7723511F6973CD3258FE0192C0CB1147B2E471D2A02BFE81A0CCA4861803F3DFC0C4F8C3F42E2D3DCA411C98597048027CB525A6BABCCCD5DE0F8F1634C4D4D096FE30D93603B1FE026B5';
wwv_flow_api.g_varchar2_table(34) := '642D0F1E3B260057AF2EE8A54B974084F1B1316C10107CE893D8934F13AB6E1A23E232086EECBEE76248584CE185F580DA163F5A7A1458B465326DD37182B5F95699E91997C1161DA11BF487C36529711C7379FE124110F2D9CF7EE6A685DF69E7EBCEC3';
wwv_flow_api.g_varchar2_table(35) := 'D02D60ECDBB757F6EDDB4BB7DBE5DCB973DAE9C454AB7D94CA65026B29168BB98CEE49E9AA2991FA2C575D18046139838E8792DCD0E2AACA40A146D68E68FB5CDE0A108A67A6A8546DFF263B6D2C2C8A22D6D69A2CD797F9E0C30F7D716464E4AB6F27EA';
wwv_flow_api.g_varchar2_table(36) := 'BFB229BAF5474BA512C78F1F17502E5DBAAC8B8B4B140A058AA512D618FAFAFAF0D6F3C4F84770D6B014AFB09AAC92F936FDD6D0D77B11AA68362645A55A18C06159F78211CF98F54C964B7C64F8210E5767C8D461AD258E635AAD16F5FA750606FB79EA';
wwv_flow_api.g_varchar2_table(37) := 'C927DE51D4EFD8037E15971860B5D13874E5CAD5D92C4D090B05BC73ECA94D2001BCD4789D338D57B91CCDB2962CB39E2EA1DAA23F30540B02A43C3EF939FEF3F28BFCEF6A93619BF040DF045F987C8A47463F4B680C4E1DCD6693D54603EF3C478F1E39';
wwv_flow_api.g_varchar2_table(38) := '3C3C3C74FE9D46FD3D7B41E2D611737868E8FCF0D0906469CAA5F9796DB7DA5C5B5DC23BCF4C692F1F397C9CC87538B7768EF9F69B5CEBCCD248AEB29E5DC6D121EC8DC7918B7974F03EFE60FA733C32F2182909DDB8CBE2E222499A323636CAE14387C4';
wwv_flow_api.g_varchar2_table(39) := '18C3BB59FCBBCE80B793154BCBCBA71BAB8D13699A92240928EC19DF435FA59F46B7C1D5688E7A778EAB9DB3CC0CDFC33FBEF92D868AF7F3CCD4E77960E81E621FB35CAFB3D668D0DFDFCFFEE9FD878787DE5DD4771580ED8088E398C5C525ED76BBB4A3';
wwv_flow_api.g_varchar2_table(40) := '88248E191C18647C6C0283E57A77194797971BE73836788CB1F208EB519B0B172F502E97D83331C1D4D49488C88EBCFE6B03C0B63B4AAAACAEAE3ED96AB59FDBA8E74AB9CCE4BE49C2B08051418DF2E6EC9B449D0E5393934C4C4C487F7F95F72AEA771D';
wwv_flow_api.g_varchar2_table(41) := '80DB892B804EA743ABD5FAD76673FD77AE5DBB4692A64C8C8F73E1C205262727999CDCF737A3A3A3CF6EF7FDDF2800762A8F2CCB68B723BADDCECAC2B56BC313E3E3D46A3529168BBB12F5F71D809DB2228E63EEC6C27F2D00D8292BEED6FF0FFCDA00F0';
wwv_flow_api.g_varchar2_table(42) := '7E1D86FFE7C7FF01775988B58C7DB04C0000000049454E44AE426082';
wwv_flow_api.create_theme_image(
 p_id=>wwv_flow_api.id(524971926262821706)
,p_theme_id=>313
,p_varchar2_table=>wwv_flow_api.g_varchar2_table
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_options
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(482611776733288332)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'fr_ca'
,p_message_text=>'Permet de télécharger le jeu de données courant. Les types de fichiers disponibles diffèrent selon votre installation. Les différents types sont CSV, XLS, PDF et RTF.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486473560257505411)
,p_name=>'APEXIR_VIEW_REPORT '
,p_message_text=>'Voir tableau'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486473679065505411)
,p_name=>'APEXIR_ADD'
,p_message_text=>'Add'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486473764570505411)
,p_name=>'APEXIR_AGGREGATE'
,p_message_text=>'Aggréger'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486473853723505411)
,p_name=>'APEXIR_AGGREGATION'
,p_message_text=>'Aggrégation'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486473966082505411)
,p_name=>'APEXIR_AGG_AVG'
,p_message_text=>'Moyenne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486474073164505411)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_text=>'Calculer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486474181626505411)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_text=>'Médianne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486474259861505411)
,p_name=>'APEXIR_AGG_SUM'
,p_message_text=>'Somme'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486474373298505412)
,p_name=>'APEXIR_ALL'
,p_message_text=>'Tout'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486474477324505412)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_text=>'Toutes les colonnes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486474549981505412)
,p_name=>'APEXIR_AND'
,p_message_text=>'AND'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486474654755505412)
,p_name=>'APEXIR_APPLY'
,p_message_text=>'Save'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486474749717505412)
,p_name=>'APEXIR_ASCENDING'
,p_message_text=>'Ascendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486474856996505412)
,p_name=>'APEXIR_AS_OF'
,p_message_text=>'Il y a '
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486474956806505412)
,p_name=>'APEXIR_BETWEEN'
,p_message_text=>'entre (BETWEEN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486475060101505412)
,p_name=>'APEXIR_BGCOLOR'
,p_message_text=>'Couleur de fond'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486475151963505412)
,p_name=>'APEXIR_BLUE'
,p_message_text=>'Bleu'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486475281458505412)
,p_name=>'APEXIR_BOTTOM'
,p_message_text=>'En bas'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486475354467505412)
,p_name=>'APEXIR_CALENDAR'
,p_message_text=>'Calendar'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486475473447505412)
,p_name=>'APEXIR_CANCEL'
,p_message_text=>'Cancel'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486475580839505412)
,p_name=>'APEXIR_CATEGORY'
,p_message_text=>'Category'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486475674343505412)
,p_name=>'APEXIR_CELL'
,p_message_text=>'Cellule'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486475758832505412)
,p_name=>'APEXIR_CHART'
,p_message_text=>'Graphique'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486475854267505412)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_text=>'Initialisation...'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486475966301505412)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_text=>'Type de graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486476075967505414)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_text=>'Choisir le format de téléchargement du rapport'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486476179369505414)
,p_name=>'APEXIR_CLOSE'
,p_message_text=>'Fermer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486476279321505414)
,p_name=>'APEXIR_COLUMN'
,p_message_text=>'Column'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486476375213505414)
,p_name=>'APEXIR_COLUMNS'
,p_message_text=>'Colonnes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486476457985505414)
,p_name=>'APEXIR_COLUMN_HEADING'
,p_message_text=>'Entête de la colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486476578998505414)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_text=>'contient'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486476676438505414)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_text=>'ne contient pas'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486476765021505414)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_text=>'est dans (IN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486476851193505414)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_text=>'n''est pas dans le dernier'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486476981458505414)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_text=>'n''est pas dans le suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486477069604505414)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_text=>'est dans le dernier'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486477162971505414)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_text=>'est dans le suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486477252980505414)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_text=>'n''est pas nul (IS NOT NULL)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486477368828505414)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_text=>'est nul (IS NULL)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486477449578505414)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_text=>'comme (LIKE)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486477561218505414)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_text=>'n''est pas dans (NOT IN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486477649277505414)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_text=>'pas comme (NOT LIKE)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486477781858505414)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_text=>'expression dans'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486477875236505415)
,p_name=>'APEXIR_COMPUTATION'
,p_message_text=>'Calcul'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486477981484505415)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Créer un calcul en utilisant un alias pour les colonnes.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486478076248505415)
,p_name=>'APEXIR_COMPUTE'
,p_message_text=>'Calculer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486478167434505415)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_text=>'Regroupement'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486478280316505415)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_text=>'Regrouper'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486478360058505415)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_text=>'Données telles qu''elle était il y a %0 minute(s)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486478466748505415)
,p_name=>'APEXIR_DEFAULT'
,p_message_text=>'Default'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486478549699505415)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_text=>'Voulez-vous vraiment supprimer cette paramétrisation?'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486478656298505415)
,p_name=>'APEXIR_DELETE_CONFIRM_JS_DIALOG'
,p_message_text=>'Voulez-vous vraiment supprimer cet enregistrement?'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486478772320505415)
,p_name=>'APEXIR_DESCENDING'
,p_message_text=>'Descendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486478862164505415)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_text=>'Détail'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486478970827505415)
,p_name=>'APEXIR_DISABLE'
,p_message_text=>'Désactiver'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486479053321505415)
,p_name=>'APEXIR_DISABLED'
,p_message_text=>'Désactivé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486479156084505415)
,p_name=>'APEXIR_DISPLAYED'
,p_message_text=>'Affiché'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486479275896505415)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_text=>'Colonne(s) affichée(s)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486479352002505415)
,p_name=>'APEXIR_DOWN'
,p_message_text=>'Descendre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486479480058505415)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_text=>'Télécharger'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486479577207505415)
,p_name=>'APEXIR_DO_NOT_AGGREGATE'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'- Ne pas aggréger -',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486479658023505415)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_text=>'Colonne(s) à ne pas afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486479769167505417)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_text=>'Modifier les paramètres du graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486479865342505417)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_text=>'Modifier la mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486479967396505417)
,p_name=>'APEXIR_ENABLED'
,p_message_text=>'Activé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486480066633505417)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_text=>'Activer/Désactiver'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486480179984505417)
,p_name=>'APEXIR_ERROR'
,p_message_text=>'Error'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486480260751505417)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_text=>'Exclure les valeurs nulles'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486480377657505417)
,p_name=>'APEXIR_FILTER'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486480479524505417)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_text=>'Choisir les colonnes pour la recherche'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486480555336505417)
,p_name=>'APEXIR_FLASHBACK'
,p_message_text=>'Retour en arrière'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486480660543505417)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Une requête avec retour en arrière permet de voir les données telles qu''elles étaient au moment choisi.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486480775620505417)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_text=>'Masque de saisie'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486480876060505417)
,p_name=>'APEXIR_FUNCTION'
,p_message_text=>'Fonction'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486480976068505417)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_text=>'Fonctions'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486481076884505417)
,p_name=>'APEXIR_GO'
,p_message_text=>'Search'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486481168048505417)
,p_name=>'APEXIR_GREEN'
,p_message_text=>'Vert'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486481252272505417)
,p_name=>'APEXIR_HCOLUMN'
,p_message_text=>'Colonne horizontale'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486481370382505417)
,p_name=>'APEXIR_HELP_RESET'
,p_message_text=>'Réinitialiser le rapport avec les paramètres initiaux, supprimer toutes les personnalisations que vous avez fait.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486481476130505417)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_text=>'Cacher colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486481568271505418)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_text=>'Condition de mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486481674673505418)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_text=>'Type de mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486481763285505418)
,p_name=>'APEXIR_HIGHLIGHT_WHEN'
,p_message_text=>'Mis en évidence quand'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486481853674505418)
,p_name=>'APEXIR_INVALID'
,p_message_text=>'Invalide'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486481967274505418)
,p_name=>'APEXIR_KEYPAD'
,p_message_text=>'Touche du clavier numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486482068676505418)
,p_name=>'APEXIR_LABEL'
,p_message_text=>'Label'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486482156444505418)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_text=>'Titre (axe des X)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486482249715505418)
,p_name=>'APEXIR_MOVE'
,p_message_text=>'Déplacer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486482352454505418)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_text=>'Déplacer tout'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486482469658505418)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_text=>'Nouvelle aggrégation'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486482549411505418)
,p_name=>'APEXIR_NEW_CATEGORY'
,p_message_text=>'- Nouvelle catégorie -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486482655783505418)
,p_name=>'APEXIR_NO'
,p_message_text=>'No'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486482768953505418)
,p_name=>'APEXIR_NONE'
,p_message_text=>'- None -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486482875503505418)
,p_name=>'APEXIR_NO_AGGREGATION_DEFINED'
,p_message_text=>'Aucune aggrégation définie'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486482974227505418)
,p_name=>'APEXIR_NO_COMPUTATION_DEFINED'
,p_message_text=>'Aucun calcul défini'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486483073136505418)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_text=>'Valeur nulle toujours au début'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486483172654505418)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_text=>'Valeur nulle toujours à la fin'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486483264833505418)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_text=>'Le moment du retour en arrière doit être numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486483366253505418)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_text=>'La séquence doit être numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486483476243505420)
,p_name=>'APEXIR_NUM_ROWS'
,p_message_text=>'Rangées'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486483561269505420)
,p_name=>'APEXIR_OPERATOR'
,p_message_text=>'Opérateur'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486483673426505420)
,p_name=>'APEXIR_OTHER'
,p_message_text=>'Autre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486483765812505420)
,p_name=>'APEXIR_RED'
,p_message_text=>'Rouge'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486483876940505420)
,p_name=>'APEXIR_REMOVE'
,p_message_text=>'Enlever'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486483968782505420)
,p_name=>'APEXIR_REMOVE_AGGREGATE'
,p_message_text=>'Enlever toutes les aggrégations'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486484073825505420)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_text=>'Enlever tout'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486484181977505421)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_text=>'Enlever le regroupement'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486484275243505421)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_text=>'La rangée contient'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486484350902505421)
,p_name=>'APEXIR_SAVE'
,p_message_text=>'Save'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486484474916505421)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_text=>'Rapport sauvé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486484580328505421)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_text=>'Rapport sauvé = "%0"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486484659630505421)
,p_name=>'APEXIR_SAVE_AS_DEFAULT'
,p_message_text=>'Sauvegardée en tant que valeur par défaut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486484766003505421)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_text=>'La paramétrisation du rapport courant est utilisée comme valeur par défaut pour tous les utilisateurs'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486484855434505421)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_text=>'Enregistrer rapport'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486484981362505421)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_text=>'Barre de recherche'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486485072160505421)
,p_name=>'APEXIR_SELECT_CATEGORY'
,p_message_text=>'- Choose category -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486485158301505421)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_text=>'- Choose a column -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486485249839505421)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_text=>'Choisir colonnes'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486485377722505421)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_text=>'- Choose function -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486485475249505421)
,p_name=>'APEXIR_SELECT_VALUE'
,p_message_text=>'Valeur sélectionnée'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486485573742505421)
,p_name=>'APEXIR_SEQUENCE'
,p_message_text=>'Séquence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486485666079505421)
,p_name=>'APEXIR_SORT'
,p_message_text=>'Trier'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486485751843505421)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_text=>'Tri ascendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486485861463505423)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_text=>'Tri descendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486485951499505423)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_text=>'Couleur du texte'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486486055375505423)
,p_name=>'APEXIR_TOP'
,p_message_text=>'En haut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486486164314505423)
,p_name=>'APEXIR_UP'
,p_message_text=>'Monter'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486486277604505423)
,p_name=>'APEXIR_YELLOW'
,p_message_text=>'Jaune'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486486354322505423)
,p_name=>'APEXIR_YES'
,p_message_text=>'Yes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486486472281505423)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_text=>'<b>Il s''est produit une erreur :</b>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486486571967505423)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_text=>'<b>Il s''est produit %0 erreurs :</b>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486486680168505423)
,p_name=>'PAGINATION.NEXT'
,p_message_text=>'Suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486486780646505423)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_text=>'Précédent'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486486858744505423)
,p_name=>'RESET'
,p_message_text=>'Reset'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486486968602505423)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_text=>'minutes.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486487079882505423)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_text=>'Trier par cette colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486487159544505423)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_text=>'Rangée(s) %0 - %1 de plus que %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486487278532505423)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_text=>'Rangée(s) %0 - %1 de %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486487376251505423)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_text=>'%0 - %1 de %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486487466401505423)
,p_name=>'APEXIR_ROWS'
,p_message_text=>'Rangées'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486487556185505423)
,p_name=>'APEXIR_RESET'
,p_message_text=>'Reset'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486487675310505425)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_text=>'Réinitialiser le rapport avec les paramètres initiaux.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486487755634505425)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_text=>'Voir graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486487872601505425)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_text=>'Voir tableau'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486487976445505425)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_text=>'Paramètres du graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486488079038505425)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_text=>'Vue générale'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486488150128505425)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_text=>'Titre (axe des Y)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486488266115505425)
,p_name=>'APEXIR_DELETE'
,p_message_text=>'Delete'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486488355410505425)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_text=>'Effacer le rapport'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486488465036505425)
,p_name=>'APEXIR_DISPLAY'
,p_message_text=>'Afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486488574845505425)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_text=>'Colonne(s) à afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486488660348505425)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_text=>'Modifier le filtre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486488773761505425)
,p_name=>'APEXIR_EXAMPLES'
,p_message_text=>'Exemples'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486488862717505425)
,p_name=>'APEXIR_FILTERS'
,p_message_text=>'Filtres'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486488965148505425)
,p_name=>'APEXIR_FLASHBACK_ERROR_MSG'
,p_message_text=>'Impossible d''exécutée la requête avec retour en arrière'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486489067074505425)
,p_name=>'APEXIR_HELP'
,p_message_text=>'Help'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486489176068505425)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_text=>'Mettre en évidence'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486489278784505425)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_text=>'Expression de calcul invalide'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486489351547505425)
,p_name=>'APEXIR_NAME'
,p_message_text=>'Name'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486489453459505425)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_text=>'Nouveau calcul'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486489552489505426)
,p_name=>'APEXIR_VALUE'
,p_message_text=>'Value'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486489671433505426)
,p_name=>'APEXIR_3D'
,p_message_text=>'3D'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486489756128505426)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_text=>'Permet de télécharger le jeu de données courant. Les types de fichiers disponibles diffèrent selon votre installation. Les différents types sont CSV, XLS, PDF et RTF.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486489849927505426)
,p_name=>'APEXIR_HELP_01'
,p_message_text=>'Un rapport interactif affiche un jeu de colonne prédéterminé. Le rapport peut être personnalisé davantage avec l''utilisation d''un filtre initial, d''un tri par défaut, des bris, du surlignage, des calculs, des aggrégations et d''un graphique. Chaque ra'
||'pport interactif peuvent donc être personnalisés davantage et les résultats peuvent être visionnés, téléchargés et la définition du rapport peut être sauvegardé pour une utilisation ultérieure.<p/>Un rapport interactif peut est personnalisé à trois n'
||'iveaux: la barre de recherche, le menu d''action et l''entête des menus.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486489956196505426)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_text=>'Le menu d''actions est utilisé pour personnaliser l''affchage de votre rapport interactif.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486490064652505426)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Les aggrégations sont des calculs mathématiques applicables sur une colonne. Les aggrégations sont affichés après chaque bri et à la fin du rapport dans les colonnes sur lesquelles ils sont définis.',
'<p/>',
'<ul><li><b>Aggréger</b> permet de sélectionner et d''éditer une aggrégation définie précédemment.</li>',
'<li><b>Fonction</b> est utilisé pour choisir la fonction qui sera appliquée (ex.: Somme, Minimum).</li>',
'<li><b>Colonne</b> est utilisé pour choisir la colonne sur laquelle on appliquera la fonction mathématique. Seulement les colonnes numériques seront affichées.</li></ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486490174032505426)
,p_name=>'APEXIR_HELP_CHART'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Vous pouvez inclure un graphique pour chaque rapport interactif. Une fois défini, vous pouvez basculer entre la vue du graphique et celle du rapport en utilisant les liens sous la barre de recherche.',
'<p/>',
'<ul><li><b>Type de graphique</b> identifie le type de graphique à inclure. Choisir entre barres horizontales, barres verticales, tarte ou lignes.</li>',
'<li><b>Libellé</b> identifie la colonne utilisée pour le libellé.</li>',
'<li><b>Titre (axe des X)</b> identifie le titre affiché sur l''axe associé à la colonne sélectionnée pour le Libellé. Non disponible pour le graphique en tarte.</li>',
'<li><b>Valeur</b> identifie la colonne utilisée pour la valeur.</li>',
'<li><b>Titre (axe des Y)</b> identifie le titre affiché sur l''axe associé à la colonne sélectionnée pour la Valeur. Non disponible pour le graphique en tarte.</li>',
'<li><b>Fonction</b> est une fonction facultative pouvant être appliquée sur la colonne sélectionnées pour la Valeur.</li></ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486490280175505426)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Lorsqu''on clique sur un entête de colonne, un menu d''entête s''affiche.',
'<p/>',
'<ul><li><b>Icône de tri ascendant</b> trie le rapport par cette colonne en ordre ascendant.</li>',
'<li><b>Icône de tri descendant</b> trie le rapport par cette colonne en ordre descendant.</li>',
'<li><b>Cacher colonne</b> cache la colonne.</li>',
'<li><b>Regroupement</b> crée un bri sur la colonne.</li>',
'<li><b>Aide</b> affiche l''aide à propose de la colonne.</li>',
'<li><b>Zone de texte</b> est utilisé pour saisir un critère recherche. Lorsqu''on saisi une valeur, la liste de valeurs au bas du menu va être réduite. Vous pouvez ensuite sélectionner une valeur dans le bas et cette valeur créera un filtre en utilisa'
||'nt ''='' (ex.: colonne = ''ABC''). Alternativement, vous pouvez cliquer sur l''icône de la lampe de poche et la valeur entrée créera un ''LIKE'' (ex.: colonne LIKE ''%ABC%'').',
'<li><b>Liste de valeurs uniques</b> contient les 500 premières valeurs uniques qui correspondent aux filtres. Si la colonne est une date, une liste de dates sera affichée. Vous pouvez sélectionner une valeur, un filtre sera créé en utilisant ''='' (ex.'
||': colonne = ''ABC'').</li></ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486490367772505426)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Si vous avez personnalisé votre rapport interactif, les paramètres seront affichés en-dessous la barre de recherche et au-dessus du rapport. Si vous avez sauvegardés des rapports personnalisés, ils s''afficheront sous la forme d''onglets. Vous pouvez a'
||'ccéder aux vues alternatives en cliquant sur les onglets. Les paramètres du rapport seront affichés sous les onglets. Cette zone peut être ouverte ou fermée en utilisant l''icône à gauche.',
'<p/>',
'Pour chaque paramètre du rapport, vous pouvez:',
'<ul><li><b>Éditer</b> en cliquant le nom.</li>',
'<li><b>Désactiver/Activer</b> en cochant la boîte d''activation et de désactivation. On utilise cette option pour activer/désactiver temporairement un paramètre.</li>',
'<li><b>Supprimer</b> en cliquant l''icône de suppression. On utilise cette option pour supprimer un paramètre de façon permanente.</li></ul>',
'<p/>',
'Si vous avez créé un graphique, vous pouvez basculter entre le rapport et le graphique en utilisant les liens à droite. Si vous êtes entrain de visionner un graphique, vous pouvez utiliser le lien d''édition pour éditer les paramètres du graphique.'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486490449340505426)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_text=>'Utilisé pour modifier les colonnes affichées. Les colonnes à droite sont affichées. Les colonnes à gauche sont cachés. Vous pouvez repositionner les colonnes affichées en utilisant les flèches à l''extrême droite. Les colonnes calculées sont préfixées'
||' par <b>**</b>.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486490561153505426)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_text=>'Utilisé pour créer un regroupement sur une ou plusieurs colonnes. On sort les colonnes du rapport interactif et on les affiche comme des colonnes de bri.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486490659759505426)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_text=>'Menu d''actions'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486490761903505426)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_text=>'Sauvegarde le rapport personnalisé pour une utilisation utltérieure. Vous devez fournir un nom et une description optionnelle.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486490855237505426)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_text=>'Aide pour le rapport interactif'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486490962178505426)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_text=>'Paramètres d''un rapport'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486491055449505426)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_text=>'Menu d''entête de colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486491158278505428)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_text=>'Exécute une requête de « retour en arrière » permettant de voir les données telles qu''elles étaient dans le passé à un moment donné. Le « retour en arrière » par défaut est de 3 heures (ou 180 minutes) mais ce chiffre diffère selon la base de données'
||'.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486491273159505428)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_text=>'Sert à ajouter ou modifier un énoncé WHERE pour la requête. D''abord, choisir une colonne (il n''est pas nécessaire qu''elle soit affichée), choisir parmi la liste des opérateurs Oracle (=, !=, not in, between), saisir une expression pour la comparaison'
||'. L''expression est sensible à la casse et vous pouvez utiliser % comme caractère de remplacement (ex.: NOM_PROVINCE like Q%).'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486491372457505428)
,p_name=>'APEXIR_HELP_SORT'
,p_message_text=>'Utilisé pour changer l''ordonnancement des colonnes (ascandant et descandat). Vous pouvez aussi spécifier commet gérer les valeurs nulles (utilise le paramètre par défaut, toujours afficher en premier ou en dernier). Une icône affichera le type de tri'
||' à la droite de l''entête d''une colonne.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486491468747505428)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Au dessus de chaque rapport, il y a une région de recherche. Cette région contient ces fonctionnalités:',
'<p/>',
'<ul><li><b>L''icône de colonnes</b> permet de choisir sur quelle(s) colonne(s) rechercher.</li>',
'<li><b>Zone de texte</b> permet de faire une recherche non sensible sur la casse (pas besoin d''utiliser des caractères de remplacement).</li>',
'<li><b>Rows</b> selects the number of records to display per page.</li>',
'<li><b>Bouton [Rechercher]</b> exécute la recherche.</li>',
'<li><b>L''icône du menu des actions</b> affiche le menu des actions.</li></ul>',
'<p/>',
'Veuillez noter que ce ne sont pas toutes les fonctionnalités qui sont disponibles pour chaque rapport.'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486491553248505428)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'La mise en évidence définit un filtre. Les rangées qui correspondent au filtre sont mises en évidence en utilisant les caractéristiques associées au filtre.',
'<p/>',
'<ul><li><b>Nom</b> est utilisé seulement pour l''affichage.</li>',
'<li><b>Séquence</b> identifie l''ordre dans lequel sera évalué les règles.</li>',
'<li><b>Actif</b> identifie si la règle est activée ou désactivée.</li>',
'<li><b>Type de mise en évidence</b> identifie si ce sera la rangée ou la cellule qui sera mise en évidence.</li>',
'<li><b>Couleur d''arrière plan</b> est la couleur utilisée pour mettre en évidence une zone.</li>',
'<li><b>Couleur de texte</b> est la couleur utilisée pour mettre en évidence le texte d''une zone.</li>',
'<li><b>Conditions de la mise en évidence</b> définit les conditions du filtre.</li></ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486491680469505428)
,p_name=>'APEXIR_ENABLE'
,p_message_text=>'Activer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486491762749505428)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_text=>'espace'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486491863435505428)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_text=>'Supprimer filtre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486491972890505428)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_text=>'Supprimer la mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486492078638505428)
,p_name=>'APEXIR_STATUS'
,p_message_text=>'Statut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486492155237505428)
,p_name=>'APEXIR_ROW'
,p_message_text=>'Rangée'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486492255904505428)
,p_name=>'APEXIR_CLEAR'
,p_message_text=>'effacer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(486492380220505428)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_text=>'Supprimer Retour en arrière'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(498407897159962454)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'fr_ca'
,p_message_text=>'Valeur'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(498408288530962455)
,p_name=>'APEXIR_3D'
,p_message_language=>'fr_ca'
,p_message_text=>'3D'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566214344254235674)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Accès refusé par la sécurité de l''application'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566216630425235675)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Accès refusé par la sécurité page'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566219817219235678)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur ne concorde pas avec le format %0.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566223026452235679)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Accéder'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566226244872235682)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur doit être numérique.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566229437857235684)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur obligatoire.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566232632737235685)
,p_name=>'APEXIR_3D'
,p_message_language=>'fr-ca'
,p_message_text=>'3D'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566235842387235688)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'Menu d''actions'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566238225665235690)
,p_name=>'APEXIR_ADD'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566241415805235696)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aggréger'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566244623515235699)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Aggrégation'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566247842482235700)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'fr-ca'
,p_message_text=>'Moyenne22'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566251026209235702)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>'Calculer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566254232774235704)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'fr-ca'
,p_message_text=>'Médianne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566257413254235706)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'fr-ca'
,p_message_text=>'Somme'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566260630218235707)
,p_name=>'APEXIR_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566263821567235711)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Toutes les colonnes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566267027219235717)
,p_name=>'APEXIR_AND'
,p_message_language=>'fr-ca'
,p_message_text=>'AND'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566270226685235718)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'fr-ca'
,p_message_text=>'Appliquer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566273442867235720)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Ascendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566276620595235722)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a '
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566279836925235723)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'fr-ca'
,p_message_text=>'entre (BETWEEN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566283024021235725)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Couleur de fond'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566286220420235727)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Bleu'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566289433174235729)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'fr-ca'
,p_message_text=>'En bas'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566292635164235731)
,p_name=>'APEXIR_CALENDAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Calendrier'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566295832041235733)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Annuler'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566299034966235734)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'fr-ca'
,p_message_text=>'Catégorie'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566302237440235737)
,p_name=>'APEXIR_CELL'
,p_message_language=>'fr-ca'
,p_message_text=>'Cellule'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566305428999235739)
,p_name=>'APEXIR_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Graphique'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566308713007235742)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'fr-ca'
,p_message_text=>'Initialisation...'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566311928544235744)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566315112552235748)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Choisir le format de téléchargement du rapport'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566318326518235751)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'fr-ca'
,p_message_text=>'effacer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566321528511235754)
,p_name=>'APEXIR_CLOSE'
,p_message_language=>'fr-ca'
,p_message_text=>'Fermer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566324742523235756)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566327936999235760)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonnes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566331136835235763)
,p_name=>'APEXIR_COLUMN_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>'Entête de la colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566334342866235765)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'Menu d''entête de colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566337520991235774)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'fr-ca'
,p_message_text=>'contient'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566340726452235777)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'fr-ca'
,p_message_text=>'ne contient pas'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566343937315235779)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'fr-ca'
,p_message_text=>'est dans (IN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566347121408235782)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'n''est pas dans le dernier'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566350340131235785)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'n''est pas dans le suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566353528680235789)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'est dans le dernier'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566355939121235792)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'est dans le suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566359128800235794)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'n''est pas nul (IS NOT NULL)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566362313312235796)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'est nul (IS NULL)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566365526939235800)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'fr-ca'
,p_message_text=>'comme (LIKE)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566368721667235802)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'fr-ca'
,p_message_text=>'n''est pas dans (NOT IN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566371932427235805)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'fr-ca'
,p_message_text=>'pas comme (NOT LIKE)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566375118765235809)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'fr-ca'
,p_message_text=>'expression dans'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566378338276235811)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Calcul'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566381530929235813)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Créer un calcul en utilisant un alias pour les colonnes.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566384733464235819)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'fr-ca'
,p_message_text=>'Calculer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566387937442235831)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Regroupement'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566391115228235834)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'fr-ca'
,p_message_text=>'Regrouper'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566394315604235836)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'Données telles qu''elle était il y a %0 minute(s)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566397534112235839)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>'Défaut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566400718553235841)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566403942426235843)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>'Voulez-vous vraiment supprimer cette paramétrisation?'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566407123716235845)
,p_name=>'APEXIR_DELETE_CONFIRM_JS_DIALOG'
,p_message_language=>'fr-ca'
,p_message_text=>'Voulez-vous vraiment supprimer cet enregistrement?'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566410337595235847)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Effacer le rapport'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566413543400235849)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Descendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566416741687235850)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Détail'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566419938776235852)
,p_name=>'APEXIR_DISABLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Désactiver'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566423115392235853)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'fr-ca'
,p_message_text=>'Désactivé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566426330471235855)
,p_name=>'APEXIR_DISPLAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566429534154235857)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'fr-ca'
,p_message_text=>'Affiché'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566432712553235860)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne(s) affichée(s)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566435938311235868)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne(s) à afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566439130351235869)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'fr-ca'
,p_message_text=>'Descendre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566442341996235871)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'fr-ca'
,p_message_text=>'Télécharger'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566445528910235873)
,p_name=>'APEXIR_DO_NOT_AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'- Ne pas aggréger -',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566448714346235874)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne(s) à ne pas afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566451929112235876)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier les paramètres du graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566455122868235878)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'fr-ca'
,p_message_text=>'Paramètres du graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566458341664235881)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier le filtre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566461516350235882)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier la mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566464813849235884)
,p_name=>'APEXIR_ENABLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Activer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566468033755235886)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'fr-ca'
,p_message_text=>'Activé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566471238422235887)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'fr-ca'
,p_message_text=>'Activer/Désactiver'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566474219902235889)
,p_name=>'APEXIR_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566476838218235890)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'fr-ca'
,p_message_text=>'Exemples'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566480034361235892)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'Exclure les valeurs nulles'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566483240585235894)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566486434367235899)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtres'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566489625829235900)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de filtre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566492818181235903)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'fr-ca'
,p_message_text=>'Choisir les colonnes pour la recherche'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566496037808235905)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>'Retour en arrière'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566499237372235907)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Une requête avec retour en arrière permet de voir les données telles qu''elles étaient au moment choisi.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566502432383235908)
,p_name=>'APEXIR_FLASHBACK_ERROR_MSG'
,p_message_language=>'fr-ca'
,p_message_text=>'Impossible d''exécutée la requête avec retour en arrière'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566505612504235910)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'fr-ca'
,p_message_text=>'Masque de saisie'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566508820773235912)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Fonction'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566512040331235913)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Fonctions'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566515216307235915)
,p_name=>'APEXIR_GO'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566518412873235916)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'fr-ca'
,p_message_text=>'Vert'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566521613949235918)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'fr-ca'
,p_message_text=>'Grouper par'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566524822916235920)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Grouper par colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566528035351235923)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne horizontale'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566531215857235925)
,p_name=>'APEXIR_HELP'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566534442834235929)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'fr-ca'
,p_message_text=>'Un rapport interactif affiche un jeu de colonne prédéterminé. Le rapport peut être personnalisé davantage avec l''utilisation d''un filtre initial, d''un tri par défaut, des bris, du surlignage, des calculs, des aggrégations et d''un graphique. Chaque ra'
||'pport interactif peuvent donc être personnalisés davantage et les résultats peuvent être visionnés, téléchargés et la définition du rapport peut être sauvegardé pour une utilisation ultérieure.<p/>Un rapport interactif peut est personnalisé à trois n'
||'iveaux: la barre de recherche, le menu d''action et l''entête des menus.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566537631360235931)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'Le menu d''actions est utilisé pour personnaliser l''affchage de votre rapport interactif.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566540817219235933)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Les aggrégations sont des calculs mathématiques applicables sur une colonne. Les aggrégations sont affichés après chaque bri et à la fin du rapport dans les colonnes sur lesquelles ils sont définis.',
'<p/>',
'<ul><li><b>Aggréger</b> permet de sélectionner et d''éditer une aggrégation définie précédemment.</li>',
'<li><b>Fonction</b> est utilisé pour choisir la fonction qui sera appliquée (ex.: Somme, Minimum).</li>',
'<li><b>Colonne</b> est utilisé pour choisir la colonne sur laquelle on appliquera la fonction mathématique. Seulement les colonnes numériques seront affichées.</li></ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566544019047235935)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Vous pouvez inclure un graphique pour chaque rapport interactif. Une fois défini, vous pouvez basculer entre la vue du graphique et celle du rapport en utilisant les liens sous la barre de recherche.',
'<p/>',
'<ul><li><b>Type de graphique</b> identifie le type de graphique à inclure. Choisir entre barres horizontales, barres verticales, tarte ou lignes.</li>',
'<li><b>Libellé</b> identifie la colonne utilisée pour le libellé.</li>',
'<li><b>Titre (axe des X)</b> identifie le titre affiché sur l''axe associé à la colonne sélectionnée pour le Libellé. Non disponible pour le graphique en tarte.</li>',
'<li><b>Valeur</b> identifie la colonne utilisée pour la valeur.</li>',
'<li><b>Titre (axe des Y)</b> identifie le titre affiché sur l''axe associé à la colonne sélectionnée pour la Valeur. Non disponible pour le graphique en tarte.</li>',
'<li><b>Fonction</b> est une fonction facultative pouvant être appliquée sur la colonne sélectionnées pour la Valeur.</li></ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566547235644235937)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Lorsqu''on clique sur un entête de colonne, un menu d''entête s''affiche.',
'<p/>',
'<ul><li><b>Icône de tri ascendant</b> trie le rapport par cette colonne en ordre ascendant.</li>',
'<li><b>Icône de tri descendant</b> trie le rapport par cette colonne en ordre descendant.</li>',
'<li><b>Cacher colonne</b> cache la colonne.</li>',
'<li><b>Regroupement</b> crée un bri sur la colonne.</li>',
'<li><b>Aide</b> affiche l''aide à propose de la colonne.</li>',
'<li><b>Zone de texte</b> est utilisé pour saisir un critère recherche. Lorsqu''on saisi une valeur, la liste de valeurs au bas du menu va être réduite. Vous pouvez ensuite sélectionner une valeur dans le bas et cette valeur créera un filtre en utilisa'
||'nt ''='' (ex.: colonne = ''ABC''). Alternativement, vous pouvez cliquer sur l''icône de la lampe de poche et la valeur entrée créera un ''LIKE'' (ex.: colonne LIKE ''%ABC%'').',
'<li><b>Liste de valeurs uniques</b> contient les 500 premières valeurs uniques qui correspondent aux filtres. Si la colonne est une date, une liste de dates sera affichée. Vous pouvez sélectionner une valeur, un filtre sera créé en utilisant ''='' (ex.'
||': colonne = ''ABC'').</li></ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566550414615235939)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Utilisé pour créer un regroupement sur une ou plusieurs colonnes. On sort les colonnes du rapport interactif et on les affiche comme des colonnes de bri.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566553621712235941)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'fr-ca'
,p_message_text=>'Permet de télécharger le jeu de données courant. Les types de fichiers disponibles diffèrent selon votre installation. Les différents types sont CSV, XLS, PDF et RTF.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566556821060235942)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Sert à ajouter ou modifier un énoncé WHERE pour la requête. D''abord, choisir une colonne (il n''est pas nécessaire qu''elle soit affichée), choisir parmi la liste des opérateurs Oracle (=, !=, not in, between), saisir une expression pour la comparaison'
||'. L''expression est sensible à la casse et vous pouvez utiliser % comme caractère de remplacement (ex.: NOM_PROVINCE like Q%).'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566560019923235944)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>'Exécute une requête de « retour en arrière » permettant de voir les données telles qu''elles étaient dans le passé à un moment donné. Le « retour en arrière » par défaut est de 3 heures (ou 180 minutes) mais ce chiffre diffère selon la base de données'
||'.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566563220960235948)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'La mise en évidence définit un filtre. Les rangées qui correspondent au filtre sont mises en évidence en utilisant les caractéristiques associées au filtre.',
'<p/>',
'<ul><li><b>Nom</b> est utilisé seulement pour l''affichage.</li>',
'<li><b>Séquence</b> identifie l''ordre dans lequel sera évalué les règles.</li>',
'<li><b>Actif</b> identifie si la règle est activée ou désactivée.</li>',
'<li><b>Type de mise en évidence</b> identifie si ce sera la rangée ou la cellule qui sera mise en évidence.</li>',
'<li><b>Couleur d''arrière plan</b> est la couleur utilisée pour mettre en évidence une zone.</li>',
'<li><b>Couleur de texte</b> est la couleur utilisée pour mettre en évidence le texte d''une zone.</li>',
'<li><b>Conditions de la mise en évidence</b> définit les conditions du filtre.</li></ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566566444118235949)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Si vous avez personnalisé votre rapport interactif, les paramètres seront affichés en-dessous la barre de recherche et au-dessus du rapport. Si vous avez sauvegardés des rapports personnalisés, ils s''afficheront sous la forme d''onglets. Vous pouvez a'
||'ccéder aux vues alternatives en cliquant sur les onglets. Les paramètres du rapport seront affichés sous les onglets. Cette zone peut être ouverte ou fermée en utilisant l''icône à gauche.',
'<p/>',
'Pour chaque paramètre du rapport, vous pouvez:',
'<ul><li><b>Éditer</b> en cliquant le nom.</li>',
'<li><b>Désactiver/Activer</b> en cochant la boîte d''activation et de désactivation. On utilise cette option pour activer/désactiver temporairement un paramètre.</li>',
'<li><b>Supprimer</b> en cliquant l''icône de suppression. On utilise cette option pour supprimer un paramètre de façon permanente.</li></ul>',
'<p/>',
'Si vous avez créé un graphique, vous pouvez basculter entre le rapport et le graphique en utilisant les liens à droite. Si vous êtes entrain de visionner un graphique, vous pouvez utiliser le lien d''édition pour éditer les paramètres du graphique.'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566569621535235951)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'fr-ca'
,p_message_text=>'Réinitialiser le rapport avec les paramètres initiaux, supprimer toutes les personnalisations que vous avez fait.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566572824237235958)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Sauvegarde le rapport personnalisé pour une utilisation utltérieure. Vous devez fournir un nom et une description optionnelle.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566576034164235959)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Au dessus de chaque rapport, il y a une région de recherche. Cette région contient ces fonctionnalités:',
'<p/>',
'<ul><li><b>L''icône de colonnes</b> permet de choisir sur quelle(s) colonne(s) rechercher.</li>',
'<li><b>Zone de texte</b> permet de faire une recherche non sensible sur la casse (pas besoin d''utiliser des caractères de remplacement).</li>',
'<li><b>Rows</b> selects the number of records to display per page.</li>',
'<li><b>Bouton [Rechercher]</b> exécute la recherche.</li>',
'<li><b>L''icône du menu des actions</b> affiche le menu des actions.</li></ul>',
'<p/>',
'Veuillez noter que ce ne sont pas toutes les fonctionnalités qui sont disponibles pour chaque rapport.'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566579215212235961)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Utilisé pour modifier les colonnes affichées. Les colonnes à droite sont affichées. Les colonnes à gauche sont cachés. Vous pouvez repositionner les colonnes affichées en utilisant les flèches à l''extrême droite. Les colonnes calculées sont préfixées'
||' par <b>**</b>.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566582421138235965)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Utilisé pour changer l''ordonnancement des colonnes (ascandant et descandat). Vous pouvez aussi spécifier commet gérer les valeurs nulles (utilise le paramètre par défaut, toujours afficher en premier ou en dernier). Une icône affichera le type de tri'
||' à la droite de l''entête d''une colonne.'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566585612645235967)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Cacher colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566588839019235968)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Mettre en évidence'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566592030635235970)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'fr-ca'
,p_message_text=>'Condition de mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566595221554235972)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566598415761235974)
,p_name=>'APEXIR_HIGHLIGHT_WHEN'
,p_message_language=>'fr-ca'
,p_message_text=>'Mis en évidence quand'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566601621339235978)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide pour le rapport interactif'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566604823210235981)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>'Invalide'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566608025497235983)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Expression de calcul invalide'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566611232457235986)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'fr-ca'
,p_message_text=>'Touche du clavier numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566614333503235989)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Libellé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566616925090235990)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Titre (axe des X)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566620136703235992)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Déplacer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566623329863235995)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Déplacer tout'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566626530605235997)
,p_name=>'APEXIR_NAME'
,p_message_language=>'fr-ca'
,p_message_text=>'Nom'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566629736682236002)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Nouvelle aggrégation'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566632927163236008)
,p_name=>'APEXIR_NEW_CATEGORY'
,p_message_language=>'fr-ca'
,p_message_text=>'- Nouvelle catégorie -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566636141664236010)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Nouveau calcul'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566639334302236013)
,p_name=>'APEXIR_NO'
,p_message_language=>'fr-ca'
,p_message_text=>'Non'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566642526651236017)
,p_name=>'APEXIR_NONE'
,p_message_language=>'fr-ca'
,p_message_text=>'- Aucun -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566645735430236022)
,p_name=>'APEXIR_NO_AGGREGATION_DEFINED'
,p_message_language=>'fr-ca'
,p_message_text=>'Aucune aggrégation définie'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566648937039236027)
,p_name=>'APEXIR_NO_COMPUTATION_DEFINED'
,p_message_language=>'fr-ca'
,p_message_text=>'Aucun calcul défini'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566652134505236033)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur nulle toujours au début'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566655330221236038)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur nulle toujours à la fin'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566658535544236040)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier valeur nulle'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566661718953236043)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'fr-ca'
,p_message_text=>'Le moment du retour en arrière doit être numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566664922150236046)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'fr-ca'
,p_message_text=>'La séquence doit être numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566668118103236048)
,p_name=>'APEXIR_NUM_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangées'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566671335336236051)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Opérateur'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566674524169236053)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'fr-ca'
,p_message_text=>'Autre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566677721967236055)
,p_name=>'APEXIR_RED'
,p_message_language=>'fr-ca'
,p_message_text=>'Rouge'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566680927570236058)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Enlever'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566684143662236069)
,p_name=>'APEXIR_REMOVE_AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>'Enlever toutes les aggrégations'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566687324933236073)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Enlever tout'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566690526938236074)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Enlever le regroupement'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566693731381236080)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer filtre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566696937635236084)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer Retour en arrière'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566700127285236088)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer la mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566702631071236095)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>'Paramètres d''un rapport'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566705736089236097)
,p_name=>'APEXIR_RESET'
,p_message_language=>'fr-ca'
,p_message_text=>'Réinitialiser'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566708928159236099)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>'Réinitialiser le rapport avec les paramètres initiaux.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566712138290236103)
,p_name=>'APEXIR_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangée'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566715329399236105)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangées'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566718516501236110)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangées par page'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566721727161236115)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'fr-ca'
,p_message_text=>'La rangée contient'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566724933268236116)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Appliquer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566728117977236118)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport sauvé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566731313986236131)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport sauvé = "%0"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566734514826236133)
,p_name=>'APEXIR_SAVE_AS_DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>'Sauvegardée en tant que valeur par défaut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566737721330236135)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>'La paramétrisation du rapport courant est utilisée comme valeur par défaut pour tous les utilisateurs'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566740926655236137)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Enregistrer rapport'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566744138168236139)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Barre de recherche'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566747337898236140)
,p_name=>'APEXIR_SELECT_CATEGORY'
,p_message_language=>'fr-ca'
,p_message_text=>'- Choisir catégorie -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566750512613236142)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'- Choisir une colonne -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566753720766236144)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Choisir colonnes'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566756934158236145)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>'- Choisir fonction -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566760113072236147)
,p_name=>'APEXIR_SELECT_SORT_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'- Choisir une colonne -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566763318276236148)
,p_name=>'APEXIR_SELECT_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur sélectionnée'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566766532208236150)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'fr-ca'
,p_message_text=>'Séquence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566769713628236152)
,p_name=>'APEXIR_SORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566772921908236154)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Tri ascendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566776117736236156)
,p_name=>'APEXIR_SORT_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier par colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566779328365236157)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Tri descendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566782522043236162)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'fr-ca'
,p_message_text=>'espace'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566785715919236164)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'fr-ca'
,p_message_text=>'Statut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566788924201236166)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Couleur du texte'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566792143181236172)
,p_name=>'APEXIR_TOP'
,p_message_language=>'fr-ca'
,p_message_text=>'En haut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566795340355236174)
,p_name=>'APEXIR_UP'
,p_message_language=>'fr-ca'
,p_message_text=>'Monter'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566798513177236176)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566801719134236179)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Titre (axe des Y)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566804913319236182)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566808117771236185)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir tableau'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566811332777236186)
,p_name=>'APEXIR_VIEW_REPORT '
,p_message_language=>'fr-ca'
,p_message_text=>'Voir tableau'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566814517791236188)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Vue générale'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566817240307236189)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'fr-ca'
,p_message_text=>'Jaune'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566820235596236191)
,p_name=>'APEXIR_YES'
,p_message_language=>'fr-ca'
,p_message_text=>'Oui'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566823429304236193)
,p_name=>'APEXLIB_ITEM_INVALID_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Le format de la valeur du champ <span class="t18Requiredlabel">%label</span> est invalide ("%0" (ex. %1))'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566826636453236194)
,p_name=>'APEXLIB_ITEM_INVALID_FORMAT_INLINE'
,p_message_language=>'fr-ca'
,p_message_text=>'Format "%0"<br>ex. %1'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566829830090236196)
,p_name=>'APEXLIB_ITEM_LESS_OR_EQUAL'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur du champ <span class="t18Requiredlabel">%label</span> doit être inférieure ou égale à la valeur "<b>%0</b>"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566833045086236198)
,p_name=>'APEXLIB_ITEM_LESS_OR_EQUAL_INLINE'
,p_message_language=>'fr-ca'
,p_message_text=>'Doit être inférieure ou<br/>égale à "<b>%0</b>"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566836223901236199)
,p_name=>'APEXLIB_ITEM_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur du champ <span class="t18Requiredlabel">%label</span> est obligatoire'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566839426888236201)
,p_name=>'APEXLIB_ITEM_REQUIRED_INLINE'
,p_message_language=>'fr-ca'
,p_message_text=>'est obligatoire'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566842620708236202)
,p_name=>'APEXLIB_TABFORM_COLUMN_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'%label est obligatoire'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566845831288236204)
,p_name=>'APEXLIB_TABFORM_GREATER_OR_EQUAL'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur du champ %label doit être supérieure ou égale à la valeur "<b>%0</b>"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566849038737236206)
,p_name=>'APEXLIB_TABFORM_INVALID_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Le format de la valeur du champ <span class="t18Requiredlabel">%label</span> est invalide ("%0" (ex. %1))'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566852240191236208)
,p_name=>'APEXLIB_TABFORM_LESS_OR_EQUAL'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur du champ <span class="t18Requiredlabel">%label</span> doit être inférieure ou égale à la valeur "<b>%0</b>"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566855418456236209)
,p_name=>'APEXLIB_TABFORM_ROW_PREFIX'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangée %0:'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566858613042236211)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'<b>Il s''est produit une erreur :</b>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566861831467236213)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'<b>Il s''est produit %0 erreurs :</b>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566865030179236214)
,p_name=>'FORM_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 de %1'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566868230655236217)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'fr-ca'
,p_message_text=>'La plage de données est invalide.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566871442981236219)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566874626308236220)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'fr-ca'
,p_message_text=>'Précédent'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566877817228236222)
,p_name=>'RESET'
,p_message_language=>'fr-ca'
,p_message_text=>'Réinitialiser'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566881032880236225)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'minutes.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566884243689236227)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier par cette colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566887415732236230)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangée(s) %0 - %1 de plus que %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566890622737236232)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangée(s) %0 - %1 de %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566893834500236234)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 - %1 de %2'
);
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(80435215501784314)
,p_shortcut_name=>'AFW_13_LISTE_NAVGT'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'         vva_optio_liste_navgt varchar2 (32767)',
'                           default afw_13_page_pkg.genr_elemn_liste_navgt;',
'      begin',
'          -- Ne pas generer si la liste est vide',
'         -- Exclure la page de connexion',
'         if     vva_optio_liste_navgt is not null',
'            and afw_13_page_pkg.obten_page_sesn !=',
'                   afw_11_aplic_pkg.obten_page_conxn',
'         then',
'            return vva_optio_liste_navgt;',
'         end if;',
'end;'))
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(478688996304369024)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'return afw_07_util_pkg.obten_mesg_suprs();'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(480996181622997195)
,p_shortcut_name=>'AFW_13_OBTEN_LIBL'
,p_shortcut_type=>'FUNCTION_BODY'
,p_error_text=>'Erreur'
,p_shortcut=>'return afw_13_page_item_pkg.obten_tradc_libl(#CURRENT_ITEM_ID#);'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(486923871814711709)
,p_shortcut_name=>'AFW_19_OBTEN_TITRE_ATRIB'
,p_shortcut_type=>'FUNCTION_BODY'
,p_error_text=>'Erreur'
,p_shortcut=>'return afw_19_fonct_pkg.obten_titre_atrib(afw_07_util_pkg.nv(''P1040_SEQNC''),#CURRENT_ITEM_ID#);'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(3710800025862497)
,p_name=>'AFW - 21 - Authentification Utilisateur (12)'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTHE_12_UTILS'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&APP_ID.:101'
,p_logout_url=>'f?p=&APP_ID.:101'
,p_cookie_name=>'AFW'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_reference_id=>3635215628232115
,p_comments=>'Authentification AFW'
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(480209600270316680)
,p_name=>'AFW - 21 - Authentification Utilisateur (11)'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTHE_11_UTILS'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&APP_ID.:101'
,p_logout_url=>'f?p=&APP_ID.:101'
,p_cookie_name=>'AFW'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'Authentification AFW'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_favr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(43843344584495371)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_FAVR'
,p_display_name=>'AFW - 21 - Favoris'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_FAVR'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_favr'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_favr'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43855321181174704)
,p_plugin_id=>wwv_flow_api.id(43843344584495371)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Classe CSS (Ajout favoris)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'icon-star'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43857142519180029)
,p_plugin_id=>wwv_flow_api.id(43843344584495371)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Texte (Ajout favoris)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Supprimer de vos favoris'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43857837343182395)
,p_plugin_id=>wwv_flow_api.id(43843344584495371)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Classe CSS (Supprimer favoris)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'icon-star-empty'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43858432814184501)
,p_plugin_id=>wwv_flow_api.id(43843344584495371)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Texte (Suppression favoris)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Ajouter aux favoris'
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/item_type/io_afw_21_bascl_favr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(45343220017806213)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'IO_AFW_21_BASCL_FAVR'
,p_display_name=>'AFW - 21 - Basculer Favoris'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','IO_AFW_21_BASCL_FAVR'),'')
,p_render_function=>'afw_21_item_pkg.genr_bascl_favr'
,p_ajax_function=>'afw_21_item_pkg.ajax_bascl_favr'
,p_standard_attributes=>'VISIBLE'
,p_substitute_attributes=>true
,p_reference_id=>44505019410159859
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45919130700767589)
,p_plugin_id=>wwv_flow_api.id(45343220017806213)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Classe CSS (Voir favoris)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45919522484767589)
,p_plugin_id=>wwv_flow_api.id(45343220017806213)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Texte (Voir favoris)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Show everything'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45919928753767589)
,p_plugin_id=>wwv_flow_api.id(45343220017806213)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Classe CSS (Voir tous)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45920340535767590)
,p_plugin_id=>wwv_flow_api.id(45343220017806213)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Texte (Voir tous)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Show favorites'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45920726847767590)
,p_plugin_id=>wwv_flow_api.id(45343220017806213)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item Toggle'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_default_value=>'PX_TOGL_FAVRT'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45921126005767590)
,p_plugin_id=>wwv_flow_api.id(45343220017806213)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Gestion filtre'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45921542436767591)
,p_plugin_id=>wwv_flow_api.id(45343220017806213)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Item contenant filtre'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_default_value=>'PX_FILTR_FAVRT'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(45921126005767590)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45921946976767591)
,p_plugin_id=>wwv_flow_api.id(45343220017806213)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Filtre (SQL)'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_default_value=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'exists (select 1 ',
'          from vd_afw_12_favr f ',
'         where f.ref_struc_aplic_formt = :A_AFW_04_CONTX ',
'           and f.ref_seqnc_struc_aplic = [PARENT_ALIAS].[SEQNC])'))
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(45921126005767590)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Replace:',
' [PARENT_ALIAS] by alias used in parent SQL;',
' [SEQNC] by primary key stocked in apexframework favorite table. (Concept seqnc)'))
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(45923634676767593)
,p_plugin_id=>wwv_flow_api.id(45343220017806213)
,p_name=>'favr_togl'
,p_display_name=>'after Toggle'
);
end;
/
prompt --application/shared_components/plugins/item_type/io_afw_21_favr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(67343448826295932)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'IO_AFW_21_FAVR'
,p_display_name=>'AFW - 21 - Favoris'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','IO_AFW_21_FAVR'),'')
,p_render_function=>'afw_21_item_pkg.genr_favr'
,p_ajax_function=>'afw_21_item_pkg.ajax_favr'
,p_standard_attributes=>'VISIBLE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'	Based on Dynamic Action configuration (Icon + title)</p>',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(67343740847299585)
,p_plugin_id=>wwv_flow_api.id(67343448826295932)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item structure applicative (code)'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_default_value=>'A_AFW_04_CONTX'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(67344058087306816)
,p_plugin_id=>wwv_flow_api.id(67343448826295932)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Item séquence (Concept)'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_default_value=>'A_AFW_04_SEQNC_CONTX'
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_navgt_enreg
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(81196430746244314)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_NAVGT_ENREG'
,p_display_name=>'AFW - 21 - Navigation par enregistrement'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_NAVGT_ENREG'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_afw_21_navgt_enreg'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_afw_21_navgt_enreg'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_afich_dialg_ifram
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(102362639868518135)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_AFICH_DIALG_IFRAM'
,p_display_name=>'AFW - 21 - Afficher dialogue (iFrame)'
,p_category=>'NOTIFICATION'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_AFICH_DIALG_IFRAM'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_afich_dialg_ifram'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_afich_dialg_ifram'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102445514328518279)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Titre'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>30
,p_max_length=>50
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102440737887518272)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>105
,p_prompt=>'SCPI'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677238174971215)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102445928528518280)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Largeur'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'640'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102447936945518283)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Hauteur'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'480'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102446344573518281)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Classe CSS'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_max_length=>100
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102440322926518271)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>130
,p_prompt=>'SAPC'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677238174971215)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(189677238174971215)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>11
,p_prompt=>'Type génération URL'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'PAGE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(189677736233972130)
,p_plugin_attribute_id=>wwv_flow_api.id(189677238174971215)
,p_display_sequence=>10
,p_display_value=>'Items'
,p_return_value=>'PAGE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(189678334076973092)
,p_plugin_attribute_id=>wwv_flow_api.id(189677238174971215)
,p_display_sequence=>20
,p_display_value=>'URL'
,p_return_value=>'URL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(189679318117980529)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>12
,p_prompt=>'Item contenant URL'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677238174971215)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'URL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102444340012518278)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Définir élément SSPC'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677238174971215)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102444722366518278)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Définir élément SSPI'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677238174971215)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102445134592518279)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Item clé étrangère'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102439537398518270)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>18
,p_prompt=>'Application'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>false
,p_default_value=>'afw_11_prodt_pkg.obten_numr_apex_prodt'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677238174971215)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102439915057518270)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>19
,p_prompt=>'Page'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677238174971215)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102393834284518195)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogbeforeclose'
,p_display_name=>'beforeClose'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102394239467518195)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogclose'
,p_display_name=>'close'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102394638136518196)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogclose_actio_dynmq'
,p_display_name=>'close Dynamic Action Plugin'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102395029376518196)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogclose_procs'
,p_display_name=>'close Process Plugin'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102395421128518197)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogdrag'
,p_display_name=>'drag'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102395836908518197)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogdragstart'
,p_display_name=>'dragStart'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102396220952518198)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogdragstop'
,p_display_name=>'dragStop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102396642180518198)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogfocus'
,p_display_name=>'focus'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102397034100518199)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogopen'
,p_display_name=>'open'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102397428079518199)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogresize'
,p_display_name=>'resize'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102397818814518200)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogresizestart'
,p_display_name=>'resizeStart'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102398226217518201)
,p_plugin_id=>wwv_flow_api.id(102362639868518135)
,p_name=>'dialogresizestop'
,p_display_name=>'resizeStop'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_initl_comps
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(160149743640076434)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_INITL_COMPS'
,p_display_name=>'AFW - 21 - Initialisation composants'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_INITL_COMPS'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_initl_comps'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/item_type/afw_21_item_choix_aprob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(198460641475634227)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'AFW_21_ITEM_CHOIX_APROB'
,p_display_name=>'AFW - 21 - Item choix approbation'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','AFW_21_ITEM_CHOIX_APROB'),'')
,p_render_function=>'afw_21_item_pkg.genr_item_choix_aprob'
,p_ajax_function=>'afw_21_item_pkg.ajax_item_choix_aprob'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:READONLY:ESCAPE_OUTPUT:SOURCE:ELEMENT:WIDTH:HEIGHT'
,p_substitute_attributes=>true
,p_reference_id=>198460944245634992
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198463724378513745)
,p_plugin_id=>wwv_flow_api.id(198460641475634227)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Concept (Code)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198464021574515036)
,p_plugin_id=>wwv_flow_api.id(198460641475634227)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Concept (Seqnc)'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198464348088518002)
,p_plugin_id=>wwv_flow_api.id(198460641475634227)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'CSS Classes on element'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198612538674953752)
,p_plugin_id=>wwv_flow_api.id(198460641475634227)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Largeur'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198613037811954138)
,p_plugin_id=>wwv_flow_api.id(198460641475634227)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Hauteur'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198641124457019099)
,p_plugin_id=>wwv_flow_api.id(198460641475634227)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Alignement'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'G'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(198642118850021670)
,p_plugin_attribute_id=>wwv_flow_api.id(198641124457019099)
,p_display_sequence=>1
,p_display_value=>'Gauche'
,p_return_value=>'G'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(198641620144021153)
,p_plugin_attribute_id=>wwv_flow_api.id(198641124457019099)
,p_display_sequence=>10
,p_display_value=>'Droite'
,p_return_value=>'D'
);
end;
/
prompt --application/shared_components/plugins/item_type/io_afw_21_selct_2
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(206244687120556560)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'IO_AFW_21_SELCT_2'
,p_display_name=>'AFW - 21 - select2'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','IO_AFW_21_SELCT_2'),'')
,p_render_function=>'afw_21_item_pkg.genr_selct_2'
,p_ajax_function=>'afw_21_item_pkg.ajax_selct_2'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:READONLY:ESCAPE_OUTPUT:QUICKPICK:SOURCE:ELEMENT:WIDTH:ELEMENT_OPTION:PLACEHOLDER:ENCRYPT:LOV:LOV_REQUIRED:LOV_DISPLAY_NULL:CASCADING_LOV'
,p_sql_min_column_count=>2
,p_sql_max_column_count=>6
,p_sql_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select display, return, [group, html_selection_format, html_result_format, search_string]',
'  from dual'))
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(51372498450588325)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Include CSS'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206247899110657375)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'SINGL_VALUE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206248192209660573)
,p_plugin_attribute_id=>wwv_flow_api.id(206247899110657375)
,p_display_sequence=>10
,p_display_value=>'Single-value'
,p_return_value=>'SINGL_VALUE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206248589621661786)
,p_plugin_attribute_id=>wwv_flow_api.id(206247899110657375)
,p_display_sequence=>20
,p_display_value=>'Mutliple-value'
,p_return_value=>'MULTP_VALUE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206347113070473485)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Allow clear'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206247899110657375)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SINGL_VALUE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206325514353243910)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Loading Remote Data'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206325892355254082)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Minimum number of results'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'10'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206325514353243910)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'The minimum number of results that must be initially (after opening the dropdown for the first time) populated in order to keep the search field. This is useful for cases where local data is used with just a few results, in which case the search box '
||'is not very useful and wastes screen space.',
'',
'The option can be set to a negative value to permanently hide the search field.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206333885797895169)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Maximum number of results'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'100'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206326500969265323)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Maximum number of items that can be selected'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'0'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206247899110657375)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'MULTP_VALUE'
,p_help_text=>'The maximum number of items that can be selected in a multi-select control. If this number is less than 1 selection is not limited.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206327396644282509)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Number of characters necessary to start a search'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206327694056283708)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Maximum number of characters that can be entered for an input.'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206328014962289204)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Separator'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>':'
,p_is_translatable=>false
,p_help_text=>'Separator character or string used to delimit ids in value attribute of the multi-valued selects.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206334485987925455)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>35
,p_prompt=>'Search type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'LIKE_IGNORE'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206325514353243910)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'CONTAINS_CASE   -- uses INSTR',
'CONTAINS_IGNORE -- uses INSTR with UPPER',
'EXACT_CASE      -- uses LIKE value%',
'EXACT_IGNORE    -- uses LIKE VALUE% with UPPER',
'LIKE_CASE       -- uses LIKE %value%',
'LIKE_IGNORE     -- uses LIKE %VALUE% with UPPER',
'LOOKUP          -- uses = value'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206334809051930034)
,p_plugin_attribute_id=>wwv_flow_api.id(206334485987925455)
,p_display_sequence=>10
,p_display_value=>'Contains case'
,p_return_value=>'CONTAINS_CASE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206335303875932435)
,p_plugin_attribute_id=>wwv_flow_api.id(206334485987925455)
,p_display_sequence=>20
,p_display_value=>'Contains ignore'
,p_return_value=>'CONTAINS_IGNORE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206335701718933385)
,p_plugin_attribute_id=>wwv_flow_api.id(206334485987925455)
,p_display_sequence=>30
,p_display_value=>'Exact case'
,p_return_value=>'EXACT_CASE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206336099562934405)
,p_plugin_attribute_id=>wwv_flow_api.id(206334485987925455)
,p_display_sequence=>40
,p_display_value=>'Exact ignore'
,p_return_value=>'EXACT_IGNORE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206336697405935423)
,p_plugin_attribute_id=>wwv_flow_api.id(206334485987925455)
,p_display_sequence=>50
,p_display_value=>'Like case'
,p_return_value=>'LIKE_CASE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206337094817936560)
,p_plugin_attribute_id=>wwv_flow_api.id(206334485987925455)
,p_display_sequence=>60
,p_display_value=>'Like ignore'
,p_return_value=>'LIKE_IGNORE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206337592014937869)
,p_plugin_attribute_id=>wwv_flow_api.id(206334485987925455)
,p_display_sequence=>70
,p_display_value=>'Lookup'
,p_return_value=>'LOOKUP'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206353216340227707)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'initSelection Query'
,p_attribute_type=>'SQL'
,p_is_required=>false
,p_default_value=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'    from vd_afw_13_page',
'order by 1'))
,p_sql_min_column_count=>2
,p_sql_max_column_count=>4
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(35903325097616612)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Width'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'100%'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(36602431309966954)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'Allow insertion'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(36592042026235405)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Search column'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'1'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(36592539870236478)
,p_plugin_attribute_id=>wwv_flow_api.id(36592042026235405)
,p_display_sequence=>10
,p_display_value=>'Display column (1)'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(36592936419238057)
,p_plugin_attribute_id=>wwv_flow_api.id(36592042026235405)
,p_display_sequence=>20
,p_display_value=>'Custom search column (6)'
,p_return_value=>'6'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206253114570691278)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_name=>'selct2_blur'
,p_display_name=>'blur'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206250290530691276)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_name=>'selct2_close'
,p_display_name=>'close'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206252712826691278)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_name=>'selct2_focus'
,p_display_name=>'focus'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206250705284691277)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_name=>'selct2_highlight'
,p_display_name=>'highlight'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206252316243691278)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_name=>'selct2_loaded'
,p_display_name=>'loaded'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206249904662691276)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_name=>'selct2_open'
,p_display_name=>'open'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206249591537691275)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_name=>'selct2_opening'
,p_display_name=>'opening'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206251915241691277)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_name=>'selct2_removed'
,p_display_name=>'removed'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206251511504691277)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_name=>'selct2_removing'
,p_display_name=>'removing'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206251093674691277)
,p_plugin_id=>wwv_flow_api.id(206244687120556560)
,p_name=>'selct2_selecting'
,p_display_name=>'selecting'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_confr_sauvg
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(447210858989872170)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_CONFR_SAUVG'
,p_display_name=>'AFW - 21 - Confirmer la sauvegarde (Initialisation)'
,p_category=>'NOTIFICATION'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_CONFR_SAUVG'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_plugn_confr_sauvg'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_plugn_confr_sauvg'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(447211059729900770)
,p_plugin_id=>wwv_flow_api.id(447210858989872170)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Message de confirmation'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_default_value=>'Des modifications au formulaire ne sont pas sauvegardées.'
,p_is_translatable=>true
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_depsm_tablr_form
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(447234765793586793)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_DEPSM_TABLR_FORM'
,p_display_name=>'AFW - 21 - Dépassement Tabular Form'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_DEPSM_TABLR_FORM'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_afw_18_depsm_tablr_form'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_afw_18_depsm_tablr_form'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_navgt_tablr_form
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(447236575975375140)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_NAVGT_TABLR_FORM'
,p_display_name=>'AFW - 21 - Navigation Tabular Form'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_NAVGT_TABLR_FORM'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_plugn_navgt_tablr_form'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_gestn_tablr_form
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(447237269012420451)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_GESTN_TABLR_FORM'
,p_display_name=>'AFW - 21 - Gestion Tabular Form'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_GESTN_TABLR_FORM'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_plugn_gestn_tablr_form'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/item_type/io_afw_21_item_popup_arbor
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(448065359416100589)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'IO_AFW_21_ITEM_POPUP_ARBOR'
,p_display_name=>'AFW - 21 - Popup LOV Arborescence'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','IO_AFW_21_ITEM_POPUP_ARBOR'),'')
,p_render_function=>'afw_21_item_pkg.genr_plugn_item_popup_arbor'
,p_standard_attributes=>'VISIBLE:READONLY:SOURCE:ELEMENT:WIDTH:ELEMENT_OPTION:LOV:LOV_DISPLAY_NULL'
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(448065765219121185)
,p_plugin_id=>wwv_flow_api.id(448065359416100589)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Librairie JavaScript du plugin'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
,p_display_length=>60
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'URL',
'',
'ex.: &A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(448066269028122310)
,p_plugin_id=>wwv_flow_api.id(448065359416100589)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Fichier CSS du plugin'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
,p_display_length=>60
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'URL',
'',
'ex.: &A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(448068761157176765)
,p_plugin_id=>wwv_flow_api.id(448065359416100589)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Logo ouvrir popup'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'/i/lov_16x16.gif'
,p_display_length=>60
,p_is_translatable=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'URL',
'',
'ex.: /i/lov_16x16.gif'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(448069281589182729)
,p_plugin_id=>wwv_flow_api.id(448065359416100589)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Largeur du popup'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'600'
,p_display_length=>10
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(448069757132185046)
,p_plugin_id=>wwv_flow_api.id(448065359416100589)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Hauteur du popup'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'600'
,p_display_length=>10
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_arbre_ajax
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(448137563354092448)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_REGN_ARBRE_AJAX'
,p_display_name=>'AFW - 21 - Arborescence'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_REGN_ARBRE_AJAX'),'')
,p_render_function=>'afw_21_regn_pkg.genr_plugn_regn_arbre'
,p_ajax_function=>'afw_21_regn_pkg.ajax_plugn_regn_arbre'
,p_standard_attributes=>'SOURCE_PLAIN'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(448137881493107190)
,p_plugin_id=>wwv_flow_api.id(448137563354092448)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item qui contient le ID du noeud'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(448344664689196626)
,p_plugin_id=>wwv_flow_api.id(448137563354092448)
,p_name=>'close_node.jstree'
,p_display_name=>'Fermer un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(448346074432227803)
,p_plugin_id=>wwv_flow_api.id(448137563354092448)
,p_name=>'create_node.jstree'
,p_display_name=>'Ajouter un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(448345467375216301)
,p_plugin_id=>wwv_flow_api.id(448137563354092448)
,p_name=>'delete_node.jstree'
,p_display_name=>'Supprimer un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(448345771531217532)
,p_plugin_id=>wwv_flow_api.id(448137563354092448)
,p_name=>'move_node.jstree'
,p_display_name=>'Déplacer un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(448342650219097801)
,p_plugin_id=>wwv_flow_api.id(448137563354092448)
,p_name=>'open_node.jstree'
,p_display_name=>'Ouvrir un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(448345075771199809)
,p_plugin_id=>wwv_flow_api.id(448137563354092448)
,p_name=>'rename_node.jstree'
,p_display_name=>'Renommer un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(448364377390709789)
,p_plugin_id=>wwv_flow_api.id(448137563354092448)
,p_name=>'select_node.jstree'
,p_display_name=>'Sélectionner un noeud'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_afich_prodt_autor
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(448938861370745122)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_AFICH_PRODT_AUTOR'
,p_display_name=>'AFW - 21 - Afficher la liste des produits autorisés'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_AFICH_PRODT_AUTOR'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_afich_prodt_autor'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_afich_prodt_autor'
,p_standard_attributes=>'JQUERY_SELECTOR'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/item_type/io_afw_21_page_item_masq
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(449602095863161774)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'IO_AFW_21_PAGE_ITEM_MASQ'
,p_display_name=>'AFW - 21 - Masque pour la saisie'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','IO_AFW_21_PAGE_ITEM_MASQ'),'')
,p_render_function=>'afw_21_item_pkg.genr_plugn_item_masq'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:READONLY:ESCAPE_OUTPUT:SOURCE:ELEMENT:WIDTH'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(449618791079690316)
,p_plugin_id=>wwv_flow_api.id(449602095863161774)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Type de masque'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'PERSN'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(447603965018162615)
,p_plugin_attribute_id=>wwv_flow_api.id(449618791079690316)
,p_display_sequence=>5
,p_display_value=>'Personnalisé'
,p_return_value=>'PERSN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(449620000429693053)
,p_plugin_attribute_id=>wwv_flow_api.id(449618791079690316)
,p_display_sequence=>10
,p_display_value=>'Téléphone'
,p_return_value=>'999-999-9999'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(449620371124694052)
,p_plugin_attribute_id=>wwv_flow_api.id(449618791079690316)
,p_display_sequence=>20
,p_display_value=>'Code postal (Canada)'
,p_return_value=>'a9a 9a9'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(449620976319695557)
,p_plugin_attribute_id=>wwv_flow_api.id(449618791079690316)
,p_display_sequence=>30
,p_display_value=>'Permis de conduire'
,p_return_value=>'a9999-999999-99'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(447604755107169154)
,p_plugin_id=>wwv_flow_api.id(449602095863161774)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Masque personnalisé'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_max_length=>200
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(449618791079690316)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PERSN'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'a - Représente un caractère alphabétique (A-Z, a-z)',
'9 - Représente un caractère numérique (0-9)',
'* - Représente un caractère alphanumérique (AZ, az ,0-9)'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(447605276709184907)
,p_plugin_id=>wwv_flow_api.id(449602095863161774)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Caractère de soulignement'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'_'
,p_display_length=>1
,p_max_length=>1
,p_is_translatable=>true
,p_help_text=>'Si vous n''êtes pas satisfait avec le caractère de soulignement (''_'') comme un espace réservé, vous pouvez passer un argument optionnel.'
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_barre_rechr_ir
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(452122150503308969)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_REGN_BARRE_RECHR_IR'
,p_display_name=>'AFW - 21 - Barre recherche IR'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_REGN_BARRE_RECHR_IR'),'')
,p_render_function=>'afw_21_regn_pkg.genr_plugn_regn_barre_rechr_ir'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_acord
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(452429871729512360)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_REGN_ACORD'
,p_display_name=>'AFW - 21 - Accordion'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_REGN_ACORD'),'')
,p_render_function=>'afw_21_regn_pkg.genr_plugn_regn_acord'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(452430063549519499)
,p_plugin_id=>wwv_flow_api.id(452429871729512360)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Largeur (px)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'215'
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'1- Exemple: 215',
'2- Exemple: P1_LARGR_REGN_ACORD'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(454300181398329774)
,p_plugin_id=>wwv_flow_api.id(452429871729512360)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Largeur par défaut (px)'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'215'
,p_is_translatable=>false
,p_help_text=>'Exemple: 215'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_confr_sauvg_reintl
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(452644764412219311)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_CONFR_SAUVG_REINTL'
,p_display_name=>'AFW - 21 - Confirmer la sauvegarde (Réinitilisation)'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_CONFR_SAUVG_REINTL'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_plugn_confr_sauvg_reint'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/item_type/com_skillbuilders_sbip_password
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(453881842899658780)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM_SKILLBUILDERS_SBIP_PASSWORD'
,p_display_name=>'SkillBuilders Password'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM_SKILLBUILDERS_SBIP_PASSWORD'),'')
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'FUNCTION sbip_password_render (',
'   p_item                IN APEX_PLUGIN.T_PAGE_ITEM,',
'   p_plugin              IN APEX_PLUGIN.T_PLUGIN,',
'   p_value               IN VARCHAR2,',
'   p_is_readonly         IN BOOLEAN,',
'   p_is_printer_friendly IN BOOLEAN ',
')',
'',
'   RETURN APEX_PLUGIN.T_PAGE_ITEM_RENDER_RESULT',
'   ',
'IS',
'',
'   l_retval             APEX_PLUGIN.T_PAGE_ITEM_RENDER_RESULT;',
'   l_name               VARCHAR2(30);',
'   l_submit_on_enter    VARCHAR2(1) := NVL(p_item.attribute_01, ''Y'');',
'   l_message_icon       VARCHAR2(20) := NVL(p_item.attribute_02, ''ui-icon-alert'');',
'   l_message_text       VARCHAR2(500) := NVL(p_item.attribute_03, ''Caps Lock is enabled.'');',
'   l_message_width      PLS_INTEGER := NVL(p_item.attribute_04, 150);',
'   l_message_alignment  VARCHAR2(20) := NVL(p_item.attribute_05, ''center bottom'');',
'   l_password_alignment VARCHAR2(20) := NVL(p_item.attribute_06, ''center top'');',
'   l_offset             VARCHAR2(20) := NVL(p_item.attribute_07, ''0'');',
'   l_jqueryui_theme     VARCHAR2(30) := p_plugin.attribute_01;',
'   l_onload_code        VARCHAR2(32767);',
'   l_crlf               CHAR(2) := CHR(13)||CHR(10);',
'   ',
'BEGIN',
'',
'   IF apex_application.g_debug',
'   THEN',
'      apex_plugin_util.debug_page_item (',
'         p_plugin              => p_plugin,',
'         p_page_item           => p_item,',
'         p_value               => p_value,',
'         p_is_readonly         => p_is_readonly,',
'         p_is_printer_friendly => p_is_printer_friendly',
'      );',
'   END IF;',
'',
'   l_name := apex_plugin.get_input_name_for_page_item(FALSE);',
'',
'   IF p_is_readonly OR p_is_printer_friendly',
'   THEN',
'      NULL;--Password should not be displayed',
'   ELSE',
'      sys.htp.p(',
'            ''<input type="password" name="'' || l_name || ''" id="'' || p_item.name || ''" value="'' ',
'         || p_value || ''" size="'' || p_item.element_width || ''" maxlength="'' || p_item.element_max_length ',
'         || ''" '' || p_item.element_attributes || '' ''',
'         || CASE',
'               WHEN l_submit_on_enter = ''Y''',
'               THEN ''onkeypress="return submitEnter(this,event)"''',
'            END',
'         || ''/>''',
'      );',
'',
'      apex_javascript.add_library(',
'         p_name      => ''com_skillbuilders_sbip_password.min'',',
'         p_directory => p_plugin.file_prefix,',
'         p_version   => NULL',
'      );',
'',
'      l_onload_code := ''apex.jQuery("input#'' || p_item.name || ''").sbip_password({'' || l_crlf',
'         || ''   '' || apex_javascript.add_attribute(''warningMsgIcon'', l_message_icon) || l_crlf',
'         || ''   '' || apex_javascript.add_attribute(''warningMsgText'', l_message_text) || l_crlf',
'         || ''   '' || apex_javascript.add_attribute(''warningMsgWidth'', l_message_width) || l_crlf',
'         || ''   '' || apex_javascript.add_attribute(''warningMsgAlignment'', l_message_alignment) || l_crlf',
'         || ''   '' || apex_javascript.add_attribute(''passwordAlignment'', l_password_alignment) || l_crlf',
'         || ''   '' || apex_javascript.add_attribute(''offset'', l_offset, TRUE, FALSE) || l_crlf',
'         || ''});'';',
'         ',
'      apex_javascript.add_onload_code(',
'         p_code => l_onload_code',
'      ); ',
'      ',
'      IF l_jqueryui_theme IS NOT NULL',
'      THEN',
'         apex_css.add_file(',
'            p_name      => ''jquery-ui'',',
'            p_directory => apex_application.g_image_prefix || ''libraries/jquery-ui/1.8/themes/'' || l_jqueryui_theme || ''/'',',
'            p_version   => NULL',
'         );',
'      END IF;',
'',
'      l_retval.is_navigable := TRUE;',
'   END IF;',
'        ',
'   RETURN l_retval;',
'    ',
'END sbip_password_render;'))
,p_render_function=>'sbip_password_render'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:ELEMENT:WIDTH:HEIGHT:ENCRYPT'
,p_substitute_attributes=>true
,p_reference_id=>9118448132853440662
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'1'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(453882314287659997)
,p_plugin_id=>wwv_flow_api.id(453881842899658780)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Theme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Use this setting to control the basic color scheme of the warning message. Other aspects of the warning message, including the icon, text, width, and placement on the page, are configured via components settings.</p>',
'',
'<p style="font-style:italic">Tip: The Theme setting adds a link to a CSS file on the APEX page where the component is used. If possible, it’s best to manually add the link to the CSS file in the page template where the component is used. This can imp'
||'rove performance/caching while decreasing the likelihood of a conflict due to another plug-in linking to a different CSS file. This setting can then be disabled by selecting the null value (- Select Theme-).</p>',
'',
'<p style="font-style:italic">Tip: The plug-in is skinned using the jQuery UI CSS Framework . To learn more or create a custom theme visit:  http://docs.jquery.com/UI/Theming and http://jqueryui.com/themeroller.  </p>',
''))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453882716462659998)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>10
,p_display_value=>'Base (APEX Default)'
,p_return_value=>'base'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453883213460659998)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>20
,p_display_value=>'Black Tie'
,p_return_value=>'black-tie'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453883721771659998)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>30
,p_display_value=>'Blitzer'
,p_return_value=>'blitzer'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453884239992659998)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>40
,p_display_value=>'Cupertino'
,p_return_value=>'cupertino'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453888241596660000)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>50
,p_display_value=>'Dark Hive'
,p_return_value=>'dark-hive'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453884734770659999)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>60
,p_display_value=>'Dot Luv'
,p_return_value=>'dot-luv'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453885235929659999)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>70
,p_display_value=>'Eggplant'
,p_return_value=>'eggplant'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453885729081659999)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>80
,p_display_value=>'Excite Bike'
,p_return_value=>'excite-bike'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453886229879659999)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>90
,p_display_value=>'Flick'
,p_return_value=>'flick'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453886741928659999)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>100
,p_display_value=>'Hot Sneaks'
,p_return_value=>'hot-sneaks'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453887240767660000)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>110
,p_display_value=>'Humanity'
,p_return_value=>'humanity'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453887733484660000)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>120
,p_display_value=>'Le Frog'
,p_return_value=>'le-frog'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453888724374660000)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>130
,p_display_value=>'Mint Choc'
,p_return_value=>'mint-choc'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453889230225660000)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>140
,p_display_value=>'Overcast'
,p_return_value=>'overcast'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453889740938660001)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>150
,p_display_value=>'Pepper Grinder'
,p_return_value=>'pepper-grinder'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453890219466660001)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>160
,p_display_value=>'Smoothness'
,p_return_value=>'smoothness'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453890733803660001)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>170
,p_display_value=>'South Street'
,p_return_value=>'south-street'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453891241773660001)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>180
,p_display_value=>'Start'
,p_return_value=>'start'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453891721919660001)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>190
,p_display_value=>'Sunny'
,p_return_value=>'sunny'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453892236235660002)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>200
,p_display_value=>'Swanky Purse'
,p_return_value=>'swanky-purse'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453892726154660002)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>210
,p_display_value=>'Trontastic'
,p_return_value=>'trontastic'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453893213315660002)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>220
,p_display_value=>'UI Darkness'
,p_return_value=>'ui-darkness'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453893727817660002)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>230
,p_display_value=>'UI Lightness'
,p_return_value=>'ui-lightness'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453894233395660003)
,p_plugin_attribute_id=>wwv_flow_api.id(453882314287659997)
,p_display_sequence=>240
,p_display_value=>'Vader'
,p_return_value=>'vader'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(453894726807660007)
,p_plugin_id=>wwv_flow_api.id(453881842899658780)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Submit when Enter pressed'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Use this setting the control whether or not the page will be submitted if the user presses the Enter button when this field has focus.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(453895129136660007)
,p_plugin_id=>wwv_flow_api.id(453881842899658780)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Warning Message Icon'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ui-icon-alert'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Use this setting to change the icon that is displayed to the left of the warning message text.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453895539108660007)
,p_plugin_attribute_id=>wwv_flow_api.id(453895129136660007)
,p_display_sequence=>10
,p_display_value=>'Alert'
,p_return_value=>'ui-icon-alert'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453896025689660007)
,p_plugin_attribute_id=>wwv_flow_api.id(453895129136660007)
,p_display_sequence=>20
,p_display_value=>'Info'
,p_return_value=>'ui-icon-info'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453896527041660008)
,p_plugin_attribute_id=>wwv_flow_api.id(453895129136660007)
,p_display_sequence=>30
,p_display_value=>'Notice'
,p_return_value=>'ui-icon-notice'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(453897019868660008)
,p_plugin_id=>wwv_flow_api.id(453881842899658780)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Warning Message Text'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Caps Lock is enabled.'
,p_display_length=>50
,p_max_length=>100
,p_is_translatable=>false
,p_help_text=>'Use this setting to change the text that is displayed to the user if the Caps Lock is on when keys are pressed in the password field.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(453897439893660008)
,p_plugin_id=>wwv_flow_api.id(453881842899658780)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Warning Message Width'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'170'
,p_display_length=>2
,p_max_length=>3
,p_is_translatable=>false
,p_help_text=>'Use this setting to set the width of the warning message in pixels. '
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(453897815122660008)
,p_plugin_id=>wwv_flow_api.id(453881842899658780)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Warning Message Alignment'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'center bottom'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Use this setting to specify which part the warning message should align with the password element.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453898216240660008)
,p_plugin_attribute_id=>wwv_flow_api.id(453897815122660008)
,p_display_sequence=>10
,p_display_value=>'Left Top'
,p_return_value=>'left top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453898737746660008)
,p_plugin_attribute_id=>wwv_flow_api.id(453897815122660008)
,p_display_sequence=>20
,p_display_value=>'Left Center'
,p_return_value=>'left center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453899243354660009)
,p_plugin_attribute_id=>wwv_flow_api.id(453897815122660008)
,p_display_sequence=>30
,p_display_value=>'Left Bottom'
,p_return_value=>'left bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453899723056660010)
,p_plugin_attribute_id=>wwv_flow_api.id(453897815122660008)
,p_display_sequence=>40
,p_display_value=>'Center Top'
,p_return_value=>'center top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453900213649660010)
,p_plugin_attribute_id=>wwv_flow_api.id(453897815122660008)
,p_display_sequence=>50
,p_display_value=>'Center Center'
,p_return_value=>'center center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453900716607660011)
,p_plugin_attribute_id=>wwv_flow_api.id(453897815122660008)
,p_display_sequence=>60
,p_display_value=>'Center Bottom'
,p_return_value=>'center bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453901238417660011)
,p_plugin_attribute_id=>wwv_flow_api.id(453897815122660008)
,p_display_sequence=>70
,p_display_value=>'Right Top'
,p_return_value=>'right top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453901742745660011)
,p_plugin_attribute_id=>wwv_flow_api.id(453897815122660008)
,p_display_sequence=>80
,p_display_value=>'Right Center'
,p_return_value=>'right center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453902212639660011)
,p_plugin_attribute_id=>wwv_flow_api.id(453897815122660008)
,p_display_sequence=>90
,p_display_value=>'Right Bottom'
,p_return_value=>'right bottom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(453902739598660011)
,p_plugin_id=>wwv_flow_api.id(453881842899658780)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Password Element Alignment'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'center top'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Use this setting to specify which part of the password element the warning message should align with.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453903140935660012)
,p_plugin_attribute_id=>wwv_flow_api.id(453902739598660011)
,p_display_sequence=>10
,p_display_value=>'Left Top'
,p_return_value=>'left top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453903625995660012)
,p_plugin_attribute_id=>wwv_flow_api.id(453902739598660011)
,p_display_sequence=>20
,p_display_value=>'Left Center'
,p_return_value=>'left center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453904128980660012)
,p_plugin_attribute_id=>wwv_flow_api.id(453902739598660011)
,p_display_sequence=>30
,p_display_value=>'Left Bottom'
,p_return_value=>'left bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453904624034660012)
,p_plugin_attribute_id=>wwv_flow_api.id(453902739598660011)
,p_display_sequence=>40
,p_display_value=>'Center Top'
,p_return_value=>'center top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453905123076660012)
,p_plugin_attribute_id=>wwv_flow_api.id(453902739598660011)
,p_display_sequence=>50
,p_display_value=>'Center Center'
,p_return_value=>'center center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453905633967660013)
,p_plugin_attribute_id=>wwv_flow_api.id(453902739598660011)
,p_display_sequence=>60
,p_display_value=>'Center Bottom'
,p_return_value=>'center bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453906134992660013)
,p_plugin_attribute_id=>wwv_flow_api.id(453902739598660011)
,p_display_sequence=>70
,p_display_value=>'Right Top'
,p_return_value=>'right top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453906642996660013)
,p_plugin_attribute_id=>wwv_flow_api.id(453902739598660011)
,p_display_sequence=>80
,p_display_value=>'Right Center'
,p_return_value=>'right center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(453907135286660013)
,p_plugin_attribute_id=>wwv_flow_api.id(453902739598660011)
,p_display_sequence=>90
,p_display_value=>'Right Bottom'
,p_return_value=>'right bottom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(453907643228660013)
,p_plugin_id=>wwv_flow_api.id(453881842899658780)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Offset'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'0'
,p_display_length=>5
,p_max_length=>7
,p_is_translatable=>false
,p_help_text=>'Use this setting to specify how many pixels the warning message should be offset from the element. Up to 2 numbers can be specified (separated by a blank space). These numbers represent the left and top offsets respectively. If only one number is spe'
||'cified then it will be used for both the top and left offsets.'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2866756E6374696F6E2861297B612E776964676574282275692E736269705F70617373776F7264222C7B6F7074696F6E733A7B7761726E696E674D736749636F6E3A6E756C6C2C7761726E696E674D7367546578743A6E756C6C2C7761726E696E674D73';
wwv_flow_api.g_varchar2_table(2) := '6757696474683A6E756C6C2C7761726E696E674D7367416C69676E6D656E743A6E756C6C2C70617373776F7264416C69676E6D656E743A6E756C6C2C6F66667365743A6E756C6C7D2C5F696E69743A66756E6374696F6E28297B76617220623D74686973';
wwv_flow_api.g_varchar2_table(3) := '3B6128622E656C656D656E74292E6B657970726573732866756E6374696F6E2863297B76617220643D537472696E672E66726F6D43686172436F646528632E7768696368293B696628642E746F55707065724361736528293D3D3D642E746F4C6F776572';
wwv_flow_api.g_varchar2_table(4) := '436173652829297B72657475726E7D69662828632E73686966744B65792626642E746F4C6F7765724361736528293D3D3D64297C7C2821632E73686966744B65792626642E746F55707065724361736528293D3D3D6429297B622E5F73686F774D657373';
wwv_flow_api.g_varchar2_table(5) := '61676528297D656C73657B622E5F686964654D65737361676528297D7D292E626C75722866756E6374696F6E28297B622E5F686964654D65737361676528297D297D2C5F73686F774D6573736167653A66756E6374696F6E28297B76617220633D746869';
wwv_flow_api.g_varchar2_table(6) := '733B76617220623B76617220643D6128632E656C656D656E74292E617474722822696422292B225F534249505F434C5F5741524E494E47223B6966282161282223222B64292E6C656E677468297B623D273C64697620636C6173733D2275692D73746174';
wwv_flow_api.g_varchar2_table(7) := '652D686967686C696768742075692D636F726E65722D616C6C22207374796C653D2277696474683A20272B632E6F7074696F6E732E7761726E696E674D736757696474682B2770783B2070616464696E673A2030707420302E37656D3B222069643D2227';
wwv_flow_api.g_varchar2_table(8) := '2B642B27223E3C7461626C653E3C74723E3C74643E5C6E2020203C7370616E20636C6173733D2275692D69636F6E20272B632E6F7074696F6E732E7761726E696E674D736749636F6E2B2722207374796C653D22666C6F61743A206C6566743B206D6172';
wwv_flow_api.g_varchar2_table(9) := '67696E2D72696768743A302E33656D3B223E3C2F7370616E3E3C2F74643E3C74643E2020203C703E272B632E6F7074696F6E732E7761726E696E674D7367546578742B223C2F703E3C2F74643E3C2F74723E3C2F7461626C653E3C2F6469763E223B6128';
wwv_flow_api.g_varchar2_table(10) := '22626F647922292E617070656E642862293B61282223222B64292E706F736974696F6E287B6F663A6128632E656C656D656E74292C6D793A632E6F7074696F6E732E7761726E696E674D7367416C69676E6D656E742C61743A632E6F7074696F6E732E70';
wwv_flow_api.g_varchar2_table(11) := '617373776F7264416C69676E6D656E742C6F66667365743A632E6F7074696F6E732E6F66667365742C636F6C6C6973696F6E3A226E6F6E65227D297D7D2C5F686964654D6573736167653A66756E6374696F6E28297B76617220623D746869733B766172';
wwv_flow_api.g_varchar2_table(12) := '20633D6128622E656C656D656E74292E617474722822696422292B225F534249505F434C5F5741524E494E47223B61282223222B63292E72656D6F766528297D7D297D2928617065782E6A5175657279293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(453908236616660014)
,p_plugin_id=>wwv_flow_api.id(453881842899658780)
,p_file_name=>'com_skillbuilders_sbip_password.min.js'
,p_mime_type=>'application/x-javascript'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_cliqr_selct_texte
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(454074277160495081)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_CLIQR_SELCT_TEXTE'
,p_display_name=>'AFW - 21 - Cliquer pour sélectionner tout le texte'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_CLIQR_SELCT_TEXTE'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_plugn_cliqr_selct_texte'
,p_standard_attributes=>'ITEM'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_afich_mesg
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(473512138338244148)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_REGN_AFICH_MESG'
,p_display_name=>'AFW - 21 - Afficher message'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_REGN_AFICH_MESG'),'')
,p_render_function=>'afw_21_regn_pkg.genr_afw_01_afich_mesg'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(473520143532245626)
,p_plugin_id=>wwv_flow_api.id(473512138338244148)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Numéro de message	'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_pile_mesg
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(473540261540250850)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_REGN_PILE_MESG'
,p_display_name=>'AFW - 21 - Pile messages'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_REGN_PILE_MESG'),'')
,p_render_function=>'afw_21_regn_pkg.genr_afw_01_err_apex'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_contx_fil_arian
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(491814744573151045)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_CONTX_FIL_ARIAN'
,p_display_name=>'AFW - 21 - Contexte fil d''ariane'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_CONTX_FIL_ARIAN'),'')
,p_execution_function=>'afw_21_procs_pkg.defnr_contx_afw_04_fil_arian'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(491838350685219078)
,p_plugin_id=>wwv_flow_api.id(491814744573151045)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Informations supplémentaires (HTML)'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_max_length=>4000
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(491842766961223771)
,p_plugin_id=>wwv_flow_api.id(491814744573151045)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Informations supplémentaires'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_aide_page
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(517440116462281854)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_AIDE_PAGE'
,p_display_name=>'AFW - 21 - Aide page'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_AIDE_PAGE'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_aide_page'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_aide_page'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(517440418586310894)
,p_plugin_id=>wwv_flow_api.id(517440116462281854)
,p_name=>'afw_21_actio_dynmq_aide_page_afich'
,p_display_name=>'Afficher'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_matrc_raprt_sql
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(520467370390923050)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_MATRC_RAPRT_SQL'
,p_display_name=>'AFW - 21 - Matrice rapport SQL'
,p_category=>'COMPONENT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_MATRC_RAPRT_SQL'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_matrc_raprt_sql'
,p_standard_attributes=>'REGION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(520473164089491904)
,p_plugin_id=>wwv_flow_api.id(520467370390923050)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Nombre de colonnes à gauche'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1'
,p_is_translatable=>false
,p_help_text=>'Nombre de dimensions verticales.<br/>Ex.: 1'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(520474076210495414)
,p_plugin_id=>wwv_flow_api.id(520467370390923050)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Surligner des lignes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Total,**Tous**'
,p_is_translatable=>true
,p_help_text=>'Permet de mettre en évidence certaines lignes (totaux).<br/>Ex.: Total,**Tous**'
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_dialg
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(529631962947912543)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_REGN_DIALG'
,p_display_name=>'AFW - 21 - Boîte de dialogue'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_REGN_DIALG'),'')
,p_render_function=>'afw_21_regn_pkg.genr_plugn_regn_dialg'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(530333946293176901)
,p_plugin_id=>wwv_flow_api.id(529631962947912543)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Modale'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(530778753382412312)
,p_plugin_id=>wwv_flow_api.id(529631962947912543)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Redimensionner'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(530779374160418280)
,p_plugin_id=>wwv_flow_api.id(529631962947912543)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Fermer avec la touche "Échap" (Esc)'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(530780077408428657)
,p_plugin_id=>wwv_flow_api.id(529631962947912543)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Classe CSS'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>60
,p_max_length=>100
,p_is_translatable=>false
,p_help_text=>'Pour cacher le bouton "Fermer" (X). Ajouter la classe: no-close.<br />Ex.: ui-afw no-close'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(530781059146830257)
,p_plugin_id=>wwv_flow_api.id(529631962947912543)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Ouvrir automatiquement'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(530781777500835579)
,p_plugin_id=>wwv_flow_api.id(529631962947912543)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Déplaçable'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(519835056570564309)
,p_plugin_id=>wwv_flow_api.id(529631962947912543)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Largeur'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'300'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(530443252812360417)
,p_plugin_id=>wwv_flow_api.id(529631962947912543)
,p_name=>'ouvridialg'
,p_display_name=>'Ouvrir le dialogue'
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_prodt_contx_a
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(543495253152949009)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_REGN_PRODT_CONTX_A'
,p_display_name=>'AFW - 21 - Produit contexte autorisé'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_REGN_PRODT_CONTX_A'),'')
,p_render_function=>'afw_21_regn_pkg.genr_prodt_contx_autor'
,p_ajax_function=>'afw_21_regn_pkg.ajax_prodt_contx_autor'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(436748269614443476)
,p_plugin_id=>wwv_flow_api.id(543495253152949009)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Changement de produits'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(596766653794658012)
,p_plugin_id=>wwv_flow_api.id(543495253152949009)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Afficher date dernière m-à-j référentiel AFW'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(629419043194676002)
,p_plugin_id=>wwv_flow_api.id(543495253152949009)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Produits affichés'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'TOUS'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(629423545272676596)
,p_plugin_attribute_id=>wwv_flow_api.id(629419043194676002)
,p_display_sequence=>10
,p_display_value=>'Tous les produits'
,p_return_value=>'TOUS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(629427848389677483)
,p_plugin_attribute_id=>wwv_flow_api.id(629419043194676002)
,p_display_sequence=>20
,p_display_value=>'Exclure les produits AFW'
,p_return_value=>'EXCLU_AFW'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(629454554969679398)
,p_plugin_attribute_id=>wwv_flow_api.id(629419043194676002)
,p_display_sequence=>30
,p_display_value=>'Seulement les produits AFW'
,p_return_value=>'SEULM_AFW'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(629258464956578251)
,p_plugin_id=>wwv_flow_api.id(543495253152949009)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Produits SAF'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(629419043194676002)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SEULM_AFW'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(629262969111579429)
,p_plugin_attribute_id=>wwv_flow_api.id(629258464956578251)
,p_display_sequence=>10
,p_display_value=>'SAFP'
,p_return_value=>'SAFP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(629267238075579927)
,p_plugin_attribute_id=>wwv_flow_api.id(629258464956578251)
,p_display_sequence=>20
,p_display_value=>'SAFD'
,p_return_value=>'SAFD'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(629271539806580432)
,p_plugin_attribute_id=>wwv_flow_api.id(629258464956578251)
,p_display_sequence=>30
,p_display_value=>'SAFU'
,p_return_value=>'SAFU'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(629275841884581026)
,p_plugin_attribute_id=>wwv_flow_api.id(629258464956578251)
,p_display_sequence=>40
,p_display_value=>'SAFS'
,p_return_value=>'SAFS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(629280145001581898)
,p_plugin_attribute_id=>wwv_flow_api.id(629258464956578251)
,p_display_sequence=>50
,p_display_value=>'SGA'
,p_return_value=>'SGA'
);
end;
/
prompt --application/shared_components/plugins/item_type/io_afw_21_champ_rechr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(595594039231502432)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'IO_AFW_21_CHAMP_RECHR'
,p_display_name=>'AFW - 21 - Champ de recherche'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','IO_AFW_21_CHAMP_RECHR'),'')
,p_render_function=>'afw_21_item_pkg.genr_champ_rechr'
,p_ajax_function=>'afw_21_item_pkg.ajax_champ_rechr'
,p_standard_attributes=>'VISIBLE:SOURCE:WIDTH'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(595898849929552854)
,p_plugin_id=>wwv_flow_api.id(595594039231502432)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Filigrane'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Recherche...'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(595903360664555888)
,p_plugin_id=>wwv_flow_api.id(595594039231502432)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Nombre critères en mémoire'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_fermr_dialg_ifram
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(615428371541336550)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_FERMR_DIALG_IFRAM'
,p_display_name=>'AFW - 21 - Fermer dialogue (iFrame)'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_FERMR_DIALG_IFRAM'),'')
,p_execution_function=>'afw_21_procs_pkg.fermr_dialg_ifram'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(697784092004965553)
,p_plugin_id=>wwv_flow_api.id(615428371541336550)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Fenêtre parent (Item clé étrangère) - Valeur de retour'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/authorization_type/io_afw_21_autor_acces_page
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(640736369566549707)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'IO_AFW_21_AUTOR_ACCES_PAGE'
,p_display_name=>'AFW - 21 - Autorisation Accès Page'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','IO_AFW_21_AUTOR_ACCES_PAGE'),'')
,p_execution_function=>'afw_21_autor_pkg.genr_autor_acces_page'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/authorization_type/io_afw_21_autor_suprs
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(640879255460602479)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'IO_AFW_21_AUTOR_SUPRS'
,p_display_name=>'AFW - 21 - Autorisation Suppression'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','IO_AFW_21_AUTOR_SUPRS'),'')
,p_execution_function=>'afw_21_autor_pkg.genr_autor_suprs'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/authorization_type/io_afw_21_autor_admin_domn
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(641146363697699415)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'IO_AFW_21_AUTOR_ADMIN_DOMN'
,p_display_name=>'AFW - 21 - Autorisation administrateur Domaine'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','IO_AFW_21_AUTOR_ADMIN_DOMN'),'')
,p_execution_function=>'afw_21_autor_pkg.genr_autor_admin_domn'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/authorization_type/io_afw_21_autor_opert_dml
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(641205272532739823)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'IO_AFW_21_AUTOR_OPERT_DML'
,p_display_name=>'AFW - 21 - Autorisation Opération DML'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','IO_AFW_21_AUTOR_OPERT_DML'),'')
,p_execution_function=>'afw_21_autor_pkg.genr_autor_opert_dml'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/authorization_type/io_afw_21_autor_modfc
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(641478770446013572)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'IO_AFW_21_AUTOR_MODFC'
,p_display_name=>'AFW - 21 - Autorisation Modification'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','IO_AFW_21_AUTOR_MODFC'),'')
,p_execution_function=>'afw_21_autor_pkg.genr_autor_modfc'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/authorization_type/io_afw_21_autor_admin_prodt
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(641719178167148222)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'IO_AFW_21_AUTOR_ADMIN_PRODT'
,p_display_name=>'AFW - 21 - Autorisation administrateur Produit'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','IO_AFW_21_AUTOR_ADMIN_PRODT'),'')
,p_execution_function=>'afw_21_autor_pkg.genr_autor_admin_prodt'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/authorization_type/io_afw_21_autor_devlp_prodt
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(641892942329175781)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'IO_AFW_21_AUTOR_DEVLP_PRODT'
,p_display_name=>'AFW - 21 - Autorisation développeur Produit'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','IO_AFW_21_AUTOR_DEVLP_PRODT'),'')
,p_execution_function=>'afw_21_autor_pkg.genr_autor_devlp_prodt'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/io_afw_21_authe_11_utils
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(646597444369030215)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'IO_AFW_21_AUTHE_11_UTILS'
,p_display_name=>'AFW - 21 - Authentification Utilisateur (AFW_11_UTILS)'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','IO_AFW_21_AUTHE_11_UTILS'),'')
,p_session_sentry_function=>'afw_21_authe_pkg.sentn'
,p_authentication_function=>'afw_21_authe_pkg.authe_11_utils'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/io_afw_21_authe_12_utils
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(646609363762035842)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'IO_AFW_21_AUTHE_12_UTILS'
,p_display_name=>'AFW - 21 - Authentification Utilisateur (AFW_12_UTILS)'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','IO_AFW_21_AUTHE_12_UTILS'),'')
,p_session_sentry_function=>'afw_21_authe_pkg.sentn'
,p_authentication_function=>'afw_21_authe_pkg.authe_12_utils'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_liste_navgt
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(681274466761977062)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_LISTE_NAVGT'
,p_display_name=>'AFW - 21 - Liste de navigation'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_LISTE_NAVGT'),'')
,p_render_function=>'afw_21_regn_pkg.genr_afw_13_liste_navgt'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(681316156849983643)
,p_plugin_id=>wwv_flow_api.id(681274466761977062)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Icône'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ui-icon-arrowthick-1-e'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(681320559273984408)
,p_plugin_attribute_id=>wwv_flow_api.id(681316156849983643)
,p_display_sequence=>10
,p_display_value=>'ui-icon-arrowthick-1-e'
,p_return_value=>'ui-icon-arrowthick-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(681324861004984900)
,p_plugin_attribute_id=>wwv_flow_api.id(681316156849983643)
,p_display_sequence=>20
,p_display_value=>'ui-icon-arrow-1-e'
,p_return_value=>'ui-icon-arrow-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(681329162390985303)
,p_plugin_attribute_id=>wwv_flow_api.id(681316156849983643)
,p_display_sequence=>30
,p_display_value=>'ui-icon-carat-1-e'
,p_return_value=>'ui-icon-carat-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(681333464121985753)
,p_plugin_attribute_id=>wwv_flow_api.id(681316156849983643)
,p_display_sequence=>40
,p_display_value=>'ui-icon-triangle-1-e'
,p_return_value=>'ui-icon-triangle-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(681337766545986456)
,p_plugin_attribute_id=>wwv_flow_api.id(681316156849983643)
,p_display_sequence=>50
,p_display_value=>'ui-icon-circle-arrow-e'
,p_return_value=>'ui-icon-circle-arrow-e'
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_trait_mess_err
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(690454967085344034)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_TRAIT_MESS_ERR'
,p_display_name=>'AFW - 21 - Traiter messages d''erreur'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_TRAIT_MESS_ERR'),'')
,p_execution_function=>'afw_21_procs_pkg.trait_mesgs_err'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(690465143667346710)
,p_plugin_id=>wwv_flow_api.id(690454967085344034)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Traiter messages'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/authorization_type/io_afw_21_autor_creat
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(690832184961964609)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'IO_AFW_21_AUTOR_CREAT'
,p_display_name=>'AFW - 21 - Autorisation Création'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','IO_AFW_21_AUTOR_CREAT'),'')
,p_execution_function=>'afw_21_autor_pkg.genr_autor_creat'
,p_substitute_attributes=>true
,p_reference_id=>256326647326815230
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_defnr_item_page
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(697478667781759921)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_DEFNR_ITEM_PAGE'
,p_display_name=>'AFW - 21 - Définir item(s) page'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_DEFNR_ITEM_PAGE'),'')
,p_execution_function=>'afw_21_procs_pkg.defnr_item_page'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(697520862811824697)
,p_plugin_id=>wwv_flow_api.id(697478667781759921)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Définir ces éléments'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(697525269045826527)
,p_plugin_id=>wwv_flow_api.id(697478667781759921)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Avec ces valeurs'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(697520862811824697)
,p_depending_on_condition_type=>'NOT_NULL'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_fermr_dialg_ifram
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(706238860925598193)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_FERMR_DIALG_IFRAM'
,p_display_name=>'AFW - 21 - Fermer dialogue (iFrame)'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_FERMR_DIALG_IFRAM'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_fermr_dialg_ifram'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_inser_trace
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(776485653756489805)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_INSER_TRACE'
,p_display_name=>'AFW - 21 - Insérer trace'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_INSER_TRACE'),'')
,p_execution_function=>'afw_21_procs_pkg.inser_trace'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(776950646679677056)
,p_plugin_id=>wwv_flow_api.id(776485653756489805)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Valeur 1'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(776955149796677931)
,p_plugin_id=>wwv_flow_api.id(776485653756489805)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Valeur 2'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/authorization_type/io_afw_21_autor_super_utils
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(834714257811110219)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'IO_AFW_21_AUTOR_SUPER_UTILS'
,p_display_name=>'AFW - 21 - Autorisation super utilisateur'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','IO_AFW_21_AUTOR_SUPER_UTILS'),'')
,p_execution_function=>'afw_21_autor_pkg.genr_autor_super_utils'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_confr_sauvg_reqt
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(854685368478856959)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_CONFR_SAUVG_REQT'
,p_display_name=>'AFW - 21 - Confirmer la sauvegarde (Requêtes)'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_CONFR_SAUVG_REQT'),'')
,p_execution_function=>'afw_21_procs_pkg.defnr_afw_21_confr_sauvg'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(854686355232622290)
,p_plugin_id=>wwv_flow_api.id(854685368478856959)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Message de confirmation'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(854686863543624659)
,p_plugin_id=>wwv_flow_api.id(854685368478856959)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Requêtes'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_regn_afich_mesg_in
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(854737260268191488)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_REGN_AFICH_MESG_IN'
,p_display_name=>'AFW - 21 - Afficher message informatif'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_REGN_AFICH_MESG_IN'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_afich_mesg_infor'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_afich_mesg_infor'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_redrc_url
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(857986355426363956)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_REDRC_URL'
,p_display_name=>'AFW - 21 - Redirection URL'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_REDRC_URL'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_redrc_url'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(857986563176375634)
,p_plugin_id=>wwv_flow_api.id(857986355426363956)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'URL'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>true
,p_default_value=>'afw_08_url_pkg.genr_url([saisir les paramètres])'
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_trans_ident_coln
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(858696057651377771)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_TRANS_IDENT_COLN'
,p_display_name=>'AFW - 21 - Transformer les identifiants de colonnes d''un IR'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_TRANS_IDENT_COLN'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_trans_ident_coln_ir'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(858696452588385806)
,p_plugin_id=>wwv_flow_api.id(858696057651377771)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Identifiants'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_help_text=>'"A":"Libellé A","B":"Libellé B"'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_pris_charg_navgt
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(865269666971284614)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_PRIS_CHARG_NAVGT'
,p_display_name=>'AFW - 21 - Prise en charge du navigateur'
,p_category=>'NOTIFICATION'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_PRIS_CHARG_NAVGT'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_pris_charg_navgt'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(865270047016288243)
,p_plugin_id=>wwv_flow_api.id(865269666971284614)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Titre'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Avertissement'
,p_display_length=>80
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(865270657752291340)
,p_plugin_id=>wwv_flow_api.id(865269666971284614)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'La version de votre navigateur n''est pas supportée. Veuillez en faire la mise à jour ou utilisez un autre navigateur.'
,p_display_length=>80
,p_max_length=>1000
,p_is_translatable=>true
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_menu
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(866665262517406362)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_REGN_MENU'
,p_display_name=>'AFW - 21 - Menu'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_REGN_MENU'),'')
,p_render_function=>'afw_21_regn_pkg.genr_afw_13_menu'
,p_substitute_attributes=>true
,p_reference_id=>174315002511187337
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(515605022605227797)
,p_plugin_id=>wwv_flow_api.id(866665262517406362)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Code du menu'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_chang_libl_fil_ari
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(880949449815900955)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_CHANG_LIBL_FIL_ARI'
,p_display_name=>'AFW - 21 - Changer libellé fil d''ariane'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_CHANG_LIBL_FIL_ARI'),'')
,p_execution_function=>'afw_21_procs_pkg.chang_libl_fil_arian'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(880949664706905291)
,p_plugin_id=>wwv_flow_api.id(880949449815900955)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Nouveau libellé'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>true
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_fermr_regn_dialg
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(898610881694412586)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_FERMR_REGN_DIALG'
,p_display_name=>'AFW - 21 - Fermer dialogue (Région)'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_FERMR_REGN_DIALG'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_fermr_regn_dialg'
,p_standard_attributes=>'REGION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_mode_page
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(906213760541657601)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_MODE_PAGE'
,p_display_name=>'AFW - 21 - Définir le mode de la page (AFW_04)'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_MODE_PAGE'),'')
,p_execution_function=>'afw_21_procs_pkg.defnr_afw_04_mode_page'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(906221772315661012)
,p_plugin_id=>wwv_flow_api.id(906213760541657601)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item cible'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(906317864397687188)
,p_plugin_id=>wwv_flow_api.id(906213760541657601)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Valeur par défaut'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_modfr_mdp
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(906217159270599678)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_MODFR_MDP'
,p_display_name=>'AFW - 21 - modifier mot passe'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_MODFR_MDP'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_afw_12_modfr_mot_passe'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(906217335160602210)
,p_plugin_id=>wwv_flow_api.id(906217159270599678)
,p_name=>'afw_21_actio_dynmq_modfr_mp_afich'
,p_display_name=>'Afficher'
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_defnr_prodt_safp
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(925701786912979024)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_DEFNR_PRODT_SAFP'
,p_display_name=>'AFW - 21 - Définir produit SAFP'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_DEFNR_PRODT_SAFP'),'')
,p_execution_function=>'afw_21_procs_pkg.defnr_prodt_safp'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_aide_page_item
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(926523536217248079)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_AIDE_PAGE_ITEM'
,p_display_name=>'AFW - 21 - Aide page item'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_AIDE_PAGE_ITEM'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_aide_page_item'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_aide_page_item'
,p_substitute_attributes=>true
,p_reference_id=>420769810180509321
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(926596150147540736)
,p_plugin_id=>wwv_flow_api.id(926523536217248079)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Afficher plusieurs à la fois'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_menu_redrc
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(926529888004376510)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_MENU_REDRC'
,p_display_name=>'AFW - 21 - Menu redirection'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_MENU_REDRC'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_menu_redrc'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_menu_redrc'
,p_substitute_attributes=>true
,p_reference_id=>420470922400147878
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_afich_regn_dialg
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1018408478072661940)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_AFICH_REGN_DIALG'
,p_display_name=>'AFW - 21 - Afficher dialogue (Région)'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_AFICH_REGN_DIALG'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_afich_regn_dialg'
,p_standard_attributes=>'REGION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(896439187347572104)
,p_plugin_id=>wwv_flow_api.id(1018408478072661940)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Largeur'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>10
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/item_type/io_afw_21_tokn_input
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1044488097755308440)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'IO_AFW_21_TOKN_INPUT'
,p_display_name=>'AFW - 21 - Token Input'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','IO_AFW_21_TOKN_INPUT'),'')
,p_render_function=>'afw_21_item_pkg.genr_tokn_input'
,p_ajax_function=>'afw_21_item_pkg.ajax_tokn_input'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:SOURCE:LOV:LOV_REQUIRED'
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_sql_examples=>'select 1, 2 from dual'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1034357183267749611)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'minChars'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1044489697267573291)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'prePopulate'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1044490214582578249)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'hintText'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Tapez un terme de recherche'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1044490693934581769)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'noResultsText'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Aucun résultat'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1044491599260592802)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'searchingText'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Recherche...'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1044492102162603014)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'tokenLimit'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1044492610473605437)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'preventDuplicates'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1044497703162700983)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Lazy Load'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(971708071180101980)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Largeur (px)'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'400'
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1044493411297615173)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_name=>'onadd'
,p_display_name=>'onAdd'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1044493714067615970)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_name=>'ondelete'
,p_display_name=>'onDelete'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1044494020993617940)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_name=>'onready'
,p_display_name=>'onReady'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1044493108526614324)
,p_plugin_id=>wwv_flow_api.id(1044488097755308440)
,p_name=>'onresult'
,p_display_name=>'onResult'
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_initl_menu
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1174134152076444542)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_INITL_MENU'
,p_display_name=>'AFW - 21 - Initialisation menu'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_INITL_MENU'),'')
,p_execution_function=>'afw_21_procs_pkg.reint_afw_13_menu'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1174143262351989626)
,p_plugin_id=>wwv_flow_api.id(1174134152076444542)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Code du menu'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_group_entet_raprt_sql
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1184014595611057759)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_GROUP_ENTET_RAPRT_SQL'
,p_display_name=>'AFW - 21 - Groupe entêtes rapport SQL'
,p_category=>'COMPONENT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_GROUP_ENTET_RAPRT_SQL'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_group_entet_raprt_sql'
,p_standard_attributes=>'REGION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1184047898318573414)
,p_plugin_id=>wwv_flow_api.id(1184014595611057759)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Ligne 1 - Entêtes '
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>true
,p_help_text=>'Liste des libellés dans les entêtes.<br/>Ex.: ,Valeur,%'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1184048408015576164)
,p_plugin_id=>wwv_flow_api.id(1184014595611057759)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Ligne 1 - colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Formatage des entêtes.<br/>Ex.: 1;1,4;1,4;1<br/><br/>colspan;rowspan,colspan;rowspan,colspan;rowspan'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1184049589445580307)
,p_plugin_id=>wwv_flow_api.id(1184014595611057759)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Ligne 2 - Entête'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_help_text=>'Liste des libellés dans les entêtes.<br/>Ex.: ,Valeur,%'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1184050093601581495)
,p_plugin_id=>wwv_flow_api.id(1184014595611057759)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Ligne 2 - colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Formatage des entêtes.<br/>Ex.: 1;1,4;1,4;1<br/><br/>colspan;rowspan,colspan;rowspan,colspan;rowspan'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1184051005029584808)
,p_plugin_id=>wwv_flow_api.id(1184014595611057759)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Ligne 3 - Entêtes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_help_text=>'Liste des libellés dans les entêtes.<br/>Ex.: ,Valeur,%'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1184051506414585224)
,p_plugin_id=>wwv_flow_api.id(1184014595611057759)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Ligne 3 - colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Formatage des entêtes.<br/>Ex.: 1;1,4;1,4;1<br/><br/>colspan;rowspan,colspan;rowspan,colspan;rowspan'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_group_entet_raprt
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1214125999602614290)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_GROUP_ENTET_RAPRT'
,p_display_name=>'AFW - 21 - Groupe entêtes rapport interactif'
,p_category=>'COMPONENT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_GROUP_ENTET_RAPRT'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_group_entet_raprt_inter'
,p_standard_attributes=>'REGION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1214258715411685092)
,p_plugin_id=>wwv_flow_api.id(1214125999602614290)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Ligne 1 - Entêtes/colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>100
,p_max_length=>200
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1214270921991686996)
,p_plugin_id=>wwv_flow_api.id(1214125999602614290)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Ligne 2 - Entêtes/colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>100
,p_max_length=>200
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1214275324761687770)
,p_plugin_id=>wwv_flow_api.id(1214125999602614290)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Ligne 3 - Entêtes/colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>100
,p_max_length=>200
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_regn_afich_mesg_pr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1283336856373585712)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_REGN_AFICH_MESG_PR'
,p_display_name=>'AFW - 21 - Afficher message processus'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_REGN_AFICH_MESG_PR'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_afich_mesg_procs'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_afich_mesg_procs'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_valdt_clob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1299468078954818979)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_VALDT_CLOB'
,p_display_name=>'AFW - 21 - Validation - CLOB'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_VALDT_CLOB'),'')
,p_execution_function=>'afw_21_procs_pkg.valdt_afw_21_colct_clob'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1299491177008827801)
,p_plugin_id=>wwv_flow_api.id(1299468078954818979)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Type de validation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'NOT_NULL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1299495583241829637)
,p_plugin_attribute_id=>wwv_flow_api.id(1299491177008827801)
,p_display_sequence=>10
,p_display_value=>'La valeur n''est pas nulle'
,p_return_value=>'NOT_NULL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1299526787181840259)
,p_plugin_id=>wwv_flow_api.id(1299468078954818979)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Numéro message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>30
,p_max_length=>20
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1299546773807845838)
,p_plugin_id=>wwv_flow_api.id(1299468078954818979)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1299555081079847971)
,p_plugin_id=>wwv_flow_api.id(1299468078954818979)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Colonne'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_max_length=>30
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_surpm_colct_clob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1307096576326132695)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_SURPM_COLCT_CLOB'
,p_display_name=>'AFW - 21 - Supprimer collection - CLOB'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_SURPM_COLCT_CLOB'),'')
,p_execution_function=>'afw_21_procs_pkg.suprm_afw_21_colct_clob'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_suprm_item_clob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1309323379394155354)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_SUPRM_ITEM_CLOB'
,p_display_name=>'AFW - 21 - Supprimer contenu items - CLOB'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_SUPRM_ITEM_CLOB'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_suprm_item_clob'
,p_standard_attributes=>'STOP_EXECUTION_ON_ERROR'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1309331352513157087)
,p_plugin_id=>wwv_flow_api.id(1309323379394155354)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Liste des items (clob)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1309347859317225284)
,p_plugin_id=>wwv_flow_api.id(1309323379394155354)
,p_name=>'suprm_item_clob_delete_termn'
,p_display_name=>'Supprimer items CLOB terminé (DELETE)'
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_calnd
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1449496696809514917)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_REGN_CALND'
,p_display_name=>'AFW - 21 - Calendrier'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_REGN_CALND'),'')
,p_render_function=>'afw_21_regn_pkg.genr_plugn_regn_calnd'
,p_ajax_function=>'afw_21_regn_pkg.ajax_plugn_regn_calnd'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1449609587956000857)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'dayclick'
,p_display_name=>'dayClick'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1441002692583800076)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'drop'
,p_display_name=>'drop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440952572713784894)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventafterrender'
,p_display_name=>'eventAfterRender'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1449609892458002168)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventclick'
,p_display_name=>'eventClick'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440981574575794851)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventdragstart'
,p_display_name=>'eventDragStart'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440977370420793703)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventdragstop'
,p_display_name=>'eventDragStop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440985778731796086)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventdrop'
,p_display_name=>'eventDrop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440931592705733926)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventmouseout'
,p_display_name=>'eventMouseout'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440927279892730206)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventmouseover'
,p_display_name=>'eventMouseover'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440948373443737819)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventrender'
,p_display_name=>'eventRender'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440998388081798753)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventresize'
,p_display_name=>'eventResize'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440989981155796784)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventresizestart'
,p_display_name=>'eventResizeStart'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440994183579797534)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'eventresizestop'
,p_display_name=>'eventResizeStop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440944169980736772)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'loading'
,p_display_name=>'loading'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(854127351901845341)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'loadingstart'
,p_display_name=>'loadingStart'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(854127757096846810)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'loadingstop'
,p_display_name=>'loadingStop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440935795475734720)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'select'
,p_display_name=>'select'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440939998592735558)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'unselect'
,p_display_name=>'unselect'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440956777561786276)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'viewdisplay'
,p_display_name=>'viewDisplay'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1440960980678787139)
,p_plugin_id=>wwv_flow_api.id(1449496696809514917)
,p_name=>'windowresize'
,p_display_name=>'windowResize'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_soumt_clob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1702735446620480711)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_SOUMT_CLOB'
,p_display_name=>'AFW - 21 - Soumettre - CLOB'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_SOUMT_CLOB'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_soumt_clob'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_soumt_clob'
,p_standard_attributes=>'STOP_EXECUTION_ON_ERROR'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1702755239132488057)
,p_plugin_id=>wwv_flow_api.id(1702735446620480711)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Liste des items (clob)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1704948232700047369)
,p_plugin_id=>wwv_flow_api.id(1702735446620480711)
,p_name=>'soumt_create_clob_termn'
,p_display_name=>'Soumettre CLOB terminé (CREATE)'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1290573380684128234)
,p_plugin_id=>wwv_flow_api.id(1702735446620480711)
,p_name=>'soumt_delete_clob_termn'
,p_display_name=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Soumettre CLOB terminé (DELETE)',
''))
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1290569171334125595)
,p_plugin_id=>wwv_flow_api.id(1702735446620480711)
,p_name=>'soumt_save_clob_termn'
,p_display_name=>'Soumettre CLOB terminé (SAVE)'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_dml_obten_clob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1705844622434328252)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_DML_OBTEN_CLOB'
,p_display_name=>'AFW - 21 - Extraction de ligne automatisée (DML) - CLOB'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_DML_OBTEN_CLOB'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_dml_obten_clob'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_dml_obten_clob'
,p_standard_attributes=>'STOP_EXECUTION_ON_ERROR'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1706005824428347788)
,p_plugin_id=>wwv_flow_api.id(1705844622434328252)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Table (Vue)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_max_length=>92
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1706050808629352712)
,p_plugin_id=>wwv_flow_api.id(1705844622434328252)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Elément contenant la valeur de colonne de clé primaire'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1706055215901354754)
,p_plugin_id=>wwv_flow_api.id(1705844622434328252)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Colonne de clé primaire'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_max_length=>30
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1706059622135356587)
,p_plugin_id=>wwv_flow_api.id(1705844622434328252)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Elément contenant la valeur de colonne de clé secondaire'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1706064033216359752)
,p_plugin_id=>wwv_flow_api.id(1705844622434328252)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Colonne de clé secondaire'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>60
,p_max_length=>30
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1707032921535763274)
,p_plugin_id=>wwv_flow_api.id(1705844622434328252)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Liste des items (séparées par des virgules)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1707070931232766007)
,p_plugin_id=>wwv_flow_api.id(1705844622434328252)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Liste des colonnes (séparées par des virgules)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>100
,p_max_length=>200
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_dml_maj_clob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1721830192448978176)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'IO_AFW_21_DML_MAJ_CLOB'
,p_display_name=>'AFW - 21 - Traitement de ligne automatique (DML) - CLOB'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','IO_AFW_21_DML_MAJ_CLOB'),'')
,p_execution_function=>'afw_21_procs_pkg.dml_maj_clob'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1721926294441997720)
,p_plugin_id=>wwv_flow_api.id(1721830192448978176)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Table (Vue)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_max_length=>92
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1721930703100000223)
,p_plugin_id=>wwv_flow_api.id(1721830192448978176)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Elément contenant la valeur de colonne de clé primaire'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1721935108295001635)
,p_plugin_id=>wwv_flow_api.id(1721830192448978176)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Colonne de clé primaire'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_max_length=>30
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1721939481414003357)
,p_plugin_id=>wwv_flow_api.id(1721830192448978176)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Elément contenant la valeur de colonne de clé secondaire'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1721943886262004781)
,p_plugin_id=>wwv_flow_api.id(1721830192448978176)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Colonne de clé secondaire'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>60
,p_max_length=>30
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1721963405655010362)
,p_plugin_id=>wwv_flow_api.id(1721830192448978176)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Liste des items (séparées par des virgules)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1721967781545012860)
,p_plugin_id=>wwv_flow_api.id(1721830192448978176)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Liste des colonnes (séparées par des virgules)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>100
,p_max_length=>200
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_fil_arian
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1908503732158919263)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_REGN_FIL_ARIAN'
,p_display_name=>'AFW - 21 - Fil d''ariane'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_REGN_FIL_ARIAN'),'')
,p_render_function=>'afw_21_regn_pkg.genr_afw_04_fil_arian'
,p_substitute_attributes=>true
,p_reference_id=>448659041313949161
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1908507902161920089)
,p_plugin_id=>wwv_flow_api.id(1908503732158919263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Icône'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ui-icon-arrowthick-1-e'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908508301136920096)
,p_plugin_attribute_id=>wwv_flow_api.id(1908507902161920089)
,p_display_sequence=>10
,p_display_value=>'ui-icon-arrowthick-1-e'
,p_return_value=>'ui-icon-arrowthick-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908508818589920096)
,p_plugin_attribute_id=>wwv_flow_api.id(1908507902161920089)
,p_display_sequence=>20
,p_display_value=>'ui-icon-arrow-1-e'
,p_return_value=>'ui-icon-arrow-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908509324400920097)
,p_plugin_attribute_id=>wwv_flow_api.id(1908507902161920089)
,p_display_sequence=>30
,p_display_value=>'ui-icon-carat-1-e'
,p_return_value=>'ui-icon-carat-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908509802129920097)
,p_plugin_attribute_id=>wwv_flow_api.id(1908507902161920089)
,p_display_sequence=>40
,p_display_value=>'ui-icon-triangle-1-e'
,p_return_value=>'ui-icon-triangle-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908510303583920099)
,p_plugin_attribute_id=>wwv_flow_api.id(1908507902161920089)
,p_display_sequence=>50
,p_display_value=>'ui-icon-circle-arrow-e'
,p_return_value=>'ui-icon-circle-arrow-e'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1908510826946920102)
,p_plugin_id=>wwv_flow_api.id(1908503732158919263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Préfixe'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_max_length=>50
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1908511206340920102)
,p_plugin_id=>wwv_flow_api.id(1908503732158919263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'AVANC'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908511626529920103)
,p_plugin_attribute_id=>wwv_flow_api.id(1908511206340920102)
,p_display_sequence=>10
,p_display_value=>'Classique'
,p_return_value=>'CLASQ'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908512104203920103)
,p_plugin_attribute_id=>wwv_flow_api.id(1908511206340920102)
,p_display_sequence=>20
,p_display_value=>'Avancé'
,p_return_value=>'AVANC'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1908512630746920103)
,p_plugin_id=>wwv_flow_api.id(1908503732158919263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Afficher informations supplémentaires'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1908513007670920103)
,p_plugin_id=>wwv_flow_api.id(1908503732158919263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Inclure le contexte'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1908512630746920103)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1001811058557499134)
,p_plugin_id=>wwv_flow_api.id(1908503732158919263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Afficher premier niveau'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_telvr_fichr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(4474182585596931741)
,p_plugin_type=>'REGION TYPE'
,p_name=>'IO_AFW_21_TELVR_FICHR'
,p_display_name=>'AFW - 21 - Téléversement des fichiers'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','IO_AFW_21_TELVR_FICHR'),'')
,p_render_function=>'afw_21_regn_pkg.genr_telvr_fichr'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.9'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(3007721273608398418)
,p_plugin_id=>wwv_flow_api.id(4474182585596931741)
,p_name=>'selct_termn_regn'
,p_display_name=>'Sélection terminée'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_soumt_blob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(4480560866430283372)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_SOUMT_BLOB'
,p_display_name=>'AFW - 21 - Soumettre - BLOB'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_SOUMT_BLOB'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_soumt_blob'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_soumt_blob'
,p_standard_attributes=>'STOP_EXECUTION_ON_ERROR'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'http://www.afw.io'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(3031343848464597725)
,p_plugin_id=>wwv_flow_api.id(4480560866430283372)
,p_name=>'debut_telvr'
,p_display_name=>'Débuter téléversement'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(4480584868293293378)
,p_plugin_id=>wwv_flow_api.id(4480560866430283372)
,p_name=>'soumt_create_blob_termn'
,p_display_name=>'Soumettre BLOB terminé (CREATE)'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(4480589071756294306)
,p_plugin_id=>wwv_flow_api.id(4480560866430283372)
,p_name=>'soumt_delete_blob_termn'
,p_display_name=>'Soumettre BLOB terminé (DELETE)'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(3031348255736599824)
,p_plugin_id=>wwv_flow_api.id(4480560866430283372)
,p_name=>'termn_telvr'
,p_display_name=>'Terminer téléversement'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(3611923890500403)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>true
,p_is_default=>true
,p_theme_id=>313
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:101'
,p_global_page_id=>0
,p_nav_list_template_options=>'#DEFAULT#'
,p_include_legacy_javascript=>true
,p_include_jquery_migrate=>true
,p_nav_bar_type=>'NAVBAR'
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(3611923890500403)
,p_name=>'Page commune'
,p_page_mode=>'NORMAL'
,p_step_title=>'Page commune'
,p_step_sub_title=>'Sie'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(648421266474632666)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20151111113008'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(452431456622032844)
,p_plug_name=>'Recherche'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'class="filtr_rechr_globl"'
,p_plug_template=>wwv_flow_api.id(524952650231821685)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'afw_13_page_pkg.obten_page_sesn != afw_11_aplic_pkg.obten_page_conxn'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(478150461567245720)
,p_plug_name=>'Fil d''ariane'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_plug_source_type=>'PLUGIN_IO_AFW_21_REGN_FIL_ARIAN'
,p_plug_query_row_template=>1
,p_attribute_01=>'ui-icon-arrowthick-1-e'
,p_attribute_04=>'AVANC'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(479685700739952283)
,p_plug_name=>'Items cachés'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BEFORE_FOOTER'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(480180465028997176)
,p_plug_name=>'Messages Informatifs'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_item_display_point=>'BELOW'
,p_plug_source_type=>'PLUGIN_IO_AFW_21_REGN_PILE_MESG'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(616776238994178482)
,p_plug_name=>'Menu accueil'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_plug_source_type=>'PLUGIN_IO_AFW_21_REGN_MENU'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'MENU_ACUEI'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(449836574543532678)
,p_name=>'SADA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(479381573826613586)
,p_name=>'SIDF'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_prompt=>'Test'
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524968048637821701)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_item_comment=>'Sie IDentifiant Fil (d''ariane)'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(479381801300613588)
,p_name=>'SSPC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(479381976290613588)
,p_name=>'SCPC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_item_comment=>'Sie Contexte Page Cible'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(479720794712233069)
,p_name=>'SAPC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(501205278703289733)
,p_name=>'SNPI'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_prompt=>'SNPI'
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524968048637821701)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(523945595100457366)
,p_name=>'SCPI'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(523945800295458889)
,p_name=>'SSPI'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(523946005143460236)
,p_name=>'SAPI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(595659338800521179)
,p_name=>'P0_RECHR_GLOBL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(452431456622032844)
,p_use_cache_before_default=>'NO'
,p_display_as=>'PLUGIN_IO_AFW_21_CHAMP_RECHR'
,p_cSize=>30
,p_cMaxlength=>200
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(524967923723821701)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Recherche...'
,p_attribute_02=>'5'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(510952066420939372)
,p_name=>'AFW'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(510952338974939374)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_CONFR_SAUVG'
,p_attribute_01=>'Êtes-vous certain de vouloir quitter cette page sans sauvegarder les modifications apportées?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(510975546465943055)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_DEPSM_TABLR_FORM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(510983549928944089)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_NAVGT_TABLR_FORM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(510991553045944896)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_GESTN_TABLR_FORM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80173212886002914)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_MENU_REDRC'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80173608573004893)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AIDE_PAGE_ITEM'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80173805338006359)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AIDE_PAGE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80149425056617424)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_INITL_COMPS'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(81196625521244317)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_NAVGT_ENREG'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(454869816967972588)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_MODFR_MDP'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22079107925561317)
,p_event_id=>wwv_flow_api.id(510952066420939372)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_FAVR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(853419748836986135)
,p_name=>'AFW - Commentaires/Bogues (Afficher dialogue)'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#boutn_comnt_bogue'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(853420059477986137)
,p_event_id=>wwv_flow_api.id(853419748836986135)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Ajouter un commentaire et/ou bogue'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_comnt_bogue'
,p_attribute_07=>'PAGE'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic'
,p_attribute_15=>'102'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(853420346890995015)
,p_name=>'AFW - Commentaires/Bogues (Fermer dialogue)'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'div.dialg_comnt_bogue div.afw_21_actio_dynmq_dialg'
,p_bind_type=>'live'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(853420640284995016)
,p_event_id=>wwv_flow_api.id(853420346890995015)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(853420962473999544)
,p_event_id=>wwv_flow_api.id(853420346890995015)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(858061650354806557)
,p_event_id=>wwv_flow_api.id(853420346890995015)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(454870019654992300)
,p_name=>'AFW - Modifier mot de passe (Afficher dialogue)'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_MODFR_MDP|DYNAMIC ACTION|afw_21_actio_dynmq_modfr_mp_afich'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(454870318156992305)
,p_event_id=>wwv_flow_api.id(454870019654992300)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Modifier votre mot de passe'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_modfr_mot_passe'
,p_attribute_07=>'PAGE'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic(afw_11_aplic_pkg.obten_aplic_authe)'
,p_attribute_15=>'106'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(454870427619994622)
,p_name=>'AFW - Modifier mot de passe (Fermer dialogue)'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'div.dialg_modfr_mot_passe div.afw_21_actio_dynmq_dialg'
,p_bind_type=>'live'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(454870713195994622)
,p_event_id=>wwv_flow_api.id(454870427619994622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(454870918075994622)
,p_event_id=>wwv_flow_api.id(454870427619994622)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(454871130820994622)
,p_event_id=>wwv_flow_api.id(454870427619994622)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(3611923890500403)
,p_name=>'Accueil'
,p_page_mode=>'NORMAL'
,p_step_title=>'Accueil'
,p_step_sub_title=>'Accueil'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_group_id=>wwv_flow_api.id(478682399982457703)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(648421266474632666)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'Aucune aide disponible pour cette page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160513154059'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81034508007147441)
,p_plug_name=>'Menu principal'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row liste-horzt">',
'  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">',
'    <a href="f?p=&P1_NUMR_APLIC_SAFM.:1:&SESSION.::::SIDF:&SIDF.">',
'      <i class="fa fa-compass icone-liste"></i>',
'	  <div class="texte-liste">Méthodologie</div>',
'	</a>',
'  </div>',
'  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">',
'    <a href="f?p=&P1_NUMR_APLIC_SAFP.:8011:&SESSION.::::SIDF:&SIDF.">',
'      <i class="fa fa-desktop icone-liste"></i>',
'	  <div class="texte-liste">Produits</div>',
'	</a>',
'  </div>',
'  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">',
'    <a href="f?p=&P1_NUMR_APLIC_SAFD.:12200:&SESSION.::::SIDF:&SIDF.">',
'      <i class="fa fa-globe icone-liste"></i>',
'	  <div class="texte-liste">Domaines</div>',
'	</a>',
'  </div>',
'  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">',
'    <a href="f?p=&P1_NUMR_APLIC_SAFA.:1:&SESSION.::::SIDF:&SIDF.">',
'      <i class="fa fa-bug icone-liste"></i>',
'      <div class="texte-liste">Assurance qualité</div>',
'	</a>',
'  </div>',
'  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">',
'    <a href="f?p=&P1_NUMR_APLIC_SAFP.:1080:&SESSION.::::SIDF:&SIDF.">',
'      <i class="fa fa-download icone-liste"></i>',
'	  <div class="texte-liste">Déploiement</div>',
'	</a>',
'  </div>',
'  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">',
'    <a href="f?p=&P1_NUMR_APLIC_SAFC.:1:&SESSION.::::SIDF:&SIDF.">',
'      <i class="fa fa-gear icone-liste"></i>',
'	  <div class="texte-liste">Pilotage</div>',
'	</a>',
'  </div>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(450009454871316982)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(439699136343966698)
,p_name=>'P1_NUMR_APLIC_SAFP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(439701040331005616)
,p_name=>'P1_NUMR_APLIC_SAFD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(439701244141006714)
,p_name=>'P1_NUMR_APLIC_SAFM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(455868327709811890)
,p_name=>'P1_NUMR_APLIC_SAFC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456925915493676717)
,p_name=>'P1_NUMR_APLIC_SAFA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(435513138978104774)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Créer le fil d''ariane Accueil'
,p_process_sql_clob=>'afw_04_fil_arian_pkg.synch_login();'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(439700217474999028)
,p_process_sequence=>15
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Alimenter numéro d''application'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  :p1_numr_aplic_safp := afw_11_aplic_pkg.obten_numr_apex_aplic (''SAFP'');',
'  :p1_numr_aplic_safd := afw_11_aplic_pkg.obten_numr_apex_aplic (''SAFD'');',
'  :p1_numr_aplic_safm := afw_11_aplic_pkg.obten_numr_apex_aplic (''SAFM'');',
'  :p1_numr_aplic_safc := afw_11_aplic_pkg.obten_numr_apex_aplic (''SAFC'');',
'  :p1_numr_aplic_safa := afw_11_aplic_pkg.obten_numr_apex_aplic (''SAFA'');',
'end;'))
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(3611923890500403)
,p_name=>'Page de connexion'
,p_page_mode=>'NORMAL'
,p_step_title=>'Page de connexion'
,p_step_sub_title=>'Page de connexion'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(524947827269821678)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160429105549'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(450135153010089828)
,p_plug_name=>'Page de connexion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(450135752258089831)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(450135153010089828)
,p_button_name=>'P101_LOGIN'
,p_button_static_id=>'P101_LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524969030218821703)
,p_button_image_alt=>'Connexion'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'LOGIN'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_grid_row_span=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(450135354543089830)
,p_name=>'P101_CODE_UTILS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(450135153010089828)
,p_prompt=>'Code d''utilisateur'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_cHeight=>1
,p_colspan=>2
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524968230407821701)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(450135562927089831)
,p_name=>'P101_MOT_PASSE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(450135153010089828)
,p_prompt=>'Mot de passe'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524968230407821701)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(450135954811089831)
,p_name=>'P101_DOMN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(450135153010089828)
,p_prompt=>'Domaine'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_read_only_when=>'P101_force_domn'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(524968230407821701)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(450136154775089832)
,p_name=>'P101_LANG'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(450135153010089828)
,p_item_default=>'FR'
,p_pre_element_text=>'<br /><br />'
,p_source=>'FR'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Français;FR,English;EN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(524967923723821701)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(450136348256089832)
,p_name=>'P101_FORCE_DOMN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(479685700739952283)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(450136764922089834)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Définir les témoins (cookies)'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'owa_util.mime_header(''text/html'', FALSE);',
'owa_cookie.send(',
'    name=>afw_11_aplic_pkg.obten_numr_apex_aplic||''_C_CODE_UTILS_CONXN'',',
'    value=>lower(:P101_CODE_UTILS));',
'exception when others then null;',
'end;',
'',
'begin',
'owa_util.mime_header(''text/html'', FALSE);',
'owa_cookie.send(',
'    name=>afw_11_aplic_pkg.obten_numr_apex_aplic||''_C_DOMN'',',
'    value=>lower(:P101_DOMN));',
'exception when others then null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(450136548981089833)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - Connexion'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  afw_12_authe_apex_pkg.exect_procd_persn();',
'',
'  afw_12_authe_apex_pkg.authe_redrg (',
'    pva_code_utils        => :p101_code_utils,',
'    pva_mot_passe         => :p101_mot_passe,',
'    pva_domn              => :p101_domn,',
'    pnu_numr_apex_aplic   => afw_07_sesn_pkg.obten_valr_sesn (',
'                              ''S_AUTHE_CIBLE_NUMR_APEX_APLIC''),',
'    pnu_numr_apex_page    => afw_07_sesn_pkg.obten_valr_sesn (',
'                              ''S_AUTHE_CIBLE_NUMR_APEX_PAGE''),',
'    pbo_indic_forcr_sspc  => true,',
'    pbo_indic_forcr_sidf  => true,',
'    pva_scpc              => afw_07_sesn_pkg.obten_valr_sesn (',
'                              ''S_AUTHE_CIBLE_SCPC''),',
'    pnu_sspc              => afw_07_sesn_pkg.obten_valr_sesn (',
'                              ''S_AUTHE_CIBLE_SSPC''),',
'    pva_sapc              => afw_07_sesn_pkg.obten_valr_sesn (',
'                              ''S_AUTHE_CIBLE_SAPC''),',
'    pva_scpi              => afw_07_sesn_pkg.obten_valr_sesn (',
'                              ''S_AUTHE_CIBLE_SCPI''),',
'    pnu_sspi              => afw_07_sesn_pkg.obten_valr_sesn (',
'                              ''S_AUTHE_CIBLE_SSPI''),',
'    pva_sapi              => afw_07_sesn_pkg.obten_valr_sesn (',
'                              ''S_AUTHE_CIBLE_SAPI''),',
'    pnu_snpi              => afw_07_sesn_pkg.obten_valr_sesn (',
'                              ''S_AUTHE_CIBLE_SNPI''),',
'    pnu_sidf              => afw_07_sesn_pkg.obten_valr_sesn (',
'                              ''S_AUTHE_CIBLE_SIDF''));',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(450137157255089834)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Effacer la cache de la page de connexion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(450137339236089834)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - Redirection vers le produit d''authentification'
,p_process_sql_clob=>'afw_12_authe_apex_pkg.redrg_prodt_authe;'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(450136968780089834)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtenir témoin (cookie) du domaine'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    v varchar2(255) := null;',
'    c owa_cookie.cookie;',
'begin',
'   c := owa_cookie.get(afw_11_aplic_pkg.obten_numr_apex_aplic||''_C_DOMN'');',
'   :P101_DOMN := c.vals(1);',
'exception when others then null;',
'end;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(473414559412820787)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtenir témoin (cookie) du code utilisateur'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'    v varchar2(255) := null;',
'    c owa_cookie.cookie;',
'begin',
'   c := owa_cookie.get(afw_11_aplic_pkg.obten_numr_apex_aplic||''_C_CODE_UTILS_CONXN'');',
'   :P101_CODE_UTILS := c.vals(1);',
'exception when others then null;',
'end;'))
);
end;
/
prompt --application/pages/page_00102
begin
wwv_flow_api.create_page(
 p_id=>102
,p_user_interface_id=>wwv_flow_api.id(3611923890500403)
,p_name=>'Commentaire'
,p_page_mode=>'NORMAL'
,p_step_title=>'Commentaire'
,p_step_sub_title=>'Commentaire'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(524949052253821681)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_page_comment=>'This page was generated by the feedback wizard'
,p_last_upd_yyyymmddhh24miss=>'20160513151934'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(440442438489404590)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524953239055821686)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(440442812428404594)
,p_plug_name=>'Commentaire'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524956232265821688)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(440442632276404592)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(440442438489404590)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524970845014821704)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(440443014436404595)
,p_name=>'P102_APPLICATION_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(440442812428404594)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Application:'
,p_source=>'APP_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>'select application_id||''. ''||application_name d, application_id v from apex_applications where application_id = :P102_APPLICATION_ID'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>1
,p_tag_attributes=>'class="fielddatabold"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524968048637821701)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Identifies Application.'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(440443515825404604)
,p_name=>'P102_PAGE_ID'
,p_item_sequence=>2
,p_item_plug_id=>wwv_flow_api.id(440442812428404594)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Page:'
,p_source=>'A_AFW_04_SOURC_NUMR_PAGE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>'select page_id||''. ''||page_name d, page_id v from apex_application_pages where page_id = :P102_PAGE_ID and application_id = :P102_APPLICATION_ID'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>1
,p_tag_attributes=>'class="fielddatabold"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524968048637821701)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Identifies page within application.'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(440444018623404605)
,p_name=>'P102_A'
,p_item_sequence=>3
,p_item_plug_id=>wwv_flow_api.id(440442812428404594)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(440444240443404605)
,p_name=>'P102_FEEDBACK'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(440442812428404594)
,p_prompt=>'Commentaire'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>90
,p_cMaxlength=>4000
,p_cHeight=>6
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524968230407821701)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Enter your feedback and press the submit feedback button.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(440444735755404606)
,p_name=>'P102_X'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(440442812428404594)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(440444930966404607)
,p_name=>'P102_FEEDBACK_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(440442812428404594)
,p_prompt=>'Type de commentaire'
,p_source=>'1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select the_name, id from APEX_FEEDBACK_TYPES order by id'
,p_cSize=>20
,p_cMaxlength=>100
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524968048637821701)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Veuillez identifier le type de commentaire.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(440445426429404607)
,p_name=>'P102_Y'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(440442812428404594)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(440445643604404612)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Submit Feedback'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_util.submit_feedback (',
'    p_comment         => :P102_FEEDBACK,',
'    p_type            => :P102_FEEDBACK_TYPE,',
'    p_application_id  => :P102_APPLICATION_ID,',
'    p_page_id         => :P102_PAGE_ID,',
'    p_email           => afw_12_utils_pkg.obten_courl_utils(afw_12_utils_pkg.obten_usagr_conct));'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(440442632276404592)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(440445813907404614)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_process_name=>'Fermer le dialogue'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
