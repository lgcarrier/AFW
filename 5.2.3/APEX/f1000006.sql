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
,p_default_application_id=>1000006
,p_default_owner=>'APEXFRAMEWORK'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 1000006 - Méthodologie
--
-- Application Export:
--   Application:     1000006
--   Name:            Méthodologie
--   Date and Time:   09:36 Jeudi Octobre 20, 2016
--   Exported By:     LGCARRIER
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.3.00.03
--   Instance ID:     69411815032911
--

-- Application Statistics:
--   Pages:                     23
--     Items:                   93
--     Processes:               47
--     Regions:                 54
--     Buttons:                 56
--     Dynamic Actions:         27
--   Shared Components:
--     Logic:
--       Items:                 96
--       Processes:             36
--       Computations:           1
--     Navigation:
--       Lists:                  3
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
--       LOVs:                  74
--       Shortcuts:              4
--       Plug-ins:              75
--     Globalization:
--       Messages:             407
--     Reports:
--   Supporting Objects:  Included

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
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,1000006)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APEXFRAMEWORK')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Méthodologie')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'1000006')
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
,p_authentication_id=>wwv_flow_api.id(3711627593895220)
,p_application_tab_set=>0
,p_logo_image=>'&A_AFW_11_DOSR_FICHR_AFW.images/afw_logo_header.png'
,p_logo_image_attributes=>'style="width:44px;height:30px;"'
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
,p_last_upd_yyyymmddhh24miss=>'20160515144526'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(456622229681275479)
,p_name=>'MENU_ACUEI_SAFM'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(456622446645275482)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Planification'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::SIDF:&SIDF.:'
,p_list_item_icon=>'menu/chart_line_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(456624721808329936)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Développement'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::SIDF:&SIDF.:'
,p_list_item_icon=>'menu/todo_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(486824842496068552)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Tâches'
,p_list_item_link_target=>'f?p=&APP_ID.:1051:&SESSION.::&DEBUG.::SIDF:&SIDF.:'
,p_list_item_icon=>'menu/todo_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(533021118179556104)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Mes tâches'
,p_list_item_link_target=>'f?p=&APP_ID.:1055:&SESSION.::&DEBUG.::SIDF:&SIDF.:'
,p_list_item_icon=>'menu/bboard_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(456626039236543097)
,p_name=>'MENU_ACUEI_PLANF'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(456626533952543102)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'Jalons'
,p_list_item_link_target=>'f?p=&APP_ID.:1001:&SESSION.::&DEBUG.::SIDF:&SIDF.:'
,p_list_item_icon=>'menu/package_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(456626226378543100)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Équipes'
,p_list_item_link_target=>'f?p=&APP_ID.:1011:&SESSION.::&DEBUG.::SIDF:&SIDF.:'
,p_list_item_icon=>'menu/users_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(456633525954955592)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Rôles'
,p_list_item_link_target=>'f?p=&APP_ID.:1041:&SESSION.::&DEBUG.::SIDF:&SIDF.:'
,p_list_item_icon=>'menu/shapes_64.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(485969935321839072)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Tâches'
,p_list_item_link_target=>'f?p=&APP_ID.:1051:&SESSION.::&DEBUG.::SIDF:&SIDF.:'
,p_list_item_icon=>'menu/todo_64.gif'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(456862550301571950)
,p_name=>'JALON_ONGLE_PRINC'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(456862746800571952)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Jalon'
,p_list_item_link_target=>'f?p=&APP_ID.:1022:&SESSION.::&DEBUG.::SIDF:&SIDF.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(456865842598588638)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tâche'
,p_list_item_link_target=>'f?p=&APP_ID.:1051:&SESSION.::&DEBUG.::SIDF,SAPC:&SIDF.,XPP1022:'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1051,1052'
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
 p_id=>wwv_flow_api.id(111660392578067)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(3583220902308450)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(7779731027180133)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_IO_AFW_21_SELCT_2'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(1524499241822049818)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_IO_AFW_21_ITEM_POPUP_ARBOR'
,p_attribute_01=>'&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
,p_attribute_02=>'&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(10027387098451642521)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_COM_SKILLBUILDERS_SBIP_PASSWORD'
,p_attribute_01=>'cupertino'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1528497534788076469)
,p_name=>'Administrateur SAF'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''SUPER_UTILS'');'
,p_error_message=>'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1528498243230088423)
,p_name=>'Administrateur produit'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''ADMIN'');'
,p_error_message=>'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1528498453966091478)
,p_name=>'Développeur'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''DEVLP'');'
,p_error_message=>'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1721922232923650037)
,p_name=>'Création'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTOR_CREAT'
,p_error_message=>'Accès refusé.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1723923346971193396)
,p_name=>'Modification'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTOR_MODFC'
,p_error_message=>'Accès refusé.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1723935220091195070)
,p_name=>'Suppression'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTOR_SUPRS'
,p_error_message=>'Accès refusé.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1723951025632196700)
,p_name=>'Opération DML'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTOR_OPERT_DML'
,p_error_message=>'Accès refusé.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1724855148880581895)
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
 p_id=>wwv_flow_api.id(1556101772433238381)
,p_process_sequence=>1000000000
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Réinitialiser la variable d''exclusion'
,p_process_sql_clob=>'afw_13_page_pkg.reint_exclu_liste_navgt();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1556101360658234957)
,p_process_sequence=>1000000000.1
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Initialiser le contexte d''exécution d''une page'
,p_process_sql_clob=>'afw_13_condt_piltb_pkg.defn_contx_exect_page();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1565252951762219008)
,p_process_sequence=>1000000000.3
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 19 - Definir les variables de sessions'
,p_process_sql_clob=>'afw_19_boutn_pkg.defnr_varbl_sesn();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1562378459565236013)
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
 p_id=>wwv_flow_api.id(1556696358858481757)
,p_process_sequence=>1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Synchroniser variables fil d''Ariane'
,p_process_sql_clob=>'afw_04_fil_arian_pkg.synch_varbl();'
,p_process_when=>'afw_13_page_pkg.obten_page_sesn <>  afw_11_aplic_pkg.obten_page_conxn'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1556298566858006675)
,p_process_sequence=>1000000000.1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Mettre à jour le contexte'
,p_process_sql_clob=>'afw_04_contx_pkg.maj_seqnc_contx();'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1597853936744000331)
,p_process_sequence=>1000000000.2
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Sauvegarde des préférences'
,p_process_sql_clob=>'afw_13_prefr_pkg.sauvg_prefr_page();'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1524968644458583960)
,p_process_sequence=>20
,p_process_point=>'BEFORE_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Script mode recherche'
,p_process_sql_clob=>'afw_13_navgt_pkg.script_mode_rechr ();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1541491735610357342)
,p_process_sequence=>1000000000
,p_process_point=>'BEFORE_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 25_Générer le script d''affichage du rapport'
,p_process_sql_clob=>'afw_25_appel_raprt_apex_pkg.genr_script_popup_raprt();'
,p_process_when=>'A_AFW_25_URL_RAPRT'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1541307341225264305)
,p_process_sequence=>1.1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 07 - Libérer les sémaphores hors persistances'
,p_process_sql_clob=>'afw_07_semph_pkg.libr_semph_perst_page();'
,p_process_error_message=>'Error'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1556913557832169722)
,p_process_sequence=>1.2
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 11 - Définir la langue'
,p_process_sql_clob=>'afw_01_lang_pkg.defnr_lang_sesn();'
,p_process_when=>':FSP_LANGUAGE_PREFERENCE is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1616391181370003919)
,p_process_sequence=>1.3
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 11 - Définir items application'
,p_process_sql_clob=>'afw_11_prodt_pkg.defnr_item_aplic_apex();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1581462531860783108)
,p_process_sequence=>1.4
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 12 - Définir items application'
,p_process_sql_clob=>'afw_12_utils_pkg.defnr_item_aplic_apex();'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1659501035802634708)
,p_process_sequence=>1.5
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Définir items application'
,p_process_sql_clob=>'afw_13_page_pkg.defnr_item_aplic_apex;'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1567070635394320757)
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
 p_id=>wwv_flow_api.id(1556180267345974278)
,p_process_sequence=>8
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Synchroniser fil d''Ariane'
,p_process_sql_clob=>'afw_04_fil_arian_pkg.synch;'
,p_process_error_message=>'Erreur lors de la synchronisation du fil d''Ariane.'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1556179760073972126)
,p_process_sequence=>9
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Synchroniser le contexte'
,p_process_sql_clob=>'afw_04_contx_pkg.synch;'
,p_process_error_message=>'#SQLERRM#'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1524960937326316941)
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
 p_id=>wwv_flow_api.id(1567071044875332993)
,p_process_sequence=>9.2
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Définir contexte navigation'
,p_process_sql_clob=>'afw_13_navgt_pkg.defnr_contx_navgt();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1597838126008997189)
,p_process_sequence=>9.5
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Charger les préférences'
,p_process_sql_clob=>'afw_13_prefr_pkg.charg_prefr_page();'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1528529549753036302)
,p_process_sequence=>9.6
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Générer le produit et l''application en cours'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'  :a_safp_prodt := afw_04_contx_pkg.obten_seqnc_contx (''PRODT'');',
'  :a_safp_aplic := afw_04_contx_pkg.obten_seqnc_contx (''APLIC'');',
'end;'))
,p_process_error_message=>'err'
,p_process_when=>'afw_13_page_pkg.obten_page_sesn  <>  afw_11_aplic_pkg.obten_page_conxn'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1560241758525469733)
,p_process_sequence=>12.1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 25 - Export CSV'
,p_process_sql_clob=>'afw_25_spx_expor_ir_pkg.afich_csv ();'
,p_process_when=>'CSV'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1560241451945467854)
,p_process_sequence=>12.2
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 25 - Export PDF'
,p_process_sql_clob=>'afw_25_plpdf_expor_ir_pkg.afich_pdf ();'
,p_process_when=>'PDF'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1523701664387710566)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE_SESSION_STATE'
,p_process_sql_clob=>'null;'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1555869561223949853)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 04 - Autoriser la duplication de la page dans le fil d''Ariane'
,p_process_sql_clob=>':A_AFW_04_AUTOR_DUPLQ_PAGE := ''O'';'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1556100984076232279)
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
 p_id=>wwv_flow_api.id(1556694667815455898)
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
 p_id=>wwv_flow_api.id(1556813558836781032)
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
 p_id=>wwv_flow_api.id(1562385540789325274)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INFO_TRI_ALTER'
,p_process_sql_clob=>'afw_25_tri_alter_pkg.afich_info_tri_alter ();'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1567071434963339572)
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
 p_id=>wwv_flow_api.id(1567071645352342555)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 - Cacher tous les boutons'
,p_process_sql_clob=>'afw_13_condt_piltb_pkg.cachr_tous_boutn;'
,p_process_error_message=>'#SQLERRM#'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1567072363145357154)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 13 -  Tout lecture seule'
,p_process_sql_clob=>'afw_13_condt_piltb_pkg.lectr_seule_tout;'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1556506558565236499)
,p_process_sequence=>1.2
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AFW - 11 - Alimenter les variables des numéros de produits'
,p_process_sql_clob=>'afw_11_aplic_pkg.defnr_varbl_numr_aplic();'
,p_process_error_message=>'Erreur'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(1555870075768954012)
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
 p_id=>wwv_flow_api.id(1556696079505478220)
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
 p_id=>wwv_flow_api.id(1524968461296579364)
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
 p_id=>wwv_flow_api.id(1556153467290169951)
,p_name=>'A_AFW_04_ACTIO'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1555867159398892565)
,p_name=>'A_AFW_04_AUTOR_DUPLQ_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1556153676294172551)
,p_name=>'A_AFW_04_CONTX'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1640146132231019932)
,p_name=>'A_AFW_04_CONTX_FORMT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1556153879411173412)
,p_name=>'A_AFW_04_SEQNC_CONTX'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1556154284605174920)
,p_name=>'A_AFW_04_SOURC_ACTIO'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1556154081835174172)
,p_name=>'A_AFW_04_SOURC_CONTX'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1640154139504022039)
,p_name=>'A_AFW_04_SOURC_CONTX_FORMT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1947800425768163135)
,p_name=>'A_AFW_04_SOURC_NUMR_APLIC'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1556545266057810464)
,p_name=>'A_AFW_04_SOURC_NUMR_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1556154487029175697)
,p_name=>'A_AFW_04_SOURC_SEQNC_CONTX'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1557233063754674503)
,p_name=>'A_AFW_04_SOURC_URL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1609995871514424715)
,p_name=>'A_AFW_04_SUPRM_FIL_COURN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1555961371795135901)
,p_name=>'A_AFW_04_SUR_SOUMS'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(9241632719980374)
,p_name=>'A_AFW_11_ACRON_APLIC'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1541589444183378696)
,p_name=>'A_AFW_11_ACRON_PRODT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1360167693817601210)
,p_name=>'A_AFW_11_DEPLC_RANGE_RAPRT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1525428658031386311)
,p_name=>'A_AFW_11_DOSR_FICHR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1525427361878340147)
,p_name=>'A_AFW_11_DOSR_FICHR_AFW'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1541581436911376581)
,p_name=>'A_AFW_11_ENVIR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1586367830401585865)
,p_name=>'A_AFW_11_JQUER_UI_CSS_SCOPE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1630788344788668102)
,p_name=>'A_AFW_11_MESG_SUPRS'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1586359825553584513)
,p_name=>'A_AFW_11_MESG_TOUT_DROIT_RESRV'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(9241804302980374)
,p_name=>'A_AFW_11_NOM_APLIC'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(9242117829980375)
,p_name=>'A_AFW_11_NOM_PRODT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(79667222005940764)
,p_name=>'A_AFW_11_NUMR_VERSN_PRODT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(79725629944619140)
,p_name=>'A_AFW_11_NUMR_VERSN_PRODT_AFW'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1359436093950570186)
,p_name=>'A_AFW_11_TEMPL_CUSTM'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1629282940699796415)
,p_name=>'A_AFW_11_TEMPL_JAVSC_CORE_1'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1629298946586798114)
,p_name=>'A_AFW_11_TEMPL_JAVSC_CORE_2'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1629306949010798842)
,p_name=>'A_AFW_11_TEMPL_JAVSC_JQUER'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1629290943123797152)
,p_name=>'A_AFW_11_TEMPL_THEME_JQUER_UI'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1766628438184223766)
,p_name=>'A_AFW_11_TRAIT_MESGS_ERR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1359435991427570185)
,p_name=>'A_AFW_11_URL_ACUEI'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(909515368839848727)
,p_name=>'A_AFW_11_URL_AUTHE_CIBLE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1541605250070380366)
,p_name=>'A_AFW_11_VERSN_PRODT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1554123040334213826)
,p_name=>'A_AFW_12_UTILS'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1513349729519461962)
,p_name=>'A_AFW_12_UTILS_CODE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1616390367864000017)
,p_name=>'A_AFW_12_UTILS_NOM_FORMT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1742883148095754875)
,p_name=>'A_AFW_13_LIEN_EDITN_RAPRT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1761306830905028102)
,p_name=>'A_AFW_13_MESG_AUCUN_DON_TROUV'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(14460520134804845)
,p_name=>'A_AFW_13_MESG_CONFR_SUPRS'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1659431138394597693)
,p_name=>'A_AFW_13_MESG_ECHEC_SPECF'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1758700926937440308)
,p_name=>'A_AFW_13_MESG_IMPOS_FETCH'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1758611836587414689)
,p_name=>'A_AFW_13_MESG_RANGE_INSER'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1758588628968412501)
,p_name=>'A_AFW_13_MESG_RANGE_MODF'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1758385043765360050)
,p_name=>'A_AFW_13_MESG_RANGE_SUPRM'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1659423133546596239)
,p_name=>'A_AFW_13_MESG_SUCS_SPECF'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1769371526726811372)
,p_name=>'A_AFW_13_MESG_TROP_DON_TROUV'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1524960151609302179)
,p_name=>'A_AFW_13_MODE_RECHR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1556914263851180877)
,p_name=>'A_AFW_13_PAGE_META'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1556914060041179766)
,p_name=>'A_AFW_13_PAGE_TITRE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1567074047786418961)
,p_name=>'A_AFW_13_PAGNT_NAVGT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1582278339501081905)
,p_name=>'A_AFW_14_POPUP_LOV_IR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1585027057146560275)
,p_name=>'A_AFW_14_POPUP_LOV_IR_RETR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564315039677450971)
,p_name=>'A_AFW_19_AFICH_EREUR'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564319847080462605)
,p_name=>'A_AFW_19_AFICH_LOV'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564319645695462161)
,p_name=>'A_AFW_19_AIDE_CLE_FONCT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564315951105454332)
,p_name=>'A_AFW_19_AIDE_ITEM'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564316253182454938)
,p_name=>'A_AFW_19_AIDE_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564313858246446858)
,p_name=>'A_AFW_19_ANULR_REQT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564314264133448613)
,p_name=>'A_AFW_19_COUNT_QUERY'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564315241408451536)
,p_name=>'A_AFW_19_DUPLQ_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564314060324447508)
,p_name=>'A_AFW_19_EFACR_CHAMP'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564315443486452072)
,p_name=>'A_AFW_19_ENTRE_REQT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564315646256452911)
,p_name=>'A_AFW_19_EXECT_REQT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564319242232461200)
,p_name=>'A_AFW_19_IMPRI'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564316554914455447)
,p_name=>'A_AFW_19_INSER_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1565250254607125247)
,p_name=>'A_AFW_19_NAVGT_BAS_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564318435306459211)
,p_name=>'A_AFW_19_NAVGT_CHAMP_PRECD'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564316956646455915)
,p_name=>'A_AFW_19_NAVGT_CHAMP_SUIVN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564314636214450025)
,p_name=>'A_AFW_19_NAVGT_DERNR_CHAMP'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564314837945450493)
,p_name=>'A_AFW_19_NAVGT_DERNR_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564318637383459782)
,p_name=>'A_AFW_19_NAVGT_ENREG_PRECD'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564317258377456383)
,p_name=>'A_AFW_19_NAVGT_ENREG_SUIVN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564318839115460269)
,p_name=>'A_AFW_19_NAVGT_GROUP_ENREG_PRECD'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564317460109456880)
,p_name=>'A_AFW_19_NAVGT_GROUP_ENREG_SUIVN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1565250457378126018)
,p_name=>'A_AFW_19_NAVGT_HAUT_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564319040500460704)
,p_name=>'A_AFW_19_NAVGT_ONGLE_PRECD'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564317661840457366)
,p_name=>'A_AFW_19_NAVGT_ONGLE_SUIVN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564317863225457769)
,p_name=>'A_AFW_19_NAVGT_PAGE_PRECD'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564318031843458197)
,p_name=>'A_AFW_19_NAVGT_PREMR_CHAMP'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564318233574458743)
,p_name=>'A_AFW_19_NAVGT_PREMR_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564319443963461668)
,p_name=>'A_AFW_19_SAUVG_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1564314433443449216)
,p_name=>'A_AFW_19_SUPRM_ENREG'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1541613351240390166)
,p_name=>'A_AFW_25_URL_RAPRT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1616389962668998448)
,p_name=>'A_DATE_SYSTM'
,p_protection_level=>'I'
,p_required_patch=>wwv_flow_api.id(1571945379827889551)
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1525561263572235264)
,p_name=>'A_NOMBR_BOUTN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1525561060455234333)
,p_name=>'A_NOMBR_CHAMP'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1525561433921236152)
,p_name=>'A_NOMBR_COLN'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1525561637037237022)
,p_name=>'A_NOMBR_PAGE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1582685275608298051)
,p_name=>'A_P12081_NUMR_PAGE_APEX'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1942882350867862051)
,p_name=>'A_SAFP_APLIC'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1528425548621786305)
,p_name=>'A_SAFP_PRODT'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1555111065464463245)
,p_name=>'FSP_AFTER_LOGIN_URL'
,p_protection_level=>'N'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(1556913362765152247)
,p_name=>'FSP_LANGUAGE_PREFERENCE'
,p_protection_level=>'I'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(1616391464878008628)
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
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1531273363042625394)
,p_lov_name=>'LOV_AFW_21_PLUGN_ARBRE_MODE_CACHE'
,p_lov_query=>'.'||wwv_flow_api.id(1531273363042625394)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1531273658700625398)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Session'
,p_lov_return_value=>'SESN'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1531274038254625400)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Aucune'
,p_lov_return_value=>'AUCUN'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1583191160521076442)
,p_lov_name=>'LOV_APEX_CONDT'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select valr d,',
'       ddv.seqnc r',
'  from vd_afw_14_domn_valr dv,',
'       vd_afw_14_detl_domn_valr ddv',
' where dv.seqnc = ddv.ref_domn_valr ',
'   and dv.code = ''CONDT_APEX''',
'   and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1942859425150280659)
,p_lov_name=>'LOV_APLIC'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select   numr_aplic_apex || '' - '' || code || '' - '' || nom d,',
'         seqnc r',
'    from vd_afw_11_aplic',
'where ref_prodt = afw_04_contx_pkg.obten_seqnc_contx(''PRODT'')',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1556142970869900215)
,p_lov_name=>'LOV_APLIC_APEX'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ''['' || owner || ''] '' || id || '' - '' || name d, id r',
'    from apex_aplic',
'   where owner <> afw_07_util_pkg.obten_schem_apex',
'order by owner, id'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1567005353705197058)
,p_lov_name=>'LOV_BOUTN_TYPE_AIDE_CONTX'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  select   ddv.valr d, ',
'           ddv.seqnc r ',
'    from   vd_afw_14_detl_domn_valr ddv, ',
'           vd_afw_14_domn_valr dv ',
'   where   ddv.ref_domn_valr = dv.seqnc ',
'     and   dv.code = ''BOUTN_TYPE_AIDE_CONTX''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'     and   ddv.date_debut_efect <= sysdate ',
'     and   (ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect',
'            or ddv.date_fin_efect is null)',
'order by   ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1578157168780657743)
,p_lov_name=>'LOV_CATGR_PERSN'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ddv.valr d, ddv.seqnc r',
'  from vd_afw_14_detl_domn_valr ddv, ',
'       vd_afw_14_domn_valr dv',
' where dv.seqnc = ddv.ref_domn_valr ',
'   and dv.code = ''CATGR_PERSN''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1530292352767377262)
,p_lov_name=>'LOV_CONDT_EXECT'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'  from vd_afw_13_condt_exect',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1528825551325398002)
,p_lov_name=>'LOV_CONTX_EXECT'
,p_lov_query=>'.'||wwv_flow_api.id(1528825551325398002)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1528825855767398002)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Propriétaire'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1528826040785398002)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Utilisateur courant'
,p_lov_return_value=>'O'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1699897035733738915)
,p_lov_name=>'LOV_COULR_PRINC'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ddv.valr d, ddv.seqnc r',
'  from vd_afw_14_detl_domn_valr ddv, ',
'       vd_afw_14_domn_valr dv',
' where dv.seqnc = ddv.ref_domn_valr ',
'   and dv.code = ''COULR_PRINC''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1699896839641738915)
,p_lov_name=>'LOV_COULR_THEME'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ddv.valr d, ddv.seqnc r',
'  from vd_afw_14_detl_domn_valr ddv, ',
'       vd_afw_14_domn_valr dv',
' where dv.seqnc = ddv.ref_domn_valr ',
'   and dv.code = ''COULR_THEME''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1558602661482417318)
,p_lov_name=>'LOV_DEFNT_ACCES'
,p_lov_query=>'.'||wwv_flow_api.id(1558602661482417318)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558603178475417320)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Accordé'
,p_lov_return_value=>'ACORD'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558603380977417320)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Utilisateur lié'
,p_lov_return_value=>'ACUCS'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558603556593417320)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Structure inférieure liée'
,p_lov_return_value=>'ACSIN'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558677171680175332)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Structure immédiate liée'
,p_lov_return_value=>'ACSTI'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558603766872417320)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Structure supérieure liée'
,p_lov_return_value=>'ACSSU'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558677683801178804)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Structure globale liée'
,p_lov_return_value=>'ACSTG'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1530252650560316953)
,p_lov_name=>'LOV_DOSR_VIRTL'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'  from vd_afw_13_dosr_virtl dv',
' where ref_prodt = :A_SAFP_PRODT',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1557022574799007343)
,p_lov_name=>'LOV_ERER_ORACL'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select libl d, seqnc r',
'from VD_AFW_01_CODE_ERR_ORACL',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1605568966903691183)
,p_lov_name=>'LOV_FORMT'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select LIBL d, SEQNC r',
'from   VD_AFW_14_FORMT',
'where ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1577502481611838381)
,p_lov_name=>'LOV_GROUP_UTILS_SEM'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select   nom d,',
'         seqnc r',
'  from   vd_afw_12_group_utils gu',
' where   gu.ref_prodt = (select   seqnc',
'                           from   vd_afw_11_prodt p',
'                          where   p.code = ''SEM'')',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1566369952231058136)
,p_lov_name=>'LOV_JEU_CARCT_APEX'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  select   ddv.valr d, ',
'           ddv.seqnc r ',
'    from   vd_afw_14_detl_domn_valr ddv, ',
'           vd_afw_14_domn_valr dv ',
'   where   ddv.ref_domn_valr = dv.seqnc ',
'     and   dv.code = ''JEU_CARCT_APEX''',
'     and   ddv.code_valr = ''UTF-8''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by   ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1578573173403087239)
,p_lov_name=>'LOV_LANG'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'  from vd_afw_01_lang',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1582646383443940829)
,p_lov_name=>'LOV_LANG_LANG'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, ref_lang r',
'  from vd_afw_01_lang_lang',
' where ref_lang_cible = afw_01_lang_pkg.obten_lang_sesn()',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1555918478688465809)
,p_lov_name=>'LOV_MESG'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select libl_mesg d, seqnc r',
'  from (select mes.numr_mesg||'' - ''||mel.mesg libl_mesg, mes.seqnc',
'          from vd_afw_01_mesg mes,',
'               vd_afw_01_mesg_lang mel',
'         where mel.ref_mesg = mes.seqnc',
'           and mel.ref_lang = afw_01_lang_pkg.obten_lang_sesn()',
'           and mes.ref_prodt = :A_SAFP_PRODT)',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(909000144796594719)
,p_lov_name=>'LOV_NATR_ENVIR'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select     valr d,',
'           ddv.seqnc r',
'    from   vd_afw_14_domn_valr dv,',
'           vd_afw_14_detl_domn_valr ddv',
'   where   dv.seqnc = ddv.ref_domn_valr',
'           and dv.code = ''AFW_NATR_ENVIR''',
'           and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'           and ddv.date_debut_efect <= sysdate',
'           and (   ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect',
'                or ddv.date_fin_efect is null)',
'order by   ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1578898359456538115)
,p_lov_name=>'LOV_NUMR_MESG'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select libl_mesg d, numr_mesg r',
'  from (select mes.numr_mesg||'' - ''||mel.mesg libl_mesg, mes.numr_mesg',
'          from vd_afw_01_mesg mes,',
'               vd_afw_01_mesg_lang mel',
'         where mel.ref_mesg = mes.seqnc',
'           and mel.ref_lang = afw_01_lang_pkg.obten_lang_sesn())',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1555860175534812095)
,p_lov_name=>'LOV_O'
,p_lov_query=>'.'||wwv_flow_api.id(1555860175534812095)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1555860469515812097)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'&nbsp;'
,p_lov_return_value=>'O'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1526721355174197857)
,p_lov_name=>'LOV_OPTIO_ENTET_CALND'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, r',
'  from vs_optio_entet_calnd',
'order by o'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1700028422429752480)
,p_lov_name=>'LOV_ORIEN_MENU'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ddv.valr d, ddv.seqnc r',
'  from vd_afw_14_detl_domn_valr ddv, ',
'       vd_afw_14_domn_valr dv',
' where dv.seqnc = ddv.ref_domn_valr ',
'   and dv.code = ''ORIEN_MENU''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1557988682545049354)
,p_lov_name=>'LOV_OUI_NON'
,p_lov_query=>'.'||wwv_flow_api.id(1557988682545049354)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1557988966819049357)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Oui'
,p_lov_return_value=>'O'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1557989169742049359)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Non'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1566982451262344813)
,p_lov_name=>'LOV_P1010_APEX_PAGE'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select id || '' - '' || name d, id r',
'  from apex_page',
' where afw_07_util_pkg.nv(''P1010_NUMR_APLIC_APEX'') is not null and flow_id = :P1010_NUMR_APLIC_APEX',
' order by id'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1567379531871384079)
,p_lov_name=>'LOV_P1010_GROUP_UTILS_IGNOR_GROUP_ADMIN'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select   nom d,',
'         seqnc r',
'  from   vd_afw_12_group_utils gu',
' where   gu.ref_prodt = :P1010_SEQNC',
'   and   gu.indic_ignor_group_admin = ''N''',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1564287245454776311)
,p_lov_name=>'LOV_P1050_TEMPL_BOUTN'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select   template_name d,',
'         id r',
'  from   apex_boutn_templ',
' where   flow_id = afw_11_prodt_pkg.obten_numr_apex_prodt(afw_07_util_pkg.nv(''P1050_REF_PRODT''))',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1563430340497416910)
,p_lov_name=>'LOV_P1070_TEMPL_BOUTN'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select   template_name d,',
'         id r',
'  from   apex_boutn_templ',
' where   flow_id = afw_11_prodt_pkg.obten_numr_apex_prodt(:p1070_seqnc)',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1569802158710484377)
,p_lov_name=>'LOV_P12041_DEPSM_ALIAS_COLN'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select arc.column_alias d, arc.column_alias r',
'from apex_regn_coln arc,',
'    apex_regn ar',
' where arc.display_as = ''HIDDEN''',
'   and arc.region_id = ar.id',
'   and arc.flow_id = ar.flow_id',
'   and ar.flow_id = :P12041_NUMR_APLIC_APEX',
'   and ar.page_id = :P12041_NUMR_APEX',
'   and ar.plug_source_type = ''UPDATABLE_SQL_QUERY''',
'   and arc.column_alias <> ''SEQNC''',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1555763577815465559)
,p_lov_name=>'LOV_P12041_OPERT'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'  from vd_afw_13_opert o',
' where o.ref_prodt = afw_04_contx_pkg.obten_seqnc_contx(''PRODT'')',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1555947472236442287)
,p_lov_name=>'LOV_P12070_IR'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select libl_regn d, seqnc r',
'  from vd_afw_13_page_ir ir',
' where ir.ref_page = :A_AFW_04_SOURC_SEQNC_CONTX',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1566934051725034571)
,p_lov_name=>'LOV_P12078_LANG_PROD'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ll.nom d,',
'       ll.ref_lang r',
'  from vd_afw_01_lang_lang ll',
' where ll.ref_lang_cible = afw_01_lang_pkg.obten_lang_sesn()',
'   and (exists (select null',
'                  from vd_afw_11_aplic a',
'                 where a.ref_lang = ll.ref_lang',
'                   and a.seqnc = afw_07_util_pkg.vd(''P12078_REF_APLIC''))',
'        or ',
'        exists (select null',
'                  from vd_afw_11_prodt_lang pl,',
'                       vd_afw_11_prodt p,',
'                       vd_afw_11_aplic a                       ',
'                 where pl.ref_prodt = p.seqnc',
'                   and pl.ref_lang = ll.ref_lang',
'                   and p.seqnc = a.ref_prodt',
'                   and a.seqnc = afw_07_util_pkg.vd(''P12078_REF_APLIC''))',
'       )',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1585635082878536920)
,p_lov_name=>'LOV_P12081_LANG_PROD'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ll.nom d,',
'       ll.ref_lang r',
'  from vd_afw_01_lang_lang ll',
' where ll.ref_lang_cible = afw_01_lang_pkg.obten_lang_sesn()',
'   and (exists (select null',
'                  from vd_afw_11_prodt p',
'                 where p.ref_lang = ll.ref_lang',
'                   and p.seqnc = afw_07_util_pkg.vd(''P12081_REF_PRODT''))',
'        or ',
'        exists (select null',
'                  from vd_afw_11_prodt_lang pl,',
'                       vd_afw_11_prodt p                       ',
'                 where pl.ref_prodt = p.seqnc',
'                   and pl.ref_lang = ll.ref_lang',
'                   and p.seqnc = afw_07_util_pkg.vd(''P12081_REF_PRODT''))',
'       )',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1583217361239704153)
,p_lov_name=>'LOV_P12091_AFW_13_ITEMS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, r from (',
'select (select a.code || '' - '' || p.nom || '' (p.'' || p.numr_apex || '')''',
'        from vd_afw_13_page p,',
'             vd_afw_11_aplic a',
'        where p.seqnc = pi.ref_page and p.ref_aplic = a.seqnc) ||',
'      '' - '' ||',
'      libl || ',
'      '' ('' || nom_apex || '')'' ',
'        d,',
'      seqnc r',
'from vd_afw_13_page_item pi',
'where type_item = ''ITEM'')',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1581989932906642369)
,p_lov_name=>'LOV_P12095_AFW_13_ITEMS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, r from (',
'select (select pr.code || '' - '' || p.nom || '' (p.'' || p.numr_apex || '')''',
'        from vd_afw_13_page p,',
'             vd_afw_11_prodt pr',
'        where p.seqnc = pi.ref_page and p.ref_prodt = pr.seqnc) ||',
'      '' - '' ||',
'      libl || ',
'      '' ('' || nom_apex || '')'' ',
'        d,',
'      seqnc r',
'from vd_afw_13_page_item pi)',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1585007648191465233)
,p_lov_name=>'LOV_P12095_AFW_13_ITEMS1'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, r from (',
'select (select pr.code || '' - '' || p.nom || '' (p.'' || p.numr_apex || '')''',
'        from vd_afw_13_page p,',
'             vd_afw_11_prodt pr',
'        where p.seqnc = pi.ref_page and p.ref_prodt = pr.seqnc) ||',
'      '' - '' ||',
'      libl || ',
'      '' ('' || nom_apex || '')'' ',
'        d,',
'      seqnc r',
'from vd_afw_13_page_item pi)',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1582935431990250513)
,p_lov_name=>'LOV_P12095_AFW_13_PAGE_IR'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  select   d,',
'           r',
'    from   (select   (select   code || '' - ''',
'                        from   vd_afw_11_prodt pr',
'                       where   pr.seqnc = p.ref_prodt) ||',
'                     nom d,',
'                     seqnc r',
'              from   vd_afw_13_page p)',
'order by   1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1585007949600465239)
,p_lov_name=>'LOV_P12095_AFW_13_PAGE_IR1'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  select   d "Nom",',
'           r',
'    from   (select   (select   pr.code || '' - ''',
'                        from   vd_afw_11_prodt pr',
'                       where   pr.seqnc = p.ref_prodt) ||',
'                     p.nom d,',
'                     p.seqnc r',
'              from   vd_afw_13_page p,',
'                     vd_afw_13_page_ir pi',
'              where  p.seqnc = pi.ref_page',
'                and  p.indic_prise_charg_afw14_popup = ''O'')',
'order by   1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1560248232561605729)
,p_lov_name=>'LOV_P14020_TYPE_DOMN'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d,',
'       seqnc r',
'  from vd_afw_14_type_domn_valr',
' where ref_prodt = :P14020_REF_PRODT',
' order by 1',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1523887648243756011)
,p_lov_name=>'LOV_P21010_PROFL_COURL'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select pc.servr || '' - '' || pc.nom_envoy d,',
'       pc.seqnc r',
'from vd_afw_17_profl_courl pc',
'where (pc.ref_prodt = afw_07_util_pkg.v (''P21010_REF_PRODT'')',
'       or afw_07_util_pkg.v (''P21010_REF_PRODT'') is null) or pc.ref_prodt is null',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1605559563262685676)
,p_lov_name=>'LOV_P4030_ATRIB'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'  from vd_defnt_atrib',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1605558987017685676)
,p_lov_name=>'LOV_P4030_LIBL'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select code || '' :: '' || nom d, seqnc r',
' from vd_libl',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1576655674727019276)
,p_lov_name=>'LOV_PAGE'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  SELECT ''['' || a.code || ''] '' || p.numr_apex || '' - '' || p.nom d, p.seqnc r',
'    FROM vd_afw_13_page p, vd_afw_11_aplic a',
'   WHERE p.ref_aplic IN',
'            (SELECT seqnc',
'               FROM vd_afw_11_aplic a2',
'              WHERE a2.ref_prodt = afw_04_contx_pkg.obten_seqnc_contx (''PRODT''))',
'         AND a.seqnc = p.ref_aplic',
'ORDER BY p.numr_apex'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1527197248244593202)
,p_lov_name=>'LOV_PLUGN'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'  from vd_afw_11_plugn',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1555130966489092297)
,p_lov_name=>'LOV_PRODT'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select   numr_aplic_apex || '' - '' || code || '' - '' || nom d,',
'         seqnc r',
'    from vd_afw_11_prodt',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1583263480554544878)
,p_lov_name=>'LOV_SESN'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select code_utils || '' ('' ||nom || '', '' || prenm || '')'' d, s.id_sesn r',
'  from vd_afw_12_utils u, vd_afw_12_sesn s',
' where s.app_user = u.code_utils',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1613244481802061566)
,p_lov_name=>'LOV_SPX_TYPE_PUBLC'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'  from vd_spx_type_publc',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1558060674585223370)
,p_lov_name=>'LOV_STRUC_APLIC'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'  from vd_afw_12_struc_aplic',
' where ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1930362324274779933)
,p_lov_name=>'LOV_SYSTM'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom_formt d, seqnc r',
'  from vd_afw_11_systm',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1563740445249273591)
,p_lov_name=>'LOV_TYPE_ACTIO_FONCT'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  select   ddv.valr d, ',
'           ddv.seqnc r ',
'    from   vd_afw_14_detl_domn_valr ddv, ',
'           vd_afw_14_domn_valr dv ',
'   where   ddv.ref_domn_valr = dv.seqnc ',
'     and   dv.code = ''TYPE_ACTIO_FONCT''',
'',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by   ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1581240575060600654)
,p_lov_name=>'LOV_TYPE_APPEL_REPRT'
,p_lov_query=>'.'||wwv_flow_api.id(1581240575060600654)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1581240873591600664)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Strict'
,p_lov_return_value=>'S'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1581241072192600668)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Ouvert'
,p_lov_return_value=>'O'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1563291247509931865)
,p_lov_name=>'LOV_TYPE_ATRIB_FONCT'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  select   ddv.valr d,',
'           ddv.seqnc r',
'    from   vd_afw_14_detl_domn_valr ddv,',
'           vd_afw_14_domn_valr dv',
'   where   ddv.ref_domn_valr = dv.seqnc and dv.code = ''TYPE_ATRIB_FONCT''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by   ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1532040735384200469)
,p_lov_name=>'LOV_TYPE_COMNC'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'from   vd_afw_01_type_comnc',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1558860285127311376)
,p_lov_name=>'LOV_TYPE_DOMN_VALR'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'from   vd_afw_14_type_domn_valr',
'where ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1558342183278714248)
,p_lov_name=>'LOV_TYPE_DON'
,p_lov_query=>'.'||wwv_flow_api.id(1558342183278714248)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558342466527714250)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Alphanumérique'
,p_lov_return_value=>'V'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558342663125714251)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Numérique'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558342876982714251)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Date'
,p_lov_return_value=>'D'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1530285734011267732)
,p_lov_name=>'LOV_TYPE_DON2'
,p_lov_query=>'.'||wwv_flow_api.id(1530285734011267732)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1530286051134267733)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Date'
,p_lov_return_value=>'D'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1530286250182267734)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Number'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1530286449298267735)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Varchar2'
,p_lov_return_value=>'V'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1566358036674930658)
,p_lov_name=>'LOV_TYPE_EXPOR_APEX'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  select   ddv.valr d, ',
'           ddv.seqnc r ',
'    from   vd_afw_14_detl_domn_valr ddv, ',
'           vd_afw_14_domn_valr dv ',
'   where   ddv.ref_domn_valr = dv.seqnc ',
'     and   dv.code = ''TYPE_EXPOR_APEX''',
'     and   ddv.code_valr = ''FLOW_EXPORT''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by   ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1563753055908421602)
,p_lov_name=>'LOV_TYPE_EXPRE_ACTIO'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  select   ddv.valr d, ',
'           ddv.seqnc r ',
'    from   vd_afw_14_detl_domn_valr ddv, ',
'           vd_afw_14_domn_valr dv ',
'   where   ddv.ref_domn_valr = dv.seqnc ',
'     and   dv.code = ''TYPE_EXPRE_ACTIO''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by   ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1583196183902121064)
,p_lov_name=>'LOV_TYPE_INSTA'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select valr d,',
'      ddv.seqnc r',
'from vd_afw_14_domn_valr dv,',
'     vd_afw_14_detl_domn_valr ddv',
'where dv.seqnc = ddv.ref_domn_valr and dv.code = ''TYPE_INSTA''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1556924072885687454)
,p_lov_name=>'LOV_TYPE_LARGR'
,p_lov_query=>'.'||wwv_flow_api.id(1556924072885687454)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1556924365298687465)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Pouce'
,p_lov_return_value=>'POUCE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1556924786553687468)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Relatif restant'
,p_lov_return_value=>'RELTF'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1556462159520774586)
,p_lov_name=>'LOV_TYPE_LIAIS'
,p_lov_query=>'.'||wwv_flow_api.id(1556462159520774586)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1556462480024774589)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'1 - Page, type d''erreur, contrainte et table/colonne'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1556462681346774589)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'2 - Page et type d''erreur'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1556462884261774589)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'3 - Page'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1556463071375774589)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'4 - Type d''erreur, contrainte et table/colonne'
,p_lov_return_value=>'4'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1556463257982774589)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'5 - Type d''erreur'
,p_lov_return_value=>'5'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1556463879143774590)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'8 - Message générique'
,p_lov_return_value=>'8'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1605559283412685676)
,p_lov_name=>'LOV_TYPE_LIBL'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select code || '' :: '' || nom d, seqnc r',
' from vd_type_libl',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1698024044129525091)
,p_lov_name=>'LOV_TYPE_MENU'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ddv.valr d, ddv.seqnc r',
'  from vd_afw_14_detl_domn_valr ddv, ',
'       vd_afw_14_domn_valr dv',
' where dv.seqnc = ddv.ref_domn_valr ',
'   and dv.code = ''TYPE_MENU''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1558736075648480812)
,p_lov_name=>'LOV_TYPE_MESG'
,p_lov_query=>'.'||wwv_flow_api.id(1558736075648480812)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558736372454480814)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Erreur'
,p_lov_return_value=>'E'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1609947358058348647)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Erreur critique'
,p_lov_return_value=>'C'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558736582762480815)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Informatif'
,p_lov_return_value=>'I'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558736764903480815)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Aide'
,p_lov_return_value=>'A'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1558736976682480815)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Avertissement'
,p_lov_return_value=>'W'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1528822442472206229)
,p_lov_name=>'LOV_TYPE_MODL'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ddv.valr display_value, ddv.seqnc return_value ',
'from vd_afw_14_detl_domn_valr ddv, vd_afw_14_domn_valr dv',
'where ddv.ref_domn_valr = dv.seqnc and dv.code = ''TYPE_MODL''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1566948938929532377)
,p_lov_name=>'LOV_TYPE_REGN_PILTB'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  select   ddv.valr d, ',
'           ddv.seqnc r ',
'    from   vd_afw_14_detl_domn_valr ddv, ',
'           vd_afw_14_domn_valr dv ',
'   where   ddv.ref_domn_valr = dv.seqnc ',
'     and   dv.code = ''TYPE_REGN_PILTB''',
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'order by   ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1530153040073897328)
,p_lov_name=>'LOV_TYPE_RESRC'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select valr d, code_valr r',
'from   vs_afw_14_domn_valr',
'where code = ''TYPE_RESRC''',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1558459976525601254)
,p_lov_name=>'LOV_TYPE_STRUC'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d, seqnc r',
'  from vd_afw_12_type_struc',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1583262372112533017)
,p_lov_name=>'LOV_UTILS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select code_utils || '' ('' ||nom || '', '' || prenm || '')'' d, seqnc r',
'  from vd_afw_12_utils',
' order by 1'))
);
end;
/
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1583219261894751573)
,p_lov_name=>'LOV_VALR_INSTA'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select valr d,',
'      ddv.seqnc r',
'from vd_afw_14_domn_valr dv,',
'     vd_afw_14_detl_domn_valr ddv',
'where dv.seqnc = ddv.ref_domn_valr and dv.code = ''VALR_INSTA_SAFP''',
'     and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn',
'     and ddv.date_debut_efect <= sysdate ',
'     and (ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect',
'          or ddv.date_fin_efect is null)',
'order by ddv.seqnc_presn'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1528806747301706204)
,p_lov_name=>'LOV_VERSN_BD_APLIC'
,p_lov_query=>'.'||wwv_flow_api.id(1528806747301706204)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1528807040592706208)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'10g'
,p_lov_return_value=>'10g'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1528807260930706212)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'11g'
,p_lov_return_value=>'11g'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1530250550073231668)
,p_lov_name=>'LOV_VERSN_PRODT'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select versn_formt d, seqnc r',
'  from vd_afw_11_versn v',
' where v.ref_prodt = :A_SAFP_PRODT',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1930941921908745445)
,p_lov_name=>'P19000_OPERT'
,p_lov_query=>'.'||wwv_flow_api.id(1930941921908745445)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1930942226182745447)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'='
,p_lov_return_value=>'='
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1930942445661745447)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'>'
,p_lov_return_value=>'>'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1930942646611745447)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'>='
,p_lov_return_value=>'>='
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1930942833935745447)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'<'
,p_lov_return_value=>'<'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1930943033449745447)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'<='
,p_lov_return_value=>'<='
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1930943239660745448)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'!='
,p_lov_return_value=>'!='
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1930943436168745448)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'like'
,p_lov_return_value=>'like'
);
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
 p_id=>wwv_flow_api.id(1555115963688401595)
,p_group_name=>'1000 - Gestion des messages d''erreur'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(1555116282388406932)
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
 p_id=>wwv_flow_api.id(524952624617896527)
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
,p_reference_id=>524947027725821677
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(524952842862896527)
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
,p_reference_id=>524947245970821677
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(524953424161896528)
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
,p_reference_id=>524947827269821678
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(524954649145896531)
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
,p_reference_id=>524949052253821681
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'* APEX Themes - Themes, Templates & Skins for Oracle APEX Applications',
'* http://www.apex-themes.com',
'* Copyright (c) 2011 Creative Mode',
'* This file is protected by copyright law and provided under license.',
'* Unauthorised copying of this file is strictly prohibited.'))
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(524954937203896531)
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
,p_reference_id=>524949340311821681
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
 p_id=>wwv_flow_api.id(121344771578247)
,p_template_name=>'HTML button (legacy - APEX 5 migration)'
,p_template=>' <input type="button" value="#LABEL#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_hot_template=>' <input type="button" value="#LABEL#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_translate_this_template=>'N'
,p_theme_class_id=>13
,p_theme_id=>313
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(524974627110896553)
,p_template_name=>'Text only'
,p_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_hot_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
,p_reference_id=>524969030218821703
,p_translate_this_template=>'N'
,p_theme_class_id=>9
,p_theme_id=>313
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(524975434385896554)
,p_template_name=>'Icon only'
,p_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" title="#LABEL#"><i class="fa #BUTTON_ATTRIBUTES#"></i></button>'
,p_hot_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" title="#LABEL#"><i class="fa #BUTTON_ATTRIBUTES#"></i></button>'
,p_reference_id=>524969837493821704
,p_theme_class_id=>8
,p_theme_id=>313
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(524976227069896554)
,p_template_name=>'Right icon'
,p_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#">#LABEL# <i class="fa #BUTTON_ATTRIBUTES#"></i></button>'
,p_hot_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#">#LABEL# <i class="fa #BUTTON_ATTRIBUTES#"></i></button>'
,p_reference_id=>524970630177821704
,p_theme_class_id=>2
,p_theme_id=>313
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(524976441906896554)
,p_template_name=>'Left icon'
,p_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#"><i class="fa #BUTTON_ATTRIBUTES#"></i> #LABEL#</button>'
,p_hot_template=>'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#"><i class="fa #BUTTON_ATTRIBUTES#"></i> #LABEL#</button>'
,p_reference_id=>524970845014821704
,p_theme_class_id=>5
,p_theme_id=>313
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(524976635139896554)
,p_template_name=>'Dropdown option'
,p_template=>'<li><a id="#BUTTON_ID#" href="#LINK#" alt="#LABEL#"><i class="fa #BUTTON_ATTRIBUTES#"></i> #LABEL#</a></li>'
,p_hot_template=>'<li><a id="#BUTTON_ID#" href="#LINK#" alt="#LABEL#"><i class="fa #BUTTON_ATTRIBUTES#"></i> #LABEL#</a></li>'
,p_reference_id=>524971038247821704
,p_theme_class_id=>1
,p_theme_id=>313
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(84183227876572727)
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
,p_reference_id=>84177630984497877
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524956441156896534)
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
,p_reference_id=>524950844264821684
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524957327694896534)
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
,p_reference_id=>524951730802821684
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524958247123896535)
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
,p_reference_id=>524952650231821685
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524958835947896536)
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
,p_reference_id=>524953239055821686
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524961247111896538)
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
,p_reference_id=>524955650219821688
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524961532541896538)
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
,p_reference_id=>524955935649821688
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524961829157896538)
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
,p_reference_id=>524956232265821688
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524964249240896540)
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
,p_reference_id=>524958652348821690
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524964537325896540)
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
,p_reference_id=>524958940433821690
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
 p_id=>wwv_flow_api.id(524964836096896540)
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
,p_reference_id=>524959239204821690
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524965123033896540)
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
,p_reference_id=>524959526141821690
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(524965428785896541)
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
,p_reference_id=>524959831893821691
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(524971433690896548)
,p_list_template_current=>'<li class="active"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Navigation tab'
,p_theme_id=>313
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul class="nav nav-tabs">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>524965836798821698
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(524972040788896549)
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
,p_reference_id=>524966443896821699
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(524966324975896545)
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
,p_reference_id=>524960728083821695
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(524966324975896545)
,p_row_template_before_first=>'<tr class="grid-row highl">'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(524967233551896546)
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
,p_reference_id=>524961636659821696
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(524967233551896546)
,p_row_template_before_first=>'<tr class="grid-row highl">'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(524967524528896546)
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
,p_reference_id=>524961927636821696
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(524967524528896546)
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
 p_id=>wwv_flow_api.id(524973520615896551)
,p_template_name=>'Without label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'</label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">'
,p_after_item=>'</div>'
,p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>'
,p_theme_id=>313
,p_theme_class_id=>13
,p_reference_id=>524967923723821701
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(524973645529896551)
,p_template_name=>'Optional label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'</label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">'
,p_after_item=>'</div>'
,p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>'
,p_theme_id=>313
,p_theme_class_id=>3
,p_reference_id=>524968048637821701
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(524973732564896551)
,p_template_name=>'Optional label with help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><a href="javascript:afw.afw_21.actio_dynmq.aide_page_item.afich(''#CURRENT_ITEM_ID#'');" tabindex="-1">'
,p_template_body2=>'</a></label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">'
,p_after_item=>'</div>'
,p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>'
,p_theme_id=>313
,p_theme_class_id=>1
,p_reference_id=>524968135672821701
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(524973827299896551)
,p_template_name=>'Required label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><span class="indic_champ_oblig">*</span><span class="texte_champ_oblig">'
,p_template_body2=>'</span></label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">'
,p_after_item=>'</div>'
,p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>'
,p_theme_id=>313
,p_theme_class_id=>4
,p_reference_id=>524968230407821701
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(524973931159896551)
,p_template_name=>'Required label with help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><span class="indic_champ_oblig">*</span><span class="texte_champ_oblig"><a href="javascript:afw.afw_21.actio_dynmq.aide_page_item.afich(''#CURRENT_ITEM_ID#'')" tabindex="-1">'
,p_template_body2=>'</a></span></label>'
,p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">'
,p_after_item=>'</div>'
,p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>'
,p_theme_id=>313
,p_theme_class_id=>2
,p_reference_id=>524968334267821701
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
 p_id=>wwv_flow_api.id(524977337481896555)
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
,p_reference_id=>524971740589821705
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
 p_id=>wwv_flow_api.id(524977023718896555)
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
,p_reference_id=>524971426826821705
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(524977523154896556)
,p_theme_id=>313
,p_theme_name=>'AFW - Bootstrap 3.0.0'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(524952624617896527)
,p_error_template=>wwv_flow_api.id(524954937203896531)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(524953424161896528)
,p_default_button_template=>wwv_flow_api.id(524976635139896554)
,p_default_region_template=>wwv_flow_api.id(524964836096896540)
,p_default_form_template=>wwv_flow_api.id(524961532541896538)
,p_default_reportr_template=>wwv_flow_api.id(524964537325896540)
,p_default_tabform_template=>wwv_flow_api.id(524961247111896538)
,p_default_wizard_template=>wwv_flow_api.id(524957634847896534)
,p_default_listr_template=>wwv_flow_api.id(524964537325896540)
,p_default_irr_template=>wwv_flow_api.id(524965123033896540)
,p_default_report_template=>wwv_flow_api.id(524967524528896546)
,p_default_label_template=>wwv_flow_api.id(524973645529896551)
,p_default_calendar_template=>wwv_flow_api.id(524977023718896555)
,p_default_option_label=>wwv_flow_api.id(524973732564896551)
,p_default_required_label=>wwv_flow_api.id(524973931159896551)
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
 p_id=>wwv_flow_api.id(524977523154896556)
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
 p_id=>wwv_flow_api.id(566276935672263376)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Accès refusé par la sécurité de l''application'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566279019508263379)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Accès refusé par la sécurité page'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566282035787263381)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur ne concorde pas avec le format %0.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566285229519263383)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Accéder'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566288418456263385)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur doit être numérique.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566291644322263387)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur obligatoire.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566294829836263389)
,p_name=>'APEXIR_3D'
,p_message_language=>'fr-ca'
,p_message_text=>'3D'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566298033048263392)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'Menu d''actions'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566300647024263393)
,p_name=>'APEXIR_ADD'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566303632989263400)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aggréger'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566306823120263401)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Aggrégation'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566310030811263404)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'fr-ca'
,p_message_text=>'Moyenne22'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566313230582263406)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>'Calculer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566316440381263407)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'fr-ca'
,p_message_text=>'Médianne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566319644143263409)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'fr-ca'
,p_message_text=>'Somme'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566322849518263411)
,p_name=>'APEXIR_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566326018628263415)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Toutes les colonnes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566329232282263420)
,p_name=>'APEXIR_AND'
,p_message_language=>'fr-ca'
,p_message_text=>'AND'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566332432321263422)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'fr-ca'
,p_message_text=>'Appliquer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566335626795263424)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Ascendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566338837104263425)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a '
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566342049228263427)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'fr-ca'
,p_message_text=>'entre (BETWEEN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566345234590263428)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Couleur de fond'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566348440553263430)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Bleu'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566351622868263433)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'fr-ca'
,p_message_text=>'En bas'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566354842667263434)
,p_name=>'APEXIR_CALENDAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Calendrier'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566358041566263436)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Annuler'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566361246847263438)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'fr-ca'
,p_message_text=>'Catégorie'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566364420295263440)
,p_name=>'APEXIR_CELL'
,p_message_language=>'fr-ca'
,p_message_text=>'Cellule'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566367638799263442)
,p_name=>'APEXIR_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Graphique'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566370920313263445)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'fr-ca'
,p_message_text=>'Initialisation...'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566374143719263448)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566377350208263452)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Choisir le format de téléchargement du rapport'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566380540273263454)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'fr-ca'
,p_message_text=>'effacer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566383745415263456)
,p_name=>'APEXIR_CLOSE'
,p_message_language=>'fr-ca'
,p_message_text=>'Fermer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566386938424263460)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566390144345263463)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonnes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566393326183263466)
,p_name=>'APEXIR_COLUMN_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>'Entête de la colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566396536833263468)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'Menu d''entête de colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566399747434263477)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'fr-ca'
,p_message_text=>'contient'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566402941961263480)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'fr-ca'
,p_message_text=>'ne contient pas'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566406150378263483)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'fr-ca'
,p_message_text=>'est dans (IN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566409322045263486)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'n''est pas dans le dernier'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566412530901263488)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'n''est pas dans le suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566415725992263492)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'est dans le dernier'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566418344851263496)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'est dans le suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566421337749263498)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'n''est pas nul (IS NOT NULL)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566424523729263500)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'est nul (IS NULL)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566427721358263503)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'fr-ca'
,p_message_text=>'comme (LIKE)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566430949112263505)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'fr-ca'
,p_message_text=>'n''est pas dans (NOT IN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566434131551263509)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'fr-ca'
,p_message_text=>'pas comme (NOT LIKE)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566437337270263512)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'fr-ca'
,p_message_text=>'expression dans'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566440529427263514)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Calcul'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566443746355263517)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Créer un calcul en utilisant un alias pour les colonnes.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566446925813263522)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'fr-ca'
,p_message_text=>'Calculer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566450126556263535)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Regroupement'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566453328015263537)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'fr-ca'
,p_message_text=>'Regrouper'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566456528987263540)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'Données telles qu''elle était il y a %0 minute(s)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566459719342263542)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>'Défaut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566462921371263545)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566466136922263547)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>'Voulez-vous vraiment supprimer cette paramétrisation?'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566469331399263548)
,p_name=>'APEXIR_DELETE_CONFIRM_JS_DIALOG'
,p_message_language=>'fr-ca'
,p_message_text=>'Voulez-vous vraiment supprimer cet enregistrement?'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566472520161263550)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Effacer le rapport'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566475727947263552)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Descendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566478919629263554)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Détail'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566482131665263555)
,p_name=>'APEXIR_DISABLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Désactiver'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566485345512263557)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'fr-ca'
,p_message_text=>'Désactivé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566488528965263559)
,p_name=>'APEXIR_DISPLAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566491747134263560)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'fr-ca'
,p_message_text=>'Affiché'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566494949840263563)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne(s) affichée(s)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566498123546263571)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne(s) à afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566501349087263573)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'fr-ca'
,p_message_text=>'Descendre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566504535814263575)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'fr-ca'
,p_message_text=>'Télécharger'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566507749660263576)
,p_name=>'APEXIR_DO_NOT_AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'- Ne pas aggréger -',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566510922703263578)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne(s) à ne pas afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566514123890263580)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier les paramètres du graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566517342334263581)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'fr-ca'
,p_message_text=>'Paramètres du graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566520536845263584)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier le filtre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566523722335263586)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier la mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566527029239263588)
,p_name=>'APEXIR_ENABLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Activer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566530234268263589)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'fr-ca'
,p_message_text=>'Activé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566533426331263591)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'fr-ca'
,p_message_text=>'Activer/Désactiver'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566536643778263592)
,p_name=>'APEXIR_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566539019140263594)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'fr-ca'
,p_message_text=>'Exemples'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566542221178263595)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'Exclure les valeurs nulles'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566545442270263597)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566548619280263602)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtres'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566551822355263604)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de filtre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566555021839263607)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'fr-ca'
,p_message_text=>'Choisir les colonnes pour la recherche'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566558219726263608)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>'Retour en arrière'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566561421377263610)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Une requête avec retour en arrière permet de voir les données telles qu''elles étaient au moment choisi.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566564644091263612)
,p_name=>'APEXIR_FLASHBACK_ERROR_MSG'
,p_message_language=>'fr-ca'
,p_message_text=>'Impossible d''exécutée la requête avec retour en arrière'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566567831474263614)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'fr-ca'
,p_message_text=>'Masque de saisie'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566571034051263615)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Fonction'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566574233517263617)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Fonctions'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566577433235263618)
,p_name=>'APEXIR_GO'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566580621757263620)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'fr-ca'
,p_message_text=>'Vert'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566583838742263622)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'fr-ca'
,p_message_text=>'Grouper par'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566587048365263624)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Grouper par colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566590246197263626)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne horizontale'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566593439111263628)
,p_name=>'APEXIR_HELP'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566596629277263633)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'fr-ca'
,p_message_text=>'Un rapport interactif affiche un jeu de colonne prédéterminé. Le rapport peut être personnalisé davantage avec l''utilisation d''un filtre initial, d''un tri par défaut, des bris, du surlignage, des calculs, des aggrégations et d''un graphique. Chaque ra'
||'pport interactif peuvent donc être personnalisés davantage et les résultats peuvent être visionnés, téléchargés et la définition du rapport peut être sauvegardé pour une utilisation ultérieure.<p/>Un rapport interactif peut est personnalisé à trois n'
||'iveaux: la barre de recherche, le menu d''action et l''entête des menus.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566599835031263634)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'Le menu d''actions est utilisé pour personnaliser l''affchage de votre rapport interactif.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566603050296263637)
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
 p_id=>wwv_flow_api.id(566606240872263639)
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
 p_id=>wwv_flow_api.id(566609443122263640)
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
 p_id=>wwv_flow_api.id(566612637380263642)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Utilisé pour créer un regroupement sur une ou plusieurs colonnes. On sort les colonnes du rapport interactif et on les affiche comme des colonnes de bri.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566615822068263644)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'fr-ca'
,p_message_text=>'Permet de télécharger le jeu de données courant. Les types de fichiers disponibles diffèrent selon votre installation. Les différents types sont CSV, XLS, PDF et RTF.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566619026360263646)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Sert à ajouter ou modifier un énoncé WHERE pour la requête. D''abord, choisir une colonne (il n''est pas nécessaire qu''elle soit affichée), choisir parmi la liste des opérateurs Oracle (=, !=, not in, between), saisir une expression pour la comparaison'
||'. L''expression est sensible à la casse et vous pouvez utiliser % comme caractère de remplacement (ex.: NOM_PROVINCE like Q%).'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566622228651263648)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>'Exécute une requête de « retour en arrière » permettant de voir les données telles qu''elles étaient dans le passé à un moment donné. Le « retour en arrière » par défaut est de 3 heures (ou 180 minutes) mais ce chiffre diffère selon la base de données'
||'.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566625442957263651)
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
 p_id=>wwv_flow_api.id(566628645569263653)
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
 p_id=>wwv_flow_api.id(566631836879263655)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'fr-ca'
,p_message_text=>'Réinitialiser le rapport avec les paramètres initiaux, supprimer toutes les personnalisations que vous avez fait.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566635041762263656)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Sauvegarde le rapport personnalisé pour une utilisation utltérieure. Vous devez fournir un nom et une description optionnelle.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566638248521263663)
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
 p_id=>wwv_flow_api.id(566641450231263665)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Utilisé pour modifier les colonnes affichées. Les colonnes à droite sont affichées. Les colonnes à gauche sont cachés. Vous pouvez repositionner les colonnes affichées en utilisant les flèches à l''extrême droite. Les colonnes calculées sont préfixées'
||' par <b>**</b>.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566644624645263669)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Utilisé pour changer l''ordonnancement des colonnes (ascandant et descandat). Vous pouvez aussi spécifier commet gérer les valeurs nulles (utilise le paramètre par défaut, toujours afficher en premier ou en dernier). Une icône affichera le type de tri'
||' à la droite de l''entête d''une colonne.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566647849261263670)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Cacher colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566651027279263672)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Mettre en évidence'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566654240238263674)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'fr-ca'
,p_message_text=>'Condition de mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566657449394263676)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566660627174263677)
,p_name=>'APEXIR_HIGHLIGHT_WHEN'
,p_message_language=>'fr-ca'
,p_message_text=>'Mis en évidence quand'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566663827193263681)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide pour le rapport interactif'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566667028990263685)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>'Invalide'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566670249006263687)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Expression de calcul invalide'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566673426275263689)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'fr-ca'
,p_message_text=>'Touche du clavier numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566676639902263692)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Libellé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566679139104263694)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Titre (axe des X)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566682336114263696)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Déplacer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566685541022263699)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Déplacer tout'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566688733493263701)
,p_name=>'APEXIR_NAME'
,p_message_language=>'fr-ca'
,p_message_text=>'Nom'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566691936874263705)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Nouvelle aggrégation'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566695132564263712)
,p_name=>'APEXIR_NEW_CATEGORY'
,p_message_language=>'fr-ca'
,p_message_text=>'- Nouvelle catégorie -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566698342318263713)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Nouveau calcul'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566701518040263717)
,p_name=>'APEXIR_NO'
,p_message_language=>'fr-ca'
,p_message_text=>'Non'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566704730581263721)
,p_name=>'APEXIR_NONE'
,p_message_language=>'fr-ca'
,p_message_text=>'- Aucun -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566707936653263725)
,p_name=>'APEXIR_NO_AGGREGATION_DEFINED'
,p_message_language=>'fr-ca'
,p_message_text=>'Aucune aggrégation définie'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566711143051263731)
,p_name=>'APEXIR_NO_COMPUTATION_DEFINED'
,p_message_language=>'fr-ca'
,p_message_text=>'Aucun calcul défini'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566714345598263733)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur nulle toujours au début'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566717537722263742)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur nulle toujours à la fin'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566720723126263743)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier valeur nulle'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566723932557263745)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'fr-ca'
,p_message_text=>'Le moment du retour en arrière doit être numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566727146367263749)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'fr-ca'
,p_message_text=>'La séquence doit être numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566730319471263752)
,p_name=>'APEXIR_NUM_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangées'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566733541477263754)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Opérateur'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566736742156263756)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'fr-ca'
,p_message_text=>'Autre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566739925299263759)
,p_name=>'APEXIR_RED'
,p_message_language=>'fr-ca'
,p_message_text=>'Rouge'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566743144526263762)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Enlever'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566746319348263773)
,p_name=>'APEXIR_REMOVE_AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>'Enlever toutes les aggrégations'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566749546848263776)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Enlever tout'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566752729330263778)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Enlever le regroupement'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566755926958263783)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer filtre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566759124665263787)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer Retour en arrière'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566762330849263792)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer la mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566765049076263798)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>'Paramètres d''un rapport'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566767921126263801)
,p_name=>'APEXIR_RESET'
,p_message_language=>'fr-ca'
,p_message_text=>'Réinitialiser'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566771136270263803)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>'Réinitialiser le rapport avec les paramètres initiaux.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566774320360263807)
,p_name=>'APEXIR_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangée'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566777518834263809)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangées'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566780725072263813)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangées par page'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566783942218263818)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'fr-ca'
,p_message_text=>'La rangée contient'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566787118027263820)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Appliquer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566790345954263821)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport sauvé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566793546051263825)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport sauvé = "%0"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566796739781263837)
,p_name=>'APEXIR_SAVE_AS_DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>'Sauvegardée en tant que valeur par défaut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566799935715263838)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>'La paramétrisation du rapport courant est utilisée comme valeur par défaut pour tous les utilisateurs'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566803150397263840)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Enregistrer rapport'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566806334999263842)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Barre de recherche'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566809535447263844)
,p_name=>'APEXIR_SELECT_CATEGORY'
,p_message_language=>'fr-ca'
,p_message_text=>'- Choisir catégorie -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566812728969263845)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'- Choisir une colonne -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566815926876263847)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Choisir colonnes'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566819150372263849)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>'- Choisir fonction -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566822344920263850)
,p_name=>'APEXIR_SELECT_SORT_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'- Choisir une colonne -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566825528083263852)
,p_name=>'APEXIR_SELECT_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur sélectionnée'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566828744853263854)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'fr-ca'
,p_message_text=>'Séquence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566831928770263855)
,p_name=>'APEXIR_SORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566835127584263858)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Tri ascendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566838339803263859)
,p_name=>'APEXIR_SORT_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier par colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566841519170263861)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Tri descendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566844747081263865)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'fr-ca'
,p_message_text=>'espace'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566847950343263868)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'fr-ca'
,p_message_text=>'Statut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566851147319263870)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Couleur du texte'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566854337721263875)
,p_name=>'APEXIR_TOP'
,p_message_language=>'fr-ca'
,p_message_text=>'En haut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566857527569263877)
,p_name=>'APEXIR_UP'
,p_message_language=>'fr-ca'
,p_message_text=>'Monter'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566860725477263880)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566863943041263882)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Titre (axe des Y)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566867133780263886)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566870332786263888)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir tableau'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566873538322263890)
,p_name=>'APEXIR_VIEW_REPORT '
,p_message_language=>'fr-ca'
,p_message_text=>'Voir tableau'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566876728592263892)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Vue générale'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566879648138263893)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'fr-ca'
,p_message_text=>'Jaune'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566882436196263895)
,p_name=>'APEXIR_YES'
,p_message_language=>'fr-ca'
,p_message_text=>'Oui'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566885619590263896)
,p_name=>'APEXLIB_ITEM_INVALID_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Le format de la valeur du champ <span class="t18Requiredlabel">%label</span> est invalide ("%0" (ex. %1))'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566888847579263898)
,p_name=>'APEXLIB_ITEM_INVALID_FORMAT_INLINE'
,p_message_language=>'fr-ca'
,p_message_text=>'Format "%0"<br>ex. %1'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566892032499263900)
,p_name=>'APEXLIB_ITEM_LESS_OR_EQUAL'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur du champ <span class="t18Requiredlabel">%label</span> doit être inférieure ou égale à la valeur "<b>%0</b>"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566895220480263901)
,p_name=>'APEXLIB_ITEM_LESS_OR_EQUAL_INLINE'
,p_message_language=>'fr-ca'
,p_message_text=>'Doit être inférieure ou<br/>égale à "<b>%0</b>"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566898440282263903)
,p_name=>'APEXLIB_ITEM_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur du champ <span class="t18Requiredlabel">%label</span> est obligatoire'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566901621756263904)
,p_name=>'APEXLIB_ITEM_REQUIRED_INLINE'
,p_message_language=>'fr-ca'
,p_message_text=>'est obligatoire'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566904846086263906)
,p_name=>'APEXLIB_TABFORM_COLUMN_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'%label est obligatoire'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566908043068263908)
,p_name=>'APEXLIB_TABFORM_GREATER_OR_EQUAL'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur du champ %label doit être supérieure ou égale à la valeur "<b>%0</b>"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566911249540263909)
,p_name=>'APEXLIB_TABFORM_INVALID_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Le format de la valeur du champ <span class="t18Requiredlabel">%label</span> est invalide ("%0" (ex. %1))'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566914445930263911)
,p_name=>'APEXLIB_TABFORM_LESS_OR_EQUAL'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur du champ <span class="t18Requiredlabel">%label</span> doit être inférieure ou égale à la valeur "<b>%0</b>"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566917626269263913)
,p_name=>'APEXLIB_TABFORM_ROW_PREFIX'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangée %0:'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566920839537263914)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'<b>Il s''est produit une erreur :</b>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566924038493263916)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'<b>Il s''est produit %0 erreurs :</b>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566927227517263918)
,p_name=>'FORM_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 de %1'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566930450703263921)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'fr-ca'
,p_message_text=>'La plage de données est invalide.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566933620216263922)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566936840254263924)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'fr-ca'
,p_message_text=>'Précédent'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566940046989263926)
,p_name=>'RESET'
,p_message_language=>'fr-ca'
,p_message_text=>'Réinitialiser'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566943242420263928)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'minutes.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566946437415263931)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier par cette colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566949631614263933)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangée(s) %0 - %1 de plus que %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566952830194263936)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'fr-ca'
,p_message_text=>'Rangée(s) %0 - %1 de %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(566956031973263938)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 - %1 de %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1559045659139237561)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'fr_ca'
,p_message_text=>'Permet de télécharger le jeu de données courant. Les types de fichiers disponibles diffèrent selon votre installation. Les différents types sont CSV, XLS, PDF et RTF.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562907442663454640)
,p_name=>'APEXIR_VIEW_REPORT '
,p_message_text=>'Voir tableau'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562907561471454640)
,p_name=>'APEXIR_ADD'
,p_message_text=>'Add'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562907646976454640)
,p_name=>'APEXIR_AGGREGATE'
,p_message_text=>'Aggréger'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562907736129454640)
,p_name=>'APEXIR_AGGREGATION'
,p_message_text=>'Aggrégation'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562907848488454640)
,p_name=>'APEXIR_AGG_AVG'
,p_message_text=>'Moyenne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562907955570454640)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_text=>'Calculer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562908064032454640)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_text=>'Médianne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562908142267454640)
,p_name=>'APEXIR_AGG_SUM'
,p_message_text=>'Somme'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562908255704454641)
,p_name=>'APEXIR_ALL'
,p_message_text=>'Tout'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562908359730454641)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_text=>'Toutes les colonnes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562908432387454641)
,p_name=>'APEXIR_AND'
,p_message_text=>'AND'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562908537161454641)
,p_name=>'APEXIR_APPLY'
,p_message_text=>'Save'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562908632123454641)
,p_name=>'APEXIR_ASCENDING'
,p_message_text=>'Ascendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562908739402454641)
,p_name=>'APEXIR_AS_OF'
,p_message_text=>'Il y a '
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562908839212454641)
,p_name=>'APEXIR_BETWEEN'
,p_message_text=>'entre (BETWEEN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562908942507454641)
,p_name=>'APEXIR_BGCOLOR'
,p_message_text=>'Couleur de fond'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562909034369454641)
,p_name=>'APEXIR_BLUE'
,p_message_text=>'Bleu'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562909163864454641)
,p_name=>'APEXIR_BOTTOM'
,p_message_text=>'En bas'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562909236873454641)
,p_name=>'APEXIR_CALENDAR'
,p_message_text=>'Calendar'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562909355853454641)
,p_name=>'APEXIR_CANCEL'
,p_message_text=>'Cancel'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562909463245454641)
,p_name=>'APEXIR_CATEGORY'
,p_message_text=>'Category'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562909556749454641)
,p_name=>'APEXIR_CELL'
,p_message_text=>'Cellule'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562909641238454641)
,p_name=>'APEXIR_CHART'
,p_message_text=>'Graphique'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562909736673454641)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_text=>'Initialisation...'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562909848707454641)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_text=>'Type de graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562909958373454643)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_text=>'Choisir le format de téléchargement du rapport'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562910061775454643)
,p_name=>'APEXIR_CLOSE'
,p_message_text=>'Fermer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562910161727454643)
,p_name=>'APEXIR_COLUMN'
,p_message_text=>'Column'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562910257619454643)
,p_name=>'APEXIR_COLUMNS'
,p_message_text=>'Colonnes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562910340391454643)
,p_name=>'APEXIR_COLUMN_HEADING'
,p_message_text=>'Entête de la colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562910461404454643)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_text=>'contient'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562910558844454643)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_text=>'ne contient pas'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562910647427454643)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_text=>'est dans (IN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562910733599454643)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_text=>'n''est pas dans le dernier'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562910863864454643)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_text=>'n''est pas dans le suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562910952010454643)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_text=>'est dans le dernier'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562911045377454643)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_text=>'est dans le suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562911135386454643)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_text=>'n''est pas nul (IS NOT NULL)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562911251234454643)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_text=>'est nul (IS NULL)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562911331984454643)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_text=>'comme (LIKE)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562911443624454643)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_text=>'n''est pas dans (NOT IN)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562911531683454643)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_text=>'pas comme (NOT LIKE)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562911664264454643)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_text=>'expression dans'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562911757642454644)
,p_name=>'APEXIR_COMPUTATION'
,p_message_text=>'Calcul'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562911863890454644)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Créer un calcul en utilisant un alias pour les colonnes.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562911958654454644)
,p_name=>'APEXIR_COMPUTE'
,p_message_text=>'Calculer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562912049840454644)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_text=>'Regroupement'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562912162722454644)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_text=>'Regrouper'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562912242464454644)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_text=>'Données telles qu''elle était il y a %0 minute(s)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562912349154454644)
,p_name=>'APEXIR_DEFAULT'
,p_message_text=>'Default'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562912432105454644)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_text=>'Voulez-vous vraiment supprimer cette paramétrisation?'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562912538704454644)
,p_name=>'APEXIR_DELETE_CONFIRM_JS_DIALOG'
,p_message_text=>'Voulez-vous vraiment supprimer cet enregistrement?'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562912654726454644)
,p_name=>'APEXIR_DESCENDING'
,p_message_text=>'Descendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562912744570454644)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_text=>'Détail'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562912853233454644)
,p_name=>'APEXIR_DISABLE'
,p_message_text=>'Désactiver'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562912935727454644)
,p_name=>'APEXIR_DISABLED'
,p_message_text=>'Désactivé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562913038490454644)
,p_name=>'APEXIR_DISPLAYED'
,p_message_text=>'Affiché'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562913158302454644)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_text=>'Colonne(s) affichée(s)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562913234408454644)
,p_name=>'APEXIR_DOWN'
,p_message_text=>'Descendre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562913362464454644)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_text=>'Télécharger'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562913459613454644)
,p_name=>'APEXIR_DO_NOT_AGGREGATE'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'- Ne pas aggréger -',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562913540429454644)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_text=>'Colonne(s) à ne pas afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562913651573454646)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_text=>'Modifier les paramètres du graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562913747748454646)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_text=>'Modifier la mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562913849802454646)
,p_name=>'APEXIR_ENABLED'
,p_message_text=>'Activé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562913949039454646)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_text=>'Activer/Désactiver'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562914062390454646)
,p_name=>'APEXIR_ERROR'
,p_message_text=>'Error'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562914143157454646)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_text=>'Exclure les valeurs nulles'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562914260063454646)
,p_name=>'APEXIR_FILTER'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562914361930454646)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_text=>'Choisir les colonnes pour la recherche'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562914437742454646)
,p_name=>'APEXIR_FLASHBACK'
,p_message_text=>'Retour en arrière'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562914542949454646)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Une requête avec retour en arrière permet de voir les données telles qu''elles étaient au moment choisi.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562914658026454646)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_text=>'Masque de saisie'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562914758466454646)
,p_name=>'APEXIR_FUNCTION'
,p_message_text=>'Fonction'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562914858474454646)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_text=>'Fonctions'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562914959290454646)
,p_name=>'APEXIR_GO'
,p_message_text=>'Search'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562915050454454646)
,p_name=>'APEXIR_GREEN'
,p_message_text=>'Vert'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562915134678454646)
,p_name=>'APEXIR_HCOLUMN'
,p_message_text=>'Colonne horizontale'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562915252788454646)
,p_name=>'APEXIR_HELP_RESET'
,p_message_text=>'Réinitialiser le rapport avec les paramètres initiaux, supprimer toutes les personnalisations que vous avez fait.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562915358536454646)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_text=>'Cacher colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562915450677454647)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_text=>'Condition de mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562915557079454647)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_text=>'Type de mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562915645691454647)
,p_name=>'APEXIR_HIGHLIGHT_WHEN'
,p_message_text=>'Mis en évidence quand'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562915736080454647)
,p_name=>'APEXIR_INVALID'
,p_message_text=>'Invalide'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562915849680454647)
,p_name=>'APEXIR_KEYPAD'
,p_message_text=>'Touche du clavier numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562915951082454647)
,p_name=>'APEXIR_LABEL'
,p_message_text=>'Label'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562916038850454647)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_text=>'Titre (axe des X)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562916132121454647)
,p_name=>'APEXIR_MOVE'
,p_message_text=>'Déplacer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562916234860454647)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_text=>'Déplacer tout'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562916352064454647)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_text=>'Nouvelle aggrégation'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562916431817454647)
,p_name=>'APEXIR_NEW_CATEGORY'
,p_message_text=>'- Nouvelle catégorie -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562916538189454647)
,p_name=>'APEXIR_NO'
,p_message_text=>'No'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562916651359454647)
,p_name=>'APEXIR_NONE'
,p_message_text=>'- None -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562916757909454647)
,p_name=>'APEXIR_NO_AGGREGATION_DEFINED'
,p_message_text=>'Aucune aggrégation définie'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562916856633454647)
,p_name=>'APEXIR_NO_COMPUTATION_DEFINED'
,p_message_text=>'Aucun calcul défini'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562916955542454647)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_text=>'Valeur nulle toujours au début'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562917055060454647)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_text=>'Valeur nulle toujours à la fin'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562917147239454647)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_text=>'Le moment du retour en arrière doit être numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562917248659454647)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_text=>'La séquence doit être numérique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562917358649454649)
,p_name=>'APEXIR_NUM_ROWS'
,p_message_text=>'Rangées'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562917443675454649)
,p_name=>'APEXIR_OPERATOR'
,p_message_text=>'Opérateur'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562917555832454649)
,p_name=>'APEXIR_OTHER'
,p_message_text=>'Autre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562917648218454649)
,p_name=>'APEXIR_RED'
,p_message_text=>'Rouge'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562917759346454649)
,p_name=>'APEXIR_REMOVE'
,p_message_text=>'Enlever'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562917851188454649)
,p_name=>'APEXIR_REMOVE_AGGREGATE'
,p_message_text=>'Enlever toutes les aggrégations'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562917956231454649)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_text=>'Enlever tout'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562918064383454650)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_text=>'Enlever le regroupement'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562918157649454650)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_text=>'La rangée contient'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562918233308454650)
,p_name=>'APEXIR_SAVE'
,p_message_text=>'Save'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562918357322454650)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_text=>'Rapport sauvé'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562918462734454650)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_text=>'Rapport sauvé = "%0"'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562918542036454650)
,p_name=>'APEXIR_SAVE_AS_DEFAULT'
,p_message_text=>'Sauvegardée en tant que valeur par défaut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562918648409454650)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_text=>'La paramétrisation du rapport courant est utilisée comme valeur par défaut pour tous les utilisateurs'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562918737840454650)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_text=>'Enregistrer rapport'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562918863768454650)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_text=>'Barre de recherche'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562918954566454650)
,p_name=>'APEXIR_SELECT_CATEGORY'
,p_message_text=>'- Choose category -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562919040707454650)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_text=>'- Choose a column -'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562919132245454650)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_text=>'Choisir colonnes'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562919260128454650)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_text=>'- Choose function -'
);
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562919357655454650)
,p_name=>'APEXIR_SELECT_VALUE'
,p_message_text=>'Valeur sélectionnée'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562919456148454650)
,p_name=>'APEXIR_SEQUENCE'
,p_message_text=>'Séquence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562919548485454650)
,p_name=>'APEXIR_SORT'
,p_message_text=>'Trier'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562919634249454650)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_text=>'Tri ascendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562919743869454652)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_text=>'Tri descendant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562919833905454652)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_text=>'Couleur du texte'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562919937781454652)
,p_name=>'APEXIR_TOP'
,p_message_text=>'En haut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562920046720454652)
,p_name=>'APEXIR_UP'
,p_message_text=>'Monter'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562920160010454652)
,p_name=>'APEXIR_YELLOW'
,p_message_text=>'Jaune'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562920236728454652)
,p_name=>'APEXIR_YES'
,p_message_text=>'Yes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562920354687454652)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_text=>'<b>Il s''est produit une erreur :</b>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562920454373454652)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_text=>'<b>Il s''est produit %0 erreurs :</b>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562920562574454652)
,p_name=>'PAGINATION.NEXT'
,p_message_text=>'Suivant'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562920663052454652)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_text=>'Précédent'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562920741150454652)
,p_name=>'RESET'
,p_message_text=>'Reset'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562920851008454652)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_text=>'minutes.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562920962288454652)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_text=>'Trier par cette colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562921041950454652)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_text=>'Rangée(s) %0 - %1 de plus que %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562921160938454652)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_text=>'Rangée(s) %0 - %1 de %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562921258657454652)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_text=>'%0 - %1 de %2'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562921348807454652)
,p_name=>'APEXIR_ROWS'
,p_message_text=>'Rangées'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562921438591454652)
,p_name=>'APEXIR_RESET'
,p_message_text=>'Reset'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562921557716454654)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_text=>'Réinitialiser le rapport avec les paramètres initiaux.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562921638040454654)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_text=>'Voir graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562921755007454654)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_text=>'Voir tableau'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562921858851454654)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_text=>'Paramètres du graphique'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562921961444454654)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_text=>'Vue générale'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562922032534454654)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_text=>'Titre (axe des Y)'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562922148521454654)
,p_name=>'APEXIR_DELETE'
,p_message_text=>'Delete'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562922237816454654)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_text=>'Effacer le rapport'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562922347442454654)
,p_name=>'APEXIR_DISPLAY'
,p_message_text=>'Afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562922457251454654)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_text=>'Colonne(s) à afficher'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562922542754454654)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_text=>'Modifier le filtre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562922656167454654)
,p_name=>'APEXIR_EXAMPLES'
,p_message_text=>'Exemples'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562922745123454654)
,p_name=>'APEXIR_FILTERS'
,p_message_text=>'Filtres'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562922847554454654)
,p_name=>'APEXIR_FLASHBACK_ERROR_MSG'
,p_message_text=>'Impossible d''exécutée la requête avec retour en arrière'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562922949480454654)
,p_name=>'APEXIR_HELP'
,p_message_text=>'Help'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562923058474454654)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_text=>'Mettre en évidence'
,p_is_js_message=>true
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562923161190454654)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_text=>'Expression de calcul invalide'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562923233953454654)
,p_name=>'APEXIR_NAME'
,p_message_text=>'Name'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562923335865454654)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_text=>'Nouveau calcul'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562923434895454655)
,p_name=>'APEXIR_VALUE'
,p_message_text=>'Value'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562923553839454655)
,p_name=>'APEXIR_3D'
,p_message_text=>'3D'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562923638534454655)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_text=>'Permet de télécharger le jeu de données courant. Les types de fichiers disponibles diffèrent selon votre installation. Les différents types sont CSV, XLS, PDF et RTF.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562923732333454655)
,p_name=>'APEXIR_HELP_01'
,p_message_text=>'Un rapport interactif affiche un jeu de colonne prédéterminé. Le rapport peut être personnalisé davantage avec l''utilisation d''un filtre initial, d''un tri par défaut, des bris, du surlignage, des calculs, des aggrégations et d''un graphique. Chaque ra'
||'pport interactif peuvent donc être personnalisés davantage et les résultats peuvent être visionnés, téléchargés et la définition du rapport peut être sauvegardé pour une utilisation ultérieure.<p/>Un rapport interactif peut est personnalisé à trois n'
||'iveaux: la barre de recherche, le menu d''action et l''entête des menus.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562923838602454655)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_text=>'Le menu d''actions est utilisé pour personnaliser l''affchage de votre rapport interactif.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562923947058454655)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Les aggrégations sont des calculs mathématiques applicables sur une colonne. Les aggrégations sont affichés après chaque bri et à la fin du rapport dans les colonnes sur lesquelles ils sont définis.',
'<p/>',
'<ul><li><b>Aggréger</b> permet de sélectionner et d''éditer une aggrégation définie précédemment.</li>',
'<li><b>Fonction</b> est utilisé pour choisir la fonction qui sera appliquée (ex.: Somme, Minimum).</li>',
'<li><b>Colonne</b> est utilisé pour choisir la colonne sur laquelle on appliquera la fonction mathématique. Seulement les colonnes numériques seront affichées.</li></ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562924056438454655)
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
 p_id=>wwv_flow_api.id(1562924162581454655)
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
 p_id=>wwv_flow_api.id(1562924250178454655)
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
 p_id=>wwv_flow_api.id(1562924331746454655)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_text=>'Utilisé pour modifier les colonnes affichées. Les colonnes à droite sont affichées. Les colonnes à gauche sont cachés. Vous pouvez repositionner les colonnes affichées en utilisant les flèches à l''extrême droite. Les colonnes calculées sont préfixées'
||' par <b>**</b>.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562924443559454655)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_text=>'Utilisé pour créer un regroupement sur une ou plusieurs colonnes. On sort les colonnes du rapport interactif et on les affiche comme des colonnes de bri.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562924542165454655)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_text=>'Menu d''actions'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562924644309454655)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_text=>'Sauvegarde le rapport personnalisé pour une utilisation utltérieure. Vous devez fournir un nom et une description optionnelle.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562924737643454655)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_text=>'Aide pour le rapport interactif'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562924844584454655)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_text=>'Paramètres d''un rapport'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562924937855454655)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_text=>'Menu d''entête de colonne'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562925040684454657)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_text=>'Exécute une requête de « retour en arrière » permettant de voir les données telles qu''elles étaient dans le passé à un moment donné. Le « retour en arrière » par défaut est de 3 heures (ou 180 minutes) mais ce chiffre diffère selon la base de données'
||'.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562925155565454657)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_text=>'Sert à ajouter ou modifier un énoncé WHERE pour la requête. D''abord, choisir une colonne (il n''est pas nécessaire qu''elle soit affichée), choisir parmi la liste des opérateurs Oracle (=, !=, not in, between), saisir une expression pour la comparaison'
||'. L''expression est sensible à la casse et vous pouvez utiliser % comme caractère de remplacement (ex.: NOM_PROVINCE like Q%).'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562925254863454657)
,p_name=>'APEXIR_HELP_SORT'
,p_message_text=>'Utilisé pour changer l''ordonnancement des colonnes (ascandant et descandat). Vous pouvez aussi spécifier commet gérer les valeurs nulles (utilise le paramètre par défaut, toujours afficher en premier ou en dernier). Une icône affichera le type de tri'
||' à la droite de l''entête d''une colonne.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562925351153454657)
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
 p_id=>wwv_flow_api.id(1562925435654454657)
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
 p_id=>wwv_flow_api.id(1562925562875454657)
,p_name=>'APEXIR_ENABLE'
,p_message_text=>'Activer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562925645155454657)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_text=>'espace'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562925745841454657)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_text=>'Supprimer filtre'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562925855296454657)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_text=>'Supprimer la mise en évidence'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562925961044454657)
,p_name=>'APEXIR_STATUS'
,p_message_text=>'Statut'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562926037643454657)
,p_name=>'APEXIR_ROW'
,p_message_text=>'Rangée'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562926138310454657)
,p_name=>'APEXIR_CLEAR'
,p_message_text=>'effacer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1562926262626454657)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_text=>'Supprimer Retour en arrière'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1574841779565911683)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'fr_ca'
,p_message_text=>'Valeur'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(1574842170936911684)
,p_name=>'APEXIR_3D'
,p_message_language=>'fr_ca'
,p_message_text=>'3D'
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
 p_id=>wwv_flow_api.id(80435730387784699)
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
 p_id=>wwv_flow_api.id(1555122878710318253)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'return afw_07_util_pkg.obten_mesg_suprs();'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(1557430064028946424)
,p_shortcut_name=>'AFW_13_OBTEN_LIBL'
,p_shortcut_type=>'FUNCTION_BODY'
,p_error_text=>'Erreur'
,p_shortcut=>'return afw_13_page_item_pkg.obten_tradc_libl(#CURRENT_ITEM_ID#);'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(1563357754220660938)
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
 p_id=>wwv_flow_api.id(3711627593895220)
,p_name=>'AFW - 21 - Authentification Utilisateur (12)'
,p_scheme_type=>'PLUGIN_IO_AFW_21_AUTHE_12_UTILS'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&APP_ID.:101'
,p_logout_url=>'f?p=&APP_ID.:101'
,p_cookie_name=>'AFW'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_reference_id=>762051053662194539
,p_comments=>'Authentification AFW'
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(1556643482676265909)
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
 p_id=>wwv_flow_api.id(43843952203497624)
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
 p_id=>wwv_flow_api.id(43855928800176957)
,p_plugin_id=>wwv_flow_api.id(43843952203497624)
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
 p_id=>wwv_flow_api.id(43857750138182282)
,p_plugin_id=>wwv_flow_api.id(43843952203497624)
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
 p_id=>wwv_flow_api.id(43858444962184648)
,p_plugin_id=>wwv_flow_api.id(43843952203497624)
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
 p_id=>wwv_flow_api.id(43859040433186754)
,p_plugin_id=>wwv_flow_api.id(43843952203497624)
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
 p_id=>wwv_flow_api.id(45343828328808668)
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
 p_id=>wwv_flow_api.id(45919739011770044)
,p_plugin_id=>wwv_flow_api.id(45343828328808668)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Classe CSS (Voir favoris)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45920130795770044)
,p_plugin_id=>wwv_flow_api.id(45343828328808668)
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
 p_id=>wwv_flow_api.id(45920537064770044)
,p_plugin_id=>wwv_flow_api.id(45343828328808668)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Classe CSS (Voir tous)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45920948846770045)
,p_plugin_id=>wwv_flow_api.id(45343828328808668)
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
 p_id=>wwv_flow_api.id(45921335158770045)
,p_plugin_id=>wwv_flow_api.id(45343828328808668)
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
 p_id=>wwv_flow_api.id(45921734316770045)
,p_plugin_id=>wwv_flow_api.id(45343828328808668)
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
 p_id=>wwv_flow_api.id(45922150747770046)
,p_plugin_id=>wwv_flow_api.id(45343828328808668)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Item contenant filtre'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_default_value=>'PX_FILTR_FAVRT'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(45921734316770045)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45922555287770046)
,p_plugin_id=>wwv_flow_api.id(45343828328808668)
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
,p_depending_on_attribute_id=>wwv_flow_api.id(45921734316770045)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Replace:',
' [PARENT_ALIAS] by alias used in parent SQL;',
' [SEQNC] by primary key stocked in apexframework favorite table. (Concept seqnc)'))
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(45924242987770048)
,p_plugin_id=>wwv_flow_api.id(45343828328808668)
,p_name=>'favr_togl'
,p_display_name=>'after Toggle'
);
end;
/
prompt --application/shared_components/plugins/item_type/io_afw_21_favr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(67343954020297509)
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
 p_id=>wwv_flow_api.id(67344246041301162)
,p_plugin_id=>wwv_flow_api.id(67343954020297509)
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
 p_id=>wwv_flow_api.id(67344563281308393)
,p_plugin_id=>wwv_flow_api.id(67343954020297509)
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
 p_id=>wwv_flow_api.id(81198420453244318)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IO_AFW_21_NAVGT_ENREG'
,p_display_name=>'AFW - 21 - Navigation par enregistrement'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','IO_AFW_21_NAVGT_ENREG'),'')
,p_render_function=>'afw_21_actio_dynmq_pkg.genr_afw_21_navgt_enreg'
,p_ajax_function=>'afw_21_actio_dynmq_pkg.ajax_afw_21_navgt_enreg'
,p_substitute_attributes=>true
,p_reference_id=>81196430746244314
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.8'
,p_about_url=>'http://www.afw.io'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_afich_dialg_ifram
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(102363251297521397)
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
 p_id=>wwv_flow_api.id(102446125757521541)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
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
 p_id=>wwv_flow_api.id(102441349316521534)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>105
,p_prompt=>'SCPI'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677849603974477)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102446539957521542)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
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
 p_id=>wwv_flow_api.id(102448548374521545)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
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
 p_id=>wwv_flow_api.id(102446956002521543)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
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
 p_id=>wwv_flow_api.id(102440934355521533)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>130
,p_prompt=>'SAPC'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677849603974477)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(189677849603974477)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
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
 p_id=>wwv_flow_api.id(189678347662975392)
,p_plugin_attribute_id=>wwv_flow_api.id(189677849603974477)
,p_display_sequence=>10
,p_display_value=>'Items'
,p_return_value=>'PAGE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(189678945505976354)
,p_plugin_attribute_id=>wwv_flow_api.id(189677849603974477)
,p_display_sequence=>20
,p_display_value=>'URL'
,p_return_value=>'URL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(189679929546983791)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>12
,p_prompt=>'Item contenant URL'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677849603974477)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'URL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102444951441521540)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Définir élément SSPC'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677849603974477)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102445333795521540)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Définir élément SSPI'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677849603974477)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102445746021521541)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Item clé étrangère'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102440148827521532)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>18
,p_prompt=>'Application'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>false
,p_default_value=>'afw_11_prodt_pkg.obten_numr_apex_prodt'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677849603974477)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(102440526486521532)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>19
,p_prompt=>'Page'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(189677849603974477)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102394445713521457)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogbeforeclose'
,p_display_name=>'beforeClose'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102394850896521457)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogclose'
,p_display_name=>'close'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102395249565521458)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogclose_actio_dynmq'
,p_display_name=>'close Dynamic Action Plugin'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102395640805521458)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogclose_procs'
,p_display_name=>'close Process Plugin'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102396032557521459)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogdrag'
,p_display_name=>'drag'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102396448337521459)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogdragstart'
,p_display_name=>'dragStart'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102396832381521460)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogdragstop'
,p_display_name=>'dragStop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102397253609521460)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogfocus'
,p_display_name=>'focus'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102397645529521461)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogopen'
,p_display_name=>'open'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102398039508521461)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogresize'
,p_display_name=>'resize'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102398430243521462)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogresizestart'
,p_display_name=>'resizeStart'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(102398837646521463)
,p_plugin_id=>wwv_flow_api.id(102363251297521397)
,p_name=>'dialogresizestop'
,p_display_name=>'resizeStop'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_initl_comps
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(160150218837078751)
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
 p_id=>wwv_flow_api.id(198461247362635908)
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
 p_id=>wwv_flow_api.id(198464330265515426)
,p_plugin_id=>wwv_flow_api.id(198461247362635908)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Concept (Code)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198464627461516717)
,p_plugin_id=>wwv_flow_api.id(198461247362635908)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Concept (Seqnc)'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198464953975519683)
,p_plugin_id=>wwv_flow_api.id(198461247362635908)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'CSS Classes on element'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198613144561955433)
,p_plugin_id=>wwv_flow_api.id(198461247362635908)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Largeur'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198613643698955819)
,p_plugin_id=>wwv_flow_api.id(198461247362635908)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Hauteur'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(198641730344020780)
,p_plugin_id=>wwv_flow_api.id(198461247362635908)
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
 p_id=>wwv_flow_api.id(198642724737023351)
,p_plugin_attribute_id=>wwv_flow_api.id(198641730344020780)
,p_display_sequence=>1
,p_display_value=>'Gauche'
,p_return_value=>'G'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(198642226031022834)
,p_plugin_attribute_id=>wwv_flow_api.id(198641730344020780)
,p_display_sequence=>10
,p_display_value=>'Droite'
,p_return_value=>'D'
);
end;
/
prompt --application/shared_components/plugins/item_type/io_afw_21_selct_2
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(206245698333569270)
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
 p_id=>wwv_flow_api.id(51373509663601035)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
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
 p_id=>wwv_flow_api.id(206248910323670085)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
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
 p_id=>wwv_flow_api.id(206249203422673283)
,p_plugin_attribute_id=>wwv_flow_api.id(206248910323670085)
,p_display_sequence=>10
,p_display_value=>'Single-value'
,p_return_value=>'SINGL_VALUE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206249600834674496)
,p_plugin_attribute_id=>wwv_flow_api.id(206248910323670085)
,p_display_sequence=>20
,p_display_value=>'Mutliple-value'
,p_return_value=>'MULTP_VALUE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206348124283486195)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Allow clear'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206248910323670085)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SINGL_VALUE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206326525566256620)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
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
 p_id=>wwv_flow_api.id(206326903568266792)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Minimum number of results'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'10'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206326525566256620)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'The minimum number of results that must be initially (after opening the dropdown for the first time) populated in order to keep the search field. This is useful for cases where local data is used with just a few results, in which case the search box '
||'is not very useful and wastes screen space.',
'',
'The option can be set to a negative value to permanently hide the search field.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206334897010907879)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
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
 p_id=>wwv_flow_api.id(206327512182278033)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Maximum number of items that can be selected'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'0'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206248910323670085)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'MULTP_VALUE'
,p_help_text=>'The maximum number of items that can be selected in a multi-select control. If this number is less than 1 selection is not limited.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206328407857295219)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Number of characters necessary to start a search'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206328705269296418)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Maximum number of characters that can be entered for an input.'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206329026175301914)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
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
 p_id=>wwv_flow_api.id(206335497200938165)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>35
,p_prompt=>'Search type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'LIKE_IGNORE'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206326525566256620)
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
 p_id=>wwv_flow_api.id(206335820264942744)
,p_plugin_attribute_id=>wwv_flow_api.id(206335497200938165)
,p_display_sequence=>10
,p_display_value=>'Contains case'
,p_return_value=>'CONTAINS_CASE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206336315088945145)
,p_plugin_attribute_id=>wwv_flow_api.id(206335497200938165)
,p_display_sequence=>20
,p_display_value=>'Contains ignore'
,p_return_value=>'CONTAINS_IGNORE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206336712931946095)
,p_plugin_attribute_id=>wwv_flow_api.id(206335497200938165)
,p_display_sequence=>30
,p_display_value=>'Exact case'
,p_return_value=>'EXACT_CASE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206337110775947115)
,p_plugin_attribute_id=>wwv_flow_api.id(206335497200938165)
,p_display_sequence=>40
,p_display_value=>'Exact ignore'
,p_return_value=>'EXACT_IGNORE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206337708618948133)
,p_plugin_attribute_id=>wwv_flow_api.id(206335497200938165)
,p_display_sequence=>50
,p_display_value=>'Like case'
,p_return_value=>'LIKE_CASE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206338106030949270)
,p_plugin_attribute_id=>wwv_flow_api.id(206335497200938165)
,p_display_sequence=>60
,p_display_value=>'Like ignore'
,p_return_value=>'LIKE_IGNORE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206338603227950579)
,p_plugin_attribute_id=>wwv_flow_api.id(206335497200938165)
,p_display_sequence=>70
,p_display_value=>'Lookup'
,p_return_value=>'LOOKUP'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206354227553240417)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
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
 p_id=>wwv_flow_api.id(35904336310629322)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
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
 p_id=>wwv_flow_api.id(36603442522979664)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
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
 p_id=>wwv_flow_api.id(36593053239248115)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
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
 p_id=>wwv_flow_api.id(36593551083249188)
,p_plugin_attribute_id=>wwv_flow_api.id(36593053239248115)
,p_display_sequence=>10
,p_display_value=>'Display column (1)'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(36593947632250767)
,p_plugin_attribute_id=>wwv_flow_api.id(36593053239248115)
,p_display_sequence=>20
,p_display_value=>'Custom search column (6)'
,p_return_value=>'6'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206254125783703988)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_name=>'selct2_blur'
,p_display_name=>'blur'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206251301743703986)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_name=>'selct2_close'
,p_display_name=>'close'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206253724039703988)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_name=>'selct2_focus'
,p_display_name=>'focus'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206251716497703987)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_name=>'selct2_highlight'
,p_display_name=>'highlight'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206253327456703988)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_name=>'selct2_loaded'
,p_display_name=>'loaded'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206250915875703986)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_name=>'selct2_open'
,p_display_name=>'open'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206250602750703985)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_name=>'selct2_opening'
,p_display_name=>'opening'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206252926454703987)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_name=>'selct2_removed'
,p_display_name=>'removed'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206252522717703987)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_name=>'selct2_removing'
,p_display_name=>'removing'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(206252104887703987)
,p_plugin_id=>wwv_flow_api.id(206245698333569270)
,p_name=>'selct2_selecting'
,p_display_name=>'selecting'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_aide_page
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(517440626158284659)
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
 p_id=>wwv_flow_api.id(517440928282313699)
,p_plugin_id=>wwv_flow_api.id(517440626158284659)
,p_name=>'afw_21_actio_dynmq_aide_page_afich'
,p_display_name=>'Afficher'
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_menu
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(866665775330410067)
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
 p_id=>wwv_flow_api.id(515605535418231502)
,p_plugin_id=>wwv_flow_api.id(866665775330410067)
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
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_aide_page_item
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(926524044529250467)
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
 p_id=>wwv_flow_api.id(926596658459543124)
,p_plugin_id=>wwv_flow_api.id(926524044529250467)
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
 p_id=>wwv_flow_api.id(926530564240379151)
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
prompt --application/shared_components/plugins/process_type/io_afw_21_initl_menu
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1174135162082494739)
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
 p_id=>wwv_flow_api.id(1174144272358039823)
,p_plugin_id=>wwv_flow_api.id(1174135162082494739)
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
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_modfr_mdp
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1360286793140834141)
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
 p_id=>wwv_flow_api.id(1360286969030836673)
,p_plugin_id=>wwv_flow_api.id(1360286793140834141)
,p_name=>'afw_21_actio_dynmq_modfr_mp_afich'
,p_display_name=>'Afficher'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_confr_sauvg
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1523644741395821399)
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
 p_id=>wwv_flow_api.id(1523644942135849999)
,p_plugin_id=>wwv_flow_api.id(1523644741395821399)
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
 p_id=>wwv_flow_api.id(1523668648199536022)
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
 p_id=>wwv_flow_api.id(1523670458381324369)
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
 p_id=>wwv_flow_api.id(1523671151418369680)
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
 p_id=>wwv_flow_api.id(1524499241822049818)
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
 p_id=>wwv_flow_api.id(1524499647625070414)
,p_plugin_id=>wwv_flow_api.id(1524499241822049818)
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
 p_id=>wwv_flow_api.id(1524500151434071539)
,p_plugin_id=>wwv_flow_api.id(1524499241822049818)
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
 p_id=>wwv_flow_api.id(1524502643563125994)
,p_plugin_id=>wwv_flow_api.id(1524499241822049818)
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
 p_id=>wwv_flow_api.id(1524503163995131958)
,p_plugin_id=>wwv_flow_api.id(1524499241822049818)
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
 p_id=>wwv_flow_api.id(1524503639538134275)
,p_plugin_id=>wwv_flow_api.id(1524499241822049818)
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
 p_id=>wwv_flow_api.id(1524571445760041677)
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
 p_id=>wwv_flow_api.id(1524571763899056419)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item qui contient le ID du noeud'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1944816352645417457)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Selecteur jQuery identifiant éléments externes (droppable)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1944817724032418668)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Selecteur jQuery identifiant éléments externes (draggable)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1944819129227420157)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Item qui reçoit l''id de l''élément glissé'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1944808351026275123)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Item qui contient le code de l''arbre'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1524778547095145855)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_name=>'close_node.jstree'
,p_display_name=>'Fermer un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1524779956838177032)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_name=>'create_node.jstree'
,p_display_name=>'Ajouter un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1524779349781165530)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_name=>'delete_node.jstree'
,p_display_name=>'Supprimer un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1524779653937166761)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_name=>'move_node.jstree'
,p_display_name=>'Déplacer un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1524776532625047030)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_name=>'open_node.jstree'
,p_display_name=>'Ouvrir un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1524778958177149038)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_name=>'rename_node.jstree'
,p_display_name=>'Renommer un noeud'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1524798259796659018)
,p_plugin_id=>wwv_flow_api.id(1524571445760041677)
,p_name=>'select_node.jstree'
,p_display_name=>'Sélectionner un noeud'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_afich_prodt_autor
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1525372743776694351)
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
 p_id=>wwv_flow_api.id(1526035978269111003)
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
 p_id=>wwv_flow_api.id(1526052673485639545)
,p_plugin_id=>wwv_flow_api.id(1526035978269111003)
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
 p_id=>wwv_flow_api.id(1524037847424111844)
,p_plugin_attribute_id=>wwv_flow_api.id(1526052673485639545)
,p_display_sequence=>5
,p_display_value=>'Personnalisé'
,p_return_value=>'PERSN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1526053882835642282)
,p_plugin_attribute_id=>wwv_flow_api.id(1526052673485639545)
,p_display_sequence=>10
,p_display_value=>'Téléphone'
,p_return_value=>'999-999-9999'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1526054253530643281)
,p_plugin_attribute_id=>wwv_flow_api.id(1526052673485639545)
,p_display_sequence=>20
,p_display_value=>'Code postal (Canada)'
,p_return_value=>'a9a 9a9'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1526054858725644786)
,p_plugin_attribute_id=>wwv_flow_api.id(1526052673485639545)
,p_display_sequence=>30
,p_display_value=>'Permis de conduire'
,p_return_value=>'a9999-999999-99'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1524038637513118383)
,p_plugin_id=>wwv_flow_api.id(1526035978269111003)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Masque personnalisé'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_max_length=>200
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(1526052673485639545)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PERSN'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'a - Représente un caractère alphabétique (A-Z, a-z)',
'9 - Représente un caractère numérique (0-9)',
'* - Représente un caractère alphanumérique (AZ, az ,0-9)'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1524039159115134136)
,p_plugin_id=>wwv_flow_api.id(1526035978269111003)
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
 p_id=>wwv_flow_api.id(1528556032909258198)
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
 p_id=>wwv_flow_api.id(1528863754135461589)
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
 p_id=>wwv_flow_api.id(1528863945955468728)
,p_plugin_id=>wwv_flow_api.id(1528863754135461589)
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
 p_id=>wwv_flow_api.id(1530734063804279003)
,p_plugin_id=>wwv_flow_api.id(1528863754135461589)
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
 p_id=>wwv_flow_api.id(1529078646818168540)
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
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_cliqr_selct_texte
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1530508159566444310)
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
 p_id=>wwv_flow_api.id(1549946020744193377)
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
 p_id=>wwv_flow_api.id(1549954025938194855)
,p_plugin_id=>wwv_flow_api.id(1549946020744193377)
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
 p_id=>wwv_flow_api.id(1549974143946200079)
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
 p_id=>wwv_flow_api.id(1568248626979100274)
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
 p_id=>wwv_flow_api.id(1568272233091168307)
,p_plugin_id=>wwv_flow_api.id(1568248626979100274)
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
 p_id=>wwv_flow_api.id(1568276649367173000)
,p_plugin_id=>wwv_flow_api.id(1568248626979100274)
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
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_matrc_raprt_sql
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1596901252796872279)
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
 p_id=>wwv_flow_api.id(1596907046495441133)
,p_plugin_id=>wwv_flow_api.id(1596901252796872279)
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
 p_id=>wwv_flow_api.id(1596907958616444643)
,p_plugin_id=>wwv_flow_api.id(1596901252796872279)
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
 p_id=>wwv_flow_api.id(1606065845353861772)
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
 p_id=>wwv_flow_api.id(1606767828699126130)
,p_plugin_id=>wwv_flow_api.id(1606065845353861772)
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
 p_id=>wwv_flow_api.id(1607212635788361541)
,p_plugin_id=>wwv_flow_api.id(1606065845353861772)
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
 p_id=>wwv_flow_api.id(1607213256566367509)
,p_plugin_id=>wwv_flow_api.id(1606065845353861772)
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
 p_id=>wwv_flow_api.id(1607213959814377886)
,p_plugin_id=>wwv_flow_api.id(1606065845353861772)
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
 p_id=>wwv_flow_api.id(1607214941552779486)
,p_plugin_id=>wwv_flow_api.id(1606065845353861772)
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
 p_id=>wwv_flow_api.id(1607215659906784808)
,p_plugin_id=>wwv_flow_api.id(1606065845353861772)
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
 p_id=>wwv_flow_api.id(1596268938976513538)
,p_plugin_id=>wwv_flow_api.id(1606065845353861772)
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
 p_id=>wwv_flow_api.id(1606877135218309646)
,p_plugin_id=>wwv_flow_api.id(1606065845353861772)
,p_name=>'ouvridialg'
,p_display_name=>'Ouvrir le dialogue'
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_prodt_contx_a
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1619929135558898238)
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
 p_id=>wwv_flow_api.id(1513182152020392705)
,p_plugin_id=>wwv_flow_api.id(1619929135558898238)
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
 p_id=>wwv_flow_api.id(1673200536200607241)
,p_plugin_id=>wwv_flow_api.id(1619929135558898238)
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
 p_id=>wwv_flow_api.id(1705852925600625231)
,p_plugin_id=>wwv_flow_api.id(1619929135558898238)
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
 p_id=>wwv_flow_api.id(1705857427678625825)
,p_plugin_attribute_id=>wwv_flow_api.id(1705852925600625231)
,p_display_sequence=>10
,p_display_value=>'Tous les produits'
,p_return_value=>'TOUS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1705861730795626712)
,p_plugin_attribute_id=>wwv_flow_api.id(1705852925600625231)
,p_display_sequence=>20
,p_display_value=>'Exclure les produits AFW'
,p_return_value=>'EXCLU_AFW'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1705888437375628627)
,p_plugin_attribute_id=>wwv_flow_api.id(1705852925600625231)
,p_display_sequence=>30
,p_display_value=>'Seulement les produits AFW'
,p_return_value=>'SEULM_AFW'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1705692347362527480)
,p_plugin_id=>wwv_flow_api.id(1619929135558898238)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Produits SAF'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1705852925600625231)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SEULM_AFW'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1705696851517528658)
,p_plugin_attribute_id=>wwv_flow_api.id(1705692347362527480)
,p_display_sequence=>10
,p_display_value=>'SAFP'
,p_return_value=>'SAFP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1705701120481529156)
,p_plugin_attribute_id=>wwv_flow_api.id(1705692347362527480)
,p_display_sequence=>20
,p_display_value=>'SAFD'
,p_return_value=>'SAFD'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1705705422212529661)
,p_plugin_attribute_id=>wwv_flow_api.id(1705692347362527480)
,p_display_sequence=>30
,p_display_value=>'SAFU'
,p_return_value=>'SAFU'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1705709724290530255)
,p_plugin_attribute_id=>wwv_flow_api.id(1705692347362527480)
,p_display_sequence=>40
,p_display_value=>'SAFS'
,p_return_value=>'SAFS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1705714027407531127)
,p_plugin_attribute_id=>wwv_flow_api.id(1705692347362527480)
,p_display_sequence=>50
,p_display_value=>'SGA'
,p_return_value=>'SGA'
);
end;
/
prompt --application/shared_components/plugins/item_type/io_afw_21_champ_rechr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1672027921637451661)
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
 p_id=>wwv_flow_api.id(1672332732335502083)
,p_plugin_id=>wwv_flow_api.id(1672027921637451661)
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
 p_id=>wwv_flow_api.id(1672337243070505117)
,p_plugin_id=>wwv_flow_api.id(1672027921637451661)
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
 p_id=>wwv_flow_api.id(1691862253947285779)
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
 p_id=>wwv_flow_api.id(1774217974410914782)
,p_plugin_id=>wwv_flow_api.id(1691862253947285779)
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
 p_id=>wwv_flow_api.id(1717170251972498936)
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
 p_id=>wwv_flow_api.id(1717313137866551708)
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
 p_id=>wwv_flow_api.id(1717580246103648644)
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
 p_id=>wwv_flow_api.id(1717639154938689052)
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
 p_id=>wwv_flow_api.id(1717912652851962801)
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
 p_id=>wwv_flow_api.id(1718153060573097451)
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
 p_id=>wwv_flow_api.id(1718326824735125010)
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
 p_id=>wwv_flow_api.id(1723031326774979444)
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
 p_id=>wwv_flow_api.id(1723043246167985071)
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
 p_id=>wwv_flow_api.id(1757708349167926291)
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
 p_id=>wwv_flow_api.id(1757750039255932872)
,p_plugin_id=>wwv_flow_api.id(1757708349167926291)
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
 p_id=>wwv_flow_api.id(1757754441679933637)
,p_plugin_attribute_id=>wwv_flow_api.id(1757750039255932872)
,p_display_sequence=>10
,p_display_value=>'ui-icon-arrowthick-1-e'
,p_return_value=>'ui-icon-arrowthick-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1757758743410934129)
,p_plugin_attribute_id=>wwv_flow_api.id(1757750039255932872)
,p_display_sequence=>20
,p_display_value=>'ui-icon-arrow-1-e'
,p_return_value=>'ui-icon-arrow-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1757763044796934532)
,p_plugin_attribute_id=>wwv_flow_api.id(1757750039255932872)
,p_display_sequence=>30
,p_display_value=>'ui-icon-carat-1-e'
,p_return_value=>'ui-icon-carat-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1757767346527934982)
,p_plugin_attribute_id=>wwv_flow_api.id(1757750039255932872)
,p_display_sequence=>40
,p_display_value=>'ui-icon-triangle-1-e'
,p_return_value=>'ui-icon-triangle-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1757771648951935685)
,p_plugin_attribute_id=>wwv_flow_api.id(1757750039255932872)
,p_display_sequence=>50
,p_display_value=>'ui-icon-circle-arrow-e'
,p_return_value=>'ui-icon-circle-arrow-e'
);
end;
/
prompt --application/shared_components/plugins/process_type/io_afw_21_trait_mess_err
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1766888849491293263)
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
 p_id=>wwv_flow_api.id(1766899026073295939)
,p_plugin_id=>wwv_flow_api.id(1766888849491293263)
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
 p_id=>wwv_flow_api.id(1767266067367913838)
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
 p_id=>wwv_flow_api.id(1773912550187709150)
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
 p_id=>wwv_flow_api.id(1773954745217773926)
,p_plugin_id=>wwv_flow_api.id(1773912550187709150)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Définir ces éléments'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1773959151451775756)
,p_plugin_id=>wwv_flow_api.id(1773912550187709150)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Avec ces valeurs'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1773954745217773926)
,p_depending_on_condition_type=>'NOT_NULL'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_fermr_dialg_ifram
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1782672743331547422)
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
 p_id=>wwv_flow_api.id(1852919536162439034)
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
 p_id=>wwv_flow_api.id(1853384529085626285)
,p_plugin_id=>wwv_flow_api.id(1852919536162439034)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Valeur 1'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1853389032202627160)
,p_plugin_id=>wwv_flow_api.id(1852919536162439034)
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
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_fil_arian
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1908566531161945104)
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
 p_id=>wwv_flow_api.id(1908570701164945930)
,p_plugin_id=>wwv_flow_api.id(1908566531161945104)
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
 p_id=>wwv_flow_api.id(1908571100139945937)
,p_plugin_attribute_id=>wwv_flow_api.id(1908570701164945930)
,p_display_sequence=>10
,p_display_value=>'ui-icon-arrowthick-1-e'
,p_return_value=>'ui-icon-arrowthick-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908571617592945937)
,p_plugin_attribute_id=>wwv_flow_api.id(1908570701164945930)
,p_display_sequence=>20
,p_display_value=>'ui-icon-arrow-1-e'
,p_return_value=>'ui-icon-arrow-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908572123403945938)
,p_plugin_attribute_id=>wwv_flow_api.id(1908570701164945930)
,p_display_sequence=>30
,p_display_value=>'ui-icon-carat-1-e'
,p_return_value=>'ui-icon-carat-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908572601132945938)
,p_plugin_attribute_id=>wwv_flow_api.id(1908570701164945930)
,p_display_sequence=>40
,p_display_value=>'ui-icon-triangle-1-e'
,p_return_value=>'ui-icon-triangle-1-e'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908573102586945940)
,p_plugin_attribute_id=>wwv_flow_api.id(1908570701164945930)
,p_display_sequence=>50
,p_display_value=>'ui-icon-circle-arrow-e'
,p_return_value=>'ui-icon-circle-arrow-e'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1908573625949945943)
,p_plugin_id=>wwv_flow_api.id(1908566531161945104)
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
 p_id=>wwv_flow_api.id(1908574005343945943)
,p_plugin_id=>wwv_flow_api.id(1908566531161945104)
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
 p_id=>wwv_flow_api.id(1908574425532945944)
,p_plugin_attribute_id=>wwv_flow_api.id(1908574005343945943)
,p_display_sequence=>10
,p_display_value=>'Classique'
,p_return_value=>'CLASQ'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1908574903206945944)
,p_plugin_attribute_id=>wwv_flow_api.id(1908574005343945943)
,p_display_sequence=>20
,p_display_value=>'Avancé'
,p_return_value=>'AVANC'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1908575429749945944)
,p_plugin_id=>wwv_flow_api.id(1908566531161945104)
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
 p_id=>wwv_flow_api.id(1908575806673945944)
,p_plugin_id=>wwv_flow_api.id(1908566531161945104)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Inclure le contexte'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1908575429749945944)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1001873857560524975)
,p_plugin_id=>wwv_flow_api.id(1908566531161945104)
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
prompt --application/shared_components/plugins/authorization_type/io_afw_21_autor_super_utils
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1911148140217059448)
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
 p_id=>wwv_flow_api.id(1931119250884806188)
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
 p_id=>wwv_flow_api.id(1931120237638571519)
,p_plugin_id=>wwv_flow_api.id(1931119250884806188)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Message de confirmation'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1931120745949573888)
,p_plugin_id=>wwv_flow_api.id(1931119250884806188)
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
 p_id=>wwv_flow_api.id(1931171142674140717)
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
 p_id=>wwv_flow_api.id(1934420237832313185)
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
 p_id=>wwv_flow_api.id(1934420445582324863)
,p_plugin_id=>wwv_flow_api.id(1934420237832313185)
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
 p_id=>wwv_flow_api.id(1935129940057327000)
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
 p_id=>wwv_flow_api.id(1935130334994335035)
,p_plugin_id=>wwv_flow_api.id(1935129940057327000)
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
 p_id=>wwv_flow_api.id(1941703549377233843)
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
 p_id=>wwv_flow_api.id(1941703929422237472)
,p_plugin_id=>wwv_flow_api.id(1941703549377233843)
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
 p_id=>wwv_flow_api.id(1941704540158240569)
,p_plugin_id=>wwv_flow_api.id(1941703549377233843)
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
prompt --application/shared_components/plugins/process_type/io_afw_21_chang_libl_fil_ari
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1944583432128342982)
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
 p_id=>wwv_flow_api.id(1944583647019347318)
,p_plugin_id=>wwv_flow_api.id(1944583432128342982)
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
 p_id=>wwv_flow_api.id(1975044764100361815)
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
 p_id=>wwv_flow_api.id(1982647642947606830)
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
 p_id=>wwv_flow_api.id(1982655654721610241)
,p_plugin_id=>wwv_flow_api.id(1982647642947606830)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item cible'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1982751746803636417)
,p_plugin_id=>wwv_flow_api.id(1982647642947606830)
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
prompt --application/shared_components/plugins/process_type/io_afw_21_defnr_prodt_safp
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2002135669318928253)
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
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_afich_regn_dialg
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2094842360478611169)
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
 p_id=>wwv_flow_api.id(1972873069753521333)
,p_plugin_id=>wwv_flow_api.id(2094842360478611169)
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
 p_id=>wwv_flow_api.id(2120921980161257669)
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
 p_id=>wwv_flow_api.id(2110791065673698840)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
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
 p_id=>wwv_flow_api.id(2120923579673522520)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'prePopulate'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2120924096988527478)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
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
 p_id=>wwv_flow_api.id(2120924576340530998)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
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
 p_id=>wwv_flow_api.id(2120925481666542031)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
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
 p_id=>wwv_flow_api.id(2120925984568552243)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'tokenLimit'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2120926492879554666)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
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
 p_id=>wwv_flow_api.id(2120931585568650212)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
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
 p_id=>wwv_flow_api.id(2048141953586051209)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
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
 p_id=>wwv_flow_api.id(2120927293703564402)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
,p_name=>'onadd'
,p_display_name=>'onAdd'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2120927596473565199)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
,p_name=>'ondelete'
,p_display_name=>'onDelete'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2120927903399567169)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
,p_name=>'onready'
,p_display_name=>'onReady'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2120926990932563553)
,p_plugin_id=>wwv_flow_api.id(2120921980161257669)
,p_name=>'onresult'
,p_display_name=>'onResult'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_group_entet_raprt_sql
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2260448478017006988)
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
 p_id=>wwv_flow_api.id(2260481780724522643)
,p_plugin_id=>wwv_flow_api.id(2260448478017006988)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Ligne 1 - Entêtes '
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Liste des libellés dans les entêtes.<br/>Ex.: ,Valeur,%'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2260482290421525393)
,p_plugin_id=>wwv_flow_api.id(2260448478017006988)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Ligne 1 - colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Formatage des entêtes.<br/>Ex.: 1;1,4;1,4;1<br/><br/>colspan;rowspan,colspan;rowspan,colspan;rowspan'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2260483471851529536)
,p_plugin_id=>wwv_flow_api.id(2260448478017006988)
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
 p_id=>wwv_flow_api.id(2260483976007530724)
,p_plugin_id=>wwv_flow_api.id(2260448478017006988)
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
 p_id=>wwv_flow_api.id(2260484887435534037)
,p_plugin_id=>wwv_flow_api.id(2260448478017006988)
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
 p_id=>wwv_flow_api.id(2260485388820534453)
,p_plugin_id=>wwv_flow_api.id(2260448478017006988)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Ligne 3 - colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Formatage des entêtes.<br/>Ex.: 1;1,4;1,4;1<br/><br/>colspan;rowspan,colspan;rowspan,colspan;rowspan'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1947331323501954739)
,p_plugin_id=>wwv_flow_api.id(2260448478017006988)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Classe CSS surlignement'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'ir_matrc_surlg_tous'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1947332120534114655)
,p_plugin_id=>wwv_flow_api.id(2260448478017006988)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Sélecteur jQuery surlignement'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'tr:contains(''**Tous**''), tr:contains(''Total'')'
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_group_entet_raprt
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2291799297168676618)
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
 p_id=>wwv_flow_api.id(2291932012977747420)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Ligne 1 - Entêtes/colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>100
,p_max_length=>1000
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2291944219557749324)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Ligne 2 - Entêtes/colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>100
,p_max_length=>1000
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2291948622327750098)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Ligne 3 - Entêtes/colspan/rowspan'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>100
,p_max_length=>1000
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2090376746347085205)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Libellé à transformer'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_display_length=>60
,p_max_length=>4000
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Syntax is [COLUMN_ID];[NEW_LABEL],[OTHER_COLUMN_ID];[OTHER_NEW_LABEL]...',
'',
'Ex: CODE_1;Label_1,CODE_2;Label_2'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2090799447226442673)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Gérer ventilation'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2090799959000446117)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Classe CSS ventilation'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>60
,p_max_length=>200
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2090799447226442673)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2090800947703452285)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Classe CSS ventilation horizontale'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>60
,p_max_length=>200
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2090799447226442673)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2090801454629454321)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Classe CSS ventilation verticale'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>60
,p_max_length=>200
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2090799447226442673)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2090815965073911573)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Classe CSS ventilation gauche'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>60
,p_max_length=>200
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2090799447226442673)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2090824447188190311)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Nombre colonnes ventilation gauche'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1'
,p_display_length=>5
,p_max_length=>5
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2090799447226442673)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1947009140701187229)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Classe CSS surlignement'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'ir_matrc_surlg_tous'
,p_display_length=>60
,p_max_length=>200
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1947009649705189765)
,p_plugin_id=>wwv_flow_api.id(2291799297168676618)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Sélecteur jQuery surlignement'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'table.apexir_WORKSHEET_DATA tr:contains(''**Tous**'')'
,p_display_length=>100
,p_max_length=>1000
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_regn_afich_mesg_pr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2359770738779534941)
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
 p_id=>wwv_flow_api.id(2375901961360768208)
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
 p_id=>wwv_flow_api.id(2375925059414777030)
,p_plugin_id=>wwv_flow_api.id(2375901961360768208)
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
 p_id=>wwv_flow_api.id(2375929465647778866)
,p_plugin_attribute_id=>wwv_flow_api.id(2375925059414777030)
,p_display_sequence=>10
,p_display_value=>'La valeur n''est pas nulle'
,p_return_value=>'NOT_NULL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2375960669587789488)
,p_plugin_id=>wwv_flow_api.id(2375901961360768208)
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
 p_id=>wwv_flow_api.id(2375980656213795067)
,p_plugin_id=>wwv_flow_api.id(2375901961360768208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2375988963485797200)
,p_plugin_id=>wwv_flow_api.id(2375901961360768208)
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
 p_id=>wwv_flow_api.id(2383530458732081924)
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
 p_id=>wwv_flow_api.id(2385757261800104583)
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
 p_id=>wwv_flow_api.id(2385765234919106316)
,p_plugin_id=>wwv_flow_api.id(2385757261800104583)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Liste des items (clob)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2385781741723174513)
,p_plugin_id=>wwv_flow_api.id(2385757261800104583)
,p_name=>'suprm_item_clob_delete_termn'
,p_display_name=>'Supprimer items CLOB terminé (DELETE)'
);
end;
/
prompt --application/shared_components/plugins/region_type/io_afw_21_regn_calnd
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2525930579215464146)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1945443049216886432)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Code du calendrier'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2526043470361950086)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'dayclick'
,p_display_name=>'dayClick'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517436574989749305)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'drop'
,p_display_name=>'drop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517386455119734123)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventafterrender'
,p_display_name=>'eventAfterRender'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2526043774863951397)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventclick'
,p_display_name=>'eventClick'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517415456981744080)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventdragstart'
,p_display_name=>'eventDragStart'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517411252826742932)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventdragstop'
,p_display_name=>'eventDragStop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517419661137745315)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventdrop'
,p_display_name=>'eventDrop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517365475111683155)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventmouseout'
,p_display_name=>'eventMouseout'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517361162298679435)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventmouseover'
,p_display_name=>'eventMouseover'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517382255849687048)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventrender'
,p_display_name=>'eventRender'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517432270487747982)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventresize'
,p_display_name=>'eventResize'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517423863561746013)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventresizestart'
,p_display_name=>'eventResizeStart'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517428065985746763)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'eventresizestop'
,p_display_name=>'eventResizeStop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517378052386686001)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'loading'
,p_display_name=>'loading'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1930561234307794570)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'loadingstart'
,p_display_name=>'loadingStart'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1930561639502796039)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'loadingstop'
,p_display_name=>'loadingStop'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517369677881683949)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'select'
,p_display_name=>'select'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517373880998684787)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'unselect'
,p_display_name=>'unselect'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517390659967735505)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'viewdisplay'
,p_display_name=>'viewDisplay'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2517394863084736368)
,p_plugin_id=>wwv_flow_api.id(2525930579215464146)
,p_name=>'windowresize'
,p_display_name=>'windowResize'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_soumt_clob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2779169329026429940)
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
 p_id=>wwv_flow_api.id(2779189121538437286)
,p_plugin_id=>wwv_flow_api.id(2779169329026429940)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Liste des items (clob)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2781382115105996598)
,p_plugin_id=>wwv_flow_api.id(2779169329026429940)
,p_name=>'soumt_create_clob_termn'
,p_display_name=>'Soumettre CLOB terminé (CREATE)'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2367007263090077463)
,p_plugin_id=>wwv_flow_api.id(2779169329026429940)
,p_name=>'soumt_delete_clob_termn'
,p_display_name=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Soumettre CLOB terminé (DELETE)',
''))
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(2367003053740074824)
,p_plugin_id=>wwv_flow_api.id(2779169329026429940)
,p_name=>'soumt_save_clob_termn'
,p_display_name=>'Soumettre CLOB terminé (SAVE)'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_dml_obten_clob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2782278504840277481)
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
 p_id=>wwv_flow_api.id(2782439706834297017)
,p_plugin_id=>wwv_flow_api.id(2782278504840277481)
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
 p_id=>wwv_flow_api.id(2782484691035301941)
,p_plugin_id=>wwv_flow_api.id(2782278504840277481)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Elément contenant la valeur de colonne de clé primaire'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2782489098307303983)
,p_plugin_id=>wwv_flow_api.id(2782278504840277481)
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
 p_id=>wwv_flow_api.id(2782493504541305816)
,p_plugin_id=>wwv_flow_api.id(2782278504840277481)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Elément contenant la valeur de colonne de clé secondaire'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2782497915622308981)
,p_plugin_id=>wwv_flow_api.id(2782278504840277481)
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
 p_id=>wwv_flow_api.id(2783466803941712503)
,p_plugin_id=>wwv_flow_api.id(2782278504840277481)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Liste des items (séparées par des virgules)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2783504813638715236)
,p_plugin_id=>wwv_flow_api.id(2782278504840277481)
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
 p_id=>wwv_flow_api.id(2798264074854927405)
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
 p_id=>wwv_flow_api.id(2798360176847946949)
,p_plugin_id=>wwv_flow_api.id(2798264074854927405)
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
 p_id=>wwv_flow_api.id(2798364585505949452)
,p_plugin_id=>wwv_flow_api.id(2798264074854927405)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Elément contenant la valeur de colonne de clé primaire'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2798368990700950864)
,p_plugin_id=>wwv_flow_api.id(2798264074854927405)
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
 p_id=>wwv_flow_api.id(2798373363819952586)
,p_plugin_id=>wwv_flow_api.id(2798264074854927405)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Elément contenant la valeur de colonne de clé secondaire'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2798377768667954010)
,p_plugin_id=>wwv_flow_api.id(2798264074854927405)
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
 p_id=>wwv_flow_api.id(2798397288060959591)
,p_plugin_id=>wwv_flow_api.id(2798264074854927405)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Liste des items (séparées par des virgules)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2798401663950962089)
,p_plugin_id=>wwv_flow_api.id(2798264074854927405)
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
prompt --application/shared_components/plugins/region_type/io_afw_21_telvr_fichr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(4474183094946934426)
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
 p_id=>wwv_flow_api.id(3007721782958401103)
,p_plugin_id=>wwv_flow_api.id(4474183094946934426)
,p_name=>'selct_termn_regn'
,p_display_name=>'Sélection terminée'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/io_afw_21_soumt_blob
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(4480561376127286153)
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
 p_id=>wwv_flow_api.id(3031344358161600506)
,p_plugin_id=>wwv_flow_api.id(4480561376127286153)
,p_name=>'debut_telvr'
,p_display_name=>'Débuter téléversement'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(4480585377990296159)
,p_plugin_id=>wwv_flow_api.id(4480561376127286153)
,p_name=>'soumt_create_blob_termn'
,p_display_name=>'Soumettre BLOB terminé (CREATE)'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(4480589581453297087)
,p_plugin_id=>wwv_flow_api.id(4480561376127286153)
,p_name=>'soumt_delete_blob_termn'
,p_display_name=>'Soumettre BLOB terminé (DELETE)'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(3031348765433602605)
,p_plugin_id=>wwv_flow_api.id(4480561376127286153)
,p_name=>'termn_telvr'
,p_display_name=>'Terminer téléversement'
);
end;
/
prompt --application/shared_components/plugins/item_type/com_skillbuilders_sbip_password
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(10027387098451642521)
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
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'1'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(10217677592456068615)
,p_plugin_id=>wwv_flow_api.id(10027387098451642521)
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
 p_id=>wwv_flow_api.id(10217694497304070024)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>10
,p_display_value=>'Base (APEX Default)'
,p_return_value=>'base'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217694900767071020)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>20
,p_display_value=>'Black Tie'
,p_return_value=>'black-tie'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217713804231071991)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>30
,p_display_value=>'Blitzer'
,p_return_value=>'blitzer'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217722409079073364)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>40
,p_display_value=>'Cupertino'
,p_return_value=>'cupertino'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217722911849074183)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>50
,p_display_value=>'Dark Hive'
,p_return_value=>'dark-hive'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217723714966075146)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>60
,p_display_value=>'Dot Luv'
,p_return_value=>'dot-luv'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217724085315076046)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>70
,p_display_value=>'Eggplant'
,p_return_value=>'eggplant'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217739988778077001)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>80
,p_display_value=>'Excite Bike'
,p_return_value=>'excite-bike'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217740492587078115)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>90
,p_display_value=>'Flick'
,p_return_value=>'flick'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217740895704078984)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>100
,p_display_value=>'Hot Sneaks'
,p_return_value=>'hot-sneaks'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217853295021154466)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>110
,p_display_value=>'Humanity'
,p_return_value=>'humanity'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217853797791155322)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>120
,p_display_value=>'Le Frog'
,p_return_value=>'le-frog'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217854300908156179)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>130
,p_display_value=>'Mint Choc'
,p_return_value=>'mint-choc'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217854704025157095)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>140
,p_display_value=>'Overcast'
,p_return_value=>'overcast'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217862207141157950)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>150
,p_display_value=>'Pepper Grinder'
,p_return_value=>'pepper-grinder'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217863309565158724)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>160
,p_display_value=>'Smoothness'
,p_return_value=>'smoothness'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217864214760160239)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>170
,p_display_value=>'South Street'
,p_return_value=>'south-street'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217864617530160998)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>180
,p_display_value=>'Start'
,p_return_value=>'start'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217865087879161863)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>190
,p_display_value=>'Sunny'
,p_return_value=>'sunny'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217865590303162601)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>200
,p_display_value=>'Swanky Purse'
,p_return_value=>'swanky-purse'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217865993766163577)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>210
,p_display_value=>'Trontastic'
,p_return_value=>'trontastic'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217867901039165706)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>220
,p_display_value=>'UI Darkness'
,p_return_value=>'ui-darkness'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217868504156166619)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>230
,p_display_value=>'UI Lightness'
,p_return_value=>'ui-lightness'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10217869608658167933)
,p_plugin_attribute_id=>wwv_flow_api.id(10217677592456068615)
,p_display_sequence=>240
,p_display_value=>'Vader'
,p_return_value=>'vader'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(10169646107014581395)
,p_plugin_id=>wwv_flow_api.id(10027387098451642521)
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
 p_id=>wwv_flow_api.id(10169576101689570422)
,p_plugin_id=>wwv_flow_api.id(10027387098451642521)
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
 p_id=>wwv_flow_api.id(10169594004113571105)
,p_plugin_attribute_id=>wwv_flow_api.id(10169576101689570422)
,p_display_sequence=>10
,p_display_value=>'Alert'
,p_return_value=>'ui-icon-alert'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10169617506883571901)
,p_plugin_attribute_id=>wwv_flow_api.id(10169576101689570422)
,p_display_sequence=>20
,p_display_value=>'Info'
,p_return_value=>'ui-icon-info'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10169619815194574335)
,p_plugin_attribute_id=>wwv_flow_api.id(10169576101689570422)
,p_display_sequence=>30
,p_display_value=>'Notice'
,p_return_value=>'ui-icon-notice'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(10169572887490566302)
,p_plugin_id=>wwv_flow_api.id(10027387098451642521)
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
 p_id=>wwv_flow_api.id(10169665811778601713)
,p_plugin_id=>wwv_flow_api.id(10027387098451642521)
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
 p_id=>wwv_flow_api.id(10212660293532671623)
,p_plugin_id=>wwv_flow_api.id(10027387098451642521)
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
 p_id=>wwv_flow_api.id(10212662603921674552)
,p_plugin_attribute_id=>wwv_flow_api.id(10212660293532671623)
,p_display_sequence=>10
,p_display_value=>'Left Top'
,p_return_value=>'left top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212663107038675522)
,p_plugin_attribute_id=>wwv_flow_api.id(10212660293532671623)
,p_display_sequence=>20
,p_display_value=>'Left Center'
,p_return_value=>'left center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212663710847676580)
,p_plugin_attribute_id=>wwv_flow_api.id(10212660293532671623)
,p_display_sequence=>30
,p_display_value=>'Left Bottom'
,p_return_value=>'left bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212665315696678010)
,p_plugin_attribute_id=>wwv_flow_api.id(10212660293532671623)
,p_display_sequence=>40
,p_display_value=>'Center Top'
,p_return_value=>'center top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212674788815679729)
,p_plugin_attribute_id=>wwv_flow_api.id(10212660293532671623)
,p_display_sequence=>50
,p_display_value=>'Center Center'
,p_return_value=>'center center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212675792624680825)
,p_plugin_attribute_id=>wwv_flow_api.id(10212660293532671623)
,p_display_sequence=>60
,p_display_value=>'Center Bottom'
,p_return_value=>'center bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212676396087681756)
,p_plugin_attribute_id=>wwv_flow_api.id(10212660293532671623)
,p_display_sequence=>70
,p_display_value=>'Right Top'
,p_return_value=>'right top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212677300589683034)
,p_plugin_attribute_id=>wwv_flow_api.id(10212660293532671623)
,p_display_sequence=>80
,p_display_value=>'Right Center'
,p_return_value=>'right center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212678103706683956)
,p_plugin_attribute_id=>wwv_flow_api.id(10212660293532671623)
,p_display_sequence=>90
,p_display_value=>'Right Bottom'
,p_return_value=>'right bottom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(10212757191810746732)
,p_plugin_id=>wwv_flow_api.id(10027387098451642521)
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
 p_id=>wwv_flow_api.id(10212758395273747764)
,p_plugin_attribute_id=>wwv_flow_api.id(10212757191810746732)
,p_display_sequence=>10
,p_display_value=>'Left Top'
,p_return_value=>'left top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212777600121749151)
,p_plugin_attribute_id=>wwv_flow_api.id(10212757191810746732)
,p_display_sequence=>20
,p_display_value=>'Left Center'
,p_return_value=>'left center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212778703930750246)
,p_plugin_attribute_id=>wwv_flow_api.id(10212757191810746732)
,p_display_sequence=>30
,p_display_value=>'Left Bottom'
,p_return_value=>'left bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212780707740751385)
,p_plugin_attribute_id=>wwv_flow_api.id(10212757191810746732)
,p_display_sequence=>40
,p_display_value=>'Center Top'
,p_return_value=>'center top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212793911895752595)
,p_plugin_attribute_id=>wwv_flow_api.id(10212757191810746732)
,p_display_sequence=>50
,p_display_value=>'Center Center'
,p_return_value=>'center center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10212922215359753599)
,p_plugin_attribute_id=>wwv_flow_api.id(10212757191810746732)
,p_display_sequence=>60
,p_display_value=>'Center Bottom'
,p_return_value=>'center bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10213630787093754895)
,p_plugin_attribute_id=>wwv_flow_api.id(10212757191810746732)
,p_display_sequence=>70
,p_display_value=>'Right Top'
,p_return_value=>'right top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10213882889517755525)
,p_plugin_attribute_id=>wwv_flow_api.id(10212757191810746732)
,p_display_sequence=>80
,p_display_value=>'Right Center'
,p_return_value=>'right center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(10213883391941756233)
,p_plugin_attribute_id=>wwv_flow_api.id(10212757191810746732)
,p_display_sequence=>90
,p_display_value=>'Right Bottom'
,p_return_value=>'right bottom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(10213897614713781714)
,p_plugin_id=>wwv_flow_api.id(10027387098451642521)
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
 p_id=>wwv_flow_api.id(10719250409123167701)
,p_plugin_id=>wwv_flow_api.id(10027387098451642521)
,p_file_name=>'com_skillbuilders_sbip_password.min.js'
,p_mime_type=>'application/x-javascript'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(3663430628528105)
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
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Page commune'
,p_page_mode=>'NORMAL'
,p_step_title=>'Page commune'
,p_step_sub_title=>'Sie'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_upd_yyyymmddhh24miss=>'20151111113008'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1528865339027982073)
,p_plug_name=>'Recherche'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'class="filtr_rechr_globl"'
,p_plug_template=>wwv_flow_api.id(524958247123896535)
,p_plug_display_sequence=>60
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
 p_id=>wwv_flow_api.id(1554584343973194949)
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
,p_attribute_06=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1556119583145901512)
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
 p_id=>wwv_flow_api.id(1556614347434946405)
,p_plug_name=>'Messages Informatifs'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>70
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
 p_id=>wwv_flow_api.id(1693210121400127711)
,p_plug_name=>'Menu principal'
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
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'afw_04_contx_pkg.obten_seqnc_contx(''PRODT'') is not null'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'MENU_PRINC_SAFP'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1947952822983405129)
,p_plug_name=>'Menu accueil'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_plug_source_type=>'PLUGIN_IO_AFW_21_REGN_MENU'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'afw_04_contx_pkg.obten_seqnc_contx(''PRODT'') is null'
,p_attribute_01=>'MENU_ACUEI'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1526270456949481907)
,p_name=>'SADA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
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
 p_id=>wwv_flow_api.id(1555815456232562815)
,p_name=>'SIDF'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_prompt=>'Test'
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_item_comment=>'Sie IDentifiant Fil (d''ariane)'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1555815683706562817)
,p_name=>'SSPC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1555815858696562817)
,p_name=>'SCPC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
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
 p_id=>wwv_flow_api.id(1556154677118182298)
,p_name=>'SAPC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1577639161109238962)
,p_name=>'SNPI'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_prompt=>'SNPI'
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1600379477506406595)
,p_name=>'SCPI'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1600379682701408118)
,p_name=>'SSPI'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1600379887549409465)
,p_name=>'SAPI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_display_as=>'NATIVE_HIDDEN'
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1672093221206470408)
,p_name=>'P0_RECHR_GLOBL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1528865339027982073)
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
,p_field_template=>wwv_flow_api.id(524973520615896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Recherche...'
,p_attribute_02=>'5'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1587385948826888601)
,p_name=>'AFW'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1587386221380888603)
,p_event_id=>wwv_flow_api.id(1587385948826888601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_CONFR_SAUVG'
,p_attribute_01=>'Êtes-vous certain de vouloir quitter cette page sans sauvegarder les modifications apportées?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1587409428871892284)
,p_event_id=>wwv_flow_api.id(1587385948826888601)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_DEPSM_TABLR_FORM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1587417432334893318)
,p_event_id=>wwv_flow_api.id(1587385948826888601)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_NAVGT_TABLR_FORM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1587425435451894125)
,p_event_id=>wwv_flow_api.id(1587385948826888601)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_GESTN_TABLR_FORM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80175903169022559)
,p_event_id=>wwv_flow_api.id(1587385948826888601)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_MENU_REDRC'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80176101444023407)
,p_event_id=>wwv_flow_api.id(1587385948826888601)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AIDE_PAGE_ITEM'
,p_attribute_01=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(80176332055024432)
,p_event_id=>wwv_flow_api.id(1587385948826888601)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AIDE_PAGE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1360282581385632101)
,p_event_id=>wwv_flow_api.id(1587385948826888601)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_MODFR_MDP'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(81198617019244318)
,p_event_id=>wwv_flow_api.id(1587385948826888601)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_NAVGT_ENREG'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(22079615887561327)
,p_event_id=>wwv_flow_api.id(1587385948826888601)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_FAVR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1929853631242935364)
,p_name=>'AFW - Commentaires/Bogues (Afficher dialogue)'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#boutn_comnt_bogue'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1929853941883935366)
,p_event_id=>wwv_flow_api.id(1929853631242935364)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Ajouter un commentaire et/ou bogue'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_comnt_bogue'
,p_attribute_07=>'PAGE'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic'
,p_attribute_15=>'102'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1929854229296944244)
,p_name=>'AFW - Commentaires/Bogues (Fermer dialogue)'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'div.dialg_comnt_bogue div.afw_21_actio_dynmq_dialg'
,p_bind_type=>'live'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1929854522690944245)
,p_event_id=>wwv_flow_api.id(1929854229296944244)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1929854844879948773)
,p_event_id=>wwv_flow_api.id(1929854229296944244)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1934495532760755786)
,p_event_id=>wwv_flow_api.id(1929854229296944244)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1360282674899687008)
,p_name=>'AFW - Modifier mot de passe (Afficher dialogue)'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_MODFR_MDP|DYNAMIC ACTION|afw_21_actio_dynmq_modfr_mp_afich'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1360282968301687010)
,p_event_id=>wwv_flow_api.id(1360282674899687008)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Modifier votre mot de passe'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_modfr_mot_passe'
,p_attribute_07=>'PAGE'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic(afw_11_aplic_pkg.obten_aplic_authe)'
,p_attribute_15=>'106'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1360283094984692718)
,p_name=>'AFW - Modifier mot de passe (Fermer dialogue)'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'div.dialg_modfr_mot_passe div.afw_21_actio_dynmq_dialg'
,p_bind_type=>'live'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1360283388561692720)
,p_event_id=>wwv_flow_api.id(1360283094984692718)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1360283587145692720)
,p_event_id=>wwv_flow_api.id(1360283094984692718)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1360283789769692720)
,p_event_id=>wwv_flow_api.id(1360283094984692718)
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
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Accueil'
,p_page_mode=>'NORMAL'
,p_step_title=>'Accueil'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'CARLO'
,p_last_upd_yyyymmddhh24miss=>'20140227100729'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81037128176834405)
,p_plug_name=>'Menu principal'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row liste-horzt">',
'  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">',
'    <a href="f?p=&APP_ID.:2:&SESSION.::&DEBUG.::SIDF:&SIDF.:">',
'      <i class="icon-bar-chart icone-liste"></i>',
'	  <div class="texte-liste">Méthodologie</div>',
'	</a>',
'  </div>',
'  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">',
'    <a href="f?p=&APP_ID.:3:&SESSION.::&DEBUG.::SIDF:&SIDF.:">',
'      <i class="icon-sitemap icone-liste"></i>',
'	  <div class="texte-liste">Développement</div>',
'	</a>',
'  </div>',
'  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">',
'    <a href="f?p=&APP_ID.:1051:&SESSION.::&DEBUG.::SIDF:&SIDF.:">',
'      <i class="icon-check icone-liste"></i>',
'	  <div class="texte-liste">Tâches</div>',
'	</a>',
'  </div>',
'  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">',
'    <a href="f?p=&APP_ID.:1055:&SESSION.::&DEBUG.::SIDF:&SIDF.:">',
'      <i class="icon-file-text-alt icone-liste"></i>',
'      <div class="texte-liste">Mes tâches</div>',
'	</a>',
'  </div>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Planification'
,p_page_mode=>'NORMAL'
,p_step_title=>'Planification'
,p_step_sub_title=>'Planification'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'CARLO'
,p_last_upd_yyyymmddhh24miss=>'20140227100834'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(81038518619333765)
,p_plug_name=>'Menu principal'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row liste-horzt">',
'  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">',
'    <a href="f?p=&APP_ID.:1001:&SESSION.::&DEBUG.::SIDF:&SIDF.:">',
'      <i class="icon-calendar icone-liste"></i>',
'      <div class="texte-liste">Jalons</div>',
'	</a>',
'  </div>',
'  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">',
'    <a href="f?p=&APP_ID.:1011:&SESSION.::&DEBUG.::SIDF:&SIDF.:">',
'      <i class="icon-group icone-liste"></i>',
'	  <div class="texte-liste">Équipes</div>',
'	</a>',
'  </div>',
'  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">',
'    <a href="f?p=&APP_ID.:1041:&SESSION.::&DEBUG.::SIDF:&SIDF.:">',
'      <i class="icon-tags icone-liste"></i>',
'	  <div class="texte-liste">Rôles</div>',
'	</a>',
'  </div>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Page de connexion'
,p_page_mode=>'NORMAL'
,p_step_title=>'Page de connexion'
,p_step_sub_title=>'Page de connexion'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(524953424161896528)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160429110235'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1526569035416039057)
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
 p_id=>wwv_flow_api.id(1526569634664039060)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1526569035416039057)
,p_button_name=>'P101_LOGIN'
,p_button_static_id=>'P101_LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976635139896554)
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
 p_id=>wwv_flow_api.id(1526569236949039059)
,p_name=>'P101_CODE_UTILS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1526569035416039057)
,p_prompt=>'Code d''utilisateur'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_cHeight=>1
,p_colspan=>2
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1526569445333039060)
,p_name=>'P101_MOT_PASSE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1526569035416039057)
,p_prompt=>'Mot de passe'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1526569837217039060)
,p_name=>'P101_DOMN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1526569035416039057)
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
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1526570037181039061)
,p_name=>'P101_LANG'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1526569035416039057)
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
,p_field_template=>wwv_flow_api.id(524973520615896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1526570230662039061)
,p_name=>'P101_FORCE_DOMN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
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
 p_id=>wwv_flow_api.id(1526570647328039063)
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
 p_id=>wwv_flow_api.id(1526570431387039062)
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
 p_id=>wwv_flow_api.id(1526571039661039063)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Effacer la cache de la page de connexion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1526571221642039063)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Redirection vers le produit d''authentification'
,p_process_sql_clob=>'afw_12_authe_apex_pkg.redrg_prodt_authe;'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1526570851186039063)
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
 p_id=>wwv_flow_api.id(1549848441818770016)
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
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Commentaire'
,p_alias=>'FEEDBACK_102'
,p_page_mode=>'NORMAL'
,p_step_title=>'Commentaire'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(524954649145896531)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_page_comment=>'This page was generated by the feedback wizard'
,p_last_upd_yyyymmddhh24miss=>'20160513151934'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1929810327091374428)
,p_plug_name=>'Commentaire'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524961829157896538)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1929851225561848635)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1929813149377374433)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1929851225561848635)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1929810544890374428)
,p_name=>'P102_APPLICATION_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(1929810327091374428)
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
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Identifies Application.'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1929811048714374431)
,p_name=>'P102_PAGE_ID'
,p_item_sequence=>2
,p_item_plug_id=>wwv_flow_api.id(1929810327091374428)
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
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Identifies page within application.'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1929811528641374431)
,p_name=>'P102_A'
,p_item_sequence=>3
,p_item_plug_id=>wwv_flow_api.id(1929810327091374428)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1929811745567374432)
,p_name=>'P102_FEEDBACK'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1929810327091374428)
,p_prompt=>'Commentaire'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>90
,p_cMaxlength=>4000
,p_cHeight=>6
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Enter your feedback and press the submit feedback button.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1929812243662374433)
,p_name=>'P102_X'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1929810327091374428)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1929812451604374433)
,p_name=>'P102_FEEDBACK_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1929810327091374428)
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
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Veuillez identifier le type de commentaire.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1929812951375374433)
,p_name=>'P102_Y'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1929810327091374428)
,p_display_as=>'NATIVE_STOP_AND_START_HTML_TABLE'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1929813549374374434)
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
,p_process_when_button_id=>wwv_flow_api.id(1929813149377374433)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1929855324494971270)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_process_name=>'Fermer le dialogue'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_01001
begin
wwv_flow_api.create_page(
 p_id=>1001
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Liste des produits'
,p_page_mode=>'NORMAL'
,p_step_title=>'Liste des produits'
,p_step_sub_title=>'Liste des produits'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20131031160452'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456630133370618334)
,p_plug_name=>'Liste des produits'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select "SEQNC", ',
'"CODE",',
'"NOM"/*,',
'"DESCR"*/',
'from VD_AFW_11_PRODT'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456630342546618334)
,p_name=>'Liste des systèmes'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_no_data_found_message=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV'
,p_detail_link=>'f?p=&APP_ID.:1021:&SESSION.::&DEBUG.:RP:SIDF,SCPI,SSPI:&SIDF.,PRODT,#SEQNC#'
,p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'GINFR'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456630419351618337)
,p_db_column_name=>'SEQNC'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Seqnc'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_static_id=>'SEQNC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456630545061618338)
,p_db_column_name=>'CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Code'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'CODE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456630628450618340)
,p_db_column_name=>'NOM'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Nom'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'NOM'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456630742546618343)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4530479'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SEQNC:CODE:NOM:DESCR'
,p_sort_column_1=>'NOM'
,p_sort_direction_1=>'ASC'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_01011
begin
wwv_flow_api.create_page(
 p_id=>1011
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Équipes'
,p_page_mode=>'NORMAL'
,p_step_title=>'Équipes'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20160513151731'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456612820113082189)
,p_plug_name=>'Équipes'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select "SEQNC", ',
'"CODE",',
'"NOM",',
'"DESCR"',
'from "VD_AFW_32_EQUIP" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_prn_output_show_link=>'Y'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456613048167082189)
,p_name=>'Équipes'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_no_data_found_message=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:1012:&SESSION.::&DEBUG.:RP:SIDF,SSPC:&SIDF.,#SEQNC#'
,p_detail_link_text=>' &A_AFW_13_LIEN_EDITN_RAPRT.'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'FOUER'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456613147364082191)
,p_db_column_name=>'SEQNC'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Seqnc'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SEQNC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456613241608082192)
,p_db_column_name=>'CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Code'
,p_allow_sorting=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'CODE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456613331618082192)
,p_db_column_name=>'NOM'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Nom'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'NOM'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456613441886082192)
,p_db_column_name=>'DESCR'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Description'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'DESCR'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456615324093245453)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4530325'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SEQNC:CODE:NOM:DESCR'
,p_sort_column_1=>'NOM'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456641137383975596)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456613718626082193)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(456641137383975596)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Créer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:1012:&SESSION.::&DEBUG.::SSPC,SIDF:,&SIDF.'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
end;
/
prompt --application/pages/page_01012
begin
wwv_flow_api.create_page(
 p_id=>1012
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Équipe'
,p_page_mode=>'NORMAL'
,p_step_title=>'Équipe'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20160513152058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456608943553082164)
,p_plug_name=>'Équipe'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524961247111896538)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456656134892495185)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(456675042558875884)
,p_plug_name=>'Membres'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524965123033896540)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select SEQNC,',
'   REF_EQUIP,',
'   REF_UTILS,',
'   afw_12_utils_pkg.obten_nom_formt_de_utils (REF_UTILS) ref_utils_formt,',
'   DEBUT_EFECT,',
'   FIN_EFECT,',
'   POURC_IMPLI_EQUIP',
'from VD_AFW_32_LIEN_EQUIP ',
'where REF_EQUIP = :P1012_SEQNC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P1012_SEQNC'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_prn_output_show_link=>'Y'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456675147500875885)
,p_name=>'Liens équipes'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_no_data_found_message=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_max_rows_per_page=>'15'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'javascript:apex.item(''P1012_LIEN_EQUIP'').setValue(#SEQNC#);'
,p_detail_link_text=>' &A_AFW_13_LIEN_EDITN_RAPRT.'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'FOUER'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456675448652875891)
,p_db_column_name=>'SEQNC'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Seqnc'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SEQNC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456675531745875891)
,p_db_column_name=>'REF_EQUIP'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Équipe'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_EQUIP'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456675643324875892)
,p_db_column_name=>'REF_UTILS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Utilisateur'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_UTILS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456675735863875892)
,p_db_column_name=>'DEBUT_EFECT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Début effectivité'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'YYYY-MM-DD'
,p_tz_dependent=>'N'
,p_static_id=>'DEBUT_EFECT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456675819768875892)
,p_db_column_name=>'FIN_EFECT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Fin effectivité'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'YYYY-MM-DD'
,p_tz_dependent=>'N'
,p_static_id=>'FIN_EFECT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456675950708875892)
,p_db_column_name=>'POURC_IMPLI_EQUIP'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Pourcentage'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'POURC_IMPLI_EQUIP'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456713934433037159)
,p_db_column_name=>'REF_UTILS_FORMT'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Utilisateur'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_UTILS_FORMT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456694119691493657)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4531113'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'REF_UTILS_FORMT:POURC_IMPLI_EQUIP:DEBUT_EFECT:FIN_EFECT:'
,p_sort_column_1=>'REF_UTILS_FORMT'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'DEBUT_EFECT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456609533771082166)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(456656134892495185)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'&A_AFW_04_SOURC_URL.'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456609235396082166)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456656134892495185)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1012_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456609125003082166)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(456656134892495185)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1012_SEQNC'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456670136053779404)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(456675042558875884)
,p_button_name=>'CREER_LIEN_EQUIP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Ajouter'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>':P1012_seqnc is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_button_css_classes=>'btn-primary'
,p_button_cattributes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456609334300082166)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(456656134892495185)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976635139896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P1012_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_cattributes=>'fa-remove'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723935220091195070)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(456655639909458842)
,p_branch_action=>'f?p=&APP_ID.:&A_AFW_04_SOURC_NUMR_PAGE.:&SESSION.::&DEBUG.::SIDF:&SIDF.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(456609334300082166)
,p_branch_sequence=>10
,p_branch_comment=>'Created 22-JAN-2013 11:37 by FOUER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(456610446470082170)
,p_branch_action=>'f?p=&APP_ID.:1012:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456610638012082171)
,p_name=>'P1012_SEQNC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Seqnc'
,p_source=>'SEQNC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456610827753082180)
,p_name=>'P1012_CODE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(456608943553082164)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Code'
,p_source=>'CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>23
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456611028177082181)
,p_name=>'P1012_NOM'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456608943553082164)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom'
,p_source=>'NOM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>60
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456611221099082181)
,p_name=>'P1012_DESCR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456608943553082164)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456704419419749073)
,p_name=>'P1012_LIEN_EQUIP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456703343268727507)
,p_name=>'Lien équipe - Afficher dialogue (création)'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(456670136053779404)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456703645514727508)
,p_event_id=>wwv_flow_api.id(456703343268727507)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Ajouter un membre'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_lien_equip'
,p_attribute_07=>'PAGE'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic(''SAFM'')'
,p_attribute_15=>'1013'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456704535134763057)
,p_name=>'Lien équipe - Afficher dialogue (modification)'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1012_LIEN_EQUIP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456704834491763058)
,p_event_id=>wwv_flow_api.id(456704535134763057)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Mettre à jour un membre'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_lien_equip'
,p_attribute_07=>'PAGE'
,p_attribute_10=>'P1012_LIEN_EQUIP'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic(''SAFM'')'
,p_attribute_15=>'1013'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456705137474782616)
,p_name=>'Lien équipe - fermer dialogue'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'div.dialg_lien_equip div.afw_21_actio_dynmq_dialg'
,p_bind_type=>'live'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456705424989782617)
,p_event_id=>wwv_flow_api.id(456705137474782616)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456705621675787498)
,p_event_id=>wwv_flow_api.id(456705137474782616)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456675042558875884)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456705825831788724)
,p_event_id=>wwv_flow_api.id(456705137474782616)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456706029294789716)
,p_event_id=>wwv_flow_api.id(456705137474782616)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456611919421082183)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from VD_AFW_32_EQUIP'
,p_attribute_02=>'VD_AFW_32_EQUIP'
,p_attribute_03=>'P1012_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_13_MESG_IMPOS_FETCH.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456612144616082184)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of VD_AFW_32_EQUIP'
,p_attribute_02=>'VD_AFW_32_EQUIP'
,p_attribute_03=>'P1012_SEQNC'
,p_attribute_04=>'SEQNC'
,p_attribute_09=>'P1012_SEQNC'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
,p_security_scheme=>wwv_flow_api.id(1723951025632196700)
);
end;
/
prompt --application/pages/page_01013
begin
wwv_flow_api.create_page(
 p_id=>1013
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Lien équipe'
,p_page_mode=>'NORMAL'
,p_step_title=>'Lien équipe'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>'))
,p_step_template=>wwv_flow_api.id(524954649145896531)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513152058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456679827209013375)
,p_plug_name=>'Lien équipe'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
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
 p_id=>wwv_flow_api.id(456680045909018786)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456680937644044684)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(456680045909018786)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456682243232074739)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(456680045909018786)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1013_SEQNC'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456690425607372376)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(456680045909018786)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1013_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456690129500354552)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456680045909018786)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976635139896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P1013_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_cattributes=>'fa-remove'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723935220091195070)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456690931971383727)
,p_name=>'P1013_SEQNC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_use_cache_before_default=>'NO'
,p_source=>'SEQNC'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_api.id(456691123445390704)
,p_name=>'P1013_REF_EQUIP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_use_cache_before_default=>'NO'
,p_item_default=>':A_AFW_04_SOURC_SEQNC_CONTX'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'REF_EQUIP'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_api.id(456691922714437799)
,p_name=>'P1013_REF_UTILS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456679827209013375)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Utilisateur'
,p_source=>'REF_UTILS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_IO_AFW_21_SELCT_2'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select NOM_FORMT d,SEQNC r ',
'from VD_AFW_12_UTILS'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Choisir -'
,p_cSize=>250
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGL_VALUE'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'10'
,p_attribute_05=>'100'
,p_attribute_06=>'0'
,p_attribute_07=>'0'
,p_attribute_09=>':'
,p_attribute_10=>'LIKE_IGNORE'
,p_attribute_11=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select NOM_FORMT d,SEQNC r ',
'from VD_AFW_12_UTILS'))
,p_attribute_12=>'300px'
,p_attribute_13=>'N'
,p_attribute_14=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456692525270447998)
,p_name=>'P1013_DEBUT_EFECT'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(456679827209013375)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date début effectif'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'DEBUT_EFECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456692718821455555)
,p_name=>'P1013_FIN_EFECT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(456679827209013375)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date fin effectif'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'FIN_EFECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456693128995467941)
,p_name=>'P1013_POURC_IMPLI_EQUIP'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456679827209013375)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Pourcentage d''implication'
,p_post_element_text=>'%'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'POURC_IMPLI_EQUIP'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>5
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'0'
,p_attribute_02=>'100'
,p_attribute_03=>'left'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456695721254531985)
,p_name=>'Fermer le dialogue - lien équipe'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(456680937644044684)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456696041361531985)
,p_event_id=>wwv_flow_api.id(456695721254531985)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456693941031490375)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from VD_AFW_32_LIEN_EQUIP'
,p_attribute_02=>'VD_AFW_32_LIEN_EQUIP'
,p_attribute_03=>'P1013_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_13_MESG_IMPOS_FETCH.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456695224109513847)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'PROCESS ROW OF VD_AFW_32_LIEN_EQUIP'
,p_attribute_02=>'VD_AFW_32_LIEN_EQUIP'
,p_attribute_03=>'P1013_SEQNC'
,p_attribute_04=>'SEQNC'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST IN (''CREATE'',''SAVE'',''DELETE'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
,p_security_scheme=>wwv_flow_api.id(1723951025632196700)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456696225887542724)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_process_name=>'Fermer dialogue'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_01021
begin
wwv_flow_api.create_page(
 p_id=>1021
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Jalons'
,p_page_mode=>'NORMAL'
,p_step_title=>'Jalons'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20160513151731'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456602728562955399)
,p_plug_name=>'Jalons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select   j.seqnc,',
'         j.date_prevu,',
'         j.nom',
'  from   vd_afw_32_jalon j',
' where   j.ref_prodt = afw_04_contx_pkg.obten_seqnc_contx (''PRODT'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456602950658955399)
,p_name=>'Jalons'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_no_data_found_message=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:1022:&SESSION.::&DEBUG.:RP:SSPC,SIDF:#SEQNC#,&SIDF.'
,p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'CARLO'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456603039842955400)
,p_db_column_name=>'SEQNC'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Seqnc'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'SEQNC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456603247432955401)
,p_db_column_name=>'DATE_PREVU'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Date prévue'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'YYYY-MM-DD'
,p_tz_dependent=>'N'
,p_static_id=>'DATE_PREVU'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456604726227000102)
,p_db_column_name=>'NOM'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nom'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'NOM'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456605227051009813)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4530224'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'DATE_PREVU:NOM:REF_PRODT_FORMT:'
,p_sort_column_1=>'DATE_PREVU'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'NOM'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456604144188976937)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456603840788955404)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456604144188976937)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Créer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:1022:&SESSION.::&DEBUG.::SIDF,SSPC:&SIDF.,'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456632447734659132)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'PLUGIN_IO_AFW_21_CHANG_LIBL_FIL_ARI'
,p_process_name=>'Changer libellé fil ariane'
,p_attribute_01=>'afw_11_prodt_pkg.obten_code_prodt(afw_04_contx_pkg.obten_seqnc_contx(''PRODT'')) ||'': Jalons'''
);
end;
/
prompt --application/pages/page_01022
begin
wwv_flow_api.create_page(
 p_id=>1022
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Jalon'
,p_page_mode=>'NORMAL'
,p_step_title=>'Jalon'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513152058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456599235085955357)
,p_plug_name=>'Jalon'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524961247111896538)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456606446706034350)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456665635912694152)
,p_plug_name=>'Équipes'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524965123033896540)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT seqnc,',
'       ref_equip_formt,',
'       debut_efect,',
'       fin_efect,',
'       pourc_afect_equip_jalon',
'  FROM vd_afw_32_jalon_equip',
' WHERE ref_jalon = :P1022_SEQNC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P1022_SEQNC'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456665746139694154)
,p_name=>'Jalon par équipe'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_no_data_found_message=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'javascript:apex.item(''P1022_JALON_EQUIP'').setValue(#SEQNC#);'
,p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'GARJE'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456665924366694157)
,p_db_column_name=>'SEQNC'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Seqnc'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SEQNC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456666048204694158)
,p_db_column_name=>'REF_EQUIP_FORMT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Équipe'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_EQUIP_FORMT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456666225777694158)
,p_db_column_name=>'DEBUT_EFECT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Début effectivité'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'YYYY-MM-DD'
,p_tz_dependent=>'N'
,p_static_id=>'DEBUT_EFECT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456666319564694158)
,p_db_column_name=>'FIN_EFECT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Fin effectivité'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'YYYY-MM-DD'
,p_tz_dependent=>'N'
,p_static_id=>'FIN_EFECT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456666449024694158)
,p_db_column_name=>'POURC_AFECT_EQUIP_JALON'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Pourcentage affecté'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'POURC_AFECT_EQUIP_JALON'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456666930634711536)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4530841'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'REF_EQUIP_FORMT:POURC_AFECT_EQUIP_JALON:DEBUT_EFECT:FIN_EFECT:'
,p_sort_column_1=>'REF_EQUIP_FORMT'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'DEBUT_EFECT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456599841076955358)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(456606446706034350)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'&A_AFW_04_SOURC_URL.'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456668950335764581)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(456665635912694152)
,p_button_name=>'CREER_JALON_EQUIP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ajouter'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_css_classes=>'btn-primary'
,p_button_cattributes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456599529500955358)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(456606446706034350)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1022_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456599427498955358)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(456606446706034350)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1022_SEQNC'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456599627183955358)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456606446706034350)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976635139896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P1022_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_cattributes=>'fa-remove'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723935220091195070)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(456658748230536900)
,p_branch_action=>'f?p=&APP_ID.:&A_AFW_04_SOURC_NUMR_PAGE.:&SESSION.::&DEBUG.::SIDF:&SIDF.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(456599627183955358)
,p_branch_sequence=>10
,p_branch_comment=>'Created 22-JAN-2013 11:50 by GARJE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(456600637081955367)
,p_branch_action=>'f?p=&APP_ID.:1022:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456600848134955374)
,p_name=>'P1022_SEQNC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Seqnc'
,p_source=>'SEQNC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456601018129955381)
,p_name=>'P1022_NOM'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(456599235085955357)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom'
,p_source=>'NOM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>60
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456601224925955382)
,p_name=>'P1022_REF_PRODT'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_use_cache_before_default=>'NO'
,p_item_default=>'afw_04_contx_pkg.obten_seqnc_contx(''PRODT'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'REF_PRODT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973931159896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456601437732955382)
,p_name=>'P1022_DATE_PREVU'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456599235085955357)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date prévue'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'DATE_PREVU'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456695642594528611)
,p_name=>'P1022_JALON_EQUIP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456693539992490021)
,p_name=>'Equipe du jalon - Afficher dialogue (Création)'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(456668950335764581)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456693833419490022)
,p_event_id=>wwv_flow_api.id(456693539992490021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Ajouter une équipe'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_jalon_equip'
,p_attribute_07=>'PAGE'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic(''SAFM'')'
,p_attribute_15=>'1023'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456694844064510120)
,p_name=>'Équipe du jalon - Afficher Dialogue (Modification)'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1022_JALON_EQUIP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456695122839510120)
,p_event_id=>wwv_flow_api.id(456694844064510120)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Mettre à jour une équipe'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_jalon_equip'
,p_attribute_07=>'PAGE'
,p_attribute_10=>'P1022_JALON_EQUIP'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic(''SAFM'')'
,p_attribute_15=>'1023'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456697936108583571)
,p_name=>'Équipe du jalon - Fermer dialogue'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'div.dialg_jalon_equip div.afw_21_actio_dynmq_dialg'
,p_bind_type=>'live'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456698228385583573)
,p_event_id=>wwv_flow_api.id(456697936108583571)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456698618924588073)
,p_event_id=>wwv_flow_api.id(456697936108583571)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456665635912694152)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456698826542590213)
,p_event_id=>wwv_flow_api.id(456697936108583571)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456699130698591403)
,p_event_id=>wwv_flow_api.id(456697936108583571)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456601831196955386)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from VD_AFW_32_JALON'
,p_attribute_02=>'VD_AFW_32_JALON'
,p_attribute_03=>'P1022_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_13_MESG_IMPOS_FETCH.'
,p_process_when=>'P1022_SEQNC'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456869350478609785)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'PLUGIN_IO_AFW_21_CHANG_LIBL_FIL_ARI'
,p_process_name=>'Changer libellé fil ariane'
,p_attribute_01=>':P1022_NOM'
,p_process_when=>'P1022_SEQNC'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456602049207955387)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of VD_AFW_32_JALON'
,p_attribute_02=>'VD_AFW_32_JALON'
,p_attribute_03=>'P1022_SEQNC'
,p_attribute_04=>'SEQNC'
,p_attribute_09=>'P1022_SEQNC'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
,p_security_scheme=>wwv_flow_api.id(1723951025632196700)
);
end;
/
prompt --application/pages/page_01023
begin
wwv_flow_api.create_page(
 p_id=>1023
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Équipe jalon'
,p_page_mode=>'NORMAL'
,p_step_title=>'Équipe'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>',
''))
,p_step_template=>wwv_flow_api.id(524954649145896531)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513152058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456676138364921995)
,p_plug_name=>'Équipe jalon'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
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
 p_id=>wwv_flow_api.id(456676344944923871)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>5
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456678126075956200)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(456676344944923871)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456676544036933038)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(456676344944923871)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1023_SEQNC'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456677242913951696)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456676344944923871)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1023_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456676843475942370)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(456676344944923871)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976635139896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P1023_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_cattributes=>'fa-remove'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723935220091195070)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456679018288991833)
,p_name=>'P1023_REF_JALON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_item_default=>':A_AFW_04_SOURC_SEQNC_CONTX'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'REF_JALON'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_api.id(456681238337044917)
,p_name=>'P1023_SEQNC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_source=>'SEQNC'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_api.id(456681730157052015)
,p_name=>'P1023_DEBUT_EFEC'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456676138364921995)
,p_prompt=>'Début effectivité'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'DEBUT_EFECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456681942277055513)
,p_name=>'P1023_FIN_EFECT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456676138364921995)
,p_prompt=>'Fin effectivité'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'FIN_EFECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456682634490091113)
,p_name=>'P1023_REF_EQUIP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(456676138364921995)
,p_prompt=>'Équipe'
,p_source=>'REF_EQUIP'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_IO_AFW_21_SELCT_2'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT nom d, seqnc r ',
'FROM VD_AFW_12_UTILS'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Choisir -'
,p_cSize=>200
,p_cMaxlength=>4000
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGL_VALUE'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'10'
,p_attribute_05=>'100'
,p_attribute_06=>'0'
,p_attribute_07=>'0'
,p_attribute_09=>':'
,p_attribute_10=>'LIKE_IGNORE'
,p_attribute_11=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT nom d, seqnc r ',
'FROM VD_AFW_12_UTILS'))
,p_attribute_12=>'300px'
,p_attribute_13=>'N'
,p_attribute_14=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456702227637694630)
,p_name=>'P1023_POURC_AFECT_EQUIP_JALON'
,p_is_required=>true
,p_item_sequence=>15
,p_item_plug_id=>wwv_flow_api.id(456676138364921995)
,p_prompt=>'Pourcentage affecté'
,p_post_element_text=>'%'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'POURC_AFECT_EQUIP_JALON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>6
,p_cMaxlength=>6
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'0'
,p_attribute_02=>'100'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456692033450440861)
,p_name=>'Fermer dialogue'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(456678126075956200)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456692341220440862)
,p_event_id=>wwv_flow_api.id(456692033450440861)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456691230155402094)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'FETCH ROW VD_AFW_32_JALON_EQUIP'
,p_attribute_02=>'VD_AFW_32_JALON_EQUIP'
,p_attribute_03=>'P1023_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_13_MESG_IMPOS_FETCH.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456691629378420729)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'PROCESS ROW OF VD_AFW_32_JALON_EQUIP'
,p_attribute_02=>'VD_AFW_32_JALON_EQUIP'
,p_attribute_03=>'P1023_SEQNC'
,p_attribute_04=>'SEQNC'
,p_attribute_09=>'P1023_SEQNC'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST IN (''CREATE'',''SAVE'',''DELETE'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
,p_security_scheme=>wwv_flow_api.id(1723951025632196700)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456692834058459979)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_process_name=>'Fermer le dialogue'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_01031
begin
wwv_flow_api.create_page(
 p_id=>1031
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Disponibilités'
,p_page_mode=>'NORMAL'
,p_step_title=>'Disponibilités'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513151731'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456765947688401705)
,p_plug_name=>'Disponibilités utilisateurs'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT "SEQNC",',
'       "REF_UTILS_FORMT",',
'       "DEBUT_EFECT",',
'       "EFORT_DISPN_SEMN",',
'       "FIN_EFECT"',
'  FROM "#OWNER#"."VD_AFW_32_DISPN_UTILS"',
' WHERE ref_utils = afw_04_contx_pkg.obten_seqnc_contx (''UTILS_SAFD'')',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456766124997401706)
,p_name=>'Disponibilités utilisateurs'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_no_data_found_message=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'javascript:apex.item(''P1031_DISPN_UTILS'').setValue(#SEQNC#);'
,p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'GARJE'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456766239635401708)
,p_db_column_name=>'SEQNC'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Seqnc'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_static_id=>'SEQNC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456766344688401710)
,p_db_column_name=>'REF_UTILS_FORMT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Utilisateur'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_UTILS_FORMT'
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'afw_04_contx_pkg.obten_seqnc_contx(''UTILS_SAFD'') is null'
,p_column_comment=>'La condition "item / column null" ne marche pas dans ce cas '
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456766446609401711)
,p_db_column_name=>'DEBUT_EFECT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Debut effectivité'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'YYYY-MM-DD'
,p_tz_dependent=>'N'
,p_static_id=>'DEBUT_EFECT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456766537222401711)
,p_db_column_name=>'EFORT_DISPN_SEMN'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Effort disponible'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'EFORT_DISPN_SEMN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456766630657401711)
,p_db_column_name=>'FIN_EFECT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Fin effectivité'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'YYYY-MM-DD'
,p_tz_dependent=>'N'
,p_static_id=>'FIN_EFECT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456783226970088673)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4532004'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'REF_UTILS_FORMT:EFORT_DISPN_SEMN:DEBUT_EFECT:FIN_EFECT:'
,p_sort_column_1=>'DEBUT_EFECT'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456767240916449391)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456766833391401711)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456767240916449391)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ajouter'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456772830630578836)
,p_name=>'P1031_DISPN_UTILS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456768633129484964)
,p_name=>'Disponibilité - Afficher dialogue (création)'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(456766833391401711)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456768941117484965)
,p_event_id=>wwv_flow_api.id(456768633129484964)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Ajouter une disponibilité'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_dispn_utils'
,p_attribute_07=>'PAGE'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic(''SAFM'')'
,p_attribute_15=>'1032'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456769536507504841)
,p_name=>'Disponibilité - Afficher dialogue (modification)'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1031_DISPN_UTILS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456769830969504842)
,p_event_id=>wwv_flow_api.id(456769536507504841)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Mettre à jour une disponibilité'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_dispn_utils'
,p_attribute_07=>'PAGE'
,p_attribute_10=>'P1031_DISPN_UTILS'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic(''SAFM'')'
,p_attribute_15=>'1032'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456770446335517149)
,p_name=>'Disponibilité - Fermer dialogue'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'div.dialg_dispn_utils div.afw_21_actio_dynmq_dialg'
,p_bind_type=>'live'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456770737211517151)
,p_event_id=>wwv_flow_api.id(456770446335517149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456770925688520648)
,p_event_id=>wwv_flow_api.id(456770446335517149)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456765947688401705)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456771131921522434)
,p_event_id=>wwv_flow_api.id(456770446335517149)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456771337462523997)
,p_event_id=>wwv_flow_api.id(456770446335517149)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_01032
begin
wwv_flow_api.create_page(
 p_id=>1032
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Disponibilité'
,p_page_mode=>'NORMAL'
,p_step_title=>'Disponibilité'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>',
''))
,p_step_template=>wwv_flow_api.id(524954649145896531)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20160513152058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456761928819401676)
,p_plug_name=>'Disponibilité'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524961247111896538)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456791334008298830)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456762523602401678)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(456791334008298830)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456762218447401678)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456791334008298830)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1032_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456762150328401678)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(456791334008298830)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1032_SEQNC'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456762346156401678)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(456791334008298830)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976635139896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P1032_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_cattributes=>'fa-remove'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723935220091195070)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456763639232401682)
,p_name=>'P1032_SEQNC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Seqnc'
,p_source=>'SEQNC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456764226065401692)
,p_name=>'P1032_DEBUT_EFECT'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456761928819401676)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Début effectivitée'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'DEBUT_EFECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456764435406401692)
,p_name=>'P1032_EFORT_DISPN_SEMN'
,p_is_required=>true
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_api.id(456761928819401676)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Effort disponible'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'EFORT_DISPN_SEMN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>3
,p_cMaxlength=>3
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456764634476401692)
,p_name=>'P1032_FIN_EFECT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(456761928819401676)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date début effectivitée'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'FIN_EFECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456796643807434129)
,p_name=>'P1032_REF_UTILS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(456761928819401676)
,p_item_default=>'afw_04_contx_pkg.obten_seqnc_contx(''UTILS_SAFD'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Utilisateur'
,p_source=>'REF_UTILS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT nom_formt d, seqnc r ',
'FROM VD_AFW_12_UTILS'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Choisir -'
,p_cSize=>200
,p_cMaxlength=>4000
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'afw_04_contx_pkg.obten_seqnc_contx(''UTILS_SAFD'') is null'
,p_read_only_when=>'afw_04_contx_pkg.obten_seqnc_contx(''UTILS_SAFD'') is not null'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456793118864351187)
,p_name=>'Fermer dialogue'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(456762523602401678)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456793440413351188)
,p_event_id=>wwv_flow_api.id(456793118864351187)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456765043094401694)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from VD_AFW_32_DISPN_UTILS'
,p_attribute_02=>'VD_AFW_32_DISPN_UTILS'
,p_attribute_03=>'P1032_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_13_MESG_IMPOS_FETCH.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456765248429401695)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of VD_AFW_32_DISPN_UTILS'
,p_attribute_02=>'VD_AFW_32_DISPN_UTILS'
,p_attribute_03=>'P1032_SEQNC'
,p_attribute_04=>'SEQNC'
,p_attribute_09=>'P1032_SEQNC'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST IN (''CREATE'',''SAVE'',''DELETE'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
,p_security_scheme=>wwv_flow_api.id(1723951025632196700)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456811746699718755)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_process_name=>'Fermer le dialogue'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_01041
begin
wwv_flow_api.create_page(
 p_id=>1041
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Rôles'
,p_page_mode=>'NORMAL'
,p_step_title=>'Rôles'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513151731'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456804322090591161)
,p_plug_name=>'Rôles'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select "SEQNC", ',
'"CODE",',
'"NOM",',
'"DESCR"',
'from "VD_AFW_32_ROLE" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456804521455591161)
,p_name=>'Rôles'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_no_data_found_message=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:1042:&SESSION.::&DEBUG.:RP:SIDF,SSPC:&SIDF.,#SEQNC#'
,p_detail_link_text=>' &A_AFW_13_LIEN_EDITN_RAPRT.'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'FOUER'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456804625609591164)
,p_db_column_name=>'SEQNC'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Seqnc'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SEQNC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456804730253591165)
,p_db_column_name=>'CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Code'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'CODE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456804834924591165)
,p_db_column_name=>'NOM'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Nom'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'NOM'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456804945120591165)
,p_db_column_name=>'DESCR'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Description'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'DESCR'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456814536319791457)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4532317'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'CODE:NOM:'
,p_sort_column_1=>'NOM'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456814927923807907)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456805136018591166)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456814927923807907)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Créer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:1042:&SESSION.::&DEBUG.::SSPC,SIDF:,&SIDF.'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
end;
/
prompt --application/pages/page_01042
begin
wwv_flow_api.create_page(
 p_id=>1042
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Rôle'
,p_page_mode=>'NORMAL'
,p_step_title=>'Rôle'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513152058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456800749552591132)
,p_plug_name=>'Rôles'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524961247111896538)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456819921446938551)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(456846441130257105)
,p_plug_name=>'Affectation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524965123033896540)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select SEQNC,    ',
'       REF_ROLE,  ',
'       REF_UTILS,',
'       REF_UTILS_FORMT,  ',
'       DEBUT_EFECT,  ',
'       FIN_EFECT',
'from VD_AFW_32_ROLE_UTILS',
'where REF_ROLE = :P1042_SEQNC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P1042_SEQNC'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456846537787257107)
,p_name=>'Rôles utilisateur'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_no_data_found_message=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_max_rows_per_page=>'15'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'javascript:apex.item(''P1042_ROLE_UTILS'').setValue(#SEQNC#);'
,p_detail_link_text=>' &A_AFW_13_LIEN_EDITN_RAPRT.'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'FOUER'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456846724906257114)
,p_db_column_name=>'SEQNC'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Seqnc'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SEQNC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456846837944257115)
,p_db_column_name=>'REF_ROLE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Ref Role'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_ROLE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456846927031257115)
,p_db_column_name=>'REF_UTILS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Ref Utils'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_UTILS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456847049296257115)
,p_db_column_name=>'DEBUT_EFECT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Début effectivité'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'YYYY-MM-DD'
,p_tz_dependent=>'N'
,p_static_id=>'DEBUT_EFECT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456847127458257115)
,p_db_column_name=>'FIN_EFECT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Fin effectivité'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'YYYY-MM-DD'
,p_tz_dependent=>'N'
,p_static_id=>'FIN_EFECT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456881834660813370)
,p_db_column_name=>'REF_UTILS_FORMT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Utilisateur'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_UTILS_FORMT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456848945640334096)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4532661'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'REF_UTILS_FORMT:DEBUT_EFECT:FIN_EFECT:'
,p_sort_column_1=>'REF_UTILS_FORMT'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'DEBUT_EFECT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456801319674591136)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(456819921446938551)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'&A_AFW_04_SOURC_URL.'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456801043986591136)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456819921446938551)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1042_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456800947874591136)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(456819921446938551)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1042_SEQNC'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456849331919339551)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(456846441130257105)
,p_button_name=>'CREER_ROLE_UTILS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Ajouter'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>':P1042_seqnc is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_button_css_classes=>'btn-primary'
,p_button_cattributes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456801118534591136)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(456819921446938551)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976635139896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P1042_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_cattributes=>'fa-remove'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723935220091195070)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(456821943405029976)
,p_branch_action=>'f?p=&APP_ID.:&A_AFW_04_SOURC_NUMR_PAGE.:&SESSION.::&DEBUG.::SIDF:&SIDF.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(456801118534591136)
,p_branch_sequence=>10
,p_branch_comment=>'Created 23-JAN-2013 16:59 by FOUER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(456802244162591141)
,p_branch_action=>'f?p=&APP_ID.:1042:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456802431386591143)
,p_name=>'P1042_SEQNC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_prompt=>'Seqnc'
,p_source=>'SEQNC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456802632555591151)
,p_name=>'P1042_CODE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(456800749552591132)
,p_prompt=>'Code'
,p_source=>'CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>23
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456802821128591152)
,p_name=>'P1042_NOM'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456800749552591132)
,p_prompt=>'Nom'
,p_source=>'NOM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>60
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456803031294591152)
,p_name=>'P1042_DESCR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456800749552591132)
,p_prompt=>'Description'
,p_source=>'DESCR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456848419190316916)
,p_name=>'P1042_ROLE_UTILS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
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
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456849634043368529)
,p_name=>'Rôle utilisateur - Afficher dialogue (création)'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(456849331919339551)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456849926701368531)
,p_event_id=>wwv_flow_api.id(456849634043368529)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Ajouter une affectation'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_role_utils'
,p_attribute_07=>'PAGE'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic(''SAFM'')'
,p_attribute_15=>'1043'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456850342617389910)
,p_name=>'Rôle utilisateur - Afficher dialogue (modification)'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1042_ROLE_UTILS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456850646086389911)
,p_event_id=>wwv_flow_api.id(456850342617389910)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Mettre à jour une affectation'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_role_utils'
,p_attribute_07=>'PAGE'
,p_attribute_10=>'P1042_ROLE_UTILS'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic(''SAFM'')'
,p_attribute_15=>'1043'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456851937338407326)
,p_name=>'Rôle utilisateur - fermer dialogue'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'div.dialg_role_utils div.afw_21_actio_dynmq_dialg'
,p_bind_type=>'live'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456852241329407327)
,p_event_id=>wwv_flow_api.id(456851937338407326)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456852423270412695)
,p_event_id=>wwv_flow_api.id(456851937338407326)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456846441130257105)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456852631235415072)
,p_event_id=>wwv_flow_api.id(456851937338407326)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456852834698416084)
,p_event_id=>wwv_flow_api.id(456851937338407326)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456803424156591154)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from VD_AFW_32_ROLE'
,p_attribute_02=>'VD_AFW_32_ROLE'
,p_attribute_03=>'P1042_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_13_MESG_IMPOS_FETCH.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456803641681591154)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of VD_AFW_32_ROLE'
,p_attribute_02=>'VD_AFW_32_ROLE'
,p_attribute_03=>'P1042_SEQNC'
,p_attribute_04=>'SEQNC'
,p_attribute_09=>'P1042_SEQNC'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
,p_security_scheme=>wwv_flow_api.id(1723951025632196700)
);
end;
/
prompt --application/pages/page_01043
begin
wwv_flow_api.create_page(
 p_id=>1043
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Rôle utilisateur'
,p_page_mode=>'NORMAL'
,p_step_title=>'Affectation'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>'))
,p_step_template=>wwv_flow_api.id(524954649145896531)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513152058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456865224590583446)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
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
 p_id=>wwv_flow_api.id(456865945368589392)
,p_plug_name=>'Rôles utilisateurs'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456867047577599564)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(456865224590583446)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456869623598611550)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(456865224590583446)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1043_SEQNC'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456870649140637848)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(456865224590583446)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1043_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456870336542624752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456865224590583446)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976635139896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:confirmDelete(htmldb_delete_message,''DELETE'');'
,p_button_condition=>'P1043_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_cattributes=>'fa-remove'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723935220091195070)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456871046500646537)
,p_name=>'P1043_SEQNC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_source=>'SEQNC'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_api.id(456871438320653640)
,p_name=>'P1043_REF_ROLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_item_default=>':A_AFW_04_SOURC_SEQNC_CONTX'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_source=>'REF_ROLE'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_api.id(456873735166699972)
,p_name=>'P1043_REF_UTILS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456865945368589392)
,p_prompt=>'Utilisateur'
,p_source=>'REF_UTILS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_IO_AFW_21_SELCT_2'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select NOM_FORMT d,SEQNC r ',
'from VD_AFW_12_UTILS'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Choisir -'
,p_cSize=>250
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGL_VALUE'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'10'
,p_attribute_05=>'100'
,p_attribute_06=>'0'
,p_attribute_07=>'0'
,p_attribute_09=>':'
,p_attribute_10=>'LIKE_IGNORE'
,p_attribute_11=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select NOM_FORMT d,SEQNC r ',
'from VD_AFW_12_UTILS'))
,p_attribute_12=>'300px'
,p_attribute_13=>'N'
,p_attribute_14=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456874230926717688)
,p_name=>'P1043_DEBUT_EFECT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456865945368589392)
,p_prompt=>'Date début effectif'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'DEBUT_EFECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456874433481727899)
,p_name=>'P1043_FIN_EFECT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(456865945368589392)
,p_prompt=>'Date fin effectif'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'FIN_EFECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456876649327751415)
,p_name=>'Fermer le dialogue - rôle utilisateur'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(456867047577599564)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456876920138751417)
,p_event_id=>wwv_flow_api.id(456876649327751415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456875723700743947)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from VD_AFW_32_ROLE_UTILS'
,p_attribute_02=>'VD_AFW_32_ROLE_UTILS'
,p_attribute_03=>'P1043_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_13_MESG_IMPOS_FETCH.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456877936776766707)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'PROCESS ROW OF VD_AFW_32_ROLE_UTILS'
,p_attribute_02=>'VD_AFW_32_ROLE_UTILS'
,p_attribute_03=>'P1043_SEQNC'
,p_attribute_04=>'SEQNC'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST IN (''CREATE'',''SAVE'',''DELETE'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
,p_security_scheme=>wwv_flow_api.id(1723951025632196700)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456878940370777169)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_process_name=>'Fermer dialogue'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_01051
begin
wwv_flow_api.create_page(
 p_id=>1051
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Tâches'
,p_page_mode=>'NORMAL'
,p_step_title=>'Tâches'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513151731'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456902135469104442)
,p_plug_name=>'Tâches'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select t.seqnc,',
'         t.numr_signf,',
'         t.nom,',
'         t.date_inscr,',
'         t.ref_envir_formt,',
'         t.ref_natr_tache_formt,',
'         afw_11_prodt_pkg.obten_code_prodt (ref_prodt) "REF_PRODT_FORMT",',
'         afw_14_domn_valr_pkg.obten_valr (ref_dv_prior) "REF_DV_PRIOR_FORMT",',
'         afw_12_stat_pkg.obten_stat_formt (ref_stat) "REF_STAT_FORMT"',
'    from vd_afw_32_tache t',
'   where t.ref_natr_tache not in (select seqnc',
'                                    from vd_afw_32_natr_tache',
'                                   where code = ''REVSN_ASURN_QUALT'')',
'order by t.ref_dv_prior desc,t.date_inscr asc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456902350614104442)
,p_name=>'Tâches'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_no_data_found_message=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:1052:&SESSION.::&DEBUG.:RP:SSPC,SIDF:#SEQNC#,&SIDF.'
,p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'GARJE'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456902423851104448)
,p_db_column_name=>'SEQNC'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Seqnc'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SEQNC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456902541441104448)
,p_db_column_name=>'NUMR_SIGNF'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Numéro'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'NUMR_SIGNF'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456902723966104449)
,p_db_column_name=>'NOM'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nom'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'NOM'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456903420186104451)
,p_db_column_name=>'REF_ENVIR_FORMT'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Environnement'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_ENVIR_FORMT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456903528923104451)
,p_db_column_name=>'REF_DV_PRIOR_FORMT'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Priorité'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_DV_PRIOR_FORMT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456903633911104451)
,p_db_column_name=>'REF_STAT_FORMT'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Statut'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_STAT_FORMT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(479300123339227584)
,p_db_column_name=>'DATE_INSCR'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Date inscription'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'YYYY-MM-DD'
,p_tz_dependent=>'N'
,p_static_id=>'DATE_INSCR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(486034219560213597)
,p_db_column_name=>'REF_NATR_TACHE_FORMT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Nature'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_NATR_TACHE_FORMT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(486034338406213598)
,p_db_column_name=>'REF_PRODT_FORMT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Produit'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_PRODT_FORMT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456912432424276341)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4533296'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'REF_PRODT_FORMT:REF_ENVIR_FORMT:REF_NATR_TACHE_FORMT:NUMR_SIGNF:NOM:REF_STAT_FORMT:REF_DV_PRIOR_FORMT:DATE_INSCR:'
,p_sort_column_1=>'REF_DV_PRIOR_FORMT'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'DATE_INSCR'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456914740612344882)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
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
 p_id=>wwv_flow_api.id(457036229818404872)
,p_plug_name=>'Onglets principaux'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(456862550301571950)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(524971433690896548)
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'NEVER'
,p_plug_display_when_condition=>'A_AFW_04_SOURC_CONTX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456903946208104454)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456914740612344882)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Créer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:1052:&SESSION.::&DEBUG.::SIDF,SSPC:&SIDF.,'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
end;
/
prompt --application/pages/page_01052
begin
wwv_flow_api.create_page(
 p_id=>1052
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Tâche'
,p_page_mode=>'NORMAL'
,p_step_title=>'Tâche'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513152058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456895447524104398)
,p_plug_name=>'Tâche'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524961247111896538)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456920622885510047)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(486842548923659816)
,p_plug_name=>'Contexte'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524965123033896540)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(486899932975730901)
,p_name=>'Planification efforts'
,p_template=>wwv_flow_api.id(524965123033896540)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>2
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select seqnc,',
'       ref_role_formt,',
'       niv_avanc,',
'       efort_a_faire',
'from VD_AFW_32_HISTR_TACHE_EFOR_ACT',
'where ref_tache = :P1052_SEQNC',
'order by ref_role_formt'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'P1052_SEQNC'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(524966324975896545)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_query_more_data=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(486900234797730912)
,p_query_column_id=>1
,p_column_alias=>'SEQNC'
,p_column_display_sequence=>1
,p_column_heading=>'SEQNC'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(486900347427730913)
,p_query_column_id=>2
,p_column_alias=>'REF_ROLE_FORMT'
,p_column_display_sequence=>2
,p_column_heading=>'Rôle'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(486900420807730913)
,p_query_column_id=>3
,p_column_alias=>'NIV_AVANC'
,p_column_display_sequence=>3
,p_column_heading=>'Avancement'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'#NIV_AVANC#%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(486900542345730913)
,p_query_column_id=>4
,p_column_alias=>'EFORT_A_FAIRE'
,p_column_display_sequence=>4
,p_column_heading=>'Efforts à faire'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'#EFORT_A_FAIRE# h'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(510283334496331614)
,p_plug_name=>'Affectation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524965123033896540)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P1052_SEQNC'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(532973623490548466)
,p_plug_name=>'Déploiement'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524965123033896540)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P1052_SEQNC'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456896026698104403)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(456920622885510047)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'&A_AFW_04_SOURC_URL.'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456895750054104403)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456920622885510047)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1052_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456895625847104403)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(456920622885510047)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1052_SEQNC'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456895850495104403)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(456920622885510047)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976635139896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P1052_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_cattributes=>'fa-remove'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723935220091195070)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(486904546191838778)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(486899932975730901)
,p_button_name=>'EDITER_PLANIF_EFORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Éditer'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from vd_afw_32_histr_tache_efort',
'where ref_tache = :P1052_SEQNC'))
,p_button_css_classes=>'btn-primary'
,p_button_cattributes=>'fa-pencil'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(486937247322595967)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(510283334496331614)
,p_button_name=>'EDITER_AFECT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Éditer'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from VD_AFW_32_HISTR_AFECT_TACHE',
'where ref_tache = :P1052_SEQNC'))
,p_button_css_classes=>'btn-primary'
,p_button_cattributes=>'fa-pencil'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(456925435361589348)
,p_branch_action=>'f?p=&APP_ID.:&A_AFW_04_SOURC_NUMR_PAGE.:&SESSION.::&DEBUG.::SIDF:&SIDF.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(456895850495104403)
,p_branch_sequence=>11
,p_branch_comment=>'Created 24-JAN-2013 13:59 by GARJE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(456896949633104410)
,p_branch_action=>'f?p=&APP_ID.:1052:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456897136743104413)
,p_name=>'P1052_SEQNC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Seqnc'
,p_source=>'SEQNC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456897330602104422)
,p_name=>'P1052_NUMR_SIGNF'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(456895447524104398)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Numéro'
,p_source=>'NUMR_SIGNF'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>14
,p_cMaxlength=>10
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_display_when=>':P1052_SEQNC is not null'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456897730270104424)
,p_name=>'P1052_NOM'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456895447524104398)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom'
,p_source=>'NOM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>72
,p_cMaxlength=>120
,p_cHeight=>1
,p_colspan=>2
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456897941653104424)
,p_name=>'P1052_DESCR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(456895447524104398)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>75
,p_cMaxlength=>1000
,p_cHeight=>7
,p_colspan=>2
,p_rowspan=>3
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456899122852104428)
,p_name=>'P1052_REF_ENVIR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(486842548923659816)
,p_prompt=>'Environnement'
,p_source=>'REF_ENVIR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT ordre_presn || '' - '' || nom d, seqnc r ',
'from VD_AFW_31_ENVIR',
'order by d'))
,p_cSize=>250
,p_cMaxlength=>255
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456899338930104428)
,p_name=>'P1052_REF_DV_PRIOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(456895447524104398)
,p_use_cache_before_default=>'NO'
,p_item_default=>'afw_14_domn_valr_pkg.obten_seqnc(''PRIOR'', ''NORML'', ''AFW'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Priorité'
,p_source=>'REF_DV_PRIOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ddv.valr_court || '' - '' || ddv.valr d, ddv.seqnc r',
'  from vd_afw_14_detl_domn_valr ddv, vd_afw_14_domn_valr dv',
' where dv.code = ''PRIOR'' ',
' and ddv.ref_domn_valr = dv.seqnc',
'order by ddv.seqnc_PRESN'))
,p_cSize=>250
,p_cMaxlength=>255
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'afw_14_domn_valr_pkg.obten_valr_court(afw_14_domn_valr_pkg.obten_seqnc(''PRIOR'',''NORML'')) ',
'|| '' - '' ||afw_14_domn_valr_pkg.obten_valr(afw_14_domn_valr_pkg.obten_seqnc(''PRIOR'',''NORML''))'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456899531811104428)
,p_name=>'P1052_REF_STAT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456895447524104398)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Statut'
,p_source=>'REF_STAT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, r',
'    from (select s.nom d,',
'                 s.seqnc r,',
'                 s.ordre o',
'            from vd_afw_12_stat s,',
'                 vd_afw_12_evolt_stat es',
'           where :P1052_SEQNC is not null ',
'             and s.ref_struc_aplic = afw_12_struc_aplic_pkg.obten_seqnc(:A_AFW_04_CONTX) ',
'             and ((es.ref_stat = :P1052_REF_STAT',
'             and es.ref_stat_evolt = s.seqnc',
'             and es.indic_code = ''N'') or :P1052_REF_STAT is null)',
'          union all',
'          select s.nom d,',
'                 s.seqnc r,',
'                 s.ordre o',
'            from vd_afw_12_stat s',
'           where s.ref_struc_aplic = afw_12_struc_aplic_pkg.obten_seqnc(:A_AFW_04_CONTX)  ',
'           and ((s.seqnc = :P1052_REF_STAT) or :P1052_REF_STAT is null))',
'order by o',
'',
'',
'',
''))
,p_cSize=>250
,p_cMaxlength=>255
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_display_when=>':P1052_SEQNC is not null'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456899750186104429)
,p_name=>'P1052_COMNT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(456895447524104398)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Commentaire'
,p_source=>'COMNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>124
,p_cMaxlength=>255
,p_cHeight=>4
,p_colspan=>3
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(485937428808966829)
,p_name=>'P1052_DATE_INSCR'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(456895447524104398)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Date inscription'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'DATE_INSCR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(485942720441210381)
,p_name=>'P1052_REF_NATR_TACHE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(456895447524104398)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nature de la tâche'
,p_source=>'REF_NATR_TACHE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d,seqnc r',
'from VD_AFW_32_NATR_TACHE',
'where code <> ''REVSN_ASURN_QUALT''',
'order by d'))
,p_cSize=>250
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(485944139797263209)
,p_name=>'P1052_REF_PRODT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(486842548923659816)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Produit'
,p_source=>'REF_PRODT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select code || '' - '' || nom d,seqnc r',
'from VD_AFW_11_PRODT',
'order by d'))
,p_cSize=>250
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(486806641102875421)
,p_name=>'P1052_REF_DV_COMPL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(456895447524104398)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare ',
'vnu_compl number(10) default null;',
'begin',
'if :P1052_SEQNC is not null then',
' select ref_dv_compl',
'  into vnu_compl',
' from vd_afw_32_tache',
' where seqnc = :P1052_SEQNC;',
'end if; ',
'',
'return vnu_compl;',
'end;',
'',
'',
'   '))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Complexité'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ddv.valr_court || '' - '' || ddv.valr d, ddv.seqnc r',
'from vd_afw_14_detl_domn_valr ddv, vd_afw_14_domn_valr dv',
'where dv.code = ''COMPL'' ',
'and ddv.ref_domn_valr = dv.seqnc ',
'order by ddv.seqnc_PRESN'))
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(486911323064087529)
,p_name=>'P1052_PLANIF_EFORT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(488769730767881068)
,p_name=>'P1052_REF_JALON'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(456895447524104398)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare ',
'vnu_jalon number(10) default null;',
'begin',
'if :P1052_SEQNC is not null then',
' select REF_JALON',
'  into vnu_jalon',
' from vd_afw_32_tache',
' where seqnc = :p1052_seqnc;',
'end if; ',
'',
'return vnu_jalon;',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Jalon'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select REF_JALON',
'from vd_afw_32_tache',
'where seqnc = :p1052_seqnc'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d,seqnc r',
'from vd_afw_32_jalon',
'order by d'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Aucun -'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(510280222891290485)
,p_name=>'P1052_AFECT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(510283334496331614)
,p_item_default=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select listagg (ref_utils_formt, '','') within group (order by ref_utils_formt) utils_formt',
'from VD_AFW_32_HISTR_AFECT_TACHE',
'where ref_tache = :P1052_SEQNC and (FIN_AFECT > sysdate or FIN_AFECT is null)',
'order by ref_utils_formt'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(486913727875136272)
,p_name=>'Planification efforts - Afficher dialogue(modification)'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(486904546191838778)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(486914045247136273)
,p_event_id=>wwv_flow_api.id(486913727875136272)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Modification de planification '
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_planif_efort'
,p_attribute_07=>'PAGE'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic'
,p_attribute_15=>'1054'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(486917736410204955)
,p_name=>'Planification efforts - Fermer dialogue'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'div.dialg_planif_efort div.afw_21_actio_dynmq_dialg'
,p_bind_type=>'live'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(486918028160204956)
,p_event_id=>wwv_flow_api.id(486917736410204955)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(486918248185208330)
,p_event_id=>wwv_flow_api.id(486917736410204955)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(486899932975730901)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(486918419572209539)
,p_event_id=>wwv_flow_api.id(486917736410204955)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(486918622689210487)
,p_event_id=>wwv_flow_api.id(486917736410204955)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(486990734835841247)
,p_name=>'Affectations  - Afficher dialogue(modification)'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(486937247322595967)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(486991037823841251)
,p_event_id=>wwv_flow_api.id(486990734835841247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
,p_attribute_01=>'Modifier l''affectation'
,p_attribute_03=>'640'
,p_attribute_04=>'480'
,p_attribute_05=>'dialg_afect'
,p_attribute_07=>'PAGE'
,p_attribute_13=>'Y'
,p_attribute_14=>'afw_11_aplic_pkg.obten_numr_apex_aplic'
,p_attribute_15=>'1053'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(486991743970853263)
,p_name=>'Affectations - Fermer dialogue'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'div.dialg_afect div.afw_21_actio_dynmq_dialg'
,p_bind_type=>'live'
,p_bind_event_type=>'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(486992044496853266)
,p_event_id=>wwv_flow_api.id(486991743970853263)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(486992420552855970)
,p_event_id=>wwv_flow_api.id(486991743970853263)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(486992724015856995)
,p_event_id=>wwv_flow_api.id(486991743970853263)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(486992927132857892)
,p_event_id=>wwv_flow_api.id(486991743970853263)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456901248154104431)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from VD_AFW_32_TACHE'
,p_attribute_02=>'VD_AFW_32_TACHE'
,p_attribute_03=>'P1052_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_MESG_IMPOS_FETCH.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456901446846104433)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of VD_AFW_32_TACHE'
,p_attribute_02=>'VD_AFW_32_TACHE'
,p_attribute_03=>'P1052_SEQNC'
,p_attribute_04=>'SEQNC'
,p_attribute_09=>'P1052_SEQNC'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
,p_security_scheme=>wwv_flow_api.id(1723951025632196700)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(486812237762158298)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sauvegarde complexité'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :P1052_REF_DV_COMPL is not null then',
'  afw_32_tache_pkg.gerer_ajout_compl(:P1052_SEQNC,:P1052_REF_DV_COMPL);',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(488794820836136521)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sauvegarde jalon'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'IF :P1052_REF_STAT IS NULL THEN',
'   :P1052_REF_STAT := afw_12_stat_pkg.obten_stat_initl_struc_aplic (''AFW_TACHE'');',
'END IF;',
'',
'IF :P1052_REF_JALON IS NOT NULL THEN',
'   afw_32_jalon_pkg.verfr_besn_ajout_jalon(:P1052_SEQNC,:P1052_REF_JALON);',
'',
'   UPDATE vd_afw_32_tache',
'   SET ref_stat = :p1052_ref_stat',
'   WHERE seqnc = :P1052_SEQNC;',
'END IF;',
'',
'IF :P1052_REF_JALON IS NULL THEN',
'   UPDATE vd_afw_32_tache',
'   SET ref_stat = :p1052_ref_stat',
'   WHERE seqnc = :P1052_SEQNC;',
'END IF;'))
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(532967747854139159)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Alimenter complexité'
,p_process_sql_clob=>':P1052_REF_DV_COMPL := afw_14_domn_valr_pkg.obten_seqnc(''COMPL'', ''SIMPL'', ''AFW'');'
,p_process_when=>'P1052_seqnc'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(532972547890441973)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Alimenter environement'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select seqnc ',
'into :P1052_REF_ENVIR',
'from VD_AFW_31_ENVIR',
'where code = afw_11_parmt_afw_pkg.obten_valr_parmt(''ENVIR_EN_OPERT'');'))
,p_process_when=>'P1052_SEQNC'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
prompt --application/pages/page_01053
begin
wwv_flow_api.create_page(
 p_id=>1053
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Affectations'
,p_page_mode=>'NORMAL'
,p_step_title=>'Affectations'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>'))
,p_step_template=>wwv_flow_api.id(524954649145896531)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513152005'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(457071641461098862)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(487142846167304926)
,p_plug_name=>'Affectations'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(457060718233871171)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(457071641461098862)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(487146922832638788)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(457071641461098862)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487145247485475576)
,p_name=>'P1053_REF_UTILS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(487142846167304926)
,p_prompt=>'Utilisateurs'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ref_utils_formt',
'from VD_AFW_32_HISTR_AFECT_TACHE',
'where ref_tache = :a_sourc_seqnc_contx and fin_afect >= sysdate',
'         or fin_afect is null',
'order by ref_utils_formt;'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom_formt d,seqnc r',
'from vd_afw_12_utils u',
'where not exists (select 1',
'  from vd_afw_32_histr_afect_tache hat',
' where  hat.ref_utils = u.seqnc and hat.ref_tache = :a_afw_04_sourc_seqnc_contx and ( hat.fin_afect >= sysdate',
'       or hat.fin_afect is null))',
'order by nom_formt'))
,p_cSize=>150
,p_cMaxlength=>4000
,p_cHeight=>10
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'ALL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487147323918667427)
,p_name=>'P1053_SEQNC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_use_cache_before_default=>'NO'
,p_source=>'SEQNC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(457070036819012366)
,p_name=>'Fermer dialogue'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(457060718233871171)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(457070349443012368)
,p_event_id=>wwv_flow_api.id(457070036819012366)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(487147438940681303)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from vd_afw_32_histr_afect_tache'
,p_attribute_02=>'VD_AFW_32_HISTR_AFECT_TACHE'
,p_attribute_03=>'P1053_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_13_MESG_IMPOS_FETCH.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(487147631929698161)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of  vd_afw_32_histr_afect_tache'
,p_attribute_02=>'VD_AFW_32_HISTR_AFECT_TACHE'
,p_attribute_03=>'P1053_SEQNC'
,p_attribute_04=>'SEQNC'
,p_attribute_09=>'P1053_SEQNC'
,p_attribute_11=>'I:U'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
,p_security_scheme=>wwv_flow_api.id(1723951025632196700)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(457071323322084137)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_process_name=>'Fermer le dialogue'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_01054
begin
wwv_flow_api.create_page(
 p_id=>1054
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Planification efforts'
,p_page_mode=>'NORMAL'
,p_step_title=>'Planification efforts'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_step_template=>wwv_flow_api.id(524954649145896531)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513152005'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(486961432495471525)
,p_name=>'Tabular Form'
,p_template=>wwv_flow_api.id(524964537325896540)
,p_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'SEQNC,',
'REF_ROLE_FORMT,',
'EFORT_A_FAIRE,',
'NIV_AVANC',
'from VD_AFW_32_HISTR_TACHE_EFOR_ACT',
'WHERE REF_TACHE = :A_AFW_04_SOURC_SEQNC_CONTX',
'order by REF_ROLE_FORMT'))
,p_source_type=>'NATIVE_TABFORM'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(524966324975896545)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_query_more_data=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(486986032727736092)
,p_query_column_id=>1
,p_column_alias=>'SEQNC'
,p_column_display_sequence=>1
,p_column_heading=>'Seqnc'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_lov_show_nulls=>'NO'
,p_column_width=>16
,p_pk_col_source_type=>'T'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_table_name=>'VD_AFW_32_HISTR_TACHE_EFOR_ACT'
,p_ref_column_name=>'SEQNC'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(486988523134792117)
,p_query_column_id=>2
,p_column_alias=>'REF_ROLE_FORMT'
,p_column_display_sequence=>2
,p_column_heading=>'Rôle'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(486986335511736092)
,p_query_column_id=>3
,p_column_alias=>'EFORT_A_FAIRE'
,p_column_display_sequence=>4
,p_column_heading=>'Efforts à faire (h)'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_display_as=>'TEXT'
,p_lov_show_nulls=>'NO'
,p_column_width=>6
,p_cattributes=>'style="text-align:right"'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(486986537573736093)
,p_query_column_id=>4
,p_column_alias=>'NIV_AVANC'
,p_column_display_sequence=>3
,p_column_heading=>'Avancement (%)'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_display_as=>'TEXT'
,p_lov_show_nulls=>'NO'
,p_column_width=>4
,p_cattributes=>'style="text-align:right"'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(486980334292651879)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_query_row_template=>wwv_flow_api.id(524967524528896546)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(487120522253796591)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(486961432495471525)
,p_button_name=>'P1054_AJOUTER'
,p_button_static_id=>'P1054_AJOUTER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ajouter'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_button_css_classes=>'btn-primary'
,p_button_cattributes=>'fa-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_grid_row_span=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(486962721033471530)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(486961432495471525)
,p_button_name=>'ADD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Ajouter'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:addRow();'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'btn-primary'
,p_button_cattributes=>'fa-plus'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(486962449756471530)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(486980334292651879)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(486962524547471530)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(486980334292651879)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1054_SEQNC'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(486964748006471539)
,p_branch_action=>'f?p=&APP_ID.:1054:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487119232249771153)
,p_name=>'P1054_REF_ROLE_FORMT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(486961432495471525)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rôle'
,p_source=>'REF_ROLE_FORMT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d,seqnc r ',
'from VD_AFW_32_ROLE',
'order by nom'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Choisir -'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(487044629826370216)
,p_name=>'Fermer dialogue'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(486962449756471530)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(487044928820370234)
,p_event_id=>wwv_flow_api.id(487044629826370216)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(487000128171208276)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'FETCH ROW VD_AFW_32_HISTR_TACHE_EFOR_ACT'
,p_attribute_02=>'VD_AFW_32_HISTR_TACHE_EFOR_ACT'
,p_attribute_03=>'P1054_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_13_MESG_IMPOS_FETCH.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(486964518978471537)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(486961432495471525)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'VD_AFW_32_HISTR_TACHE_EFOR_ACT'
,p_attribute_03=>'SEQNC'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_process_when_button_id=>wwv_flow_api.id(486962524547471530)
,p_process_success_message=>'&nbsp;#MRU_COUNT# &A_AFW_13_MESG_RANGE_MODF., #MRI_COUNT# &A_AFW_13_MESG_RANGE_INSER..'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(487122141047858797)
,p_process_sequence=>35
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Ajout nouveau rôle'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'INSERT INTO VD_AFW_32_HISTR_TACHE_EFOR_ACT (REF_TACHE,',
'                                            REF_ROLE,',
'                                            EFORT_A_FAIRE, ',
'                                            NIV_AVANC)',
'     VALUES (:A_AFW_04_SOURC_SEQNC_CONTX,',
'             :P1054_REF_ROLE_FORMT,',
'             0,           ',
'             0);'))
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(487120522253796591)
,p_process_when=>'SUBMIT'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
);
end;
/
prompt --application/pages/page_01055
begin
wwv_flow_api.create_page(
 p_id=>1055
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Mes tâches'
,p_page_mode=>'NORMAL'
,p_step_title=>'Mes tâches'
,p_step_sub_title=>'Mes tâches'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20131031160452'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(532983448609719373)
,p_plug_name=>'Mes tâches'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524964537325896540)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select seqnc,',
'       numr_signf,',
'       nom,',
'       ref_envir_formt,',
'       ref_prodt_formt,',
'       ref_natr_tache_formt,',
'       ref_dv_prior_formt,',
'       ref_dv_prior,',
'       ref_stat_reals,',
'       ref_utils',
'from vs_afw_32_tache',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(532983542732719374)
,p_name=>'Mes tâche'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'&A_AFW_13_MESG_TROP_DON_TROUV.'
,p_no_data_found_message=>'&A_AFW_13_MESG_AUCUN_DON_TROUV.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:1056:&SESSION.::&DEBUG.:RP:SSPC,SIDF:#SEQNC#,&SIDF.'
,p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'FOUER'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(532983727436719382)
,p_db_column_name=>'SEQNC'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Seqnc'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SEQNC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(532983847431719386)
,p_db_column_name=>'NUMR_SIGNF'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Numéro'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'NUMR_SIGNF'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(532983933484719386)
,p_db_column_name=>'NOM'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Nom'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'NOM'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(532984022677719386)
,p_db_column_name=>'REF_ENVIR_FORMT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Environnement'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_ENVIR_FORMT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(532984134125719387)
,p_db_column_name=>'REF_PRODT_FORMT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Produit'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_PRODT_FORMT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(532984222612719388)
,p_db_column_name=>'REF_NATR_TACHE_FORMT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Nature '
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_NATR_TACHE_FORMT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(532984321187719388)
,p_db_column_name=>'REF_DV_PRIOR_FORMT'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Priorité'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_DV_PRIOR_FORMT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(532998931021736655)
,p_db_column_name=>'REF_DV_PRIOR'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Ref Dv Prior'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_DV_PRIOR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(532999641167872100)
,p_db_column_name=>'REF_UTILS'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Ref Utils'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_UTILS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(533564440395110972)
,p_db_column_name=>'REF_STAT_REALS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Ref Stat Reals'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'REF_STAT_REALS'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(532986343293784031)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5294035'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'REF_PRODT_FORMT:REF_NATR_TACHE_FORMT:NUMR_SIGNF:NOM:REF_DV_PRIOR_FORMT:REF_ENVIR_FORMT:'
,p_sort_column_1=>'REF_UTILS'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'REF_DV_PRIOR'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_01056
begin
wwv_flow_api.create_page(
 p_id=>1056
,p_user_interface_id=>wwv_flow_api.id(3663430628528105)
,p_name=>'Consulter une tâche'
,p_page_mode=>'NORMAL'
,p_step_title=>'Consulter une tâche'
,p_step_sub_title=>'Tâche'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'//-->',
'</script>'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1724855148880581895)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_upd_yyyymmddhh24miss=>'20160513152058'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(533009623954419853)
,p_plug_name=>'Tâche'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524961247111896538)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(533012426975419868)
,p_plug_name=>'Gérer contexte'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524965123033896540)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
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
 p_id=>wwv_flow_api.id(533014025684419872)
,p_plug_name=>'Barre de bouton (nav bar)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(524958835947896536)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(533014445606419873)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(533014025684419872)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_image_alt=>'Annuler'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'&A_AFW_04_SOURC_URL.'
,p_button_condition=>'EDITER'
,p_button_css_classes=>'btn-info'
,p_button_cattributes=>'fa-undo'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(533014624571419873)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(533014025684419872)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1056_SEQNC'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723923346971193396)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(533014826855419873)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(533014025684419872)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enregistrer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P1056_SEQNC'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'btn-success'
,p_button_cattributes=>'fa-save'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1721922232923650037)
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(533014242706419872)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(533014025684419872)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976635139896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Supprimer'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'EDITER'
,p_button_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_button_cattributes=>'fa-remove'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(1723935220091195070)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(533031739247158162)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(533014025684419872)
,p_button_name=>'EDITER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Éditer'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_button_condition=>'EDITER'
,p_button_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_button_css_classes=>'btn-primary'
,p_button_cattributes=>'fa-pencil'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(533567228095419569)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(533014025684419872)
,p_button_name=>'CONSULTER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(524976441906896554)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consulter'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_condition=>'EDITER'
,p_button_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_button_cattributes=>'fff-icon-magnifier'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(533019529669419886)
,p_branch_action=>'f?p=&APP_ID.:&A_AFW_04_SOURC_NUMR_PAGE.:&SESSION.::&DEBUG.::SIDF:&SIDF.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(533014242706419872)
,p_branch_sequence=>10
,p_branch_comment=>'Created 24-JAN-2013 13:59 by GARJE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(533035846809406324)
,p_branch_action=>'f?p=&APP_ID.:1056:&SESSION.:&REQUEST.:&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(533031739247158162)
,p_branch_sequence=>15
,p_branch_comment=>'Created 28-FEB-2013 15:16 by FOUER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(533019730504419889)
,p_branch_action=>'f?p=&APP_ID.:1056:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533009821953419858)
,p_name=>'P1056_NUMR_SIGNF'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Numéro'
,p_source=>'NUMR_SIGNF'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>14
,p_cMaxlength=>10
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_display_when=>':P1056_SEQNC is not null'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533010026866419861)
,p_name=>'P1056_NOM'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nom'
,p_source=>'NOM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>72
,p_cMaxlength=>120
,p_cHeight=>1
,p_colspan=>2
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533010244450419861)
,p_name=>'P1056_DESCR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_prompt=>'Description'
,p_source=>'DESCR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>75
,p_cMaxlength=>4000
,p_cHeight=>7
,p_colspan=>2
,p_rowspan=>3
,p_label_alignment=>'ABOVE'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_read_only_disp_attr=>'width="60px"'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533010427815419862)
,p_name=>'P1056_REF_DV_PRIOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_use_cache_before_default=>'NO'
,p_item_default=>'afw_14_domn_valr_pkg.obten_seqnc(''PRIOR'', ''NORML'', ''AFW'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Priorité'
,p_source=>'REF_DV_PRIOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ddv.valr_court || '' - '' || ddv.valr d, ddv.seqnc r',
'  from vd_afw_14_detl_domn_valr ddv, vd_afw_14_domn_valr dv',
' where dv.code = ''PRIOR'' ',
' and ddv.ref_domn_valr = dv.seqnc',
'order by ddv.seqnc_PRESN'))
,p_cSize=>250
,p_cMaxlength=>255
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_item_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'afw_14_domn_valr_pkg.obten_valr_court(afw_14_domn_valr_pkg.obten_seqnc(''PRIOR'',''NORML'')) ',
'|| '' - '' ||afw_14_domn_valr_pkg.obten_valr(afw_14_domn_valr_pkg.obten_seqnc(''PRIOR'',''NORML''))'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533010624826419862)
,p_name=>'P1056_REF_STAT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Statut'
,p_source=>'REF_STAT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select d, r',
'    from (select s.nom d,',
'                 s.seqnc r,',
'                 s.ordre o',
'            from vd_afw_12_stat s,',
'                 vd_afw_12_evolt_stat es',
'           where :P1056_SEQNC is not null ',
'             and s.ref_struc_aplic = afw_12_struc_aplic_pkg.obten_seqnc(:A_AFW_04_CONTX) ',
'             and ((es.ref_stat = :P1056_REF_STAT',
'             and es.ref_stat_evolt = s.seqnc',
'             and es.indic_code = ''N'') or :P1056_REF_STAT is null)',
'          union all',
'          select s.nom d,',
'                 s.seqnc r,',
'                 s.ordre o',
'            from vd_afw_12_stat s',
'           where s.ref_struc_aplic = afw_12_struc_aplic_pkg.obten_seqnc(:A_AFW_04_CONTX)  ',
'           and ((s.seqnc = :P1056_REF_STAT) or :P1056_REF_STAT is null))',
'order by o',
'',
'',
'',
''))
,p_cSize=>250
,p_cMaxlength=>255
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_display_when=>':P1056_SEQNC is not null'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533010844224419862)
,p_name=>'P1056_COMNT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Commentaire'
,p_source=>'COMNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>124
,p_cMaxlength=>255
,p_cHeight=>4
,p_colspan=>3
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533011041359419863)
,p_name=>'P1056_REF_DV_COMPL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_item_default=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare ',
'vnu_compl number(10) default null;',
'begin',
'if :P1056_SEQNC is not null then',
' select ref_dv_compl',
'  into vnu_compl',
' from vd_afw_32_tache',
' where seqnc = :P1056_SEQNC;',
'end if; ',
'',
'return vnu_compl;',
'end;',
'',
'',
'   '))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Complexité'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ddv.valr_court || '' - '' || ddv.valr d, ddv.seqnc r',
'from vd_afw_14_detl_domn_valr ddv, vd_afw_14_domn_valr dv',
'where dv.code = ''COMPL'' ',
'and ddv.ref_domn_valr = dv.seqnc ',
'order by ddv.seqnc_PRESN'))
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533011242380419863)
,p_name=>'P1056_DATE_INSCR'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Date inscription'
,p_format_mask=>'YYYY-MM-DD'
,p_source=>'DATE_INSCR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>12
,p_cMaxlength=>10
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533011432112419863)
,p_name=>'P1056_REF_JALON'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Jalon'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select REF_JALON',
'from vd_afw_32_tache',
'where seqnc = :p1056_seqnc'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d,seqnc r',
'from vd_afw_32_jalon',
'order by d'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Choisir -'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533011649461419864)
,p_name=>'P1056_REF_NATR_TACHE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nature de la tâche'
,p_source=>'REF_NATR_TACHE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select nom d,seqnc r',
'from VD_AFW_32_NATR_TACHE',
'order by d'))
,p_cSize=>250
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533012643215419869)
,p_name=>'P1056_REF_ENVIR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(533012426975419868)
,p_prompt=>'Environnement'
,p_source=>'REF_ENVIR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT nom d, seqnc r ',
'from VD_AFW_31_ENVIR',
'order by d'))
,p_cSize=>250
,p_cMaxlength=>255
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533012829108419869)
,p_name=>'P1056_REF_PRODT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(533012426975419868)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Produit'
,p_source=>'REF_PRODT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select code || '' - '' || nom d,seqnc r',
'from VD_AFW_11_PRODT',
'order by d'))
,p_cSize=>250
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(524973827299896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533015048123419875)
,p_name=>'P1056_SEQNC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Seqnc'
,p_source=>'SEQNC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533015232086419876)
,p_name=>'P1056_PLANIF_EFORT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1556119583145901512)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(533572518988634574)
,p_name=>'P1056_REF_STAT_REALS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(533009623954419853)
,p_prompt=>'Précision de réalisation'
,p_source=>'REF_STAT_REALS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select s.nom d, s.seqnc r',
'  from vd_afw_12_stat s',
' where     s.ref_struc_aplic =',
'              afw_12_struc_aplic_pkg.obten_seqnc (''AFW_PRECN_REALS'')',
'order by ordre',
''))
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'ABOVE'
,p_read_only_when=>'EDITER'
,p_read_only_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_api.id(524973645529896551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(533016039295419879)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from VD_AFW_32_TACHE'
,p_attribute_02=>'VD_AFW_32_TACHE'
,p_attribute_03=>'P1056_SEQNC'
,p_attribute_04=>'SEQNC'
,p_process_error_message=>'&A_AFW_MESG_IMPOS_FETCH.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(533616320166770176)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Alimenter précision de réalisation'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT seqnc',
'INTO :P1056_REF_STAT_REALS',
'FROM vd_afw_12_stat',
'WHERE ref_struc_aplic = afw_12_struc_aplic_pkg.obten_seqnc(''AFW_PRECN_REALS'')',
'AND code = ''AUCNE_PRECN'';'))
,p_process_when=>'P1056_REF_STAT_REALS '
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(533016242494419879)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of VD_AFW_32_TACHE'
,p_attribute_02=>'VD_AFW_32_TACHE'
,p_attribute_03=>'P1056_SEQNC'
,p_attribute_04=>'SEQNC'
,p_attribute_09=>'P1056_SEQNC'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'&A_AFW_13_MESG_ECHEC_SPECF.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&A_AFW_13_MESG_SUCS_SPECF.'
,p_security_scheme=>wwv_flow_api.id(1723951025632196700)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(533015629898419879)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sauvegarde complexité'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :P1056_REF_DV_COMPL is not null then',
'  afw_32_tache_pkg.gerer_ajout_compl(:P1056_SEQNC,:P1056_REF_DV_COMPL);',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(533015838080419879)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sauvegarde jalon'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if :P1056_REF_JALON is not null then',
'   afw_32_jalon_pkg.verfr_besn_ajout_jalon(:P1056_SEQNC,:P1056_REF_JALON);',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(533015439519419877)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Alimenter environement'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select seqnc ',
'into :P1056_REF_ENVIR',
'from VD_AFW_31_ENVIR',
'where code = afw_11_parmt_afw_pkg.obten_valr_parmt(''ENVIR_EN_OPERT'');'))
,p_process_when=>'P1056_SEQNC'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(533016422551419879)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Alimenter complexité'
,p_process_sql_clob=>':P1056_REF_DV_COMPL := afw_14_domn_valr_pkg.obten_seqnc(''COMPL'', ''SIMPL'', ''AFW'');'
,p_process_when=>'P1056_seqnc'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(9265913129058135)
);
end;
/
prompt --application/deployment/install
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
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
