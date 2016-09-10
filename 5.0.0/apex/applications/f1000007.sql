set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 1000007 - Configuration
--
-- Application Export:
--   Application:     1000007
--   Name:            Configuration
--   Date and Time:   16:32 Dimanche Septembre 13, 2015
--   Exported By:     LGCARRIER
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.2.6.00.03
--   Instance ID:     61904861268027
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
-- Application Statistics:
--   Pages:                     12
--     Items:                   47
--     Processes:               24
--     Regions:                 31
--     Buttons:                 24
--     Dynamic Actions:          5
--   Shared Components:
--     Logic:
--       Items:                 96
--       Processes:             36
--       Computations:           1
--     Navigation:
--       Lists:                  2
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
--         Button:               5
--         Report:               3
--       LOVs:                  74
--       Shortcuts:              5
--       Plug-ins:              74
--     Globalization:
--       Messages:             407
--     Reports:
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,1248716320362712));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'fr-ca'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,1000007);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,1000007));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,1000007));
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,1000007),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,1000007),
  p_owner => nvl(wwv_flow_application_install.get_schema,'APEXFRAMEWORK'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Configuration'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'1000007'),
  p_application_group=>19694313105945939,
  p_application_group_name=>'AFW',
  p_application_group_comment=>'',
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt=> '04F9DCE96AAAE7B4F8E289A9EE18F5193DD8F0D953B6238BD82884B199A17F75',
  p_checksum_salt_last_reset => '20081009112110',
  p_max_session_length_sec=> 28800,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'fr-ca',
  p_flow_language_derived_from=> 'FLOW_PRIMARY_LANGUAGE',
  p_allow_feedback_yn=> 'Y',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 3711921554898031 + wwv_flow_api.g_id_offset,
  p_logout_url=> '',
  p_application_tab_set=> 0,
  p_logo_image => '&A_AFW_11_DOSR_FICHR_AFW.images/afw_logo_header.png',
  p_logo_image_attributes => 'style="width:44px;height:30px;"',
  p_public_url_prefix => '',
  p_public_user=> 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_flow_version=> '4.4',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'Y',
  p_browser_frame=>'A',
  p_deep_linking=>'Y',
  p_vpd=> 'begin null; end;'||unistr('\000a')||
'afw_07_polc_pkg.initl_contx();',
  p_vpd_teardown_code=> '',
  p_authorize_public_pages_yn=>'Y',
  p_csv_encoding=> 'Y',
  p_auto_time_zone=> 'N',
  p_include_legacy_javascript=> 'Y',
  p_error_handling_function=> 'afw_01_err_apex_pkg.gestn_mesg_err_apex',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_substitution_string_01 => 'APEX_DML_LOCK_WAIT_TIME',
  p_substitution_value_01  => '5',
  p_substitution_string_02 => 'DIR',
  p_substitution_value_02  => 'ltr',
  p_last_updated_by => 'SBRIGIC',
  p_last_upd_yyyymmddhh24miss=> '20150610131643',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

----------------
--package app map
--
prompt  ...user interfaces
--
 
begin
 
--application/user interface/desktop
wwv_flow_api.create_user_interface (
  p_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_ui_type_name => 'DESKTOP'
 ,p_display_name => 'Desktop'
 ,p_display_seq => 10
 ,p_use_auto_detect => true
 ,p_is_default => true
 ,p_theme_id => 313
 ,p_home_url => 'f?p=&APP_ID.:1:&SESSION.'
 ,p_login_url => 'f?p=&APP_ID.:101'
 ,p_global_page_id => 0
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
--application/plug-in setting/item_type_native_yes_no
wwv_flow_api.create_plugin_setting (
  p_id => 3589231328311533 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_03 => 'N'
  );
--application/plug-in setting/item_type_plugin_io_afw_21_selct_2
wwv_flow_api.create_plugin_setting (
  p_id => 7780026283182323 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'PLUGIN_IO_AFW_21_SELCT_2'
 ,p_attribute_01 => 'Y'
  );
--application/plug-in setting/item_type_plugin_io_afw_21_item_popup_arbor
wwv_flow_api.create_plugin_setting (
  p_id => 1071498911997720209 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'PLUGIN_IO_AFW_21_ITEM_POPUP_ARBOR'
 ,p_attribute_01 => '&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
 ,p_attribute_02 => '&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
  );
--application/plug-in setting/item_type_plugin_com_skillbuilders_sbip_password
wwv_flow_api.create_plugin_setting (
  p_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'PLUGIN_COM_SKILLBUILDERS_SBIP_PASSWORD'
 ,p_attribute_01 => 'cupertino'
  );
null;
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
--application/shared_components/security/authorization/administrateur_saf
wwv_flow_api.create_security_scheme (
  p_id => 1075497204963746860 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Administrateur SAF'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''SUPER_UTILS'');'
 ,p_error_message => 'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/administrateur_produit
wwv_flow_api.create_security_scheme (
  p_id => 1075497913405758814 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Administrateur produit'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''ADMIN'');'
 ,p_error_message => 'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/développeur
wwv_flow_api.create_security_scheme (
  p_id => 1075498124141761869 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Développeur'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''DEVLP'');'
 ,p_error_message => 'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/création
wwv_flow_api.create_security_scheme (
  p_id => 1268921903099320428 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Création'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTOR_CREAT'
 ,p_error_message => 'Accès refusé.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/modification
wwv_flow_api.create_security_scheme (
  p_id => 1270923017146863787 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Modification'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTOR_MODFC'
 ,p_error_message => 'Accès refusé.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/suppression
wwv_flow_api.create_security_scheme (
  p_id => 1270934890266865461 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Suppression'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTOR_SUPRS'
 ,p_error_message => 'Accès refusé.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/opération_dml
wwv_flow_api.create_security_scheme (
  p_id => 1270950695807867091 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Opération DML'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTOR_OPERT_DML'
 ,p_error_message => 'Accès refusé.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/accès_page
wwv_flow_api.create_security_scheme (
  p_id => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Accès page'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTOR_ACCES_PAGE'
 ,p_error_message => 'Accès refusé.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
null;
 
end;
/

prompt  ...application processes
--
--application/shared_components/logic/application_processes/afw_11_alimenter_les_variables_des_numéros_de_produits
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_11_aplic_pkg.defnr_varbl_numr_aplic();';

wwv_flow_api.create_flow_process(
  p_id => 1103506228740906890 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.2,
  p_process_point => 'AFTER_AUTHENTICATION',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 11 - Alimenter les variables des numéros de produits',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_réinitialiser_la_variable_d_exclusion
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_page_pkg.reint_exclu_liste_navgt();';

wwv_flow_api.create_flow_process(
  p_id => 1103101442608908772 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1000000000,
  p_process_point => 'AFTER_FOOTER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Réinitialiser la variable d''exclusion',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_initialiser_le_contexte_d_exécution_d_une_page
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_condt_piltb_pkg.defn_contx_exect_page();';

wwv_flow_api.create_flow_process(
  p_id => 1103101030833905348 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1000000000.1,
  p_process_point => 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Initialiser le contexte d''exécution d''une page',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_19_definir_les_variables_de_sessions
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_19_boutn_pkg.defnr_varbl_sesn();';

wwv_flow_api.create_flow_process(
  p_id => 1112252621937889399 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1000000000.3,
  p_process_point => 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 19 - Definir les variables de sessions',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_javascript_au_chargement
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_01_javsc_pkg.ajout_scrip_charg ();'||unistr('\000a')||
'afw_07_javsc_pkg.ajout_scrip_charg ();'||unistr('\000a')||
'--afw_19_javsc_pkg.ajout_scrip_charg ();'||unistr('\000a')||
'afw_25_javsc_pkg.ajout_scrip_charg ();';

wwv_flow_api.create_flow_process(
  p_id => 1109378129740906404 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1000000000.4,
  p_process_point => 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - JavaScript au chargement',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_04_synchroniser_variables_fil_d_ariane
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_04_fil_arian_pkg.synch_varbl();';

wwv_flow_api.create_flow_process(
  p_id => 1103696029034152148 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Synchroniser variables fil d''Ariane',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'afw_13_page_pkg.obten_page_sesn <>  afw_11_aplic_pkg.obten_page_conxn',
  p_process_when_type=> 'PLSQL_EXPRESSION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_04_mettre_à_jour_le_contexte
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_04_contx_pkg.maj_seqnc_contx();';

wwv_flow_api.create_flow_process(
  p_id => 1103298237033677066 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1000000000.1,
  p_process_point => 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Mettre à jour le contexte',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_sauvegarde_des_préférences
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_prefr_pkg.sauvg_prefr_page();';

wwv_flow_api.create_flow_process(
  p_id => 1144853606919670722 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1000000000.2,
  p_process_point => 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Sauvegarde des préférences',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_script_mode_recherche
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_navgt_pkg.script_mode_rechr ();';

wwv_flow_api.create_flow_process(
  p_id => 1071968314634254351 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 20,
  p_process_point => 'BEFORE_FOOTER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Script mode recherche',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_25_générer_le_script_d_affichage_du_rapport
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_25_appel_raprt_apex_pkg.genr_script_popup_raprt();';

wwv_flow_api.create_flow_process(
  p_id => 1088491405786027733 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1000000000,
  p_process_point => 'BEFORE_FOOTER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 25_Générer le script d''affichage du rapport',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'A_AFW_25_URL_RAPRT',
  p_process_when_type=> 'ITEM_IS_NOT_NULL',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_07_libérer_les_sémaphores_hors_persistances
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_07_semph_pkg.libr_semph_perst_page();';

wwv_flow_api.create_flow_process(
  p_id => 1088307011400934696 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.1,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 07 - Libérer les sémaphores hors persistances',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Error',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_11_définir_la_langue
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_01_lang_pkg.defnr_lang_sesn();';

wwv_flow_api.create_flow_process(
  p_id => 1103913228007840113 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.2,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 11 - Définir la langue',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> ':FSP_LANGUAGE_PREFERENCE is null',
  p_process_when_type=> 'PLSQL_EXPRESSION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_11_définir_items_application
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_11_prodt_pkg.defnr_item_aplic_apex();';

wwv_flow_api.create_flow_process(
  p_id => 1163390851545674310 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.3,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 11 - Définir items application',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_12_définir_items_application
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_12_utils_pkg.defnr_item_aplic_apex();';

wwv_flow_api.create_flow_process(
  p_id => 1128462202036453499 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.4,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 12 - Définir items application',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_définir_items_application
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_page_pkg.defnr_item_aplic_apex;';

wwv_flow_api.create_flow_process(
  p_id => 1206500705978305099 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.5,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Définir items application',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_aller_au_dernier_enregistrement
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_navgt_pkg.obten_dernr_enreg();';

wwv_flow_api.create_flow_process(
  p_id => 1114070305569991148 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 5,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Aller au dernier enregistrement',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> ':SAPC = ''XDE''',
  p_process_when_type=> 'PLSQL_EXPRESSION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_04_synchroniser_fil_d_ariane
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_04_fil_arian_pkg.synch;';

wwv_flow_api.create_flow_process(
  p_id => 1103179937521644669 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 8,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Synchroniser fil d''Ariane',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur lors de la synchronisation du fil d''Ariane.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_04_synchroniser_le_contexte
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_04_contx_pkg.synch;';

wwv_flow_api.create_flow_process(
  p_id => 1103179430249642517 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 9,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Synchroniser le contexte',
  p_process_sql_clob=> p,
  p_process_error_message=> '#SQLERRM#',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_gérer_le_mode_recherche
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_navgt_pkg.trait_mode_rechr ();'||unistr('\000a')||
':A_AFW_13_MODE_RECHR := afw_13_navgt_pkg.est_en_mode_rechr_va();';

wwv_flow_api.create_flow_process(
  p_id => 1071960607501987332 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 9.1,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Gérer le mode recherche',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_définir_contexte_navigation
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_navgt_pkg.defnr_contx_navgt();';

wwv_flow_api.create_flow_process(
  p_id => 1114070715051003384 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 9.2,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Définir contexte navigation',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_charger_les_préférences
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_prefr_pkg.charg_prefr_page();';

wwv_flow_api.create_flow_process(
  p_id => 1144837796184667580 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 9.5,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Charger les préférences',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/générer_le_produit_et_l_application_en_cours
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'  :a_safp_prodt := afw_04_contx_pkg.obten_seqnc_contx (''PRODT'');'||unistr('\000a')||
'  :a_safp_aplic := afw_04_contx_pkg.obten_seqnc_contx (''APLIC'');'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 1075529219928706693 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 9.6,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Générer le produit et l''application en cours',
  p_process_sql_clob=> p,
  p_process_error_message=> 'err',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'afw_13_page_pkg.obten_page_sesn  <>  afw_11_aplic_pkg.obten_page_conxn',
  p_process_when_type=> 'PLSQL_EXPRESSION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_25_export_csv
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_25_spx_expor_ir_pkg.afich_csv ();';

wwv_flow_api.create_flow_process(
  p_id => 1107241428701140124 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 12.1,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 25 - Export CSV',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'CSV',
  p_process_when_type=> 'REQUEST_EQUALS_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_25_export_pdf
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_25_plpdf_expor_ir_pkg.afich_pdf ();';

wwv_flow_api.create_flow_process(
  p_id => 1107241122121138245 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 12.2,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 25 - Export PDF',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'PDF',
  p_process_when_type=> 'REQUEST_EQUALS_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/update_session_state
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'null;';

wwv_flow_api.create_flow_process(
  p_id => 1070701334563380957 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'UPDATE_SESSION_STATE',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_04_autoriser_la_duplication_de_la_page_dans_le_fil_d_ariane
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||':A_AFW_04_AUTOR_DUPLQ_PAGE := ''O'';';

wwv_flow_api.create_flow_process(
  p_id => 1102869231399620244 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Autoriser la duplication de la page dans le fil d''Ariane',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_cacher_la_liste_de_navigation
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_page_pkg.cachr_liste_navgt();';

wwv_flow_api.create_flow_process(
  p_id => 1103100654251902670 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Cacher la liste de navigation',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur'||unistr('\000a')||
'',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_04_retourner_valeurs_modales
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'if :A_AFW_04_ACTIO = ''XRM'' then'||unistr('\000a')||
'  afw_04_contx_pkg.retr_modl;'||unistr('\000a')||
'end if;';

wwv_flow_api.create_flow_process(
  p_id => 1103694337991126289 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Retourner valeurs modales',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'A_AFW_04_ACTIO',
  p_process_when_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_process_when2=> 'XRM',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_04_réinitialiser_la_séquence
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'  vnu_page           number default afw_07_util_pkg.nv (''APP_PAGE_ID'');'||unistr('\000a')||
'  vvc_nom_item_seqnc varchar2 (30) default ''P'' || to_char (vnu_page) || ''_SEQNC'';'||unistr('\000a')||
'begin'||unistr('\000a')||
'  if afw_07_util_pkg.exist_item (vvc_nom_item_seqnc) then'||unistr('\000a')||
'    afw_07_util_pkg.defnr_etat_sessn (vvc_nom_item_seqnc, null);'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 1103813229012451423 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Réinitialiser la séquence',
  p_process_sql_clob=> p,
  p_process_error_message=> '#SQLERRM#',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/info_tri_alter
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_25_tri_alter_pkg.afich_info_tri_alter ();';

wwv_flow_api.create_flow_process(
  p_id => 1109385210964995665 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'INFO_TRI_ALTER',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_gérer_touches_haut_bas
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'htp.p(''<script type="text/javascript">'||unistr('\000a')||
'apex.jQuery(document).keydown(checkUpDownKey);'||unistr('\000a')||
'</script>'');';

wwv_flow_api.create_flow_process(
  p_id => 1114071105139009963 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Gérer touches haut/bas',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_cacher_tous_les_boutons
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_condt_piltb_pkg.cachr_tous_boutn;';

wwv_flow_api.create_flow_process(
  p_id => 1114071315528012946 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Cacher tous les boutons',
  p_process_sql_clob=> p,
  p_process_error_message=> '#SQLERRM#',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_tout_lecture_seule
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_condt_piltb_pkg.lectr_seule_tout;';

wwv_flow_api.create_flow_process(
  p_id => 1114072033321027545 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 -  Tout lecture seule',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_04_valider_info_de_provenance_avant_submit
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'if not afw_04_fil_arian_pkg.est_valid_sidf(true) then'||unistr('\000a')||
'  afw_08_url_pkg.redrg_page_acuei_postn;'||unistr('\000a')||
'end if;';

wwv_flow_api.create_flow_process(
  p_id => 1102869745944624403 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.1,
  p_process_point => 'ON_SUBMIT_BEFORE_COMPUTATION',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Valider info de provenance avant Submit',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur lors de la validation de la provenance.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'afw_13_page_pkg.obten_page_sesn <>  afw_11_aplic_pkg.obten_page_conxn',
  p_process_when_type=> 'PLSQL_EXPRESSION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_04_synchroniser_variables_contexte
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_04_contx_pkg.synch_varbl;';

wwv_flow_api.create_flow_process(
  p_id => 1103695749681148611 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.2,
  p_process_point => 'ON_SUBMIT_BEFORE_COMPUTATION',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Synchroniser variables contexte',
  p_process_sql_clob=> p,
  p_process_error_message=> '#SQLERRM#',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'afw_13_page_pkg.obten_page_sesn <>  afw_11_aplic_pkg.obten_page_conxn',
  p_process_when_type=> 'PLSQL_EXPRESSION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/afw_13_recherche
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_13_navgt_pkg.efect_rechr ();';

wwv_flow_api.create_flow_process(
  p_id => 1071968131472249755 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.3,
  p_process_point => 'ON_SUBMIT_BEFORE_COMPUTATION',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 13 - Recherche',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'AFW_13_RECHR_FORML',
  p_process_when_type=> 'REQUEST_EQUALS_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

prompt  ...application items
--
--application/shared_components/logic/application_items/a_afw_04_actio
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1103153137465840342 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_ACTIO'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_autor_duplq_page
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1102866829574562956 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_AUTOR_DUPLQ_PAGE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_contx
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1103153346469842942 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_CONTX'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_contx_formt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1187145802406690323 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_CONTX_FORMT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_seqnc_contx
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1103153549586843803 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_SEQNC_CONTX'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_sourc_actio
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1103153954780845311 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_SOURC_ACTIO'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_sourc_contx
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1103153752010844563 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_SOURC_CONTX'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_sourc_contx_formt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1187153809679692430 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_SOURC_CONTX_FORMT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_sourc_numr_aplic
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1494800095943833526 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_SOURC_NUMR_APLIC'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_sourc_numr_page
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1103544936233480855 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_SOURC_NUMR_PAGE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_sourc_seqnc_contx
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1103154157204846088 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_SOURC_SEQNC_CONTX'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_sourc_url
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1104232733930344894 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_SOURC_URL'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_suprm_fil_courn
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1156995541690095106 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_SUPRM_FIL_COURN'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_04_sur_soums
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1102961041970806292 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_04_SUR_SOUMS'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_acron_aplic
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 9242428421980375 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_ACRON_APLIC'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_acron_prodt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1088589114359049087 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_ACRON_PRODT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_deplc_range_raprt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 907167363993271601 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_DEPLC_RANGE_RAPRT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_dosr_fichr
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1072428328207056702 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_DOSR_FICHR'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_dosr_fichr_afw
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1072427032054010538 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_DOSR_FICHR_AFW'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_envir
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1088581107087046972 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_ENVIR'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_jquer_ui_css_scope
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1133367500577256256 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_JQUER_UI_CSS_SCOPE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_mesg_suprs
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1177788014964338493 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_MESG_SUPRS'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_mesg_tout_droit_resrv
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1133359495729254904 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_MESG_TOUT_DROIT_RESRV'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_nom_aplic
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 9242618411980375 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_NOM_APLIC'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_nom_prodt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 9242910288980375 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_NOM_PRODT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_numr_versn_prodt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 79667517825940765 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_NUMR_VERSN_PRODT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_numr_versn_prodt_afw
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 79725912876619140 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_NUMR_VERSN_PRODT_AFW'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_templ_custm
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 906435764126240577 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_TEMPL_CUSTM'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_templ_javsc_core_1
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1176282610875466806 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_TEMPL_JAVSC_CORE_1'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_templ_javsc_core_2
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1176298616762468505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_TEMPL_JAVSC_CORE_2'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_templ_javsc_jquer
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1176306619186469233 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_TEMPL_JAVSC_JQUER'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_templ_theme_jquer_ui
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1176290613299467543 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_TEMPL_THEME_JQUER_UI'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_trait_mesgs_err
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1313628108359894157 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_TRAIT_MESGS_ERR'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_url_acuei
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 906435661603240576 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_URL_ACUEI'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_url_authe_cible
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 456515039015519118 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_URL_AUTHE_CIBLE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_11_versn_prodt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1088604920246050757 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_11_VERSN_PRODT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_12_utils
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1101122710509884217 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_12_UTILS'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_12_utils_code
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1060349399695132353 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_12_UTILS_CODE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_12_utils_nom_formt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1163390038039670408 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_12_UTILS_NOM_FORMT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_lien_editn_raprt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1289882818271425266 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_LIEN_EDITN_RAPRT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_mesg_aucun_don_trouv
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1308306501080698493 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MESG_AUCUN_DON_TROUV'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_mesg_confr_suprs
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 14460726791804846 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MESG_CONFR_SUPRS'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_mesg_echec_specf
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1206430808570268084 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MESG_ECHEC_SPECF'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_mesg_impos_fetch
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1305700597113110699 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MESG_IMPOS_FETCH'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_mesg_range_inser
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1305611506763085080 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MESG_RANGE_INSER'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_mesg_range_modf
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1305588299144082892 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MESG_RANGE_MODF'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_mesg_range_suprm
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1305384713941030441 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MESG_RANGE_SUPRM'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_mesg_sucs_specf
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1206422803722266630 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MESG_SUCS_SPECF'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_mesg_trop_don_trouv
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1316371196902481763 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MESG_TROP_DON_TROUV'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_mode_rechr
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1071959821784972570 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MODE_RECHR'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_page_meta
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1103913934026851268 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_PAGE_META'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_page_titre
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1103913730216850157 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_PAGE_TITRE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_13_pagnt_navgt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1114073717962089352 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_PAGNT_NAVGT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_14_popup_lov_ir
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1129278009676752296 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_14_POPUP_LOV_IR'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_14_popup_lov_ir_retr
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1132026727322230666 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_14_POPUP_LOV_IR_RETR'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_afich_ereur
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111314709853121362 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_AFICH_EREUR'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_afich_lov
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111319517256132996 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_AFICH_LOV'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_aide_cle_fonct
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111319315871132552 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_AIDE_CLE_FONCT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_aide_item
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111315621281124723 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_AIDE_ITEM'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_aide_page
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111315923358125329 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_AIDE_PAGE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_anulr_reqt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111313528422117249 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_ANULR_REQT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_count_query
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111313934309119004 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_COUNT_QUERY'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_duplq_enreg
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111314911584121927 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_DUPLQ_ENREG'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_efacr_champ
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111313730500117899 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_EFACR_CHAMP'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_entre_reqt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111315113662122463 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_ENTRE_REQT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_exect_reqt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111315316432123302 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_EXECT_REQT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_impri
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111318912408131591 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_IMPRI'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_inser_enreg
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111316225090125838 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_INSER_ENREG'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_bas_page
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1112249924782795638 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_BAS_PAGE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_champ_precd
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111318105482129602 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_CHAMP_PRECD'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_champ_suivn
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111316626822126306 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_CHAMP_SUIVN'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_dernr_champ
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111314306390120416 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_DERNR_CHAMP'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_dernr_enreg
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111314508121120884 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_DERNR_ENREG'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_enreg_precd
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111318307559130173 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_ENREG_PRECD'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_enreg_suivn
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111316928553126774 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_ENREG_SUIVN'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_group_enreg_precd
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111318509291130660 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_GROUP_ENREG_PRECD'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_group_enreg_suivn
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111317130285127271 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_GROUP_ENREG_SUIVN'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_haut_page
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1112250127553796409 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_HAUT_PAGE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_ongle_precd
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111318710676131095 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_ONGLE_PRECD'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_ongle_suivn
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111317332016127757 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_ONGLE_SUIVN'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_page_precd
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111317533401128160 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_PAGE_PRECD'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_premr_champ
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111317702019128588 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_PREMR_CHAMP'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_navgt_premr_enreg
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111317903750129134 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_NAVGT_PREMR_ENREG'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_sauvg_enreg
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111319114139132059 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_SAUVG_ENREG'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_19_suprm_enreg
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1111314103619119607 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_19_SUPRM_ENREG'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_afw_25_url_raprt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1088613021416060557 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_25_URL_RAPRT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_date_systm
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1163389632844668839 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_DATE_SYSTM'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_required_patch => 1118945050003559942 + wwv_flow_api.g_id_offset
  );
 
end;
/

--application/shared_components/logic/application_items/a_nombr_boutn
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1072560933747905655 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_NOMBR_BOUTN'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_nombr_champ
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1072560730630904724 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_NOMBR_CHAMP'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_nombr_coln
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1072561104096906543 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_NOMBR_COLN'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_nombr_page
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1072561307212907413 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_NOMBR_PAGE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_p12081_numr_page_apex
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1129684945783968442 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_P12081_NUMR_PAGE_APEX'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_safp_aplic
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1489882021043532442 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_SAFP_APLIC'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_safp_prodt
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1075425218797456696 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_SAFP_PRODT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/fsp_after_login_url
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1102110735640133636 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'FSP_AFTER_LOGIN_URL'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'N'
  );
 
end;
/

--application/shared_components/logic/application_items/fsp_language_preference
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1103913032940822638 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'FSP_LANGUAGE_PREFERENCE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

prompt  ...application level computations
--
 
begin
 
--application/shared_components/logic/application_computations/a_date_systm
wwv_flow_api.create_flow_computation (
  p_id => 1163391135053679019 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'A_DATE_SYSTM',
  p_computation_point    => 'BEFORE_HEADER',
  p_computation_type => 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'to_char(sysdate, ''Day dd month yyyy'') || '' (semaine '' ||to_number(to_char(sysdate, ''iw'')) || ''/52)''',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
--application/shared_components/user_interface/lov/lov_afw_21_plugn_arbre_mode_cache
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1078273033218295785 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_AFW_21_PLUGN_ARBRE_MODE_CACHE',
  p_lov_query=> '.'||to_char(1078273033218295785 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1078273328876295789 + wwv_flow_api.g_id_offset,
  p_lov_id=>1078273033218295785 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Session',
  p_lov_return_value=>'SESN',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1078273708430295791 + wwv_flow_api.g_id_offset,
  p_lov_id=>1078273033218295785 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Aucune',
  p_lov_return_value=>'AUCUN',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_apex_condt
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1130190830696746833 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_APEX_CONDT',
  p_lov_query=> 'select valr d,'||unistr('\000a')||
'       ddv.seqnc r'||unistr('\000a')||
'  from vd_afw_14_domn_valr dv,'||unistr('\000a')||
'       vd_afw_14_detl_domn_valr ddv'||unistr('\000a')||
' where dv.seqnc = ddv.ref_domn_valr '||unistr('\000a')||
'   and dv.code = ''CONDT_APEX'''||unistr('\000a')||
'   and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_aplic
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1489859095325951050 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_APLIC',
  p_lov_query=> 'select   numr_aplic_apex || '' - '' || code || '' - '' || nom d,'||unistr('\000a')||
'         seqnc r'||unistr('\000a')||
'    from vd_afw_11_aplic'||unistr('\000a')||
'where ref_prodt = afw_04_contx_pkg.obten_seqnc_contx(''PRODT'')'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_aplic_apex
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1103142641045570606 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_APLIC_APEX',
  p_lov_query=> 'select ''['' || owner || ''] '' || id || '' - '' || name d, id r'||unistr('\000a')||
'    from apex_aplic'||unistr('\000a')||
'   where owner <> afw_07_util_pkg.obten_schem_apex'||unistr('\000a')||
'order by owner, id');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_boutn_type_aide_contx
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1114005023880867449 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_BOUTN_TYPE_AIDE_CONTX',
  p_lov_query=> '  select   ddv.valr d, '||unistr('\000a')||
'           ddv.seqnc r '||unistr('\000a')||
'    from   vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'           vd_afw_14_domn_valr dv '||unistr('\000a')||
'   where   ddv.ref_domn_valr = dv.seqnc '||unistr('\000a')||
'     and   dv.code = ''BOUTN_TYPE_AIDE_CONTX'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'     and   ddv.date_debut_efect <= sysdate '||unistr('\000a')||
'     and   (ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect'||unistr('\000a')||
'            or ddv.date_fin_efect is null)'||unistr('\000a')||
'order by   ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_catgr_persn
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1125156838956328134 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_CATGR_PERSN',
  p_lov_query=> 'select ddv.valr d, ddv.seqnc r'||unistr('\000a')||
'  from vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'       vd_afw_14_domn_valr dv'||unistr('\000a')||
' where dv.seqnc = ddv.ref_domn_valr '||unistr('\000a')||
'   and dv.code = ''CATGR_PERSN'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_condt_exect
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1077292022943047653 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_CONDT_EXECT',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_afw_13_condt_exect'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_contx_exect
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1075825221501068393 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_CONTX_EXECT',
  p_lov_query=> '.'||to_char(1075825221501068393 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1075825525943068393 + wwv_flow_api.g_id_offset,
  p_lov_id=>1075825221501068393 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Propriétaire',
  p_lov_return_value=>'N',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1075825710961068393 + wwv_flow_api.g_id_offset,
  p_lov_id=>1075825221501068393 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Utilisateur courant',
  p_lov_return_value=>'O',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_coulr_princ
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1246896705909409306 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_COULR_PRINC',
  p_lov_query=> 'select ddv.valr d, ddv.seqnc r'||unistr('\000a')||
'  from vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'       vd_afw_14_domn_valr dv'||unistr('\000a')||
' where dv.seqnc = ddv.ref_domn_valr '||unistr('\000a')||
'   and dv.code = ''COULR_PRINC'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_coulr_theme
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1246896509817409306 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_COULR_THEME',
  p_lov_query=> 'select ddv.valr d, ddv.seqnc r'||unistr('\000a')||
'  from vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'       vd_afw_14_domn_valr dv'||unistr('\000a')||
' where dv.seqnc = ddv.ref_domn_valr '||unistr('\000a')||
'   and dv.code = ''COULR_THEME'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_defnt_acces
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1105602331658087709 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_DEFNT_ACCES',
  p_lov_query=> '.'||to_char(1105602331658087709 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105602848651087711 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105602331658087709 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Accordé',
  p_lov_return_value=>'ACORD',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105603051153087711 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105602331658087709 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Utilisateur lié',
  p_lov_return_value=>'ACUCS',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105603226769087711 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105602331658087709 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Structure inférieure liée',
  p_lov_return_value=>'ACSIN',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105676841855845723 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105602331658087709 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'Structure immédiate liée',
  p_lov_return_value=>'ACSTI',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105603437048087711 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105602331658087709 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>5,
  p_lov_disp_value=>'Structure supérieure liée',
  p_lov_return_value=>'ACSSU',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105677353976849195 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105602331658087709 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>6,
  p_lov_disp_value=>'Structure globale liée',
  p_lov_return_value=>'ACSTG',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_dosr_virtl
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1077252320735987344 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_DOSR_VIRTL',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_afw_13_dosr_virtl dv'||unistr('\000a')||
' where ref_prodt = :A_SAFP_PRODT'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_erer_oracl
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1104022244974677734 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_ERER_ORACL',
  p_lov_query=> 'select libl d, seqnc r'||unistr('\000a')||
'from VD_AFW_01_CODE_ERR_ORACL'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_formt
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1152568637079361574 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_FORMT',
  p_lov_query=> 'select LIBL d, SEQNC r'||unistr('\000a')||
'from   VD_AFW_14_FORMT'||unistr('\000a')||
'where ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_group_utils_sem
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1124502151787508772 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_GROUP_UTILS_SEM',
  p_lov_query=> 'select   nom d,'||unistr('\000a')||
'         seqnc r'||unistr('\000a')||
'  from   vd_afw_12_group_utils gu'||unistr('\000a')||
' where   gu.ref_prodt = (select   seqnc'||unistr('\000a')||
'                           from   vd_afw_11_prodt p'||unistr('\000a')||
'                          where   p.code = ''SEM'')'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_jeu_carct_apex
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1113369622406728527 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_JEU_CARCT_APEX',
  p_lov_query=> '  select   ddv.valr d, '||unistr('\000a')||
'           ddv.seqnc r '||unistr('\000a')||
'    from   vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'           vd_afw_14_domn_valr dv '||unistr('\000a')||
'   where   ddv.ref_domn_valr = dv.seqnc '||unistr('\000a')||
'     and   dv.code = ''JEU_CARCT_APEX'''||unistr('\000a')||
'     and   ddv.code_valr = ''UTF-8'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by   ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_lang
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1125572843578757630 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_LANG',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_afw_01_lang'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_lang_lang
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1129646053619611220 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_LANG_LANG',
  p_lov_query=> 'select nom d, ref_lang r'||unistr('\000a')||
'  from vd_afw_01_lang_lang'||unistr('\000a')||
' where ref_lang_cible = afw_01_lang_pkg.obten_lang_sesn()'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_mesg
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1102918148864136200 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_MESG',
  p_lov_query=> 'select libl_mesg d, seqnc r'||unistr('\000a')||
'  from (select mes.numr_mesg||'' - ''||mel.mesg libl_mesg, mes.seqnc'||unistr('\000a')||
'          from vd_afw_01_mesg mes,'||unistr('\000a')||
'               vd_afw_01_mesg_lang mel'||unistr('\000a')||
'         where mel.ref_mesg = mes.seqnc'||unistr('\000a')||
'           and mel.ref_lang = afw_01_lang_pkg.obten_lang_sesn()'||unistr('\000a')||
'           and mes.ref_prodt = :A_SAFP_PRODT)'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_natr_envir
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 455999814972265110 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_NATR_ENVIR',
  p_lov_query=> 'select     valr d,'||unistr('\000a')||
'           ddv.seqnc r'||unistr('\000a')||
'    from   vd_afw_14_domn_valr dv,'||unistr('\000a')||
'           vd_afw_14_detl_domn_valr ddv'||unistr('\000a')||
'   where   dv.seqnc = ddv.ref_domn_valr'||unistr('\000a')||
'           and dv.code = ''AFW_NATR_ENVIR'''||unistr('\000a')||
'           and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'           and ddv.date_debut_efect <= sysdate'||unistr('\000a')||
'           and (   ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect'||unistr('\000a')||
'                or ddv.date_fin_efect is null)'||unistr('\000a')||
'order by   ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_numr_mesg
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1125898029632208506 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_NUMR_MESG',
  p_lov_query=> 'select libl_mesg d, numr_mesg r'||unistr('\000a')||
'  from (select mes.numr_mesg||'' - ''||mel.mesg libl_mesg, mes.numr_mesg'||unistr('\000a')||
'          from vd_afw_01_mesg mes,'||unistr('\000a')||
'               vd_afw_01_mesg_lang mel'||unistr('\000a')||
'         where mel.ref_mesg = mes.seqnc'||unistr('\000a')||
'           and mel.ref_lang = afw_01_lang_pkg.obten_lang_sesn())'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_o
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1102859845710482486 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_O',
  p_lov_query=> '.'||to_char(1102859845710482486 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1102860139691482488 + wwv_flow_api.g_id_offset,
  p_lov_id=>1102859845710482486 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'&nbsp;',
  p_lov_return_value=>'O',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_optio_entet_calnd
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1073721025349868248 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_OPTIO_ENTET_CALND',
  p_lov_query=> 'select d, r'||unistr('\000a')||
'  from vs_optio_entet_calnd'||unistr('\000a')||
'order by o');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_orien_menu
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1247028092605422871 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_ORIEN_MENU',
  p_lov_query=> 'select ddv.valr d, ddv.seqnc r'||unistr('\000a')||
'  from vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'       vd_afw_14_domn_valr dv'||unistr('\000a')||
' where dv.seqnc = ddv.ref_domn_valr '||unistr('\000a')||
'   and dv.code = ''ORIEN_MENU'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_oui_non
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1104988352720719745 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_OUI_NON',
  p_lov_query=> '.'||to_char(1104988352720719745 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1104988636994719748 + wwv_flow_api.g_id_offset,
  p_lov_id=>1104988352720719745 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Oui',
  p_lov_return_value=>'O',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1104988839917719750 + wwv_flow_api.g_id_offset,
  p_lov_id=>1104988352720719745 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Non',
  p_lov_return_value=>'N',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p1010_apex_page
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1113982121438015204 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P1010_APEX_PAGE',
  p_lov_query=> 'select id || '' - '' || name d, id r'||unistr('\000a')||
'  from apex_page'||unistr('\000a')||
' where afw_07_util_pkg.nv(''P1010_NUMR_APLIC_APEX'') is not null and flow_id = :P1010_NUMR_APLIC_APEX'||unistr('\000a')||
' order by id');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p1010_group_utils_ignor_group_admin
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1114379202047054470 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P1010_GROUP_UTILS_IGNOR_GROUP_ADMIN',
  p_lov_query=> 'select   nom d,'||unistr('\000a')||
'         seqnc r'||unistr('\000a')||
'  from   vd_afw_12_group_utils gu'||unistr('\000a')||
' where   gu.ref_prodt = :P1010_SEQNC'||unistr('\000a')||
'   and   gu.indic_ignor_group_admin = ''N'''||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p1050_templ_boutn
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1111286915630446702 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P1050_TEMPL_BOUTN',
  p_lov_query=> 'select   template_name d,'||unistr('\000a')||
'         id r'||unistr('\000a')||
'  from   apex_boutn_templ'||unistr('\000a')||
' where   flow_id = afw_11_prodt_pkg.obten_numr_apex_prodt(afw_07_util_pkg.nv(''P1050_REF_PRODT''))'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p1070_templ_boutn
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1110430010673087301 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P1070_TEMPL_BOUTN',
  p_lov_query=> 'select   template_name d,'||unistr('\000a')||
'         id r'||unistr('\000a')||
'  from   apex_boutn_templ'||unistr('\000a')||
' where   flow_id = afw_11_prodt_pkg.obten_numr_apex_prodt(:p1070_seqnc)'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p12041_depsm_alias_coln
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1116801828886154768 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P12041_DEPSM_ALIAS_COLN',
  p_lov_query=> 'select arc.column_alias d, arc.column_alias r'||unistr('\000a')||
'from apex_regn_coln arc,'||unistr('\000a')||
'    apex_regn ar'||unistr('\000a')||
' where arc.display_as = ''HIDDEN'''||unistr('\000a')||
'   and arc.region_id = ar.id'||unistr('\000a')||
'   and arc.flow_id = ar.flow_id'||unistr('\000a')||
'   and ar.flow_id = :P12041_NUMR_APLIC_APEX'||unistr('\000a')||
'   and ar.page_id = :P12041_NUMR_APEX'||unistr('\000a')||
'   and ar.plug_source_type = ''UPDATABLE_SQL_QUERY'''||unistr('\000a')||
'   and arc.column_alias <> ''SEQNC'''||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p12041_opert
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1102763247991135950 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P12041_OPERT',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_afw_13_opert o'||unistr('\000a')||
' where o.ref_prodt = afw_04_contx_pkg.obten_seqnc_contx(''PRODT'')'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p12070_ir
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1102947142412112678 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P12070_IR',
  p_lov_query=> 'select libl_regn d, seqnc r'||unistr('\000a')||
'  from vd_afw_13_page_ir ir'||unistr('\000a')||
' where ir.ref_page = :A_AFW_04_SOURC_SEQNC_CONTX'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p12078_lang_prod
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1113933721900704962 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P12078_LANG_PROD',
  p_lov_query=> 'select ll.nom d,'||unistr('\000a')||
'       ll.ref_lang r'||unistr('\000a')||
'  from vd_afw_01_lang_lang ll'||unistr('\000a')||
' where ll.ref_lang_cible = afw_01_lang_pkg.obten_lang_sesn()'||unistr('\000a')||
'   and (exists (select null'||unistr('\000a')||
'                  from vd_afw_11_aplic a'||unistr('\000a')||
'                 where a.ref_lang = ll.ref_lang'||unistr('\000a')||
'                   and a.seqnc = afw_07_util_pkg.vd(''P12078_REF_APLIC''))'||unistr('\000a')||
'        or '||unistr('\000a')||
'        exists (select null'||unistr('\000a')||
'                  from vd_afw_11_prodt_lang pl,'||unistr('\000a')||
'                       vd_afw_11_prodt p,'||unistr('\000a')||
'                       vd_afw_11_aplic a                       '||unistr('\000a')||
'                 where pl.ref_prodt = p.seqnc'||unistr('\000a')||
'                   and pl.ref_lang = ll.ref_lang'||unistr('\000a')||
'                   and p.seqnc = a.ref_prodt'||unistr('\000a')||
'                   and a.seqnc = afw_07_util_pkg.vd(''P12078_REF_APLIC''))'||unistr('\000a')||
'       )'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p12081_lang_prod
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1132634753054207311 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P12081_LANG_PROD',
  p_lov_query=> 'select ll.nom d,'||unistr('\000a')||
'       ll.ref_lang r'||unistr('\000a')||
'  from vd_afw_01_lang_lang ll'||unistr('\000a')||
' where ll.ref_lang_cible = afw_01_lang_pkg.obten_lang_sesn()'||unistr('\000a')||
'   and (exists (select null'||unistr('\000a')||
'                  from vd_afw_11_prodt p'||unistr('\000a')||
'                 where p.ref_lang = ll.ref_lang'||unistr('\000a')||
'                   and p.seqnc = afw_07_util_pkg.vd(''P12081_REF_PRODT''))'||unistr('\000a')||
'        or '||unistr('\000a')||
'        exists (select null'||unistr('\000a')||
'                  from vd_afw_11_prodt_lang pl,'||unistr('\000a')||
'                       vd_afw_11_prodt p                       '||unistr('\000a')||
'                 where pl.ref_prodt = p.seqnc'||unistr('\000a')||
'                   and pl.ref_lang = ll.ref_lang'||unistr('\000a')||
'                   and p.seqnc = afw_07_util_pkg.vd(''P12081_REF_PRODT''))'||unistr('\000a')||
'       )'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p12091_afw_13_items
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1130217031415374544 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P12091_AFW_13_ITEMS',
  p_lov_query=> 'select d, r from ('||unistr('\000a')||
'select (select a.code || '' - '' || p.nom || '' (p.'' || p.numr_apex || '')'''||unistr('\000a')||
'        from vd_afw_13_page p,'||unistr('\000a')||
'             vd_afw_11_aplic a'||unistr('\000a')||
'        where p.seqnc = pi.ref_page and p.ref_aplic = a.seqnc) ||'||unistr('\000a')||
'      '' - '' ||'||unistr('\000a')||
'      libl || '||unistr('\000a')||
'      '' ('' || nom_apex || '')'' '||unistr('\000a')||
'        d,'||unistr('\000a')||
'      seqnc r'||unistr('\000a')||
'from vd_afw_13_page_item pi'||unistr('\000a')||
'where type_item = ''ITEM'')'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p12095_afw_13_items
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1128989603082312760 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P12095_AFW_13_ITEMS',
  p_lov_query=> 'select d, r from ('||unistr('\000a')||
'select (select pr.code || '' - '' || p.nom || '' (p.'' || p.numr_apex || '')'''||unistr('\000a')||
'        from vd_afw_13_page p,'||unistr('\000a')||
'             vd_afw_11_prodt pr'||unistr('\000a')||
'        where p.seqnc = pi.ref_page and p.ref_prodt = pr.seqnc) ||'||unistr('\000a')||
'      '' - '' ||'||unistr('\000a')||
'      libl || '||unistr('\000a')||
'      '' ('' || nom_apex || '')'' '||unistr('\000a')||
'        d,'||unistr('\000a')||
'      seqnc r'||unistr('\000a')||
'from vd_afw_13_page_item pi)'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p12095_afw_13_items1
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1132007318367135624 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P12095_AFW_13_ITEMS1',
  p_lov_query=> 'select d, r from ('||unistr('\000a')||
'select (select pr.code || '' - '' || p.nom || '' (p.'' || p.numr_apex || '')'''||unistr('\000a')||
'        from vd_afw_13_page p,'||unistr('\000a')||
'             vd_afw_11_prodt pr'||unistr('\000a')||
'        where p.seqnc = pi.ref_page and p.ref_prodt = pr.seqnc) ||'||unistr('\000a')||
'      '' - '' ||'||unistr('\000a')||
'      libl || '||unistr('\000a')||
'      '' ('' || nom_apex || '')'' '||unistr('\000a')||
'        d,'||unistr('\000a')||
'      seqnc r'||unistr('\000a')||
'from vd_afw_13_page_item pi)'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p12095_afw_13_page_ir
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1129935102165920904 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P12095_AFW_13_PAGE_IR',
  p_lov_query=> '  select   d,'||unistr('\000a')||
'           r'||unistr('\000a')||
'    from   (select   (select   code || '' - '''||unistr('\000a')||
'                        from   vd_afw_11_prodt pr'||unistr('\000a')||
'                       where   pr.seqnc = p.ref_prodt) ||'||unistr('\000a')||
'                     nom d,'||unistr('\000a')||
'                     seqnc r'||unistr('\000a')||
'              from   vd_afw_13_page p)'||unistr('\000a')||
'order by   1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p12095_afw_13_page_ir1
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1132007619776135630 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P12095_AFW_13_PAGE_IR1',
  p_lov_query=> '  select   d "Nom",'||unistr('\000a')||
'           r'||unistr('\000a')||
'    from   (select   (select   pr.code || '' - '''||unistr('\000a')||
'                        from   vd_afw_11_prodt pr'||unistr('\000a')||
'                       where   pr.seqnc = p.ref_prodt) ||'||unistr('\000a')||
'                     p.nom d,'||unistr('\000a')||
'                     p.seqnc r'||unistr('\000a')||
'              from   vd_afw_13_page p,'||unistr('\000a')||
'                     vd_afw_13_page_ir pi'||unistr('\000a')||
'              where  p.seqnc = pi.ref_page'||unistr('\000a')||
'                and  p.indic_prise_charg_afw14_popup = ''O'')'||unistr('\000a')||
'order by   1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p14020_type_domn
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1107247902737276120 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P14020_TYPE_DOMN',
  p_lov_query=> 'select nom d,'||unistr('\000a')||
'       seqnc r'||unistr('\000a')||
'  from vd_afw_14_type_domn_valr'||unistr('\000a')||
' where ref_prodt = :P14020_REF_PRODT'||unistr('\000a')||
' order by 1'||unistr('\000a')||
'');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p21010_profl_courl
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1070887318419426402 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P21010_PROFL_COURL',
  p_lov_query=> 'select pc.servr || '' - '' || pc.nom_envoy d,'||unistr('\000a')||
'       pc.seqnc r'||unistr('\000a')||
'from vd_afw_17_profl_courl pc'||unistr('\000a')||
'where (pc.ref_prodt = afw_07_util_pkg.v (''P21010_REF_PRODT'')'||unistr('\000a')||
'       or afw_07_util_pkg.v (''P21010_REF_PRODT'') is null) or pc.ref_prodt is null'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p4030_atrib
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1152559233438356067 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P4030_ATRIB',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_defnt_atrib'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_p4030_libl
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1152558657193356067 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_P4030_LIBL',
  p_lov_query=> 'select code || '' :: '' || nom d, seqnc r'||unistr('\000a')||
' from vd_libl'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_page
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1123655344902689667 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_PAGE',
  p_lov_query=> '  SELECT ''['' || a.code || ''] '' || p.numr_apex || '' - '' || p.nom d, p.seqnc r'||unistr('\000a')||
'    FROM vd_afw_13_page p, vd_afw_11_aplic a'||unistr('\000a')||
'   WHERE p.ref_aplic IN'||unistr('\000a')||
'            (SELECT seqnc'||unistr('\000a')||
'               FROM vd_afw_11_aplic a2'||unistr('\000a')||
'              WHERE a2.ref_prodt = afw_04_contx_pkg.obten_seqnc_contx (''PRODT''))'||unistr('\000a')||
'         AND a.seqnc = p.ref_aplic'||unistr('\000a')||
'ORDER BY p.numr_apex');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_plugn
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1074196918420263593 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_PLUGN',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_afw_11_plugn'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_prodt
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1102130636664762688 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_PRODT',
  p_lov_query=> 'select   numr_aplic_apex || '' - '' || code || '' - '' || nom d,'||unistr('\000a')||
'         seqnc r'||unistr('\000a')||
'    from vd_afw_11_prodt'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_sesn
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1130263150730215269 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_SESN',
  p_lov_query=> 'select code_utils || '' ('' ||nom || '', '' || prenm || '')'' d, s.id_sesn r'||unistr('\000a')||
'  from vd_afw_12_utils u, vd_afw_12_sesn s'||unistr('\000a')||
' where s.app_user = u.code_utils'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_spx_type_publc
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1160244151977731957 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_SPX_TYPE_PUBLC',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_spx_type_publc'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_struc_aplic
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1105060344760893761 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_STRUC_APLIC',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_afw_12_struc_aplic'||unistr('\000a')||
' where ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_systm
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1477361994450450324 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_SYSTM',
  p_lov_query=> 'select nom_formt d, seqnc r'||unistr('\000a')||
'  from vd_afw_11_systm'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_actio_fonct
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1110740115424943982 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_ACTIO_FONCT',
  p_lov_query=> '  select   ddv.valr d, '||unistr('\000a')||
'           ddv.seqnc r '||unistr('\000a')||
'    from   vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'           vd_afw_14_domn_valr dv '||unistr('\000a')||
'   where   ddv.ref_domn_valr = dv.seqnc '||unistr('\000a')||
'     and   dv.code = ''TYPE_ACTIO_FONCT'''||unistr('\000a')||
''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by   ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_appel_reprt
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1128240245236271045 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_APPEL_REPRT',
  p_lov_query=> '.'||to_char(1128240245236271045 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1128240543767271055 + wwv_flow_api.g_id_offset,
  p_lov_id=>1128240245236271045 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Strict',
  p_lov_return_value=>'S',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1128240742368271059 + wwv_flow_api.g_id_offset,
  p_lov_id=>1128240245236271045 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Ouvert',
  p_lov_return_value=>'O',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_atrib_fonct
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1110290917685602256 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_ATRIB_FONCT',
  p_lov_query=> '  select   ddv.valr d,'||unistr('\000a')||
'           ddv.seqnc r'||unistr('\000a')||
'    from   vd_afw_14_detl_domn_valr ddv,'||unistr('\000a')||
'           vd_afw_14_domn_valr dv'||unistr('\000a')||
'   where   ddv.ref_domn_valr = dv.seqnc and dv.code = ''TYPE_ATRIB_FONCT'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by   ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_comnc
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1079040405559870860 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_COMNC',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'from   vd_afw_01_type_comnc'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_domn_valr
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1105859955302981767 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_DOMN_VALR',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'from   vd_afw_14_type_domn_valr'||unistr('\000a')||
'where ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_don
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1105341853454384639 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_DON',
  p_lov_query=> '.'||to_char(1105341853454384639 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105342136703384641 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105341853454384639 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Alphanumérique',
  p_lov_return_value=>'V',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105342333301384642 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105341853454384639 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Numérique',
  p_lov_return_value=>'N',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105342547158384642 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105341853454384639 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Date',
  p_lov_return_value=>'D',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_don2
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1077285404186938123 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_DON2',
  p_lov_query=> '.'||to_char(1077285404186938123 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1077285721309938124 + wwv_flow_api.g_id_offset,
  p_lov_id=>1077285404186938123 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Date',
  p_lov_return_value=>'D',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1077285920357938125 + wwv_flow_api.g_id_offset,
  p_lov_id=>1077285404186938123 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Number',
  p_lov_return_value=>'N',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1077286119473938126 + wwv_flow_api.g_id_offset,
  p_lov_id=>1077285404186938123 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Varchar2',
  p_lov_return_value=>'V',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_expor_apex
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1113357706850601049 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_EXPOR_APEX',
  p_lov_query=> '  select   ddv.valr d, '||unistr('\000a')||
'           ddv.seqnc r '||unistr('\000a')||
'    from   vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'           vd_afw_14_domn_valr dv '||unistr('\000a')||
'   where   ddv.ref_domn_valr = dv.seqnc '||unistr('\000a')||
'     and   dv.code = ''TYPE_EXPOR_APEX'''||unistr('\000a')||
'     and   ddv.code_valr = ''FLOW_EXPORT'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by   ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_expre_actio
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1110752726084091993 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_EXPRE_ACTIO',
  p_lov_query=> '  select   ddv.valr d, '||unistr('\000a')||
'           ddv.seqnc r '||unistr('\000a')||
'    from   vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'           vd_afw_14_domn_valr dv '||unistr('\000a')||
'   where   ddv.ref_domn_valr = dv.seqnc '||unistr('\000a')||
'     and   dv.code = ''TYPE_EXPRE_ACTIO'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by   ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_insta
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1130195854077791455 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_INSTA',
  p_lov_query=> 'select valr d,'||unistr('\000a')||
'      ddv.seqnc r'||unistr('\000a')||
'from vd_afw_14_domn_valr dv,'||unistr('\000a')||
'     vd_afw_14_detl_domn_valr ddv'||unistr('\000a')||
'where dv.seqnc = ddv.ref_domn_valr and dv.code = ''TYPE_INSTA'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_largr
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1103923743061357845 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_LARGR',
  p_lov_query=> '.'||to_char(1103923743061357845 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1103924035474357856 + wwv_flow_api.g_id_offset,
  p_lov_id=>1103923743061357845 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Pouce',
  p_lov_return_value=>'POUCE',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1103924456729357859 + wwv_flow_api.g_id_offset,
  p_lov_id=>1103923743061357845 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Relatif restant',
  p_lov_return_value=>'RELTF',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_liais
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1103461829696444977 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_LIAIS',
  p_lov_query=> '.'||to_char(1103461829696444977 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1103462150200444980 + wwv_flow_api.g_id_offset,
  p_lov_id=>1103461829696444977 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'1 - Page, type d''erreur, contrainte et table/colonne',
  p_lov_return_value=>'1',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1103462351522444980 + wwv_flow_api.g_id_offset,
  p_lov_id=>1103461829696444977 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'2 - Page et type d''erreur',
  p_lov_return_value=>'2',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1103462554437444980 + wwv_flow_api.g_id_offset,
  p_lov_id=>1103461829696444977 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'3 - Page',
  p_lov_return_value=>'3',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1103462741551444980 + wwv_flow_api.g_id_offset,
  p_lov_id=>1103461829696444977 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'4 - Type d''erreur, contrainte et table/colonne',
  p_lov_return_value=>'4',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1103462928158444980 + wwv_flow_api.g_id_offset,
  p_lov_id=>1103461829696444977 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>5,
  p_lov_disp_value=>'5 - Type d''erreur',
  p_lov_return_value=>'5',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1103463549319444981 + wwv_flow_api.g_id_offset,
  p_lov_id=>1103461829696444977 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>8,
  p_lov_disp_value=>'8 - Message générique',
  p_lov_return_value=>'8',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_libl
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1152558953588356067 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_LIBL',
  p_lov_query=> 'select code || '' :: '' || nom d, seqnc r'||unistr('\000a')||
' from vd_type_libl'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_menu
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1245023714305195482 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_MENU',
  p_lov_query=> 'select ddv.valr d, ddv.seqnc r'||unistr('\000a')||
'  from vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'       vd_afw_14_domn_valr dv'||unistr('\000a')||
' where dv.seqnc = ddv.ref_domn_valr '||unistr('\000a')||
'   and dv.code = ''TYPE_MENU'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_mesg
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1105735745824151203 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_MESG',
  p_lov_query=> '.'||to_char(1105735745824151203 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105736042630151205 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105735745824151203 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Erreur',
  p_lov_return_value=>'E',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1156947028234019038 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105735745824151203 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Erreur critique',
  p_lov_return_value=>'C',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105736252938151206 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105735745824151203 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Informatif',
  p_lov_return_value=>'I',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105736435079151206 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105735745824151203 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'Aide',
  p_lov_return_value=>'A',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1105736646858151206 + wwv_flow_api.g_id_offset,
  p_lov_id=>1105735745824151203 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>5,
  p_lov_disp_value=>'Avertissement',
  p_lov_return_value=>'W',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_modl
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1075822112647876620 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_MODL',
  p_lov_query=> 'select ddv.valr display_value, ddv.seqnc return_value '||unistr('\000a')||
'from vd_afw_14_detl_domn_valr ddv, vd_afw_14_domn_valr dv'||unistr('\000a')||
'where ddv.ref_domn_valr = dv.seqnc and dv.code = ''TYPE_MODL'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_regn_piltb
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1113948609105202768 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_REGN_PILTB',
  p_lov_query=> '  select   ddv.valr d, '||unistr('\000a')||
'           ddv.seqnc r '||unistr('\000a')||
'    from   vd_afw_14_detl_domn_valr ddv, '||unistr('\000a')||
'           vd_afw_14_domn_valr dv '||unistr('\000a')||
'   where   ddv.ref_domn_valr = dv.seqnc '||unistr('\000a')||
'     and   dv.code = ''TYPE_REGN_PILTB'''||unistr('\000a')||
'     and   dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'order by   ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_resrc
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1077152710249567719 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_RESRC',
  p_lov_query=> 'select valr d, code_valr r'||unistr('\000a')||
'from   vs_afw_14_domn_valr'||unistr('\000a')||
'where code = ''TYPE_RESRC'''||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_struc
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1105459646701271645 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_STRUC',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_afw_12_type_struc'||unistr('\000a')||
'');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_utils
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1130262042288203408 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_UTILS',
  p_lov_query=> 'select code_utils || '' ('' ||nom || '', '' || prenm || '')'' d, seqnc r'||unistr('\000a')||
'  from vd_afw_12_utils'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_valr_insta
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1130218932070421964 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_VALR_INSTA',
  p_lov_query=> 'select valr d,'||unistr('\000a')||
'      ddv.seqnc r'||unistr('\000a')||
'from vd_afw_14_domn_valr dv,'||unistr('\000a')||
'     vd_afw_14_detl_domn_valr ddv'||unistr('\000a')||
'where dv.seqnc = ddv.ref_domn_valr and dv.code = ''VALR_INSTA_SAFP'''||unistr('\000a')||
'     and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'     and ddv.date_debut_efect <= sysdate '||unistr('\000a')||
'     and (ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect'||unistr('\000a')||
'          or ddv.date_fin_efect is null)'||unistr('\000a')||
'order by ddv.seqnc_presn');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_versn_bd_aplic
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1075806417477376595 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_VERSN_BD_APLIC',
  p_lov_query=> '.'||to_char(1075806417477376595 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1075806710768376599 + wwv_flow_api.g_id_offset,
  p_lov_id=>1075806417477376595 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'10g',
  p_lov_return_value=>'10g',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1075806931106376603 + wwv_flow_api.g_id_offset,
  p_lov_id=>1075806417477376595 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'11g',
  p_lov_return_value=>'11g',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_versn_prodt
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1077250220248902059 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_VERSN_PRODT',
  p_lov_query=> 'select versn_formt d, seqnc r'||unistr('\000a')||
'  from vd_afw_11_versn v'||unistr('\000a')||
' where v.ref_prodt = :A_SAFP_PRODT'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/p19000_opert
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1477941592084415836 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'P19000_OPERT',
  p_lov_query=> '.'||to_char(1477941592084415836 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1477941896358415838 + wwv_flow_api.g_id_offset,
  p_lov_id=>1477941592084415836 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'=',
  p_lov_return_value=>'=',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1477942115837415838 + wwv_flow_api.g_id_offset,
  p_lov_id=>1477941592084415836 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'>',
  p_lov_return_value=>'>',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1477942316787415838 + wwv_flow_api.g_id_offset,
  p_lov_id=>1477941592084415836 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'>=',
  p_lov_return_value=>'>=',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1477942504111415838 + wwv_flow_api.g_id_offset,
  p_lov_id=>1477941592084415836 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'<',
  p_lov_return_value=>'<',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1477942703625415838 + wwv_flow_api.g_id_offset,
  p_lov_id=>1477941592084415836 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>5,
  p_lov_disp_value=>'<=',
  p_lov_return_value=>'<=',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1477942909836415839 + wwv_flow_api.g_id_offset,
  p_lov_id=>1477941592084415836 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>6,
  p_lov_disp_value=>'!=',
  p_lov_return_value=>'!=',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1477943106344415839 + wwv_flow_api.g_id_offset,
  p_lov_id=>1477941592084415836 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>7,
  p_lov_disp_value=>'like',
  p_lov_return_value=>'like',
  p_lov_data_comment=> '');
 
null;
 
end;
/

prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
wwv_flow_api.create_page_group(
  p_id=>1102115633864071986 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'1000 - Gestion des messages d''erreur',
  p_group_desc=>'');
 
wwv_flow_api.create_page_group(
  p_id=>1102115952564077323 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'9000 - Généraux - Communs',
  p_group_desc=>'');
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00000
prompt  ...PAGE 0: Page commune
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 0
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Page commune'
 ,p_step_title => 'Page commune'
 ,p_step_sub_title => 'Sie'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_required_role => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20150416161337'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1075865009203652464 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Recherche',
  p_region_name=>'',
  p_region_attributes=> 'class="filtr_rechr_globl"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524958827992909912+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => 'afw_13_page_pkg.obten_page_sesn != afw_11_aplic_pkg.obten_page_conxn',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1101584014148865340 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Fil d''ariane',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_IO_AFW_21_REGN_FIL_ARIAN',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'ui-icon-arrowthick-1-e',
  p_attribute_04 => 'AVANC',
  p_attribute_05 => 'Y',
  p_attribute_06 => 'N',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1103119253321571903 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Items cachés',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BEFORE_FOOTER',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1103614017610616796 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Messages Informatifs',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_07',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_IO_AFW_21_REGN_PILE_MESG',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1240209791575798102 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Menu principal',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_IO_AFW_21_REGN_MENU',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => 'afw_04_contx_pkg.obten_seqnc_contx(''PRODT'') is not null',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'MENU_PRINC_SAFP',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1494952493159075520 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Menu accueil',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_IO_AFW_21_REGN_MENU',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => 'afw_04_contx_pkg.obten_seqnc_contx(''PRODT'') is null',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'MENU_ACUEI',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1073270127125152298 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SADA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1102815126408233206 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SIDF',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Test',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_item_comment => 'Sie IDentifiant Fil (d''ariane)');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1102815353882233208 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SSPC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1102815528872233208 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SCPC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_item_comment => 'Sie Contexte Page Cible');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1103154347293852689 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SAPC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1124638831284909353 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SNPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'SNPI',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1147379147682076986 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SCPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1147379352877078509 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SSPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1147379557725079856 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SAPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1219092891382140799 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_RECHR_GLOBL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 1075865009203652464+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'PLUGIN_IO_AFW_21_CHAMP_RECHR',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 200,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when_type=>'NEVER',
  p_field_template=> 524974101484909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Recherche...',
  p_attribute_02 => '5',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'AFW'
 ,p_event_sequence => 10
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
  );
wwv_flow_api.create_page_da_action (
  p_id => 1134385891556558994 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_CONFR_SAUVG'
 ,p_attribute_01 => 'Êtes-vous certain de vouloir quitter cette page sans sauvegarder les modifications apportées?'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1134409099047562675 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_DEPSM_TABLR_FORM'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1134417102510563709 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_NAVGT_TABLR_FORM'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1134425105627564516 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 40
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_GESTN_TABLR_FORM'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 80176628389026064 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 60
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_MENU_REDRC'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 80176926664026889 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 70
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AIDE_PAGE_ITEM'
 ,p_attribute_01 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 80177223644028330 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 80
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AIDE_PAGE'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 907282251561302492 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 90
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_MODFR_MDP'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 81199029782244319 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 100
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_NAVGT_ENREG'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 22079713681561328 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1134385619002558992 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 110
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_FAVR'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 1476853301418605755 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'AFW - Commentaires/Bogues (Afficher dialogue)'
 ,p_event_sequence => 20
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => '#boutn_comnt_bogue'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 1476853612059605757 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1476853301418605755 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
 ,p_attribute_01 => 'Ajouter un commentaire et/ou bogue'
 ,p_attribute_03 => '640'
 ,p_attribute_04 => '480'
 ,p_attribute_05 => 'dialg_comnt_bogue'
 ,p_attribute_07 => 'N'
 ,p_attribute_08 => 'Y'
 ,p_attribute_09 => 'N'
 ,p_attribute_13 => 'Y'
 ,p_attribute_14 => 'afw_11_aplic_pkg.obten_numr_apex_aplic'
 ,p_attribute_15 => '102'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 1476853899472614635 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'AFW - Commentaires/Bogues (Fermer dialogue)'
 ,p_event_sequence => 30
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'div.dialg_comnt_bogue div.afw_21_actio_dynmq_dialg'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
  );
wwv_flow_api.create_page_da_action (
  p_id => 1476854192866614636 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1476853899472614635 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1476854515055619164 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1476853899472614635 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1481495202936426177 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1476853899472614635 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 907282345075357399 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'AFW - Modifier mot de passe (Afficher dialogue)'
 ,p_event_sequence => 40
 ,p_triggering_element_type => 'DOM_OBJECT'
 ,p_triggering_element => 'document'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'PLUGIN_IO_AFW_21_MODFR_MDP|DYNAMIC ACTION|afw_21_actio_dynmq_modfr_mp_afich'
  );
wwv_flow_api.create_page_da_action (
  p_id => 907282638477357401 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 907282345075357399 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
 ,p_attribute_01 => 'Modifier votre mot de passe'
 ,p_attribute_03 => '640'
 ,p_attribute_04 => '480'
 ,p_attribute_05 => 'dialg_modfr_mot_passe'
 ,p_attribute_07 => 'N'
 ,p_attribute_08 => 'N'
 ,p_attribute_09 => 'N'
 ,p_attribute_13 => 'Y'
 ,p_attribute_14 => 'afw_11_aplic_pkg.obten_numr_apex_aplic(afw_11_aplic_pkg.obten_aplic_authe)'
 ,p_attribute_15 => '106'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 907282765160363109 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'AFW - Modifier mot de passe (Fermer dialogue)'
 ,p_event_sequence => 50
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'div.dialg_modfr_mot_passe div.afw_21_actio_dynmq_dialg'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
  );
wwv_flow_api.create_page_da_action (
  p_id => 907283058737363111 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 907282765160363109 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 907283257321363111 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 907282765160363109 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 907283459945363111 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 907282765160363109 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_IN'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 0
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00001
prompt  ...PAGE 1: Accueil
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Accueil'
 ,p_step_title => 'Accueil'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_required_role => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'CARLO'
 ,p_last_upd_yyyymmddhh24miss => '20140227100936'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<div class="row liste-horzt">'||unistr('\000a')||
'  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">'||unistr('\000a')||
'    <a href="f?p=&APP_ID.:1011:&SESSION.::&DEBUG.::SIDF:&SIDF.:">'||unistr('\000a')||
'      <i class="icon-gears icone-liste"></i>'||unistr('\000a')||
'      <div class="texte-liste">Environnements</div>'||unistr('\000a')||
'	</a>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">'||unistr('\000a')||
'    <a href="f?p=&APP_ID.:1041:&SESSION.::&DEBUG.::SIDF:&SIDF.:">'||unistr('\000a')||
'      <i class="icon-f';

s:=s||'ile-alt icone-liste"></i>'||unistr('\000a')||
'	  <div class="texte-liste">Modèles de capture</div>'||unistr('\000a')||
'	</a>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">'||unistr('\000a')||
'    <a href="f?p=&APP_ID.:1051:&SESSION.::&DEBUG.::SIDF:&SIDF.:">'||unistr('\000a')||
'      <i class="icon-gear icone-liste"></i>'||unistr('\000a')||
'	  <div class="texte-liste">Paramètres</div>'||unistr('\000a')||
'	</a>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>';

wwv_flow_api.create_page_plug (
  p_id=> 81036132342561227 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Menu principal',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00101
prompt  ...PAGE 101: Page de connexion
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 101
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Page de connexion'
 ,p_step_title => 'Page de connexion'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Page de connexion'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 524954005030909905 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20121109152158'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1073568705591709448 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Page de connexion',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1073568907124709450 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_CODE_UTILS',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1073568705591709448+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Code d''utilisateur',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1073569115508709451 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_MOT_PASSE',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1073568705591709448+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Mot de passe',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1073569304839709451 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 1073568705591709448+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default=> 'LOGIN',
  p_prompt=>'Connexion',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(524977216008909931 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1073569507392709451 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_DOMN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1073568705591709448+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Domaine',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P101_force_domn',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1073569707356709452 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LANG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 1073568705591709448+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'FR',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_pre_element_text=>'<br /><br />',
  p_source=>'FR',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC2:Français;FR,English;EN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 524974101484909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1073569900837709452 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_FORCE_DOMN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'owa_util.mime_header(''text/html'', FALSE);'||unistr('\000a')||
'owa_cookie.send('||unistr('\000a')||
'    name=>afw_11_aplic_pkg.obten_numr_apex_aplic||''_C_CODE_UTILS_CONXN'','||unistr('\000a')||
'    value=>lower(:P101_CODE_UTILS));'||unistr('\000a')||
'exception when others then null;'||unistr('\000a')||
'end;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'owa_util.mime_header(''text/html'', FALSE);'||unistr('\000a')||
'owa_cookie.send('||unistr('\000a')||
'    name=>afw_11_aplic_pkg.obten_numr_apex_aplic||''_C_DOMN'','||unistr('\000a')||
'    value=>lower(:P101_DOMN));'||unistr('\000a')||
'exception when others then nu';

p:=p||'ll;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 1073570317503709454 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Définir les témoins (cookies)',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'  afw_12_authe_apex_pkg.exect_procd_persn();'||unistr('\000a')||
''||unistr('\000a')||
'  afw_12_authe_apex_pkg.authe_redrg ('||unistr('\000a')||
'    pva_code_utils        => :p101_code_utils,'||unistr('\000a')||
'    pva_mot_passe         => :p101_mot_passe,'||unistr('\000a')||
'    pva_domn              => :p101_domn,'||unistr('\000a')||
'    pnu_numr_apex_aplic   => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_NUMR_APEX_APLIC''),'||unistr('\000a')||
'    pnu_numr_apex_page    => afw_07_sesn_pkg.obte';

p:=p||'n_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_NUMR_APEX_PAGE''),'||unistr('\000a')||
'    pbo_indic_forcr_sspc  => true,'||unistr('\000a')||
'    pbo_indic_forcr_sidf  => true,'||unistr('\000a')||
'    pva_scpc              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SCPC''),'||unistr('\000a')||
'    pnu_sspc              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SSPC''),'||unistr('\000a')||
'    pva_sapc         ';

p:=p||'     => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SAPC''),'||unistr('\000a')||
'    pva_scpi              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SCPI''),'||unistr('\000a')||
'    pnu_sspi              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SSPI''),'||unistr('\000a')||
'    pva_sapi              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'          ';

p:=p||'                    ''S_AUTHE_CIBLE_SAPI''),'||unistr('\000a')||
'    pnu_snpi              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SNPI''),'||unistr('\000a')||
'    pnu_sidf              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SIDF''));'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 1073570101562709453 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - Connexion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 1073570709836709454 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Effacer la cache de la page de connexion',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'afw_12_authe_apex_pkg.redrg_prodt_authe;';

wwv_flow_api.create_page_process(
  p_id     => 1073570891817709454 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Redirection vers le produit d''authentification',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'    v varchar2(255) := null;'||unistr('\000a')||
'    c owa_cookie.cookie;'||unistr('\000a')||
'begin'||unistr('\000a')||
'   c := owa_cookie.get(afw_11_aplic_pkg.obten_numr_apex_aplic||''_C_DOMN'');'||unistr('\000a')||
'   :P101_DOMN := c.vals(1);'||unistr('\000a')||
'exception when others then null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 1073570521361709454 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 70,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtenir témoin (cookie) du domaine',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'    v varchar2(255) := null;'||unistr('\000a')||
'    c owa_cookie.cookie;'||unistr('\000a')||
'begin'||unistr('\000a')||
'   c := owa_cookie.get(afw_11_aplic_pkg.obten_numr_apex_aplic||''_C_CODE_UTILS_CONXN'');'||unistr('\000a')||
'   :P101_CODE_UTILS := c.vals(1);'||unistr('\000a')||
'exception when others then null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 1096848111994440407 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 80,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtenir témoin (cookie) du code utilisateur',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 101
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00102
prompt  ...PAGE 102: Commentaire
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 102
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Commentaire'
 ,p_alias => 'FEEDBACK_102'
 ,p_step_title => 'Commentaire'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 524955230014909908 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_page_comment => 'This page was generated by the feedback wizard'
 ,p_last_upd_yyyymmddhh24miss => '20130829001254'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1476809997267044819 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 102,
  p_plug_name=> 'Commentaire',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 524962410026909915+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 1476850895737519026 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 102,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959416816909913+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 1476812819553044824 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 102,
  p_button_sequence=> 10,
  p_button_plug_id => 1476850895737519026+wwv_flow_api.g_id_offset,
  p_button_name    => 'SUBMIT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Appliquer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Identifies Application.';

wwv_flow_api.create_page_item(
  p_id=>1476810215066044819 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_APPLICATION_ID',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 1476809997267044819+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Application:',
  p_source=>'APP_ID',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov=> 'select application_id||''. ''||application_name d, application_id v from apex_applications where application_id = :P102_APPLICATION_ID',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_tag_attributes  => 'class="fielddatabold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'Y',
  p_attribute_02 => 'LOV',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Identifies page within application.';

wwv_flow_api.create_page_item(
  p_id=>1476810718890044822 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_PAGE_ID',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 1476809997267044819+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Page:',
  p_source=>'A_AFW_04_SOURC_NUMR_PAGE',
  p_source_type=> 'ITEM',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov=> 'select page_id||''. ''||page_name d, page_id v from apex_application_pages where page_id = :P102_PAGE_ID and application_id = :P102_APPLICATION_ID',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_tag_attributes  => 'class="fielddatabold"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'Y',
  p_attribute_02 => 'LOV',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1476811198817044822 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_A',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 1476809997267044819+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_display_as=> 'NATIVE_STOP_AND_START_HTML_TABLE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Enter your feedback and press the submit feedback button.';

wwv_flow_api.create_page_item(
  p_id=>1476811415743044823 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_FEEDBACK',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1476809997267044819+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Commentaire',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 90,
  p_cMaxlength=> 4000,
  p_cHeight=> 6,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'Y',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1476811913838044824 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_X',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1476809997267044819+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_display_as=> 'NATIVE_STOP_AND_START_HTML_TABLE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Veuillez identifier le type de commentaire.';

wwv_flow_api.create_page_item(
  p_id=>1476812121780044824 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_FEEDBACK_TYPE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1476809997267044819+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Type de commentaire',
  p_source=>'1',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select the_name, id from APEX_FEEDBACK_TYPES order by id',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1476812621551044824 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_Y',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 1476809997267044819+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_display_as=> 'NATIVE_STOP_AND_START_HTML_TABLE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_util.submit_feedback ('||unistr('\000a')||
'    p_comment         => :P102_FEEDBACK,'||unistr('\000a')||
'    p_type            => :P102_FEEDBACK_TYPE,'||unistr('\000a')||
'    p_application_id  => :P102_APPLICATION_ID,'||unistr('\000a')||
'    p_page_id         => :P102_PAGE_ID,'||unistr('\000a')||
'    p_email           => afw_12_utils_pkg.obten_courl_utils(afw_12_utils_pkg.obten_usagr_conct));';

wwv_flow_api.create_page_process(
  p_id     => 1476813219550044825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 102,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Submit Feedback',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>1476812819553044824 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p := null;
wwv_flow_api.create_page_process(
  p_id     => 1476854994670641661 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 102,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM',
  p_process_name=> 'Fermer le dialogue',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 102
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01011
prompt  ...PAGE 1011: Environnements
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1011
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Environnements'
 ,p_step_title => 'Environnements'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_required_role => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20131031174802'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select   e.seqnc,'||unistr('\000a')||
'         e.code_espac_travl_apex,'||unistr('\000a')||
'         e.code,'||unistr('\000a')||
'         e.nom,'||unistr('\000a')||
'         e.ref_dv_natr_envir_formt'||unistr('\000a')||
'  from   vd_afw_31_envir e';

wwv_flow_api.create_page_plug (
  p_id=> 455981520692048163 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_plug_name=> 'Liste des environnements',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 524965118194909917+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select   e.seqnc,'||unistr('\000a')||
'         e.code_espac_travl_apex,'||unistr('\000a')||
'         e.code,'||unistr('\000a')||
'         e.nom,'||unistr('\000a')||
'         e.ref_dv_natr_envir_formt'||unistr('\000a')||
'  from   vd_afw_31_envir e';

wwv_flow_api.create_worksheet(
  p_id=> 455981712890048164+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_region_id=> 455981520692048163+wwv_flow_api.g_id_offset,
  p_name=> 'Liste des environnements',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> '&A_AFW_13_MESG_TROP_DON_TROUV.',
  p_no_data_found_message=> '&A_AFW_13_MESG_AUCUN_DON_TROUV.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_button_template=> 524975207979909930+wwv_flow_api.g_id_offset,
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_actions_menu_icon=>'&A_AFW_11_DOSR_FICHR_AFW.images/raprt_inter/actio.png',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_detail_link=>'f?p=&APP_ID.:1012:&SESSION.::&DEBUG.:RP:SSPC,SIDF:#SEQNC#,&SIDF.',
  p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'CARLO',
  p_internal_uid=> 1);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 455981820798048168+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_worksheet_id => 455981712890048164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SEQNC',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Seqnc',
  p_report_label           =>'Seqnc',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 455981923536048171+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_worksheet_id => 455981712890048164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CODE_ESPAC_TRAVL_APEX',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Espace travail APEX',
  p_report_label           =>'Espace travail APEX',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 455982021255048171+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_worksheet_id => 455981712890048164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CODE',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Code',
  p_report_label           =>'Code',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 455982135261048171+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_worksheet_id => 455981712890048164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'NOM',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Nom',
  p_report_label           =>'Nom',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 455989141142111806+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_worksheet_id => 455981712890048164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'REF_DV_NATR_ENVIR_FORMT',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Nature',
  p_report_label           =>'Nature',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'SEQNC:CODE_ESPAC_TRAVL_APEX:CODE:NOM:REF_DV_NATR_ENVIR_FORMT';

wwv_flow_api.create_worksheet_rpt(
  p_id => 455991038980130146+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_worksheet_id => 455981712890048164+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'4524022',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'CODE',
  p_sort_direction_1        =>'ASC',
  p_sort_column_2           =>'0',
  p_sort_direction_2        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 455994229246174670 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959416816909913+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 455982427880048172 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1011,
  p_button_sequence=> 30,
  p_button_plug_id => 455994229246174670+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Créer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1012:&SESSION.::&DEBUG.:1012:SSPC,SIDF:,&SIDF.',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-plus',
  p_security_scheme => 1268921903099320428+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1011
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01012
prompt  ...PAGE 1012: Environnement
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1012
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Environnement'
 ,p_step_title => 'Environnement'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_required_role => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20131101101705'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 455995735395195302 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1012,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959416816909913+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'482374726620353567';

wwv_flow_api.create_page_plug (
  p_id=> 485965834027673460 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1012,
  p_plug_name=> 'Onglets',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_06',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 485963637705665098 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 524972014559909925+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'ITEM_IS_NOT_NULL',
  p_plug_display_when_condition => 'P1012_SEQNC',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'/* Formatted on 2013/02/07 09:07:48 (QP5 v5.215.12089.38647) */'||unistr('\000a')||
'SELECT seqnc,'||unistr('\000a')||
'       code,'||unistr('\000a')||
'       nom,'||unistr('\000a')||
'          afw_15_htp_pkg.ouvri_bals (''span'','||unistr('\000a')||
'                                     ''class'','||unistr('\000a')||
'                                     ''ui-icon fff-icon-camera'','||unistr('\000a')||
'                                     ''title'','||unistr('\000a')||
'                                     ''Modifier definition'')'||unistr('\000a')||
'       || afw_15_htp_pkg.fermr_bals ';

s:=s||'(''span'')'||unistr('\000a')||
'          lien_defn'||unistr('\000a')||
'  FROM VD_AFW_31_SCHEM'||unistr('\000a')||
' WHERE ref_envir = :P1012_SEQNC;';

wwv_flow_api.create_page_plug (
  p_id=> 485970139661731844 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1012,
  p_plug_name=> 'Schemas',
  p_region_name=>'',
  p_parent_plug_id=>485965834027673460 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'N',
  p_plug_template=> 524965118194909917+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_plug_display_when_condition => 'P1012_SEQNC',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'/* Formatted on 2013/02/07 09:07:48 (QP5 v5.215.12089.38647) */'||unistr('\000a')||
'SELECT seqnc,'||unistr('\000a')||
'       code,'||unistr('\000a')||
'       nom,'||unistr('\000a')||
'          afw_15_htp_pkg.ouvri_bals (''span'','||unistr('\000a')||
'                                     ''class'','||unistr('\000a')||
'                                     ''ui-icon fff-icon-camera'','||unistr('\000a')||
'                                     ''title'','||unistr('\000a')||
'                                     ''Modifier definition'')'||unistr('\000a')||
'       || afw_15_htp_pkg.fermr_bals ';

a1:=a1||'(''span'')'||unistr('\000a')||
'          lien_defn'||unistr('\000a')||
'  FROM VD_AFW_31_SCHEM'||unistr('\000a')||
' WHERE ref_envir = :P1012_SEQNC;';

wwv_flow_api.create_worksheet(
  p_id=> 485970243489731844+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1012,
  p_region_id=> 485970139661731844+wwv_flow_api.g_id_offset,
  p_name=> 'Schemas',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> '&A_AFW_13_MESG_TROP_DON_TROUV.',
  p_no_data_found_message=> '&A_AFW_13_MESG_AUCUN_DON_TROUV.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_button_template=> 524975207979909930+wwv_flow_api.g_id_offset,
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_actions_menu_icon=>'&A_AFW_11_DOSR_FICHR_AFW.images/raprt_inter/actio.png',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_detail_link=>'f?p=&APP_ID.:1022:&SESSION.::&DEBUG.:RP:SIDF,SSPC:&SIDF.,#SEQNC#',
  p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'GARJE',
  p_internal_uid=> 1);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 485970425461731849+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1012,
  p_worksheet_id => 485970243489731844+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SEQNC',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Seqnc',
  p_report_label           =>'Seqnc',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 485970526931731854+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1012,
  p_worksheet_id => 485970243489731844+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CODE',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Code',
  p_report_label           =>'Code',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 485970611278731854+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1012,
  p_worksheet_id => 485970243489731844+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'NOM',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Nom',
  p_report_label           =>'Nom',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 486038528973174089+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1012,
  p_worksheet_id => 485970243489731844+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LIEN_DEFN',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Captures',
  p_report_label           =>'Captures',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'f?p=&APP_ID.:1032:&SESSION.::&DEBUG.:RP:SIDF,SAPC:&SIDF.,#SEQNC#',
  p_column_linktext        =>'#LIEN_DEFN#',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'SEQNC:CODE:NOM:LIEN_DEFN';

wwv_flow_api.create_worksheet_rpt(
  p_id => 485971027325737783+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1012,
  p_worksheet_id => 485970243489731844+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'4823822',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 485972432351777040 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1012,
  p_plug_name=> 'Environnement',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524961827980909915+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 455978015729048104 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1012,
  p_button_sequence=> 10,
  p_button_plug_id => 455995735395195302+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Annuler',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '&A_AFW_04_SOURC_URL.',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-info',
  p_button_cattributes=>'icon-undo',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 455977741948048103 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1012,
  p_button_sequence=> 30,
  p_button_plug_id => 455995735395195302+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enregistrer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P1012_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_security_scheme => 1270923017146863787+ wwv_flow_api.g_id_offset,
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 455977612724048103 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1012,
  p_button_sequence=> 40,
  p_button_plug_id => 455995735395195302+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enregistrer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P1012_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_security_scheme => 1268921903099320428+ wwv_flow_api.g_id_offset,
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 455977835616048103 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1012,
  p_button_sequence=> 20,
  p_button_plug_id => 455995735395195302+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(524977216008909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Supprimer',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(htmldb_delete_message,''DELETE'');',
  p_button_execute_validations=>'N',
  p_button_condition=> 'P1012_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_cattributes=>'icon-remove',
  p_security_scheme => 1270934890266865461+ wwv_flow_api.g_id_offset,
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 485982640719883485 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1012,
  p_button_sequence=> 50,
  p_button_plug_id => 485970139661731844+wwv_flow_api.g_id_offset,
  p_button_name    => 'AJOUT_SCHEM',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Ajouter',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1022:&SESSION.::&DEBUG.::SIDF,SSPC:&SIDF.,',
  p_button_cattributes=>'fff-icon-add',
  p_security_scheme => 1268921903099320428+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>456006632727327053 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1012,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:&A_AFW_04_SOURC_NUMR_PAGE.:&SESSION.::&DEBUG.:RP:SIDF:&SIDF.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>455977835616048103+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 14-JAN-2013 17:06 by CARLO');
 
wwv_flow_api.create_page_branch(
  p_id=>455978931352048108 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1012,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1012:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>455979116395048139 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1012,
  p_name=>'P1012_SEQNC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Seqnc',
  p_source=>'SEQNC',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>455979317818048147 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1012,
  p_name=>'P1012_CODE_ESPAC_TRAVL_APEX',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 485972432351777040+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Espace travail APEX',
  p_source=>'CODE_ESPAC_TRAVL_APEX',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 4000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>455979512122048148 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1012,
  p_name=>'P1012_CODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 485972432351777040+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Code',
  p_source=>'CODE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 23,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>455979717357048148 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1012,
  p_name=>'P1012_NOM',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 485972432351777040+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nom',
  p_source=>'NOM',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 60,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>455979933699048149 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1012,
  p_name=>'P1012_DESCR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 485972432351777040+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Description',
  p_source=>'DESCR',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 4000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>455980143700048149 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1012,
  p_name=>'P1012_REF_DV_NATR_ENVIR',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 485972432351777040+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nature environnement',
  p_source=>'REF_DV_NATR_ENVIR',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'LOV_NATR_ENVIR',
  p_lov=> 'select     valr d,'||unistr('\000a')||
'           ddv.seqnc r'||unistr('\000a')||
'    from   vd_afw_14_domn_valr dv,'||unistr('\000a')||
'           vd_afw_14_detl_domn_valr ddv'||unistr('\000a')||
'   where   dv.seqnc = ddv.ref_domn_valr'||unistr('\000a')||
'           and dv.code = ''AFW_NATR_ENVIR'''||unistr('\000a')||
'           and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'           and ddv.date_debut_efect <= sysdate'||unistr('\000a')||
'           and (   ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect'||unistr('\000a')||
'                or ddv.date_fin_efect is null)'||unistr('\000a')||
'order by   ddv.seqnc_presn',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- Choisir -',
  p_lov_null_value=> '',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>485967626586709139 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1012,
  p_name=>'P1012_MODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'SCHEM',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:VD_AFW_31_ENVIR:P1012_SEQNC:SEQNC';

wwv_flow_api.create_page_process(
  p_id     => 455980621425048150 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1012,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from VD_AFW_31_ENVIR',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_FETCH_IMPOS.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p := null;
wwv_flow_api.create_page_process(
  p_id     => 486743412104351800 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1012,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLUGIN_IO_AFW_21_CHANG_LIBL_FIL_ARI',
  p_process_name=> 'Changer libellé fil ariane',
  p_process_sql_clob => p,
  p_attribute_01=> ':P1012_NOM',
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1012_SEQNC',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:VD_AFW_31_ENVIR:P1012_SEQNC:SEQNC|IUD';

wwv_flow_api.create_page_process(
  p_id     => 455980829111048150 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1012,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of VD_AFW_31_ENVIR',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_ECHEC_SPECF.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '&A_AFW_13_MESG_SUCS_SPECF.',
  p_security_scheme => 1270950695807867091+ wwv_flow_api.g_id_offset,
  p_process_is_stateful_y_n=>'N',
  p_return_key_into_item1=>'P1012_SEQNC',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p := null;
wwv_flow_api.create_page_process(
  p_id     => 485973526034794176 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1012,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLUGIN_IO_AFW_21_MODE_PAGE',
  p_process_name=> 'Gérer le mode',
  p_process_sql_clob => p,
  p_attribute_01=> 'P1012_MODE',
  p_attribute_02=> 'SCHEM',
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1012
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01022
prompt  ...PAGE 1022: Schéma
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1022
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Schéma'
 ,p_step_title => 'Schéma'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Mettre à jour un schéma'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_required_role => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20131101101705'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 485994711690936461 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1022,
  p_plug_name=> 'Mettre à jour un schéma',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 524961827980909915+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 486002211900969826 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1022,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959416816909913+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 485994939020936463 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1022,
  p_button_sequence=> 10,
  p_button_plug_id => 486002211900969826+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Annuler',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '&A_AFW_04_SOURC_URL.',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-info',
  p_button_cattributes=>'icon-undo',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 485995340664936464 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1022,
  p_button_sequence=> 30,
  p_button_plug_id => 486002211900969826+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enregistrer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P1022_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_security_scheme => 1270923017146863787+ wwv_flow_api.g_id_offset,
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 485995515008936464 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1022,
  p_button_sequence=> 40,
  p_button_plug_id => 486002211900969826+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enregistrer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P1022_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_security_scheme => 1268921903099320428+ wwv_flow_api.g_id_offset,
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 485995134804936463 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1022,
  p_button_sequence=> 20,
  p_button_plug_id => 486002211900969826+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(524977216008909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Supprimer',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(htmldb_delete_message,''DELETE'');',
  p_button_execute_validations=>'N',
  p_button_condition=> 'P1022_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_cattributes=>'icon-remove',
  p_security_scheme => 1270934890266865461+ wwv_flow_api.g_id_offset,
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>485997441634936473 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1022,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:&A_AFW_04_SOURC_NUMR_PAGE.:&SESSION.::&DEBUG.::SIDF:&SIDF.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>485995134804936463+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 06-FEB-2013 16:38 by GARJE');
 
wwv_flow_api.create_page_branch(
  p_id=>485997221299936472 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1022,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1022:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>485995741829936464 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1022,
  p_name=>'P1022_CODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 485994711690936461+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Code',
  p_source=>'CODE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>485995924465936467 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1022,
  p_name=>'P1022_NOM',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 485994711690936461+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nom',
  p_source=>'NOM',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 60,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>485996136725936467 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1022,
  p_name=>'P1022_REF_ENVIR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'afw_04_contx_pkg.obten_seqnc_contx(''AFW_ENVIR'')',
  p_item_default_type=> 'PLSQL_EXPRESSION',
  p_prompt=>'Environnement',
  p_source=>'REF_ENVIR',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 86,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>485996324608936467 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1022,
  p_name=>'P1022_INDIC_CAPTR_DDL',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 485994711690936461+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'N',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Capture DDL',
  p_source=>'INDIC_CAPTR_DDL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC2:Oui;O,Non;N',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 1,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>485996523691936469 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1022,
  p_name=>'P1022_SEQNC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Seqnc',
  p_source=>'SEQNC',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>488836643706839445 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1022,
  p_name=>'P1022_REF_DEFNT_CAPTR_DEFT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 485994711690936461+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Modèle de capture',
  p_source=>'REF_DEFNT_CAPTR_DEFT',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select nom r, seqnc d from vd_afw_31_defnt_captr_deft',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- Choisir -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:VD_AFW_31_SCHEM:P1022_SEQNC:SEQNC';

wwv_flow_api.create_page_process(
  p_id     => 485996733496936470 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1022,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from VD_AFW_31_SCHEM',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_FETCH_IMPOS.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p := null;
wwv_flow_api.create_page_process(
  p_id     => 486744022671392708 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1022,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLUGIN_IO_AFW_21_CHANG_LIBL_FIL_ARI',
  p_process_name=> 'Changer libellé fil ariane',
  p_process_sql_clob => p,
  p_attribute_01=> ':P1022_NOM',
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1022_SEQNC',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:VD_AFW_31_SCHEM:P1022_SEQNC:SEQNC|IUD';

wwv_flow_api.create_page_process(
  p_id     => 485996913635936471 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1022,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of VD_AFW_31_SCHEM',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_ECHEC_SPECF.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '&A_AFW_13_MESG_SUCS_SPECF.',
  p_security_scheme => 1270950695807867091+ wwv_flow_api.g_id_offset,
  p_process_is_stateful_y_n=>'N',
  p_return_key_into_item1=>'P1022_SEQNC',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'AFW_31_DEFNT_CAPTR_PKG.appli_modl_captr_schem(:P1022_SEQNC, :P1022_REF_DEFNT_CAPTR_DEFT);';

wwv_flow_api.create_page_process(
  p_id     => 488851541393097068 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1022,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Conciliation Objet-Evenm',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_ECHEC_SPECF.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>485995515008936464 + wwv_flow_api.g_id_offset,
  p_process_when=>'P1022_REF_DEFNT_CAPTR_DEFT',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_process_success_message=> '&A_AFW_13_MESG_SUCS_SPECF.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1022
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01032
prompt  ...PAGE 1032: Définitions de capture
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1032
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Définitions de capture'
 ,p_step_title => 'Définitions de capture'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_required_role => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20131101101705'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 486041034654260905 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1032,
  p_plug_name=> 'Mettre à jour les définitions de captures',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524961827980909915+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'/* Formatted on 2013/02/11 10:43:11 (QP5 v5.215.12089.38647) */'||unistr('\000a')||
'SELECT SEQNC,'||unistr('\000a')||
'       REF_DV_NATR_OBJET_FORMT,'||unistr('\000a')||
'       REF_DV_COMPR_SI_VERL,'||unistr('\000a')||
'       INDIC_VERL_SI_OBJET_NON_VERL,'||unistr('\000a')||
'       INDIC_PRIS_CHARG_ENONC,'||unistr('\000a')||
'       INDIC_JOURN_ENONC_COMPL'||unistr('\000a')||
'  FROM VD_AFW_31_DEFNT_CAPTR'||unistr('\000a')||
' WHERE REF_SCHEM = :P1032_REF_SCHEM AND REF_DV_EVENM = :P1032_REF_EVENM';

wwv_flow_api.create_report_region (
  p_id=> 486043912283339580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1032,
  p_name=> 'Liste des objets',
  p_region_name=>'',
  p_template=> 524965703902909917+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 15,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> 1,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 524966905844909922+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> '- Choisir -',
  p_query_break_cols=> '0',
  p_query_no_data_found=> '&A_AFW_13_MESG_AUCUN_DON_TROUV.',
  p_query_more_data=> '&A_AFW_13_MESG_TROP_DON_TROUV.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 486044228601339587 + wwv_flow_api.g_id_offset,
  p_region_id=> 486043912283339580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'SEQNC',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Seqnc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source_type=> 'T',
  p_pk_col_source=> s,
  p_ref_table_name=> 'VD_AFW_31_DEFNT_CAPTR',
  p_ref_column_name=> 'SEQNC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 487060623670515443 + wwv_flow_api.g_id_offset,
  p_region_id=> 486043912283339580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'REF_DV_NATR_OBJET_FORMT',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Nature de l''objet',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>1,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 486044416726339587 + wwv_flow_api.g_id_offset,
  p_region_id=> 486043912283339580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'REF_DV_COMPR_SI_VERL',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Comportement si vérouillé',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_QUERY',
  p_inline_lov=> 'select     valr d,'||unistr('\000a')||
'           ddv.seqnc r'||unistr('\000a')||
'    from   vd_afw_14_domn_valr dv,'||unistr('\000a')||
'           vd_afw_14_detl_domn_valr ddv'||unistr('\000a')||
'   where   dv.seqnc = ddv.ref_domn_valr'||unistr('\000a')||
'           and dv.code = ''COMPR_SI_VERL'''||unistr('\000a')||
'           and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'           and ddv.date_debut_efect <= sysdate'||unistr('\000a')||
'           and (   ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect'||unistr('\000a')||
'                or ddv.date_fin_efect is null)'||unistr('\000a')||
'order by   ddv.seqnc_presn',
  p_lov_show_nulls=> 'YES',
  p_lov_null_text=> '- Choisir -',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'VD_AFW_31_DEFNT_CAPTR',
  p_ref_column_name=> 'REF_DV_COMPR_SI_VERL',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 486044527609339587 + wwv_flow_api.g_id_offset,
  p_region_id=> 486043912283339580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'INDIC_VERL_SI_OBJET_NON_VERL',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Verrouiller l''objet',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>1104988352720719745 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_column_width=> '12',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'VD_AFW_31_DEFNT_CAPTR',
  p_ref_column_name=> 'INDIC_VERL_SI_OBJET_NON_VERL',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 486044611494339587 + wwv_flow_api.g_id_offset,
  p_region_id=> 486043912283339580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'INDIC_PRIS_CHARG_ENONC',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Prendre en charge l''énoncé',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>1104988352720719745 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'YES',
  p_lov_null_text=> '- Choisir -',
  p_column_width=> '12',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'VD_AFW_31_DEFNT_CAPTR',
  p_ref_column_name=> 'INDIC_PRIS_CHARG_ENONC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 486044734182339587 + wwv_flow_api.g_id_offset,
  p_region_id=> 486043912283339580 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'INDIC_JOURN_ENONC_COMPL',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Journaliser l''énoncé',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>1104988352720719745 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'YES',
  p_lov_null_text=> '- Choisir -',
  p_column_width=> '12',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'VD_AFW_31_DEFNT_CAPTR',
  p_ref_column_name=> 'INDIC_JOURN_ENONC_COMPL',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 486046928906344345 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1032,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959416816909913+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 25,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 486044821990339591 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1032,
  p_button_sequence=> 10,
  p_button_plug_id => 486046928906344345+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Annuler',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '&A_AFW_04_SOURC_URL.',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-info',
  p_button_cattributes=>'icon-undo',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 486044941962339591 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1032,
  p_button_sequence=> 30,
  p_button_plug_id => 486046928906344345+wwv_flow_api.g_id_offset,
  p_button_name    => 'SUBMIT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enregistrer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_security_scheme => 1270923017146863787+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>486046635936339599 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1032,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1032:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>486041515869274314 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1032,
  p_name=>'P1032_REF_SCHEM',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 486041034654260905+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> ':A_AFW_04_ACTIO',
  p_item_default_type=> 'PLSQL_EXPRESSION',
  p_prompt=>'Schéma',
  p_source=>'SEQNC',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select nom d,'||unistr('\000a')||
'       seqnc r'||unistr('\000a')||
'  from vd_afw_31_schem',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when_type=>'ALWAYS',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>486042126089315149 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1032,
  p_name=>'P1032_REF_EVENM',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 486043912283339580+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Évènement',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select     valr d,'||unistr('\000a')||
'           ddv.seqnc r'||unistr('\000a')||
'    from   vd_afw_14_domn_valr dv,'||unistr('\000a')||
'           vd_afw_14_detl_domn_valr ddv'||unistr('\000a')||
'   where   dv.seqnc = ddv.ref_domn_valr'||unistr('\000a')||
'           and dv.code = ''EVENM'''||unistr('\000a')||
'           and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'           and ddv.date_debut_efect <= sysdate'||unistr('\000a')||
'           and (   ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect'||unistr('\000a')||
'                or ddv.date_fin_efect is null)'||unistr('\000a')||
'order by   ddv.seqnc_presn',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- Choisir -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>487180336690263432 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1032,
  p_name=>'P1032_REF_DEFNT_CAPTR_DEFT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 486041034654260905+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'DECLARE'||unistr('\000a')||
'   vnu_templ   NUMBER (10);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'   SELECT ref_defnt_captr_deft'||unistr('\000a')||
'     INTO vnu_templ'||unistr('\000a')||
'     FROM vd_afw_31_schem'||unistr('\000a')||
'    WHERE seqnc = :P1032_REF_SCHEM;'||unistr('\000a')||
''||unistr('\000a')||
'   RETURN vnu_templ;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'   WHEN NO_DATA_FOUND'||unistr('\000a')||
'   THEN'||unistr('\000a')||
'      RETURN NULL;'||unistr('\000a')||
'END;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'Modèle de capture',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select nom d,'||unistr('\000a')||
'       seqnc r'||unistr('\000a')||
'  from vd_afw_31_defnt_captr_deft',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- Choisir -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>488774441734454117 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1032,
  p_name=>'P1032_CONCILIER',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 486041034654260905+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Concilier',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(524977022775909931 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_button_image_attr=> 'fff-icon-application-side-expand',
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT-BOTTOM',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:VD_AFW_31_DEFNT_CAPTR:SEQNC';

wwv_flow_api.create_page_process(
  p_id     => 486046421674339596 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1032,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 486043912283339580 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_UPDATE',
  p_process_name=> 'ApplyMRU',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_ECHEC_SPECF.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>486044941962339591 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '#MRU_COUNT# &A_AFW_13_MESG_RANGE_MODF., #MRI_COUNT# &A_AFW_13_MESG_RANGE_INSER..',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'AFW_31_DEFNT_CAPTR_PKG.appli_modl_captr_schem(:P1032_REF_SCHEM, :P1032_REF_DEFNT_CAPTR_DEFT);';

wwv_flow_api.create_page_process(
  p_id     => 488796341348901489 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1032,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Conciliation Objet-Evenm',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_ECHEC_SPECF.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>488774441734454117 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '&A_AFW_13_MESG_SUCS_SPECF.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1032
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01041
prompt  ...PAGE 1041: Modèles de capture
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1041
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Modèles de capture'
 ,p_step_title => 'Modèles de capture'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Liste des templates de capture'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_required_role => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20131031174802'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'Select seqnc, '||unistr('\000a')||
'       nom, '||unistr('\000a')||
'       code '||unistr('\000a')||
'  from vd_afw_31_defnt_captr_deft';

wwv_flow_api.create_page_plug (
  p_id=> 487114612521474614 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1041,
  p_plug_name=> 'Liste des modèles de capture',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 524965118194909917+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'Select seqnc, '||unistr('\000a')||
'       nom, '||unistr('\000a')||
'       code '||unistr('\000a')||
'  from vd_afw_31_defnt_captr_deft';

wwv_flow_api.create_worksheet(
  p_id=> 487114740665474614+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1041,
  p_region_id=> 487114612521474614+wwv_flow_api.g_id_offset,
  p_name=> 'Liste des templates de capture',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> '&A_AFW_13_MESG_TROP_DON_TROUV.',
  p_no_data_found_message=> '&A_AFW_13_MESG_AUCUN_DON_TROUV.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_button_template=> 524975207979909930+wwv_flow_api.g_id_offset,
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_actions_menu_icon=>'&A_AFW_11_DOSR_FICHR_AFW.images/raprt_inter/actio.png',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_detail_link=>'f?p=&APP_ID.:1042:&SESSION.::&DEBUG.:RP:SSPC,SIDF:#SEQNC#,&SIDF.',
  p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'GARJE',
  p_internal_uid=> 1);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 487114932845474614+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1041,
  p_worksheet_id => 487114740665474614+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SEQNC',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Seqnc',
  p_report_label           =>'Seqnc',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 487115012557474614+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1041,
  p_worksheet_id => 487114740665474614+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'NOM',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Nom',
  p_report_label           =>'Nom',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 487115139068474614+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1041,
  p_worksheet_id => 487114740665474614+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CODE',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Code',
  p_report_label           =>'Code',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'SEQNC:NOM:CODE';

wwv_flow_api.create_worksheet_rpt(
  p_id => 487122929110746862+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1041,
  p_worksheet_id => 487114740665474614+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'4835341',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 487115439987485127 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1041,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959416816909913+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 487115619339488595 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1041,
  p_button_sequence=> 10,
  p_button_plug_id => 487115439987485127+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Créer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1042:&SESSION.::&DEBUG.:::',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-plus',
  p_security_scheme => 1268921903099320428+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1041
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01042
prompt  ...PAGE 1042: Modèle de capture
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1042
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Modèle de capture'
 ,p_step_title => 'Modèle de capture'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_required_role => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20131031164855'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 487117035067627926 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1042,
  p_plug_name=> 'Mettre à jour un modèle de capture',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 524961827980909915+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 487124841493769390 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1042,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959416816909913+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 487138536589013926 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1042,
  p_plug_name=> 'Définitions de captures',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524965703902909917+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'ITEM_IS_NOT_NULL',
  p_plug_display_when_condition => 'P1042_SEQNC',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT "SEQNC",'||unistr('\000a')||
'       "REF_DEFNT_CAPTR_DEFT",'||unistr('\000a')||
'       "REF_DV_NATR_OBJET_FORMT",'||unistr('\000a')||
'       "REF_DV_EVENM_FORMT",'||unistr('\000a')||
'       "INDIC_VERL_SI_OBJET_NON_VERL",'||unistr('\000a')||
'       "INDIC_PRIS_CHARG_ENONC",'||unistr('\000a')||
'       "INDIC_JOURN_ENONC_COMPL",'||unistr('\000a')||
'       "REF_DV_COMPR_SI_VERL"'||unistr('\000a')||
'  FROM "#OWNER#"."VD_AFW_31_DETL_DEF_CAPT_DEFT"'||unistr('\000a')||
' WHERE ref_defnt_captr_deft = :P1042_SEQNC AND ref_dv_evenm = :P1042_ref_evenm';

wwv_flow_api.create_report_region (
  p_id=> 487134523513991233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1042,
  p_name=> 'Définitions de captures',
  p_region_name=>'',
  p_parent_plug_id=>487138536589013926 + wwv_flow_api.g_id_offset,
  p_template=> 524965118194909917+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 524966905844909922+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> '(null)',
  p_query_break_cols=> '0',
  p_query_no_data_found=> '&A_AFW_13_MESG_AUCUN_DON_TROUV.',
  p_query_more_data=> '&A_AFW_13_MESG_TROP_DON_TROUV.',
  p_query_num_rows_type=> 'ROW_RANGES_WITH_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 487134838281991242 + wwv_flow_api.g_id_offset,
  p_region_id=> 487134523513991233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'SEQNC',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Seqnc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source_type=> 'T',
  p_pk_col_source=> s,
  p_ref_table_name=> 'VD_AFW_31_D_DEFNT_CAPTR_DEFT',
  p_ref_column_name=> 'SEQNC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 487135015268991243 + wwv_flow_api.g_id_offset,
  p_region_id=> 487134523513991233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'REF_DEFNT_CAPTR_DEFT',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Defnt Captr Deft',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_table_name=> 'VD_AFW_31_D_DEFNT_CAPTR_DEFT',
  p_ref_column_name=> 'REF_DEFNT_CAPTR_DEFT',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 487135134873991243 + wwv_flow_api.g_id_offset,
  p_region_id=> 487134523513991233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'REF_DV_NATR_OBJET_FORMT',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Nature de l''objet',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>1,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_table_name=> 'VD_AFW_31_D_DEFNT_CAPTR_DEFT',
  p_ref_column_name=> 'REF_DV_NATR_OBJET_FORMT',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 487135221183991243 + wwv_flow_api.g_id_offset,
  p_region_id=> 487134523513991233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'REF_DV_EVENM_FORMT',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_table_name=> 'VD_AFW_31_D_DEFNT_CAPTR_DEFT',
  p_ref_column_name=> 'REF_DV_EVENM_FORMT',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 487135313067991243 + wwv_flow_api.g_id_offset,
  p_region_id=> 487134523513991233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'INDIC_VERL_SI_OBJET_NON_VERL',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Verrouiller l''objet',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>1104988352720719745 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'YES',
  p_lov_null_text=> '- Choisir -',
  p_column_width=> '12',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'VD_AFW_31_D_DEFNT_CAPTR_DEFT',
  p_ref_column_name=> 'INDIC_VERL_SI_OBJET_NON_VERL',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 487135419920991243 + wwv_flow_api.g_id_offset,
  p_region_id=> 487134523513991233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'INDIC_PRIS_CHARG_ENONC',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Prendre en charge l''énoncé',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>1104988352720719745 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'YES',
  p_lov_null_text=> '- Choisir -',
  p_column_width=> '12',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'VD_AFW_31_D_DEFNT_CAPTR_DEFT',
  p_ref_column_name=> 'INDIC_PRIS_CHARG_ENONC',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 487135540260991243 + wwv_flow_api.g_id_offset,
  p_region_id=> 487134523513991233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'INDIC_JOURN_ENONC_COMPL',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Journaliser l''énoncé',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>1104988352720719745 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'YES',
  p_lov_null_text=> '- Choisir -',
  p_column_width=> '12',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'VD_AFW_31_D_DEFNT_CAPTR_DEFT',
  p_ref_column_name=> 'INDIC_JOURN_ENONC_COMPL',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 487135625644991243 + wwv_flow_api.g_id_offset,
  p_region_id=> 487134523513991233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'REF_DV_COMPR_SI_VERL',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Comportement si vérouillé',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_QUERY',
  p_inline_lov=> 'select     valr d,'||unistr('\000a')||
'           ddv.seqnc r'||unistr('\000a')||
'    from   vd_afw_14_domn_valr dv,'||unistr('\000a')||
'           vd_afw_14_detl_domn_valr ddv'||unistr('\000a')||
'   where   dv.seqnc = ddv.ref_domn_valr'||unistr('\000a')||
'           and dv.code = ''COMPR_SI_VERL'''||unistr('\000a')||
'           and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'           and ddv.date_debut_efect <= sysdate'||unistr('\000a')||
'           and (   ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect'||unistr('\000a')||
'                or ddv.date_fin_efect is null)'||unistr('\000a')||
'order by   ddv.seqnc_presn',
  p_lov_show_nulls=> 'YES',
  p_lov_null_text=> '- Choisir -',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_table_name=> 'VD_AFW_31_D_DEFNT_CAPTR_DEFT',
  p_ref_column_name=> 'REF_DV_COMPR_SI_VERL',
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 487117612658627928 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1042,
  p_button_sequence=> 10,
  p_button_plug_id => 487124841493769390+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Annuler',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '&A_AFW_04_SOURC_URL.',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-info',
  p_button_cattributes=>'icon-undo',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 487117342832627928 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1042,
  p_button_sequence=> 30,
  p_button_plug_id => 487124841493769390+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enregistrer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P1042_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_security_scheme => 1270923017146863787+ wwv_flow_api.g_id_offset,
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 487117215418627928 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1042,
  p_button_sequence=> 40,
  p_button_plug_id => 487124841493769390+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enregistrer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P1042_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_security_scheme => 1268921903099320428+ wwv_flow_api.g_id_offset,
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 487117433780627928 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1042,
  p_button_sequence=> 20,
  p_button_plug_id => 487124841493769390+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(524977216008909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Supprimer',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(htmldb_delete_message,''DELETE'');',
  p_button_execute_validations=>'N',
  p_button_condition=> 'P1042_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_cattributes=>'icon-remove',
  p_security_scheme => 1270934890266865461+ wwv_flow_api.g_id_offset,
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 487135824917991248 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1042,
  p_button_sequence=> 30,
  p_button_plug_id => 487134523513991233+wwv_flow_api.g_id_offset,
  p_button_name    => 'SUBMIT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enregistrer',
  p_button_position=> 'TEMPLATE_DEFAULT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_security_scheme => 1270923017146863787+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>487118521562627935 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1042,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:&A_AFW_04_SOURC_NUMR_PAGE.:&SESSION.::&DEBUG.::SIDF:&SIDF.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>487117433780627928+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>487136721017991254 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1042,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1042:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>487118728939627939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1042,
  p_name=>'P1042_SEQNC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1103119253321571903+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Seqnc',
  p_source=>'SEQNC',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>487118940468627948 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1042,
  p_name=>'P1042_NOM',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 487117035067627926+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nom',
  p_source=>'NOM',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 60,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>487119125782627949 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1042,
  p_name=>'P1042_CODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 487117035067627926+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Code',
  p_source=>'CODE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>487170143401924834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1042,
  p_name=>'P1042_REF_EVENM',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 487134523513991233+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Évènement',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select     valr d,'||unistr('\000a')||
'           ddv.seqnc r'||unistr('\000a')||
'    from   vd_afw_14_domn_valr dv,'||unistr('\000a')||
'           vd_afw_14_detl_domn_valr ddv'||unistr('\000a')||
'   where   dv.seqnc = ddv.ref_domn_valr'||unistr('\000a')||
'           and dv.code = ''EVENM'''||unistr('\000a')||
'           and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn'||unistr('\000a')||
'           and ddv.date_debut_efect <= sysdate'||unistr('\000a')||
'           and (   ddv.date_fin_efect is not null and sysdate <= ddv.date_fin_efect'||unistr('\000a')||
'                or ddv.date_fin_efect is null)'||unistr('\000a')||
'order by   ddv.seqnc_presn',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- Choisir -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:VD_AFW_31_DEFNT_CAPTR_DEFT:P1042_SEQNC:SEQNC';

wwv_flow_api.create_page_process(
  p_id     => 487119519704627950 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1042,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from VD_AFW_31_DEFNT_CAPTR_DEFT',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_FETCH_IMPOS.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:VD_AFW_31_D_DEFNT_CAPTR_DEFT:SEQNC';

wwv_flow_api.create_page_process(
  p_id     => 487136541250991253 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1042,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 487134523513991233 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_UPDATE',
  p_process_name=> 'ApplyMRU',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_ECHEC_SPECF.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>487135824917991248 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '#MRU_COUNT# &A_AFW_13_MESG_RANGE_MODF., #MRI_COUNT# &A_AFW_13_MESG_RANGE_INSER..',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:VD_AFW_31_DEFNT_CAPTR_DEFT:P1042_SEQNC:SEQNC|IUD';

wwv_flow_api.create_page_process(
  p_id     => 487119739942627952 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1042,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of VD_AFW_31_DEFNT_CAPTR_DEFT',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_ECHEC_SPECF.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '&A_AFW_13_MESG_SUCS_SPECF.',
  p_security_scheme => 1270950695807867091+ wwv_flow_api.g_id_offset,
  p_process_is_stateful_y_n=>'N',
  p_return_key_into_item1=>'P1042_SEQNC',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'AFW_31_DEFNT_CAPTR_PKG.creer_modl_captr_vide(:P1042_SEQNC);';

wwv_flow_api.create_page_process(
  p_id     => 487174418402087867 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1042,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Créer association initiale',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>487117215418627928 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1042
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01051
prompt  ...PAGE 1051: Paramètres
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1051
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Paramètres'
 ,p_step_title => 'Paramètres'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Paramètres'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_required_role => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20131031174802'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select seqnc, code from vd_afw_11_parmt_afw';

wwv_flow_api.create_page_plug (
  p_id=> 510914122752831710 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1051,
  p_plug_name=> 'Paramètres',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 524965118194909917+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select seqnc, code from vd_afw_11_parmt_afw';

wwv_flow_api.create_worksheet(
  p_id=> 510914212774831710+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1051,
  p_region_id=> 510914122752831710+wwv_flow_api.g_id_offset,
  p_name=> 'Paramètres',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> '&A_AFW_13_MESG_TROP_DON_TROUV.',
  p_no_data_found_message=> '&A_AFW_13_MESG_AUCUN_DON_TROUV.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_button_template=> 524975207979909930+wwv_flow_api.g_id_offset,
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_actions_menu_icon=>'&A_AFW_11_DOSR_FICHR_AFW.images/raprt_inter/actio.png',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_detail_link=>'f?p=&APP_ID.:1052:&SESSION.::&DEBUG.:RP:SSPC,SIDF:#SEQNC#,&SIDF.',
  p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'GARJE',
  p_internal_uid=> 1);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 510914437357831740+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1051,
  p_worksheet_id => 510914212774831710+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SEQNC',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Seqnc',
  p_report_label           =>'Seqnc',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 510914531893831757+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1051,
  p_worksheet_id => 510914212774831710+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CODE',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Code du paramètre',
  p_report_label           =>'Code du paramètre',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'SEQNC:CODE';

wwv_flow_api.create_worksheet_rpt(
  p_id => 510915540611858047+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1051,
  p_worksheet_id => 510914212774831710+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'5073267',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'CODE',
  p_sort_direction_1        =>'ASC',
  p_sort_column_2           =>'0',
  p_sort_direction_2        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 510916136240866156 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1051,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959416816909913+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 510916339488876619 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1051,
  p_button_sequence=> 10,
  p_button_plug_id => 510916136240866156+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Créer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1052:&SESSION.::&DEBUG.::SIDF:&SIDF.',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-plus',
  p_security_scheme => 1268921903099320428+ wwv_flow_api.g_id_offset,
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1051
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01052
prompt  ...PAGE 1052: Paramètre
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1052
 ,p_user_interface_id => 3676627442531189 + wwv_flow_api.g_id_offset
 ,p_name => 'Paramètre'
 ,p_step_title => 'Paramètre'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_required_role => 1271854819056252286 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_upd_yyyymmddhh24miss => '20131101101705'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 510917443284910671 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1052,
  p_plug_name=> 'Paramètre',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 524961827980909915+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 510921512569925616 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1052,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959416816909913+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 510918023072910672 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1052,
  p_button_sequence=> 10,
  p_button_plug_id => 510921512569925616+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Annuler',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '&A_AFW_04_SOURC_URL.',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-info',
  p_button_cattributes=>'icon-undo',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 510917728504910672 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1052,
  p_button_sequence=> 30,
  p_button_plug_id => 510921512569925616+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enregistrer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P1052_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_security_scheme => 1270923017146863787+ wwv_flow_api.g_id_offset,
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 510917629838910672 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1052,
  p_button_sequence=> 40,
  p_button_plug_id => 510921512569925616+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977022775909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Enregistrer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P1052_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-save',
  p_security_scheme => 1268921903099320428+ wwv_flow_api.g_id_offset,
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 510917817757910672 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1052,
  p_button_sequence=> 20,
  p_button_plug_id => 510921512569925616+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(524977216008909931+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Supprimer',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(htmldb_delete_message,''DELETE'');',
  p_button_execute_validations=>'N',
  p_button_condition=> 'P1052_SEQNC',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_button_cattributes=>'icon-remove',
  p_security_scheme => 1270934890266865461+ wwv_flow_api.g_id_offset,
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>510922634518941357 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1052,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:&A_AFW_04_SOURC_NUMR_PAGE.:&SESSION.::&DEBUG.::SIDF:&SIDF.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>510917817757910672+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 25-FEB-2013 16:31 by GARJE');
 
wwv_flow_api.create_page_branch(
  p_id=>510918939141910681 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1052,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1052:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>510919132732910683 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1052,
  p_name=>'P1052_SEQNC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 510917443284910671+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Seqnc',
  p_source=>'SEQNC',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>510919322216910705 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1052,
  p_name=>'P1052_CODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 510917443284910671+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Code du paramètre',
  p_source=>'CODE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974408168909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>510919523392910706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1052,
  p_name=>'P1052_VALR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 510917443284910671+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Valeur',
  p_source=>'VALR',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 200,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 524974226398909928+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:VD_AFW_11_PARMT_AFW:P1052_SEQNC:SEQNC';

wwv_flow_api.create_page_process(
  p_id     => 510919912132910707 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1052,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from VD_AFW_11_PARMT_AFW',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_IMPOS_FETCH.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:VD_AFW_11_PARMT_AFW:P1052_SEQNC:SEQNC|IUD';

wwv_flow_api.create_page_process(
  p_id     => 510920136672910710 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1052,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of VD_AFW_11_PARMT_AFW',
  p_process_sql_clob => p,
  p_process_error_message=> '&A_AFW_13_MESG_ECHEC_SPECF.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '&A_AFW_13_MESG_SUCS_SPECF.',
  p_security_scheme => 1270950695807867091+ wwv_flow_api.g_id_offset,
  p_process_is_stateful_y_n=>'N',
  p_return_key_into_item1=>'P1052_SEQNC',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1052
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/p1012_onglt
 
begin
 
wwv_flow_api.create_list (
  p_id=> 485963637705665098 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'P1012_ONGLT',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 485963823710665099 + wwv_flow_api.g_id_offset,
  p_list_id=> 485963637705665098 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Schémas',
  p_list_item_link_target=> 'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.::SIDF,SAPC:&SIDF.,SCHEM:',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'PLSQL_EXPRESSION',
  p_list_item_current_for_pages=> 'afw_07_util_pkg.v(''P'' || afw_13_page_pkg.obten_numr_apex_page  || ''_MODE'') = ''SCHEM''',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/menu_piltg
 
begin
 
wwv_flow_api.create_list (
  p_id=> 485982843143884204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'MENU_PILTG',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 485983315876884206 + wwv_flow_api.g_id_offset,
  p_list_id=> 485982843143884204 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Environnements',
  p_list_item_link_target=> 'f?p=&APP_ID.:1011:&SESSION.::&DEBUG.::SIDF:&SIDF.:',
  p_list_item_icon=> 'menu/dynamic_64.gif',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> 'f?p=135:1:&SESSION.',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 486840617127258382 + wwv_flow_api.g_id_offset,
  p_list_id=> 485982843143884204 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Modèles de capture',
  p_list_item_link_target=> 'f?p=&APP_ID.:1041:&SESSION.::&DEBUG.::SIDF:&SIDF.:',
  p_list_item_icon=> 'menu/clipboard_64.gif',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> 'f?p=135:1:&SESSION.',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 510912325542815762 + wwv_flow_api.g_id_offset,
  p_list_id=> 485982843143884204 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Paramètres',
  p_list_item_link_target=> 'f?p=&APP_ID.:1051:&SESSION.::&DEBUG.::SIDF:&SIDF.:',
  p_list_item_icon=> 'menu/logic_64.gif',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> 'f?p=135:1:&SESSION.',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
prompt  ...page templates for application: 1000007
--
--application/shared_components/user_interface/templates/page/without_tab
prompt  ......Page template 524953205486909904
 
begin
 
wwv_flow_api.create_template (
  p_id => 524953205486909904 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 313
 ,p_name => 'Without tab'
 ,p_is_popup => false
 ,p_javascript_file_urls => '&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/js/bootstrap.min.js?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
 ,p_css_file_urls => '&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/bootstrap#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/afw/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/font-awesome/3.2.1/css/font-awesome#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="en">'||unistr('\000a')||
'	<head>'||unistr('\000a')||
'		<meta charset="utf-8">'||unistr('\000a')||
'		<meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'                <meta http-equiv="X-UA-Compatible" content="IE=edge">'||unistr('\000a')||
'		<meta name="description" content="">'||unistr('\000a')||
'		<meta name="author" content="">'||unistr('\000a')||
''||unistr('\000a')||
'		<title>&A_AFW_11_ACRON_PRODT. - #TITLE#</title>'||unistr('\000a')||
'		<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_CORE_1.'||unistr('\000a')||
'		#APEX_CSS#'||unistr('\000a')||
'		#TEMPLATE_CSS#'||unistr('\000a')||
'		#THEME_CSS#'||unistr('\000a')||
'		#PAGE_CSS#'||unistr('\000a')||
'		#APEX_JAVASCRIPT#'||unistr('\000a')||
'		#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'		#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'		#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'		&A_AFW_11_TEMPL_THEME_JQUER_UI.'||unistr('\000a')||
'		<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_CORE_2. '||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_JQUER.'||unistr('\000a')||
'		#PAGE_JAVASCRIPT#'||unistr('\000a')||
'        <!-- Le fav and touch icons -->'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="57x57" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-57x57.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="60x60" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-60x60.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="72x72" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-72x72.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="76x76" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-76x76.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="114x114" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-114x114.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="120x120" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-120x120.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="144x144" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-144x144.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="152x152" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-152x152.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="180x180" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-180x180.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="192x192" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/android-icon-192x192.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="32x32" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-32x32.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="96x96" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-96x96.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="16x16" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-16x16.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="manifest" href="assets/img/ico/manifest.json">'||unistr('\000a')||
'		<meta name="msapplication-TileColor" content="#ffffff">'||unistr('\000a')||
'		<meta name="msapplication-TileImage" content="assets/img/ico/ms-icon-144x144.png">'||unistr('\000a')||
'		<meta name="theme-color" content="#ffffff">'||unistr('\000a')||
'	</head>'||unistr('\000a')||
'	<body class="&A_AFW_11_JQUER_UI_CSS_SCOPE." #ONLOAD#>'||unistr('\000a')||
'		<div class="container-main">'||unistr('\000a')||
'			#FORM_OPEN#'
 ,p_box => 
'				<div class="navbar navbar-fixed-top navbar-sub1">'||unistr('\000a')||
'				   <div class="navbar-inner">'||unistr('\000a')||
'					<button data-target=".sub-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">'||unistr('\000a')||
'						<span class="icon-bar"></span>'||unistr('\000a')||
'						<span class="icon-bar"></span>'||unistr('\000a')||
'						<span class="icon-bar"></span>'||unistr('\000a')||
'					</button>'||unistr('\000a')||
'					<div class="navbar-collapse collapse sub-navbar-collapse">'||unistr('\000a')||
'						#REGION_'||
'POSITION_01# #REGION_POSITION_05#'||unistr('\000a')||
'					</div><!--/.navbar-collapse -->'||unistr('\000a')||
'				   </div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
''||unistr('\000a')||
'				<div class="navbar navbar-fixed-top navbar-sub2">'||unistr('\000a')||
'				   <div class="navbar-inner">'||unistr('\000a')||
'					<div id="afw_mesg_apex">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'					<div id="afw_01_mesg">#REGION_POSITION_07#</div>'||unistr('\000a')||
'				   </div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
'				'||unistr('\000a')||
'				<div class="navbar navbar-fixed'||
'-top navbar-main">'||unistr('\000a')||
'				   <div class="navbar-inner">'||unistr('\000a')||
'						<button data-target=".main-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'						</button>'||unistr('\000a')||
'						<a class="navbar-brand" href="&A_AFW_11_URL_ACUEI.">&A_AFW_11_ACRON_PRODT.</a>'||unistr('\000a')||
'						<div class="navb'||
'ar-collapse collapse main-navbar-collapse">'||unistr('\000a')||
'							#REGION_POSITION_02#'||unistr('\000a')||
'						</div><!--/.navbar-collapse -->'||unistr('\000a')||
'				   </div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
'				'||unistr('\000a')||
'				<div class="container">'||unistr('\000a')||
'					<div class="row">'||unistr('\000a')||
'					 <div class="col-lg-12">'||unistr('\000a')||
'					   <div class="hero-unit">'||unistr('\000a')||
'						 #REGION_POSITION_03#'||unistr('\000a')||
'					   </div>'||unistr('\000a')||
'					   <div class="row">'||unistr('\000a')||
'						 #BOX_BODY#'||unistr('\000a')||
'					   </div><!--/row-->'||unistr('\000a')||
'					   <div class="row">'||unistr('\000a')||
'						 #'||
'REGION_POSITION_06#'||unistr('\000a')||
'					   </div><!--/row-->'||unistr('\000a')||
'					 </div><!--/col-->'||unistr('\000a')||
'					</div><!--/row-->'||unistr('\000a')||
'				 '||unistr('\000a')||
'					<hr>'||unistr('\000a')||
''||unistr('\000a')||
'					<footer>'
 ,p_footer_template => 
'						<p>&A_AFW_11_VERSN_PRODT. - &A_AFW_11_MESG_TOUT_DROIT_RESRV.</p>'||unistr('\000a')||
'						<div class="container">#REGION_POSITION_08#</div>'||unistr('\000a')||
'					</footer>'||unistr('\000a')||
'				</div><!--/.fluid-container-->'||unistr('\000a')||
'			#FORM_CLOSE#'||unistr('\000a')||
'		</div> <!-- /container -->'||unistr('\000a')||
'		#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'		#GENERATED_CSS#'||unistr('\000a')||
'		#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'	</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div id="afw_sucs_mesg" class="alert alert-success">'||unistr('\000a')||
'  <button type="button" class="close" data-dismiss="alert">&times;</button>'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div id="afw_notfc_mesg" class="alert alert-danger">'||unistr('\000a')||
'  <button type="button" class="close" data-dismiss="alert">&times;</button>'||unistr('\000a')||
'  #MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_04'
 ,p_theme_class_id => 3
 ,p_grid_type => 'TABLE'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => false
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '<div class="container">'||unistr('\000a')||
'#ROWS#'||unistr('\000a')||
'</div>'
 ,p_grid_row_template => '<div class="row">'||unistr('\000a')||
'#COLUMNS#'||unistr('\000a')||
'</div>'
 ,p_grid_column_template => '<div class="col-md-#COLUMN_SPAN_NUMBER# #FIRST_LAST_COLUMN_ATTRIBUTES#">'||unistr('\000a')||
'#CONTENT#'||unistr('\000a')||
'</div>'
 ,p_grid_first_column_attributes => 'col-first'
 ,p_grid_last_column_attributes => 'col-last'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-on", showGrid)'||unistr('\000a')||
'    .on("apex-devbar-grid-debug-off", hideGrid);'
 ,p_has_edit_links => true
 ,p_reference_id => 524947027725821677
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/without_tab_with_one_frame
prompt  ......Page template 524953423731909904
 
begin
 
wwv_flow_api.create_template (
  p_id => 524953423731909904 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 313
 ,p_name => 'Without tab with one frame'
 ,p_is_popup => false
 ,p_javascript_file_urls => '&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/js/bootstrap.min.js?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
 ,p_css_file_urls => '&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/bootstrap#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/afw/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/font-awesome/3.2.1/css/font-awesome#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="en">'||unistr('\000a')||
'	<head>'||unistr('\000a')||
'		<meta charset="utf-8">'||unistr('\000a')||
'		<meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'		<meta name="description" content="">'||unistr('\000a')||
'		<meta name="author" content="">'||unistr('\000a')||
''||unistr('\000a')||
'		<title>&A_AFW_11_ACRON_PRODT. - #TITLE#</title>'||unistr('\000a')||
'		<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_CORE_1.'||unistr('\000a')||
'		#APEX_CSS#'||unistr('\000a')||
'		#TEMPLATE_CSS#'||unistr('\000a')||
'		#THEME_CSS#'||unistr('\000a')||
'		#PAGE_CSS#'||unistr('\000a')||
'		#APEX_JAVASCRIPT#'||unistr('\000a')||
'		#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'		#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'		#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'		&A_AFW_11_TEMPL_THEME_JQUER_UI.'||unistr('\000a')||
'		<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_CORE_2. '||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_JQUER.'||unistr('\000a')||
'		#PAGE_JAVASCRIPT#'||unistr('\000a')||
'        <!-- Le fav and touch icons -->'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="57x57" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-57x57.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="60x60" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-60x60.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="72x72" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-72x72.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="76x76" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-76x76.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="114x114" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-114x114.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="120x120" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-120x120.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="144x144" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-144x144.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="152x152" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-152x152.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="180x180" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-180x180.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="192x192" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/android-icon-192x192.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="32x32" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-32x32.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="96x96" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-96x96.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="16x16" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-16x16.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="manifest" href="assets/img/ico/manifest.json">'||unistr('\000a')||
'		<meta name="msapplication-TileColor" content="#ffffff">'||unistr('\000a')||
'		<meta name="msapplication-TileImage" content="assets/img/ico/ms-icon-144x144.png">'||unistr('\000a')||
'		<meta name="theme-color" content="#ffffff">'||unistr('\000a')||
'	</head>'||unistr('\000a')||
'	<body class="&A_AFW_11_JQUER_UI_CSS_SCOPE." #ONLOAD#>'||unistr('\000a')||
'		<div class="container">'||unistr('\000a')||
'			#FORM_OPEN#'
 ,p_box => 
'				<div class="navbar navbar-fixed-top navbar-sub1">'||unistr('\000a')||
'				   <div class="navbar-inner">'||unistr('\000a')||
'					 <div class="container">'||unistr('\000a')||
'					   <button data-target=".sub-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'						</button>'||unistr('\000a')||
'						<div class="navbar-collapse collaps'||
'e sub-navbar-collapse">'||unistr('\000a')||
'							#REGION_POSITION_01# #REGION_POSITION_05#'||unistr('\000a')||
'						</div><!--/.navbar-collapse -->'||unistr('\000a')||
'					 </div>'||unistr('\000a')||
'				   </div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
''||unistr('\000a')||
'				<div class="navbar navbar-fixed-top navbar-sub2">'||unistr('\000a')||
'				   <div class="navbar-inner">'||unistr('\000a')||
'					 <div class="container">'||unistr('\000a')||
'						<div id="afw_mesg_apex">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'						<div id="afw_01_mesg">#REGION'||
'_POSITION_07#</div>'||unistr('\000a')||
'					 </div>'||unistr('\000a')||
'				   </div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
'				'||unistr('\000a')||
'				<div class="navbar navbar-fixed-top navbar-main">'||unistr('\000a')||
'				   <div class="navbar-inner">'||unistr('\000a')||
'					 <div class="container">'||unistr('\000a')||
'						<button data-target=".main-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'							<span class="icon-bar"></s'||
'pan>'||unistr('\000a')||
'						</button>'||unistr('\000a')||
'						<a class="navbar-brand" href="&A_AFW_11_URL_ACUEI.">&A_AFW_11_ACRON_PRODT.</a>'||unistr('\000a')||
'						<div class="navbar-collapse collapse main-navbar-collapse">'||unistr('\000a')||
'							#REGION_POSITION_02#'||unistr('\000a')||
'						</div><!--/.navbar-collapse -->'||unistr('\000a')||
'					 </div>'||unistr('\000a')||
'				   </div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
'				'||unistr('\000a')||
'				<div class="container">'||unistr('\000a')||
'					<div class="row">'||unistr('\000a')||
'					 <div class="col-lg-3">'||unistr('\000a')||
'					   <div class="well sidebar-nav si'||
'debar-nav-fixed">'||unistr('\000a')||
'						 #REGION_POSITION_04#'||unistr('\000a')||
'					   </div><!--/.well -->'||unistr('\000a')||
'					 </div><!--/span-->'||unistr('\000a')||
'					 <div class="col-lg-9">'||unistr('\000a')||
'					   <div class="hero-unit">'||unistr('\000a')||
'						 #REGION_POSITION_03#'||unistr('\000a')||
'					   </div>'||unistr('\000a')||
'					   <div class="row">'||unistr('\000a')||
'						 #BOX_BODY#'||unistr('\000a')||
'					   </div><!--/row-->'||unistr('\000a')||
'					   <div class="row">'||unistr('\000a')||
'						 #REGION_POSITION_06#'||unistr('\000a')||
'					   </div><!--/row-->'||unistr('\000a')||
'					 </div><!--/span-->'||unistr('\000a')||
'					</div><!--/row--'||
'>'||unistr('\000a')||
'				 '||unistr('\000a')||
'					<hr>'||unistr('\000a')||
''||unistr('\000a')||
'					<footer>'
 ,p_footer_template => 
'						<p>&A_AFW_11_VERSN_PRODT. - &A_AFW_11_MESG_TOUT_DROIT_RESRV.</p>'||unistr('\000a')||
'						<div class="container">#REGION_POSITION_08#</div>'||unistr('\000a')||
'					</footer>'||unistr('\000a')||
'				</div><!--/.fluid-container-->'||unistr('\000a')||
'			#FORM_CLOSE#'||unistr('\000a')||
'		</div> <!-- /container -->'||unistr('\000a')||
'		#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'		#GENERATED_CSS#'||unistr('\000a')||
'		#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'	</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div id="afw_sucs_mesg" class="alert alert-success">'||unistr('\000a')||
'  <button type="button" class="close" data-dismiss="alert">&times;</button>'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_notification_message => '<div id="afw_notfc_mesg" class="alert alert-danger">'||unistr('\000a')||
'  <button type="button" class="close" data-dismiss="alert">&times;</button>'||unistr('\000a')||
'  #MESSAGE#'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_04'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_02'
 ,p_theme_class_id => 17
 ,p_grid_type => 'TABLE'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '<div>#ROWS#</div>'
 ,p_grid_row_template => '<div class="row">#COLUMNS#</div>'
 ,p_grid_column_template => '<div class="col-md-#COLUMN_SPAN_NUMBER#">#CONTENT#</div>'
 ,p_has_edit_links => true
 ,p_reference_id => 524947245970821677
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 524954005030909905
 
begin
 
wwv_flow_api.create_template (
  p_id => 524954005030909905 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 313
 ,p_name => 'Login'
 ,p_is_popup => false
 ,p_javascript_file_urls => '&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/js/bootstrap.min.js?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
 ,p_css_file_urls => '&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/bootstrap#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/afw/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/font-awesome/3.2.1/css/font-awesome#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="en">'||unistr('\000a')||
'	<head>'||unistr('\000a')||
'		<meta charset="utf-8">'||unistr('\000a')||
'		<meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'		<meta http-equiv="X-UA-Compatible" content="IE=edge">'||unistr('\000a')||
'                <meta name="description" content="">'||unistr('\000a')||
'		<meta name="author" content="">'||unistr('\000a')||
'          '||unistr('\000a')||
'		<title>&A_AFW_11_ACRON_PRODT. - #TITLE#</title>'||unistr('\000a')||
'		<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_CORE_1.'||unistr('\000a')||
'		#APEX_CSS#'||unistr('\000a')||
'		#TEMPLATE_CSS#'||unistr('\000a')||
'		#THEME_CSS#'||unistr('\000a')||
'		#PAGE_CSS#'||unistr('\000a')||
'		#APEX_JAVASCRIPT#'||unistr('\000a')||
'		#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'		#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'		#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'		&A_AFW_11_TEMPL_THEME_JQUER_UI.'||unistr('\000a')||
'		<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_CORE_2. '||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_JQUER.'||unistr('\000a')||
'		#PAGE_JAVASCRIPT#'||unistr('\000a')||
'        <!-- Le fav and touch icons -->'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="57x57" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-57x57.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="60x60" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-60x60.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="72x72" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-72x72.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="76x76" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-76x76.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="114x114" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-114x114.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="120x120" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-120x120.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="144x144" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-144x144.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="152x152" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-152x152.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="180x180" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-180x180.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="192x192" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/android-icon-192x192.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="32x32" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-32x32.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="96x96" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-96x96.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="16x16" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-16x16.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="manifest" href="assets/img/ico/manifest.json">'||unistr('\000a')||
'		<meta name="msapplication-TileColor" content="#ffffff">'||unistr('\000a')||
'		<meta name="msapplication-TileImage" content="assets/img/ico/ms-icon-144x144.png">'||unistr('\000a')||
'		<meta name="theme-color" content="#ffffff">'||unistr('\000a')||
'	</head>'||unistr('\000a')||
'	<body class="login &A_AFW_11_JQUER_UI_CSS_SCOPE." #ONLOAD#>'||unistr('\000a')||
'		<div class="container-main">'||unistr('\000a')||
'			#FORM_OPEN#'
 ,p_box => 
'				<div class="navbar navbar-fixed-top navbar-sub1">'||unistr('\000a')||
'				   <div class="navbar-inner">'||unistr('\000a')||
'					   <button data-target=".sub-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'						</button>'||unistr('\000a')||
'						<div class="navbar-collapse collapse sub-navbar-collapse">'||unistr('\000a')||
'						'||
'	#REGION_POSITION_01# #REGION_POSITION_05#'||unistr('\000a')||
'						</div><!--/.navbar-collapse -->'||unistr('\000a')||
'				   </div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
''||unistr('\000a')||
'				<div class="navbar navbar-fixed-top navbar-sub2">'||unistr('\000a')||
'				   <div class="navbar-inner">'||unistr('\000a')||
'						<div id="afw_mesg_apex">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'						<div id="afw_01_mesg">#REGION_POSITION_07#</div>'||unistr('\000a')||
'				   </div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
'				'||unistr('\000a')||
'				<div class="navbar '||
'navbar-fixed-top navbar-main">'||unistr('\000a')||
'				   <div class="navbar-inner">'||unistr('\000a')||
'						<button data-target=".main-navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle">'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'							<span class="icon-bar"></span>'||unistr('\000a')||
'						</button>'||unistr('\000a')||
'						<a class="navbar-brand" href="#">&A_AFW_11_ACRON_PRODT.</a>'||unistr('\000a')||
'						<div class="navbar-coll'||
'apse collapse main-navbar-collapse">'||unistr('\000a')||
'							#REGION_POSITION_02#'||unistr('\000a')||
'						</div><!--/.navbar-collapse -->'||unistr('\000a')||
'				   </div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
'		                <div class="hero-unit">#REGION_POSITION_03#</div>'||unistr('\000a')||
'		                #BOX_BODY#'||unistr('\000a')||
'				#REGION_POSITION_06#'
 ,p_footer_template => 
'	                                <hr>'||unistr('\000a')||
'                                        <div class="container">'||unistr('\000a')||
'                                            <div class="row">'||unistr('\000a')||
'                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">'||unistr('\000a')||
'                                                    <footer>'||unistr('\000a')||
'                                                        <p>&A_AFW_11_VERS'||
'N_PRODT. - &A_AFW_11_MESG_TOUT_DROIT_RESRV.</p>'||unistr('\000a')||
'					            </footer>'||unistr('\000a')||
'                                                </div>'||unistr('\000a')||
'                                            </div>'||unistr('\000a')||
'                                        </div>'||unistr('\000a')||
'                                        #REGION_POSITION_08#'||unistr('\000a')||
'			#FORM_CLOSE#'||unistr('\000a')||
'		</div> <!-- /container -->'||unistr('\000a')||
'		#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'		#GENERATED_CSS#'||unistr('\000a')||
'		#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'	'||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div id="afw_sucs_mesg" class="alert alert-success">'||unistr('\000a')||
'  <button type="button" class="close" data-dismiss="alert">&times;</button>'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div id="afw_notfc_mesg" class="alert alert-danger">'||unistr('\000a')||
'  <button type="button" class="close" data-dismiss="alert">&times;</button>'||unistr('\000a')||
'  #MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_04'
 ,p_theme_class_id => 6
 ,p_grid_type => 'VARIABLE'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => false
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '<div class="container">#ROWS#</div>'
 ,p_grid_row_template => '<div class="row">#COLUMNS#</div>'
 ,p_grid_column_template => '<div class="col-md-#COLUMN_SPAN_NUMBER#">#CONTENT#</div>'
 ,p_has_edit_links => true
 ,p_reference_id => 524947827269821678
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 524955230014909908
 
begin
 
wwv_flow_api.create_template (
  p_id => 524955230014909908 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 313
 ,p_name => 'Popup'
 ,p_is_popup => false
 ,p_javascript_file_urls => '&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/js/bootstrap.min.js?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
 ,p_css_file_urls => '&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/bootstrap#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/afw/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/font-awesome/3.2.1/css/font-awesome#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="en">'||unistr('\000a')||
'	<head>'||unistr('\000a')||
'		<meta charset="utf-8">'||unistr('\000a')||
'		<meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'		<meta name="description" content="">'||unistr('\000a')||
'		<meta name="author" content="">'||unistr('\000a')||
''||unistr('\000a')||
'		<title>&A_AFW_11_ACRON_PRODT. - #TITLE#</title>'||unistr('\000a')||
'		<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_CORE_1.'||unistr('\000a')||
'		#APEX_CSS#'||unistr('\000a')||
'		#TEMPLATE_CSS#'||unistr('\000a')||
'		#THEME_CSS#'||unistr('\000a')||
'		#PAGE_CSS#'||unistr('\000a')||
'		#APEX_JAVASCRIPT#'||unistr('\000a')||
'		#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'		#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'		#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'		&A_AFW_11_TEMPL_THEME_JQUER_UI.'||unistr('\000a')||
'		<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_CORE_2. '||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_JQUER.'||unistr('\000a')||
'		#PAGE_JAVASCRIPT#'||unistr('\000a')||
'        <!-- Le fav and touch icons -->'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="57x57" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-57x57.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="60x60" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-60x60.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="72x72" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-72x72.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="76x76" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-76x76.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="114x114" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-114x114.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="120x120" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-120x120.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="144x144" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-144x144.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="152x152" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-152x152.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="180x180" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-180x180.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="192x192" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/android-icon-192x192.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="32x32" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-32x32.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="96x96" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-96x96.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="16x16" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-16x16.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="manifest" href="assets/img/ico/manifest.json">'||unistr('\000a')||
'		<meta name="msapplication-TileColor" content="#ffffff">'||unistr('\000a')||
'		<meta name="msapplication-TileImage" content="assets/img/ico/ms-icon-144x144.png">'||unistr('\000a')||
'		<meta name="theme-color" content="#ffffff">'||unistr('\000a')||
'	</head>'||unistr('\000a')||
'	<body class="dialog &A_AFW_11_JQUER_UI_CSS_SCOPE." #ONLOAD#>'||unistr('\000a')||
'		<div class="container">'||unistr('\000a')||
'			#FORM_OPEN#'
 ,p_box => 
'				<div class="container">'||unistr('\000a')||
'						<div id="afw_mesg_apex">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'						<div id="afw_01_mesg">#REGION_POSITION_07#</div>'||unistr('\000a')||
'				</div>'||unistr('\000a')||
''||unistr('\000a')||
'				<div class="container">'||unistr('\000a')||
'					 <div>'||unistr('\000a')||
'                                           <div class="row">'||unistr('\000a')||
'						 #REGION_POSITION_05#'||unistr('\000a')||
'					   </div>'||unistr('\000a')||
'                                           <div class="row">'||unistr('\000a')||
'			'||
'			 #BOX_BODY#'||unistr('\000a')||
'					   </div>'||unistr('\000a')||
'					 </div>'
 ,p_footer_template => 
'				</div><!--/.fluid-container-->'||unistr('\000a')||
'			#FORM_CLOSE#'||unistr('\000a')||
'		</div> <!-- /container -->'||unistr('\000a')||
'		#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'		#GENERATED_CSS#'||unistr('\000a')||
'		#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'	</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div id="afw_sucs_mesg" class="alert alert-success">'||unistr('\000a')||
'  <button type="button" class="close" data-dismiss="alert">&times;</button>'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div id="afw_notfc_mesg" class="alert alert-danger">'||unistr('\000a')||
'  <button type="button" class="close" data-dismiss="alert">&times;</button>'||unistr('\000a')||
'  #MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_04'
 ,p_theme_class_id => 4
 ,p_grid_type => 'TABLE'
 ,p_grid_max_columns => 12
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '<div>#ROWS#</div>'
 ,p_grid_row_template => '<div class="row">#COLUMNS#</div>'
 ,p_grid_column_template => '<div class="col-md-#COLUMN_SPAN_NUMBER#">#CONTENT#</div>'
 ,p_has_edit_links => true
 ,p_reference_id => 524949052253821681
 ,p_translate_this_template => 'N'
 ,p_template_comment => '* APEX Themes - Themes, Templates & Skins for Oracle APEX Applications'||unistr('\000a')||
'* http://www.apex-themes.com'||unistr('\000a')||
'* Copyright (c) 2011 Creative Mode'||unistr('\000a')||
'* This file is protected by copyright law and provided under license.'||unistr('\000a')||
'* Unauthorised copying of this file is strictly prohibited.'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/error_class_custom_1
prompt  ......Page template 524955518072909908
 
begin
 
wwv_flow_api.create_template (
  p_id => 524955518072909908 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 313
 ,p_name => 'Error (class= Custom 1)'
 ,p_is_popup => false
 ,p_javascript_file_urls => '&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/js/bootstrap.min.js?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
 ,p_css_file_urls => '&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/bootstrap#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/bootstrap/3.0.0/css/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/afw/custom.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'||unistr('\000a')||
'&A_AFW_11_DOSR_FICHR_AFW.theme/font-awesome/3.2.1/css/font-awesome#MIN#.css?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.'
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="en">'||unistr('\000a')||
'	<head>'||unistr('\000a')||
'		<meta charset="utf-8">'||unistr('\000a')||
'		<meta name="viewport" content="width=device-width, initial-scale=1.0">'||unistr('\000a')||
'		<meta name="description" content="">'||unistr('\000a')||
'		<meta name="author" content="">'||unistr('\000a')||
''||unistr('\000a')||
'		<title>&A_AFW_11_ACRON_PRODT. - #TITLE#</title>'||unistr('\000a')||
'		<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_CORE_1.'||unistr('\000a')||
'		#APEX_CSS#'||unistr('\000a')||
'		#TEMPLATE_CSS#'||unistr('\000a')||
'		#THEME_CSS#'||unistr('\000a')||
'		#PAGE_CSS#'||unistr('\000a')||
'		#APEX_JAVASCRIPT#'||unistr('\000a')||
'		#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'		#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'		#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'		&A_AFW_11_TEMPL_THEME_JQUER_UI.'||unistr('\000a')||
'		<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_CORE_2. '||unistr('\000a')||
'		&A_AFW_11_TEMPL_JAVSC_JQUER.'||unistr('\000a')||
'		#PAGE_JAVASCRIPT#'||unistr('\000a')||
'        <!-- Le fav and touch icons -->'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="57x57" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-57x57.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="60x60" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-60x60.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="72x72" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-72x72.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="76x76" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-76x76.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="114x114" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-114x114.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="120x120" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-120x120.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="144x144" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-144x144.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="152x152" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-152x152.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="apple-touch-icon" sizes="180x180" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/apple-icon-180x180.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="192x192" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/android-icon-192x192.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="32x32" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-32x32.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="96x96" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-96x96.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="icon" type="image/png" sizes="16x16" href="&A_AFW_11_DOSR_FICHR_AFW.assets/img/ico/favicon-16x16.png?v=&A_AFW_11_NUMR_VERSN_PRODT_AFW.">'||unistr('\000a')||
'		<link rel="manifest" href="assets/img/ico/manifest.json">'||unistr('\000a')||
'		<meta name="msapplication-TileColor" content="#ffffff">'||unistr('\000a')||
'		<meta name="msapplication-TileImage" content="assets/img/ico/ms-icon-144x144.png">'||unistr('\000a')||
'		<meta name="theme-color" content="#ffffff">'||unistr('\000a')||
'	</head>'||unistr('\000a')||
'	<body class="error &A_AFW_11_JQUER_UI_CSS_SCOPE." #ONLOAD#>'||unistr('\000a')||
'		<div class="container-main">'||unistr('\000a')||
'			#FORM_OPEN#'
 ,p_box => 
'<div id="afw_bloc_err" class="afw_bloc_err">'||unistr('\000a')||
'#BOX_BODY#'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'    #FORM_CLOSE#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  #DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div id="afw_sucs_mesg" class="alert alert-success">'||unistr('\000a')||
'  <button type="button" class="close" data-dismiss="alert">&times;</button>'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div id="afw_notfc_mesg" class="alert alert-danger">'||unistr('\000a')||
'  <button type="button" class="close" data-dismiss="alert">&times;</button>'||unistr('\000a')||
'  #MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_04'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_02'
 ,p_theme_class_id => 8
 ,p_error_page_template => '<div id="afw_mesg_err" class="afw_mesg_err">#MESSAGE#</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<script language="javascript">'||unistr('\000a')||
'afw.afw_01.mesg.trait_err_apex(&A_AFW_11_TRAIT_MESGS_ERR.);'||unistr('\000a')||
'</script>'
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => true
 ,p_reference_id => 524949340311821681
 ,p_translate_this_template => 'N'
 ,p_template_comment => '* APEX Themes - Themes, Templates & Skins for Oracle APEX Applications'||unistr('\000a')||
'* http://www.apex-themes.com'||unistr('\000a')||
'* Copyright (c) 2011 Creative Mode'||unistr('\000a')||
'* This file is protected by copyright law and provided under license.'||unistr('\000a')||
'* Unauthorised copying of this file is strictly prohibited.'
  );
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/text_only
prompt  ......Button Template 524975207979909930
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 524975207979909930 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Text only'
 ,p_template => 
'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
 ,p_hot_template => 
'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
 ,p_reference_id => 524969030218821703
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 9
 ,p_theme_id => 313
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/icon_only
prompt  ......Button Template 524976015254909931
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 524976015254909931 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Icon only'
 ,p_template => 
'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" title="#LABEL#"><i class="#BUTTON_ATTRIBUTES#"></i></button>'
 ,p_hot_template => 
'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#" title="#LABEL#"><i class="#BUTTON_ATTRIBUTES#"></i></button>'
 ,p_reference_id => 524969837493821704
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 8
 ,p_theme_id => 313
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/right_icon
prompt  ......Button Template 524976807938909931
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 524976807938909931 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Right icon'
 ,p_template => 
'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#">#LABEL# <i class="#BUTTON_ATTRIBUTES#"></i></button>'
 ,p_hot_template => 
'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#">#LABEL# <i class="#BUTTON_ATTRIBUTES#"></i></button>'
 ,p_reference_id => 524970630177821704
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 2
 ,p_theme_id => 313
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/left_icon
prompt  ......Button Template 524977022775909931
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 524977022775909931 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Left icon'
 ,p_template => 
'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#"><i class="#BUTTON_ATTRIBUTES#"></i> #LABEL#</button>'
 ,p_hot_template => 
'<button type="button" id="#BUTTON_ID#" onclick="#LINK#" alt="#LABEL#" class="btn #BUTTON_CSS_CLASSES#"><i class="#BUTTON_ATTRIBUTES#"></i> #LABEL#</button>'
 ,p_reference_id => 524970845014821704
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_theme_id => 313
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/dropdown_option
prompt  ......Button Template 524977216008909931
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 524977216008909931 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Dropdown option'
 ,p_template => 
'<li><a id="#BUTTON_ID#" href="#LINK#" alt="#LABEL#"><i class="#BUTTON_ATTRIBUTES#"></i> #LABEL#</a></li>'
 ,p_hot_template => 
'<li><a id="#BUTTON_ID#" href="#LINK#" alt="#LABEL#"><i class="#BUTTON_ATTRIBUTES#"></i> #LABEL#</a></li>'
 ,p_reference_id => 524971038247821704
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 313
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/button_toolbar_with_actions_dropdown
prompt  ......region template 84183808745586104
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 84183808745586104 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_ID#" class="btn-toolbar regn-toolbar-action-dropdown #REGION_CSS_CLASSES#">'||unistr('\000a')||
'	<div class="pull-left">#PREVIOUS#</div>'||unistr('\000a')||
'	<div class="pull-right">#NEXT#</div>'||unistr('\000a')||
'	<div class="btn-group #REGION_ATTRIBUTES#">'||unistr('\000a')||
'		<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">'||unistr('\000a')||
'			Actions'||unistr('\000a')||
'			<span class="caret"></span>'||unistr('\000a')||
'		</button>'||unistr('\000a')||
'		<ul class="dropdown-menu pull-right">'||unistr('\000a')||
'	'||
'		#DELETE#'||unistr('\000a')||
'			#SUB_REGIONS#'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="pull-right">#EXPAND##COPY##HELP##CLOSE##EDIT##CHANGE##CREATE2#</div>'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Button Toolbar with Actions Dropdown'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 313
 ,p_theme_class_id => 17
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 84177630984497877
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/afw_accordion_menu_2
prompt  ......region template 524957022025909911
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524957022025909911 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div id="#REGION_STATIC_ID#_acord">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'AFW - Accordion Menu 2'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 313
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524950844264821684
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/afw_13_menu_class_custom_7
prompt  ......region template 524957908563909911
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524957908563909911 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="afw_13_cadre_menu">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td class="afw_13_cadre_menu_entet">'||unistr('\000a')||
'      #TITLE#'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td class="afw_13_cadre_menu_corps">'||unistr('\000a')||
'      #BODY#'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td class="afw_13_cadre_menu_pied">'||unistr('\000a')||
'      <img src="/res/afw/theme/1px_trans.gif" width="1" height="1" />'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'AFW - 13 Menu (class= Custom 7)'
 ,p_theme_id => 313
 ,p_theme_class_id => 27
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524951730802821684
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/without_template_custom_7
prompt  ......region template 524958827992909912
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524958827992909912 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Without template  (Custom 7)'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 313
 ,p_theme_class_id => 27
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524952650231821685
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_toolbar_with_dropdown
prompt  ......region template 524959416816909913
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524959416816909913 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_ID#" class="btn-toolbar regn-toolbar-dropdown #REGION_CSS_CLASSES#">'||unistr('\000a')||
'	<div class="pull-left">#PREVIOUS#</div>'||unistr('\000a')||
'	<div class="pull-right">#NEXT#</div>'||unistr('\000a')||
'	<div class="btn-group #REGION_ATTRIBUTES#">'||unistr('\000a')||
'		#CREATE#'||unistr('\000a')||
'		<div class="btn-group">'||unistr('\000a')||
'			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">'||unistr('\000a')||
'				Actions'||unistr('\000a')||
'				<span class="caret"></span>'||unistr('\000a')||
'			</button>'||unistr('\000a')||
'			<ul '||
'class="dropdown-menu pull-right">'||unistr('\000a')||
'				#DELETE#'||unistr('\000a')||
'				#SUB_REGIONS#'||unistr('\000a')||
'				"AFW_13_LISTE_NAVGT"'||unistr('\000a')||
'			</ul>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="pull-right">#EXPAND##COPY##HELP##CLOSE##EDIT##CHANGE##CREATE2#</div>'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Button Toolbar with Dropdown'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 313
 ,p_theme_class_id => 17
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524953239055821686
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/100_width_form_without_title_class_custom_2
prompt  ......region template 524961827980909915
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524961827980909915 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="panel panel-default panel-no-title #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="panel-heading">'||unistr('\000a')||
'		<h3 class="panel-title">#TITLE#</h3>'||unistr('\000a')||
'		<div class="btn-toolbar">'||unistr('\000a')||
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>'||unistr('\000a')||
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>'||unistr('\000a')||
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>'||unistr('\000a')||
'		</div'||
'>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="panel-body">'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => '100% width form without title (class= Custom 2)'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 313
 ,p_theme_class_id => 22
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524955650219821688
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/100_width_boxed_form
prompt  ......region template 524962113410909915
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524962113410909915 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="panel panel-default #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="panel-heading">'||unistr('\000a')||
'		<h3 class="panel-title">#TITLE#</h3>'||unistr('\000a')||
'		<div class="btn-toolbar">'||unistr('\000a')||
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>'||unistr('\000a')||
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>'||unistr('\000a')||
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div'||
' class="panel-body">'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => '100% width boxed form'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 313
 ,p_theme_class_id => 8
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524955935649821688
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/100_width_form_with_underlined_title_class_custom_1
prompt  ......region template 524962410026909915
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524962410026909915 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="panel panel-default #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="panel-heading">'||unistr('\000a')||
'		<h3 class="panel-title">#TITLE#</h3>'||unistr('\000a')||
'		<div class="btn-toolbar">'||unistr('\000a')||
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>'||unistr('\000a')||
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>'||unistr('\000a')||
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div'||
' class="panel-body">'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => '100% width form with underlined title (class= Custom 1)'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 313
 ,p_theme_class_id => 21
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524956232265821688
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report
prompt  ......region template 524964830109909917
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524964830109909917 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="panel panel-default #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="panel-heading">'||unistr('\000a')||
'		<h3 class="panel-title">#TITLE#</h3>'||unistr('\000a')||
'		<div class="btn-toolbar">'||unistr('\000a')||
'			<div class="btn-group">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>'||unistr('\000a')||
'			<div class="btn-group">#DELETE##EDIT##CREATE#</div>'||unistr('\000a')||
'			<div class="btn-group">#CHANGE##CREATE2##NEXT#</div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'       '||
' <div class="panel-body">'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Report'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 313
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524958652348821690
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/100_width_report_without_title_custom_5
prompt  ......region template 524965118194909917
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524965118194909917 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="panel panel-default panel-no-title #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="panel-body">'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => '100% width report without title (Custom 5)'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 313
 ,p_theme_class_id => 25
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524958940433821690
 ,p_translate_this_template => 'N'
 ,p_template_comment => '<div class="panel panel-default panel-no-title #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="panel-heading">'||unistr('\000a')||
'		<h3 class="panel-title">#TITLE#</h3>'||unistr('\000a')||
'		<div class="btn-toolbar">'||unistr('\000a')||
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>'||unistr('\000a')||
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>'||unistr('\000a')||
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="panel-body">'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'</div>'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/100_width_boxed_report
prompt  ......region template 524965416965909917
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524965416965909917 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="panel panel-default #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="panel-heading">'||unistr('\000a')||
'		<h3 class="panel-title">#TITLE#</h3>'||unistr('\000a')||
'		<div class="btn-toolbar">'||unistr('\000a')||
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>'||unistr('\000a')||
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>'||unistr('\000a')||
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div'||
' class="panel-body">'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => '100% width boxed report'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 313
 ,p_theme_class_id => 13
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524959239204821690
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/100_width_report_with_underlined_title_custom_4
prompt  ......region template 524965703902909917
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524965703902909917 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="panel panel-default #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="panel-heading">'||unistr('\000a')||
'		<h3 class="panel-title">#TITLE#</h3>'||unistr('\000a')||
'		<div class="btn-toolbar">'||unistr('\000a')||
'			<div class="pull-left">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>'||unistr('\000a')||
'			<div class="pull-right">#DELETE##EDIT##CREATE#</div>'||unistr('\000a')||
'			<div class="pull-right">#CHANGE##CREATE2##NEXT#</div>'||unistr('\000a')||
'		</div>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div'||
' class="panel-body">'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => '100% width report with underlined title (Custom 4)'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 313
 ,p_theme_class_id => 24
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524959526141821690
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_alternative_1
prompt  ......region template 524966009654909918
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524966009654909918 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="panel panel-default panel-alternative #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'	<div class="panel-heading">'||unistr('\000a')||
'		<h3 class="panel-title">#TITLE#</h3>'||unistr('\000a')||
'		<div class="btn-toolbar">'||unistr('\000a')||
'			<div class="btn-group">#PREVIOUS##HELP##CLOSE##EXPAND##COPY#</div>'||unistr('\000a')||
'			<div class="btn-group">#DELETE##EDIT##CREATE#</div>'||unistr('\000a')||
'			<div class="btn-group">#CHANGE##CREATE2##NEXT#</div>'||unistr('\000a')||
'		</di'||
'v>'||unistr('\000a')||
'	</div>'||unistr('\000a')||
'	<div class="panel-body">'||unistr('\000a')||
'	#BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Report, alternative 1'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 313
 ,p_theme_class_id => 10
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 524959831893821691
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/navigation_tab
prompt  ......list template 524972014559909925
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="active"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>524972014559909925 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Navigation tab',
  p_theme_id  => 313,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<ul class="nav nav-tabs">',
  p_list_template_after_rows=>'</ul>',
  p_reference_id=>524965836798821698,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/afw_afw_13_menu_custom_3
prompt  ......list template 524972621657909926
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="afw_13_menu_sectn">'||unistr('\000a')||
'  <div class="afw_13_menu_infor">'||unistr('\000a')||
'    <i class="#IMAGE#"></i>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="afw_13_menu_detls">'||unistr('\000a')||
'    <a href="#LINK#">'||unistr('\000a')||
'      #TEXT#'||unistr('\000a')||
'    </a>';

t2:=t2||'<div class="afw_13_menu_sectn">'||unistr('\000a')||
'  <div class="afw_13_menu_infor">'||unistr('\000a')||
'    <i class="#IMAGE#"></i>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="afw_13_menu_detls">'||unistr('\000a')||
'    <a href="#LINK#" class="titre #IMAGE_ATTR#">'||unistr('\000a')||
'      #TEXT#'||unistr('\000a')||
'    </a>';

t3:=t3||'<li class="afw_13_menu_choix"><a href="#LINK#" class="">#TEXT#</a></li>';

t4:=t4||'<li class="afw_13_menu_choix"><a href="#LINK#" class="">#TEXT#</a></li>';

t5:=t5||'<div class="afw_13_menu_sectn">'||unistr('\000a')||
'  <div class="afw_13_menu_infor">'||unistr('\000a')||
'    <i class="#IMAGE#"></i>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="afw_13_menu_detls">'||unistr('\000a')||
'    <a href="#LINK#">'||unistr('\000a')||
'      #TEXT#'||unistr('\000a')||
'    </a>';

t6:=t6||'<div class="afw_13_menu_sectn">'||unistr('\000a')||
'  <div class="afw_13_menu_infor">'||unistr('\000a')||
'    <i class="#IMAGE#"></i>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="afw_13_menu_detls">'||unistr('\000a')||
'    <a href="#LINK#" class="titre #IMAGE_ATTR#">'||unistr('\000a')||
'      #TEXT#'||unistr('\000a')||
'    </a>';

t7:=t7||'<li class="afw_13_menu_choix"><a href="#LINK#" class="">#TEXT#</a></li>';

t8:=t8||'<li class="afw_13_menu_choix"><a href="#LINK#" class="">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>524972621657909926 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'AFW - AFW 13 Menu (Custom 3)',
  p_theme_id  => 313,
  p_theme_class_id => 11,
  p_list_template_before_rows=>'<div class="afw_13_menu">',
  p_list_template_after_rows=>'</div><div class="clear"></div>',
  p_between_items=>'</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'</div>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_reference_id=>524966443896821699,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/without_border_with_highlight
prompt  ......report template 524966905844909922
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="grid-data" headers="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 524966905844909922 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Without border with highlight',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div class="grid grid-borderless">'||unistr('\000a')||
'<table class="grid-table" #REPORT_ATTRIBUTES#>',
  p_row_template_after_rows =>'<ul class="pagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="report-links">#EXTERNAL_LINK##CSV_LINK#</div>'||unistr('\000a')||
'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="grid-header grid-default" #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'<span class="text">#TEXT#</span>',
  p_next_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT#"><i class="icon-arrow-right"></i></a></li>',
  p_previous_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS#"><i class="icon-arrow-left"></i></a></li>',
  p_next_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT_SET#"><i class="icon-arrow-right"></i></a></li>',
  p_previous_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS_SET#"><i class="icon-arrow-left"></i></a></li>',
  p_theme_id  => 313,
  p_theme_class_id => 1,
  p_reference_id=> 524960728083821695,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 524966905844909922 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr class="grid-row highl">',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 524967814420909923
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="grid-data" headers="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 524967814420909923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div class="grid grid-borderless">'||unistr('\000a')||
'<table class="grid-table" #REPORT_ATTRIBUTES#>',
  p_row_template_after_rows =>'<ul class="pagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="report-links">#EXTERNAL_LINK##CSV_LINK#</div>'||unistr('\000a')||
'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="grid-header grid-default" #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'<span class="text">#TEXT#</span>',
  p_next_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT#"><i class="icon-arrow-right"></i></a></li>',
  p_previous_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS#"><i class="icon-arrow-left"></i></a></li>',
  p_next_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT_SET#"><i class="icon-arrow-right"></i></a></li>',
  p_previous_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS_SET#"><i class="icon-arrow-left"></i></a></li>',
  p_theme_id  => 313,
  p_theme_class_id => 4,
  p_reference_id=> 524961636659821696,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 524967814420909923 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr class="grid-row highl">',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 524968105397909923
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="grid-data odd" headers="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_VALUE#</td>';

c2:=c2||'<td class="grid-data even" headers="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 524968105397909923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div class="grid grid-borderless alternating-row-colors">'||unistr('\000a')||
'<table class="grid-table" #REPORT_ATTRIBUTES#>',
  p_row_template_after_rows =>'<ul class="pagination">'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="report-links">#EXTERNAL_LINK##CSV_LINK#</div>'||unistr('\000a')||
'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="grid-header grid-default" #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'EVEN_ROW_NUMBERS',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_pagination_template=>'<span class="text">#TEXT#</span>',
  p_next_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT#"><i class="icon-arrow-right"></i></a></li>',
  p_previous_page_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS#"><i class="icon-arrow-left"></i></a></li>',
  p_next_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_NEXT_SET#"><i class="icon-arrow-right"></i></a></li>',
  p_previous_set_template=>'<li><a href="#LINK#" class="btn btn-default" title="#PAGINATION_PREVIOUS_SET#"><i class="icon-arrow-left"></i></a></li>',
  p_theme_id  => 313,
  p_theme_class_id => 5,
  p_reference_id=> 524961927636821696,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 524968105397909923 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr class="grid-row highl">',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/without_label
prompt  ......label template 524974101484909928
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 524974101484909928 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Without label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#">',
  p_template_body2=>'</label>',
  p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">',
  p_after_item=>'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>',
  p_theme_id  => 313,
  p_theme_class_id => 13,
  p_reference_id=> 524967923723821701,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label
prompt  ......label template 524974226398909928
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 524974226398909928 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#">',
  p_template_body2=>'</label>',
  p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">',
  p_after_item=>'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>',
  p_theme_id  => 313,
  p_theme_class_id => 3,
  p_reference_id=> 524968048637821701,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label_with_help
prompt  ......label template 524974313433909928
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 524974313433909928 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional label with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><a href="javascript:afw.afw_21.actio_dynmq.aide_page_item.afich(''#CURRENT_ITEM_ID#'');" tabindex="-1">',
  p_template_body2=>'</a></label>',
  p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">',
  p_after_item=>'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>',
  p_theme_id  => 313,
  p_theme_class_id => 1,
  p_reference_id=> 524968135672821701,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label
prompt  ......label template 524974408168909928
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 524974408168909928 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><span class="indic_champ_oblig">*</span><span class="texte_champ_oblig">',
  p_template_body2=>'</span></label>',
  p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">',
  p_after_item=>'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>',
  p_theme_id  => 313,
  p_theme_class_id => 4,
  p_reference_id=> 524968230407821701,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label_with_help
prompt  ......label template 524974512028909928
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 524974512028909928 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required label with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><span class="indic_champ_oblig">*</span><span class="texte_champ_oblig"><a href="javascript:afw.afw_21.actio_dynmq.aide_page_item.afich(''#CURRENT_ITEM_ID#'')" tabindex="-1">',
  p_template_body2=>'</a></span></label>',
  p_before_item=>'<div id="#CURRENT_ITEM_CONTAINER_ID#" class="form-group #CURRENT_FORM_ELEMENT#">',
  p_after_item=>'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<div class="alert alert-danger">#ERROR_MESSAGE#</div>',
  p_theme_id  => 313,
  p_theme_class_id => 2,
  p_reference_id=> 524968334267821701,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 524977918350909932
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 524977918350909932 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Recherche',
  p_page_html_head=>'<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'&A_AFW_11_TEMPL_JAVSC_CORE_1.'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'&A_AFW_11_TEMPL_THEME_JQUER_UI.'||unistr('\000a')||
'<!-- AFW - JavaScript - Core -->'||unistr('\000a')||
'&A_AFW_11_TEMPL_JAVSC_CORE_2. '||unistr('\000a')||
'&A_AFW_11_TEMPL_JAVSC_JQUER.',
  p_page_body_attr=>'class="&A_AFW_11_JQUER_UI_CSS_SCOPE."',
  p_before_field_text=>'<div class="panel panel-default">'||unistr('\000a')||
'<div class="panel-heading">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Rechercher',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Fermer',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Suivant >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Précédent',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>'||unistr('\000a')||
'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<div class="pagination"><span class="text">Rangée(s) #FIRST_ROW# - #LAST_ROW#</span></div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="panel panel-default">'||unistr('\000a')||
'<div class="panel-heading">',
  p_theme_id  => 313,
  p_theme_class_id => 1,
  p_reference_id       => 524971740589821705,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>'||unistr('\000a')||
'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 524977604587909932
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 524977604587909932 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th id="#DY#" scope="col" class="uCalDayCol">#IDAY#</th>',
  p_month_title_format=> '<div class="uCal">'||unistr('\000a')||
'<h1 class="uMonth">#IMONTH# <span>#YYYY#</span></h1>',
  p_month_open_format=> '<table class="uCal" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">',
  p_month_close_format=> '</table>'||unistr('\000a')||
'<div class="uCalFooter"></div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'',
  p_day_title_format=> '<span class="uDayTitle">#DD#</span>',
  p_day_open_format=> '<td class="uDay" headers="#DY#">#TITLE_FORMAT#<div class="uDayData">#DATA#</div>',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td class="uDay today" headers="#DY#">#TITLE_FORMAT#<div class="uDayData">#DATA#</div>',
  p_weekend_title_format=> '<span class="uDayTitle weekendday">#DD#</span>',
  p_weekend_open_format => '<td class="uDay" headers="#DY#">#TITLE_FORMAT#<div class="uDayData">#DATA#</div>',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<span class="uDayTitle">#DD#</span>',
  p_nonday_open_format => '<td class="uDay nonday" headers="#DY#">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr>',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<div class="uCal uCalWeekly">'||unistr('\000a')||
'<h1 class="uMonth">#WTITLE#</h1>',
  p_weekly_day_of_week_format => '<th scope="col" class="aCalDayCol" id="#DY#">'||unistr('\000a')||
'  <span class="visible-desktop">#DD# #IDAY#</span>'||unistr('\000a')||
'  <span class="hidden-desktop">#DD# <em>#IDY#</em></span>'||unistr('\000a')||
'</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="uCal">',
  p_weekly_month_close_format => '</table>'||unistr('\000a')||
'<div class="uCalFooter"></div>'||unistr('\000a')||
'</div>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="uDay" headers="#DY#"><div class="uDayData">',
  p_weekly_day_close_format => '</div></td>',
  p_weekly_today_open_format => '<td class="uDay today" headers="#DY#"><div class="uDayData">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td class="uDay weekend" headers="#DY#"><div class="uDayData">',
  p_weekly_weekend_close_format => '</div></td>',
  p_weekly_time_open_format => '<th scope="row" class="uCalHour">',
  p_weekly_time_close_format => '</th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th scope="col" id="#DY#" class="aCalDayCol">#IDAY#</th>',
  p_daily_month_title_format => '<div class="uCal uCalWeekly uCalDaily">'||unistr('\000a')||
'<h1 class="uMonth">#IMONTH# #DD#, #YYYY#</h1>',
  p_daily_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="uCal">',
  p_daily_month_close_format => '</table>'||unistr('\000a')||
'<div class="uCalFooter"></div>'||unistr('\000a')||
'</div>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td class="uDay" headers="#DY#"><div class="uDayData">',
  p_daily_day_close_format => '</div></td>',
  p_daily_today_open_format => '<td class="uDay today" headers="#DY#"><div class="uDayData">',
  p_daily_time_open_format => '<th scope="row" class="uCalHour" id="#TIME#">',
  p_daily_time_close_format => '</th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '<ul class="listCalendar">'||unistr('\000a')||
'  <li class="monthHeader">'||unistr('\000a')||
'    <h1>#IMONTH# #YYYY#</h1>'||unistr('\000a')||
'  </li>'||unistr('\000a')||
'  #DAYS#'||unistr('\000a')||
'  <li class="listEndCap"></li>'||unistr('\000a')||
'</ul>',
  p_agenda_past_day_format => '  <li class="dayHeader past">'||unistr('\000a')||
'    <h2>#IDAY# <span>#IMONTH# #DD#</span></h2>'||unistr('\000a')||
'  </li>',
  p_agenda_today_day_format => '  <li class="dayHeader today">'||unistr('\000a')||
'    <h2>#IDAY# <span>#IMONTH# #DD#</span></h2>'||unistr('\000a')||
'  </li>',
  p_agenda_future_day_format => '  <li class="dayHeader future">'||unistr('\000a')||
'    <h2>#IDAY# <span>#IMONTH# #DD#</span></h2>'||unistr('\000a')||
'  </li>',
  p_agenda_past_entry_format => '  <li class="dayData past">#DATA#</li>',
  p_agenda_today_entry_format => '  <li class="dayData today">#DATA#</li>',
  p_agenda_future_entry_format => '  <li class="dayData future">#DATA#</li>',
  p_month_data_format => '#DAYS#',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => 313,
  p_theme_class_id => 1,
  p_reference_id=> 524971426826821705);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/afw_bootstrap_3_0_0
prompt  ......theme 524978104023909933
begin
wwv_flow_api.create_theme (
  p_id =>524978104023909933 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 313,
  p_theme_name=>'AFW - Bootstrap 3.0.0',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>524953205486909904 + wwv_flow_api.g_id_offset,
  p_error_template=>524955518072909908 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>null + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>524954005030909905 + wwv_flow_api.g_id_offset,
  p_default_button_template=>524977216008909931 + wwv_flow_api.g_id_offset,
  p_default_region_template=>524965416965909917 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>null + wwv_flow_api.g_id_offset,
  p_default_form_template  =>524962113410909915 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>524965118194909917 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>524961827980909915 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>524958215716909911 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>null + wwv_flow_api.g_id_offset,
  p_default_listr_template=>524965118194909917 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>524965703902909917 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>524968105397909923 + wwv_flow_api.g_id_offset,
  p_default_label_template=>524974226398909928 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>null + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>524977604587909932 + wwv_flow_api.g_id_offset,
  p_default_list_template=>null + wwv_flow_api.g_id_offset,
  p_default_option_label=>524974313433909928 + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>524974512028909928 + wwv_flow_api.g_id_offset);
end;
/
 
begin
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
end;
/
begin
wwv_flow_api.create_theme_image(
  p_id =>524978104023909933 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 313,
  p_varchar2_table=> wwv_flow_api.g_varchar2_table,
  p_mimetype=> '');
end;
/
prompt  ...theme styles
--
 
begin
 
null;
 
end;
/

prompt  ...theme display points
--
 
begin
 
null;
 
end;
/

prompt  ...build options
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 1000007
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...text messages
--
prompt  ......Message apex_authorization_access_denied_application
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Accès refusé par la sécurité de l''application';

wwv_flow_api.create_message (
  p_id=>566281912655266458 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apex_authorization_access_denied_page
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Accès refusé par la sécurité page';

wwv_flow_api.create_message (
  p_id=>566283519416266461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apex_datepicker_value_invalid
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La valeur ne concorde pas avec le format %0.';

wwv_flow_api.create_message (
  p_id=>566286022742266463 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEX.DATEPICKER_VALUE_INVALID',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apex_go_to_error
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Accéder';

wwv_flow_api.create_message (
  p_id=>566289220994266465 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEX.GO_TO_ERROR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apex_number_field_value_invalid
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La valeur doit être numérique.';

wwv_flow_api.create_message (
  p_id=>566292418759266467 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apex_page_item_is_required
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Valeur obligatoire.';

wwv_flow_api.create_message (
  p_id=>566295611366266469 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEX.PAGE_ITEM_IS_REQUIRED',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_3d
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'3D';

wwv_flow_api.create_message (
  p_id=>566298822642266471 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_3D',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_actions_menu
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Menu d''actions';

wwv_flow_api.create_message (
  p_id=>566302032083266473 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ACTIONS_MENU',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_add
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Ajouter';

wwv_flow_api.create_message (
  p_id=>566305120805266476 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ADD',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_aggregate
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aggréger';

wwv_flow_api.create_message (
  p_id=>566307637976266482 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGGREGATE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_aggregation
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aggrégation';

wwv_flow_api.create_message (
  p_id=>566310825583266483 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGGREGATION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_agg_avg
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Moyenne22';

wwv_flow_api.create_message (
  p_id=>566314024132266486 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGG_AVG',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_agg_count
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Calculer';

wwv_flow_api.create_message (
  p_id=>566317238368266488 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGG_COUNT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_agg_median
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Médianne';

wwv_flow_api.create_message (
  p_id=>566320421798266489 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGG_MEDIAN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_agg_sum
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Somme';

wwv_flow_api.create_message (
  p_id=>566323612743266491 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGG_SUM',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_all
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Tout';

wwv_flow_api.create_message (
  p_id=>566326828748266493 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ALL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_all_columns
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Toutes les colonnes';

wwv_flow_api.create_message (
  p_id=>566330014226266497 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ALL_COLUMNS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_and
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'AND';

wwv_flow_api.create_message (
  p_id=>566333237959266502 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AND',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_apply
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Appliquer';

wwv_flow_api.create_message (
  p_id=>566336419568266504 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_APPLY',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_ascending
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Ascendant';

wwv_flow_api.create_message (
  p_id=>566339633509266506 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ASCENDING',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_as_of
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Il y a ';

wwv_flow_api.create_message (
  p_id=>566342843729266507 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AS_OF',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_between
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'entre (BETWEEN)';

wwv_flow_api.create_message (
  p_id=>566346019252266509 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_BETWEEN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_bgcolor
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Couleur de fond';

wwv_flow_api.create_message (
  p_id=>566349237475266510 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_BGCOLOR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_blue
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Bleu';

wwv_flow_api.create_message (
  p_id=>566352414725266512 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_BLUE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_bottom
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'En bas';

wwv_flow_api.create_message (
  p_id=>566355614358266515 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_BOTTOM',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_calendar
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Calendrier';

wwv_flow_api.create_message (
  p_id=>566358818278266516 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CALENDAR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_cancel
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Annuler';

wwv_flow_api.create_message (
  p_id=>566362013848266518 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CANCEL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_category
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Catégorie';

wwv_flow_api.create_message (
  p_id=>566365235749266520 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CATEGORY',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_cell
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Cellule';

wwv_flow_api.create_message (
  p_id=>566368431705266521 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CELL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_chart
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Graphique';

wwv_flow_api.create_message (
  p_id=>566371643603266524 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CHART',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_chart_initializing
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Initialisation...';

wwv_flow_api.create_message (
  p_id=>566374815879266526 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CHART_INITIALIZING',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_chart_type
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Type de graphique';

wwv_flow_api.create_message (
  p_id=>566378117597266529 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CHART_TYPE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_choose_download_format
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Choisir le format de téléchargement du rapport';

wwv_flow_api.create_message (
  p_id=>566381326257266532 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_clear
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'effacer';

wwv_flow_api.create_message (
  p_id=>566384526995266536 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CLEAR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_close
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Fermer';

wwv_flow_api.create_message (
  p_id=>566387733959266538 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CLOSE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonne';

wwv_flow_api.create_message (
  p_id=>566390933861266542 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COLUMN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_columns
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonnes';

wwv_flow_api.create_message (
  p_id=>566394115544266545 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COLUMNS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_column_heading
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Entête de la colonne';

wwv_flow_api.create_message (
  p_id=>566397320032266548 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COLUMN_HEADING',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_column_heading_menu
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Menu d''entête de colonne';

wwv_flow_api.create_message (
  p_id=>566400514450266550 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COLUMN_HEADING_MENU',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_contains
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'contient';

wwv_flow_api.create_message (
  p_id=>566403715796266553 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_CONTAINS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_doesnot_contain
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'ne contient pas';

wwv_flow_api.create_message (
  p_id=>566406938596266562 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_in
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'est dans (IN)';

wwv_flow_api.create_message (
  p_id=>566410130256266565 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_IN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_isnot_in_last
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'n''est pas dans le dernier';

wwv_flow_api.create_message (
  p_id=>566413323518266568 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_isnot_in_next
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'n''est pas dans le suivant';

wwv_flow_api.create_message (
  p_id=>566416514468266570 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_is_in_last
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'est dans le dernier';

wwv_flow_api.create_message (
  p_id=>566419724878266573 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_IS_IN_LAST',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_is_in_next
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'est dans le suivant';

wwv_flow_api.create_message (
  p_id=>566422821181266578 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_IS_IN_NEXT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_is_not_null
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'n''est pas nul (IS NOT NULL)';

wwv_flow_api.create_message (
  p_id=>566425317764266580 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_IS_NOT_NULL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_is_null
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'est nul (IS NULL)';

wwv_flow_api.create_message (
  p_id=>566428536907266582 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_IS_NULL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_like
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'comme (LIKE)';

wwv_flow_api.create_message (
  p_id=>566431723662266584 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_LIKE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_not_in
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'n''est pas dans (NOT IN)';

wwv_flow_api.create_message (
  p_id=>566434943357266587 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_NOT_IN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_not_like
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'pas comme (NOT LIKE)';

wwv_flow_api.create_message (
  p_id=>566438140827266591 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_NOT_LIKE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_regexp_like
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'expression dans';

wwv_flow_api.create_message (
  p_id=>566441313346266593 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_REGEXP_LIKE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_computation
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Calcul';

wwv_flow_api.create_message (
  p_id=>566444540187266596 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPUTATION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_computation_footer
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Créer un calcul en utilisant un alias pour les colonnes.'||unistr('\000a')||
'';

wwv_flow_api.create_message (
  p_id=>566447737768266599 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPUTATION_FOOTER',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_compute
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Calculer';

wwv_flow_api.create_message (
  p_id=>566450926781266601 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPUTE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_control_break
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Regroupement';

wwv_flow_api.create_message (
  p_id=>566454126592266617 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CONTROL_BREAK',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_control_breaks
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Regrouper';

wwv_flow_api.create_message (
  p_id=>566457335663266619 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CONTROL_BREAKS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_data_as_of
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Données telles qu''elle était il y a %0 minute(s)';

wwv_flow_api.create_message (
  p_id=>566460532440266621 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DATA_AS_OF',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_default
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Défaut';

wwv_flow_api.create_message (
  p_id=>566463729504266624 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DEFAULT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_delete
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Supprimer';

wwv_flow_api.create_message (
  p_id=>566466917119266627 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DELETE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_delete_confirm
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Voulez-vous vraiment supprimer cette paramétrisation?';

wwv_flow_api.create_message (
  p_id=>566470125568266629 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DELETE_CONFIRM',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_delete_confirm_js_dialog
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Voulez-vous vraiment supprimer cet enregistrement?';

wwv_flow_api.create_message (
  p_id=>566473311364266630 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DELETE_CONFIRM_JS_DIALOG',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_delete_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Effacer le rapport';

wwv_flow_api.create_message (
  p_id=>566476526077266632 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DELETE_REPORT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_descending
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Descendant';

wwv_flow_api.create_message (
  p_id=>566479712437266634 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DESCENDING',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_detail_view
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Détail';

wwv_flow_api.create_message (
  p_id=>566482914119266636 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DETAIL_VIEW',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_disable
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Désactiver';

wwv_flow_api.create_message (
  p_id=>566486112803266637 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISABLE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_disabled
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Désactivé';

wwv_flow_api.create_message (
  p_id=>566489315084266639 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISABLED',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_display
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Afficher';

wwv_flow_api.create_message (
  p_id=>566492528795266641 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISPLAY',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_displayed
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Affiché';

wwv_flow_api.create_message (
  p_id=>566495727036266642 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISPLAYED',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_displayed_columns
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonne(s) affichée(s)';

wwv_flow_api.create_message (
  p_id=>566498930990266645 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISPLAYED_COLUMNS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_display_in_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonne(s) à afficher';

wwv_flow_api.create_message (
  p_id=>566502116613266648 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISPLAY_IN_REPORT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_down
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Descendre';

wwv_flow_api.create_message (
  p_id=>566505338409266655 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DOWN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_download
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Télécharger';

wwv_flow_api.create_message (
  p_id=>566508513239266657 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DOWNLOAD',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_do_not_aggregate
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Ne pas aggréger -'||unistr('\000a')||
'';

wwv_flow_api.create_message (
  p_id=>566511716125266658 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DO_NOT_AGGREGATE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_do_not_display
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonne(s) à ne pas afficher';

wwv_flow_api.create_message (
  p_id=>566514939488266660 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DO_NOT_DISPLAY',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_edit_chart
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Modifier les paramètres du graphique';

wwv_flow_api.create_message (
  p_id=>566518134999266662 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EDIT_CHART',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_edit_chart2
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Paramètres du graphique';

wwv_flow_api.create_message (
  p_id=>566521341455266663 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EDIT_CHART2',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_edit_filter
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Modifier le filtre';

wwv_flow_api.create_message (
  p_id=>566524538216266666 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EDIT_FILTER',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_edit_highlight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Modifier la mise en évidence';

wwv_flow_api.create_message (
  p_id=>566527715732266668 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EDIT_HIGHLIGHT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_enable
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Activer';

wwv_flow_api.create_message (
  p_id=>566530933789266670 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ENABLE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_enabled
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Activé';

wwv_flow_api.create_message (
  p_id=>566534238078266671 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ENABLED',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_enable_disable_alt
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Activer/Désactiver';

wwv_flow_api.create_message (
  p_id=>566537424934266673 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ENABLE_DISABLE_ALT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_error
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Erreur';

wwv_flow_api.create_message (
  p_id=>566540629946266675 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ERROR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_examples
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Exemples';

wwv_flow_api.create_message (
  p_id=>566543538738266676 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EXAMPLES',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_exclude_null
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Exclure les valeurs nulles';

wwv_flow_api.create_message (
  p_id=>566546216538266677 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EXCLUDE_NULL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_filter
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Filtrer';

wwv_flow_api.create_message (
  p_id=>566549423761266679 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FILTER',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_filters
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Filtres';

wwv_flow_api.create_message (
  p_id=>566552624395266684 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FILTERS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_filter_type
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Type de filtre';

wwv_flow_api.create_message (
  p_id=>566555842544266686 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FILTER_TYPE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_finder_alt
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Choisir les colonnes pour la recherche';

wwv_flow_api.create_message (
  p_id=>566559011772266688 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FINDER_ALT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_flashback
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Retour en arrière';

wwv_flow_api.create_message (
  p_id=>566562238143266690 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FLASHBACK',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_flashback_description
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Une requête avec retour en arrière permet de voir les données telles qu''elles étaient au moment choisi.'||unistr('\000a')||
'';

wwv_flow_api.create_message (
  p_id=>566565428380266692 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FLASHBACK_DESCRIPTION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_flashback_error_msg
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Impossible d''exécutée la requête avec retour en arrière';

wwv_flow_api.create_message (
  p_id=>566568626637266694 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FLASHBACK_ERROR_MSG',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_format_mask
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Masque de saisie';

wwv_flow_api.create_message (
  p_id=>566571814683266696 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FORMAT_MASK',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_function
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Fonction';

wwv_flow_api.create_message (
  p_id=>566575027497266697 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FUNCTION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_functions
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Fonctions';

wwv_flow_api.create_message (
  p_id=>566578227176266699 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FUNCTIONS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_go
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rechercher';

wwv_flow_api.create_message (
  p_id=>566581426722266700 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_GO',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_green
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Vert';

wwv_flow_api.create_message (
  p_id=>566584637681266702 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_GREEN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_group_by
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Grouper par';

wwv_flow_api.create_message (
  p_id=>566587838278266704 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_GROUP_BY',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_group_by_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Grouper par colonne';

wwv_flow_api.create_message (
  p_id=>566591027558266706 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_GROUP_BY_COLUMN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_hcolumn
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonne horizontale';

wwv_flow_api.create_message (
  p_id=>566594234470266708 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HCOLUMN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aide';

wwv_flow_api.create_message (
  p_id=>566597416372266710 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_01
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Un rapport interactif affiche un jeu de colonne prédéterminé. Le rapport peut être personnalisé davantage avec l''utilisation d''un filtre initial, d''un tri par défaut, des bris, du surlignage, des calculs, des aggrégations et d''un graphique. Chaque rapport interactif peuvent donc être personnalisés davantage et les résultats peuvent être visionnés, téléchargés et la définition du rapport peut être ';

h:=h||'sauvegardé pour une utilisation ultérieure.<p/>Un rapport interactif peut est personnalisé à trois niveaux: la barre de recherche, le menu d''action et l''entête des menus.';

wwv_flow_api.create_message (
  p_id=>566600640144266712 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_01',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_actions_menu
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Le menu d''actions est utilisé pour personnaliser l''affchage de votre rapport interactif.';

wwv_flow_api.create_message (
  p_id=>566603825037266716 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_ACTIONS_MENU',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_aggregate
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Les aggrégations sont des calculs mathématiques applicables sur une colonne. Les aggrégations sont affichés après chaque bri et à la fin du rapport dans les colonnes sur lesquelles ils sont définis.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<ul><li><b>Aggréger</b> permet de sélectionner et d''éditer une aggrégation définie précédemment.</li>'||unistr('\000a')||
'<li><b>Fonction</b> est utilisé pour choisir la fonction qui sera appliquée (ex.: Somme, Minim';

h:=h||'um).</li>'||unistr('\000a')||
'<li><b>Colonne</b> est utilisé pour choisir la colonne sur laquelle on appliquera la fonction mathématique. Seulement les colonnes numériques seront affichées.</li></ul>';

wwv_flow_api.create_message (
  p_id=>566607030291266718 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_AGGREGATE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_chart
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Vous pouvez inclure un graphique pour chaque rapport interactif. Une fois défini, vous pouvez basculer entre la vue du graphique et celle du rapport en utilisant les liens sous la barre de recherche.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<ul><li><b>Type de graphique</b> identifie le type de graphique à inclure. Choisir entre barres horizontales, barres verticales, tarte ou lignes.</li>'||unistr('\000a')||
'<li><b>Libellé</b> identifie la colonne util';

h:=h||'isée pour le libellé.</li>'||unistr('\000a')||
'<li><b>Titre (axe des X)</b> identifie le titre affiché sur l''axe associé à la colonne sélectionnée pour le Libellé. Non disponible pour le graphique en tarte.</li>'||unistr('\000a')||
'<li><b>Valeur</b> identifie la colonne utilisée pour la valeur.</li>'||unistr('\000a')||
'<li><b>Titre (axe des Y)</b> identifie le titre affiché sur l''axe associé à la colonne sélectionnée pour la Valeur. Non disponible pour le ';

h:=h||'graphique en tarte.</li>'||unistr('\000a')||
'<li><b>Fonction</b> est une fonction facultative pouvant être appliquée sur la colonne sélectionnées pour la Valeur.</li></ul>';

wwv_flow_api.create_message (
  p_id=>566610238942266720 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_CHART',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_column_heading_menu
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Lorsqu''on clique sur un entête de colonne, un menu d''entête s''affiche.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<ul><li><b>Icône de tri ascendant</b> trie le rapport par cette colonne en ordre ascendant.</li>'||unistr('\000a')||
'<li><b>Icône de tri descendant</b> trie le rapport par cette colonne en ordre descendant.</li>'||unistr('\000a')||
'<li><b>Cacher colonne</b> cache la colonne.</li>'||unistr('\000a')||
'<li><b>Regroupement</b> crée un bri sur la colonne.</li>'||unistr('\000a')||
'<li><b>Aide</b> affiche l''';

h:=h||'aide à propose de la colonne.</li>'||unistr('\000a')||
'<li><b>Zone de texte</b> est utilisé pour saisir un critère recherche. Lorsqu''on saisi une valeur, la liste de valeurs au bas du menu va être réduite. Vous pouvez ensuite sélectionner une valeur dans le bas et cette valeur créera un filtre en utilisant ''='' (ex.: colonne = ''ABC''). Alternativement, vous pouvez cliquer sur l''icône de la lampe de poche et la valeur e';

h:=h||'ntrée créera un ''LIKE'' (ex.: colonne LIKE ''%ABC%'').'||unistr('\000a')||
'<li><b>Liste de valeurs uniques</b> contient les 500 premières valeurs uniques qui correspondent aux filtres. Si la colonne est une date, une liste de dates sera affichée. Vous pouvez sélectionner une valeur, un filtre sera créé en utilisant ''='' (ex.: colonne = ''ABC'').</li></ul>';

wwv_flow_api.create_message (
  p_id=>566613424253266722 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_control_break
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Utilisé pour créer un regroupement sur une ou plusieurs colonnes. On sort les colonnes du rapport interactif et on les affiche comme des colonnes de bri.';

wwv_flow_api.create_message (
  p_id=>566616636630266724 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_CONTROL_BREAK',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_download
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Permet de télécharger le jeu de données courant. Les types de fichiers disponibles diffèrent selon votre installation. Les différents types sont CSV, XLS, PDF et RTF.';

wwv_flow_api.create_message (
  p_id=>566619816095266726 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_DOWNLOAD',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_filter
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Sert à ajouter ou modifier un énoncé WHERE pour la requête. D''abord, choisir une colonne (il n''est pas nécessaire qu''elle soit affichée), choisir parmi la liste des opérateurs Oracle (=, !=, not in, between), saisir une expression pour la comparaison. L''expression est sensible à la casse et vous pouvez utiliser % comme caractère de remplacement (ex.: NOM_PROVINCE like Q%).';

wwv_flow_api.create_message (
  p_id=>566623018469266728 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_FILTER',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_flashback
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Exécute une requête de « retour en arrière » permettant de voir les données telles qu''elles étaient dans le passé à un moment donné. Le « retour en arrière » par défaut est de 3 heures (ou 180 minutes) mais ce chiffre diffère selon la base de données.';

wwv_flow_api.create_message (
  p_id=>566626236039266730 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_FLASHBACK',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_highlight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La mise en évidence définit un filtre. Les rangées qui correspondent au filtre sont mises en évidence en utilisant les caractéristiques associées au filtre.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<ul><li><b>Nom</b> est utilisé seulement pour l''affichage.</li>'||unistr('\000a')||
'<li><b>Séquence</b> identifie l''ordre dans lequel sera évalué les règles.</li>'||unistr('\000a')||
'<li><b>Actif</b> identifie si la règle est activée ou désactivée.</li>'||unistr('\000a')||
'<li><b>Type de mise en é';

h:=h||'vidence</b> identifie si ce sera la rangée ou la cellule qui sera mise en évidence.</li>'||unistr('\000a')||
'<li><b>Couleur d''arrière plan</b> est la couleur utilisée pour mettre en évidence une zone.</li>'||unistr('\000a')||
'<li><b>Couleur de texte</b> est la couleur utilisée pour mettre en évidence le texte d''une zone.</li>'||unistr('\000a')||
'<li><b>Conditions de la mise en évidence</b> définit les conditions du filtre.</li></ul>';

wwv_flow_api.create_message (
  p_id=>566629435321266731 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_HIGHLIGHT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_report_settings
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Si vous avez personnalisé votre rapport interactif, les paramètres seront affichés en-dessous la barre de recherche et au-dessus du rapport. Si vous avez sauvegardés des rapports personnalisés, ils s''afficheront sous la forme d''onglets. Vous pouvez accéder aux vues alternatives en cliquant sur les onglets. Les paramètres du rapport seront affichés sous les onglets. Cette zone peut être ouverte ou ';

h:=h||'fermée en utilisant l''icône à gauche.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'Pour chaque paramètre du rapport, vous pouvez:'||unistr('\000a')||
'<ul><li><b>Éditer</b> en cliquant le nom.</li>'||unistr('\000a')||
'<li><b>Désactiver/Activer</b> en cochant la boîte d''activation et de désactivation. On utilise cette option pour activer/désactiver temporairement un paramètre.</li>'||unistr('\000a')||
'<li><b>Supprimer</b> en cliquant l''icône de suppression. On utilise cette option pour supprimer u';

h:=h||'n paramètre de façon permanente.</li></ul>'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'Si vous avez créé un graphique, vous pouvez basculter entre le rapport et le graphique en utilisant les liens à droite. Si vous êtes entrain de visionner un graphique, vous pouvez utiliser le lien d''édition pour éditer les paramètres du graphique.';

wwv_flow_api.create_message (
  p_id=>566632615299266735 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_REPORT_SETTINGS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_reset
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Réinitialiser le rapport avec les paramètres initiaux, supprimer toutes les personnalisations que vous avez fait.';

wwv_flow_api.create_message (
  p_id=>566635820610266737 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_RESET',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_save_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Sauvegarde le rapport personnalisé pour une utilisation utltérieure. Vous devez fournir un nom et une description optionnelle.';

wwv_flow_api.create_message (
  p_id=>566639011364266738 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_SAVE_REPORT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_search_bar
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Au dessus de chaque rapport, il y a une région de recherche. Cette région contient ces fonctionnalités:'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<ul><li><b>L''icône de colonnes</b> permet de choisir sur quelle(s) colonne(s) rechercher.</li>'||unistr('\000a')||
'<li><b>Zone de texte</b> permet de faire une recherche non sensible sur la casse (pas besoin d''utiliser des caractères de remplacement).</li>'||unistr('\000a')||
'<li><b>Rows</b> selects the number of records to displ';

h:=h||'ay per page.</li>'||unistr('\000a')||
'<li><b>Bouton [Rechercher]</b> exécute la recherche.</li>'||unistr('\000a')||
'<li><b>L''icône du menu des actions</b> affiche le menu des actions.</li></ul>'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'Veuillez noter que ce ne sont pas toutes les fonctionnalités qui sont disponibles pour chaque rapport.';

wwv_flow_api.create_message (
  p_id=>566642215598266745 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_SEARCH_BAR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_select_columns
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Utilisé pour modifier les colonnes affichées. Les colonnes à droite sont affichées. Les colonnes à gauche sont cachés. Vous pouvez repositionner les colonnes affichées en utilisant les flèches à l''extrême droite. Les colonnes calculées sont préfixées par <b>**</b>.';

wwv_flow_api.create_message (
  p_id=>566645440055266747 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_SELECT_COLUMNS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_sort
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Utilisé pour changer l''ordonnancement des colonnes (ascandant et descandat). Vous pouvez aussi spécifier commet gérer les valeurs nulles (utilise le paramètre par défaut, toujours afficher en premier ou en dernier). Une icône affichera le type de tri à la droite de l''entête d''une colonne.';

wwv_flow_api.create_message (
  p_id=>566648634220266748 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_SORT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_hide_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Cacher colonne';

wwv_flow_api.create_message (
  p_id=>566651838669266752 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HIDE_COLUMN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_highlight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Mettre en évidence';

wwv_flow_api.create_message (
  p_id=>566655026220266754 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HIGHLIGHT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_highlight_condition
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Condition de mise en évidence';

wwv_flow_api.create_message (
  p_id=>566658225715266756 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HIGHLIGHT_CONDITION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_highlight_type
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Type de mise en évidence';

wwv_flow_api.create_message (
  p_id=>566661436893266757 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HIGHLIGHT_TYPE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_highlight_when
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Mis en évidence quand';

wwv_flow_api.create_message (
  p_id=>566664631289266759 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HIGHLIGHT_WHEN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_interactive_report_help
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aide pour le rapport interactif';

wwv_flow_api.create_message (
  p_id=>566667839149266761 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_INTERACTIVE_REPORT_HELP',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_invalid
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Invalide';

wwv_flow_api.create_message (
  p_id=>566671027438266766 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_INVALID',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_invalid_computation
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Expression de calcul invalide';

wwv_flow_api.create_message (
  p_id=>566674227723266769 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_INVALID_COMPUTATION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_keypad
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Touche du clavier numérique';

wwv_flow_api.create_message (
  p_id=>566677422370266771 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_KEYPAD',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_label
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Libellé';

wwv_flow_api.create_message (
  p_id=>566680615079266774 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LABEL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_label_axis_title
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Titre (axe des X)';

wwv_flow_api.create_message (
  p_id=>566683623586266776 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LABEL_AXIS_TITLE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_move
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Déplacer';

wwv_flow_api.create_message (
  p_id=>566686327311266778 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_MOVE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_move_all
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Déplacer tout';

wwv_flow_api.create_message (
  p_id=>566689533790266781 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_MOVE_ALL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_name
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Nom';

wwv_flow_api.create_message (
  p_id=>566692734515266782 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NAME',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_new_aggregation
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Nouvelle aggrégation';

wwv_flow_api.create_message (
  p_id=>566695914021266786 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEW_AGGREGATION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_new_category
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Nouvelle catégorie -';

wwv_flow_api.create_message (
  p_id=>566699112225266790 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEW_CATEGORY',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_new_computation
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Nouveau calcul';

wwv_flow_api.create_message (
  p_id=>566702343398266795 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEW_COMPUTATION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_no
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Non';

wwv_flow_api.create_message (
  p_id=>566705535624266798 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NO',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_none
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Aucun -';

wwv_flow_api.create_message (
  p_id=>566708720112266800 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NONE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_no_aggregation_defined
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aucune aggrégation définie';

wwv_flow_api.create_message (
  p_id=>566711913305266806 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NO_AGGREGATION_DEFINED',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_no_computation_defined
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aucun calcul défini';

wwv_flow_api.create_message (
  p_id=>566715117778266812 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NO_COMPUTATION_DEFINED',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_nulls_always_first
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Valeur nulle toujours au début';

wwv_flow_api.create_message (
  p_id=>566718343616266814 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NULLS_ALWAYS_FIRST',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_nulls_always_last
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Valeur nulle toujours à la fin';

wwv_flow_api.create_message (
  p_id=>566721519195266821 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NULLS_ALWAYS_LAST',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_null_sorting
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Trier valeur nulle';

wwv_flow_api.create_message (
  p_id=>566724717358266825 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NULL_SORTING',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_numeric_flashback_time
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Le moment du retour en arrière doit être numérique';

wwv_flow_api.create_message (
  p_id=>566727943322266827 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_numeric_sequence
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La séquence doit être numérique';

wwv_flow_api.create_message (
  p_id=>566731139666266831 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NUMERIC_SEQUENCE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_num_rows
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangées';

wwv_flow_api.create_message (
  p_id=>566734342877266833 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NUM_ROWS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_operator
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Opérateur';

wwv_flow_api.create_message (
  p_id=>566737532697266836 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_OPERATOR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_other
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Autre';

wwv_flow_api.create_message (
  p_id=>566740731317266838 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_OTHER',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_red
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rouge';

wwv_flow_api.create_message (
  p_id=>566743926453266841 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_RED',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enlever';

wwv_flow_api.create_message (
  p_id=>566747113200266843 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_aggregate
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enlever toutes les aggrégations';

wwv_flow_api.create_message (
  p_id=>566750323603266855 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_AGGREGATE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_all
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enlever tout';

wwv_flow_api.create_message (
  p_id=>566753512861266858 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_ALL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_control_break
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enlever le regroupement';

wwv_flow_api.create_message (
  p_id=>566756728162266860 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_CONTROL_BREAK',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_filter
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Supprimer filtre';

wwv_flow_api.create_message (
  p_id=>566759937546266865 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_FILTER',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_flashback
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Supprimer Retour en arrière';

wwv_flow_api.create_message (
  p_id=>566763141394266869 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_FLASHBACK',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_highlight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Supprimer la mise en évidence';

wwv_flow_api.create_message (
  p_id=>566766340552266872 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_HIGHLIGHT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_report_settings
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Paramètres d''un rapport';

wwv_flow_api.create_message (
  p_id=>566769524945266880 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REPORT_SETTINGS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_reset
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Réinitialiser';

wwv_flow_api.create_message (
  p_id=>566771915428266882 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_RESET',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_reset_confirm
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Réinitialiser le rapport avec les paramètres initiaux.';

wwv_flow_api.create_message (
  p_id=>566775127822266884 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_RESET_CONFIRM',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_row
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangée';

wwv_flow_api.create_message (
  p_id=>566778324655266887 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ROW',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_rows
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangées';

wwv_flow_api.create_message (
  p_id=>566781518457266890 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ROWS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_rows_per_page
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangées par page';

wwv_flow_api.create_message (
  p_id=>566784731702266892 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ROWS_PER_PAGE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_row_text_contains
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La rangée contient';

wwv_flow_api.create_message (
  p_id=>566787911681266898 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ROW_TEXT_CONTAINS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_save
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Appliquer';

wwv_flow_api.create_message (
  p_id=>566791128009266902 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_saved_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rapport sauvé';

wwv_flow_api.create_message (
  p_id=>566794331860266903 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVED_REPORT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_saved_report_msg
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rapport sauvé = "%0"';

wwv_flow_api.create_message (
  p_id=>566797528888266906 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVED_REPORT_MSG',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_save_as_default
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Sauvegardée en tant que valeur par défaut';

wwv_flow_api.create_message (
  p_id=>566800743265266919 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVE_AS_DEFAULT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_save_default_confirm
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La paramétrisation du rapport courant est utilisée comme valeur par défaut pour tous les utilisateurs';

wwv_flow_api.create_message (
  p_id=>566803936656266920 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_save_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enregistrer rapport';

wwv_flow_api.create_message (
  p_id=>566807111512266922 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVE_REPORT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_search_bar
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Barre de recherche';

wwv_flow_api.create_message (
  p_id=>566810336545266924 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SEARCH_BAR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_category
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Choisir catégorie -';

wwv_flow_api.create_message (
  p_id=>566813530535266926 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_CATEGORY',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Choisir une colonne -';

wwv_flow_api.create_message (
  p_id=>566816725370266927 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_COLUMN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_columns
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Choisir colonnes';

wwv_flow_api.create_message (
  p_id=>566819923582266929 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_COLUMNS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_function
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Choisir fonction -';

wwv_flow_api.create_message (
  p_id=>566823140203266931 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_FUNCTION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_sort_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Choisir une colonne -';

wwv_flow_api.create_message (
  p_id=>566826334027266932 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_SORT_COLUMN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_value
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Valeur sélectionnée';

wwv_flow_api.create_message (
  p_id=>566829523201266934 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_VALUE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_sequence
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Séquence';

wwv_flow_api.create_message (
  p_id=>566832724670266936 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SEQUENCE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_sort
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Trier';

wwv_flow_api.create_message (
  p_id=>566835914124266937 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SORT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_sort_ascending
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Tri ascendant';

wwv_flow_api.create_message (
  p_id=>566839137477266940 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SORT_ASCENDING',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_sort_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Trier par colonne';

wwv_flow_api.create_message (
  p_id=>566842315163266941 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SORT_COLUMN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_sort_descending
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Tri descendant';

wwv_flow_api.create_message (
  p_id=>566845525648266943 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SORT_DESCENDING',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_space_as_in_one_empty_string
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'espace';

wwv_flow_api.create_message (
  p_id=>566848719613266947 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_status
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Statut';

wwv_flow_api.create_message (
  p_id=>566851913357266949 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_STATUS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_text_color
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Couleur du texte';

wwv_flow_api.create_message (
  p_id=>566855140545266952 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_TEXT_COLOR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_top
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'En haut';

wwv_flow_api.create_message (
  p_id=>566858326123266955 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_TOP',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_up
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Monter';

wwv_flow_api.create_message (
  p_id=>566861541173266959 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_UP',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_value
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Valeur';

wwv_flow_api.create_message (
  p_id=>566864721178266961 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VALUE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_value_axis_title
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Titre (axe des Y)';

wwv_flow_api.create_message (
  p_id=>566867929066266963 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VALUE_AXIS_TITLE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_view_chart
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Voir graphique';

wwv_flow_api.create_message (
  p_id=>566871114441266967 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VIEW_CHART',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_view_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Voir tableau';

wwv_flow_api.create_message (
  p_id=>566874319278266970 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VIEW_REPORT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_view_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Voir tableau';

wwv_flow_api.create_message (
  p_id=>566877543654266972 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VIEW_REPORT ',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_working_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Vue générale';

wwv_flow_api.create_message (
  p_id=>566880730256266974 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_WORKING_REPORT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_yellow
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Jaune';

wwv_flow_api.create_message (
  p_id=>566883933216266975 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_YELLOW',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_yes
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Oui';

wwv_flow_api.create_message (
  p_id=>566886514206266977 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_YES',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_item_invalid_format
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Le format de la valeur du champ <span class="t18Requiredlabel">%label</span> est invalide ("%0" (ex. %1))';

wwv_flow_api.create_message (
  p_id=>566889619463266978 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_ITEM_INVALID_FORMAT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_item_invalid_format_inline
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Format "%0"<br>ex. %1';

wwv_flow_api.create_message (
  p_id=>566892816841266980 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_ITEM_INVALID_FORMAT_INLINE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_item_less_or_equal
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La valeur du champ <span class="t18Requiredlabel">%label</span> doit être inférieure ou égale à la valeur "<b>%0</b>"';

wwv_flow_api.create_message (
  p_id=>566896015497266982 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_ITEM_LESS_OR_EQUAL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_item_less_or_equal_inline
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Doit être inférieure ou<br/>égale à "<b>%0</b>"';

wwv_flow_api.create_message (
  p_id=>566899242207266983 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_ITEM_LESS_OR_EQUAL_INLINE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_item_required
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La valeur du champ <span class="t18Requiredlabel">%label</span> est obligatoire';

wwv_flow_api.create_message (
  p_id=>566902439862266985 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_ITEM_REQUIRED',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_item_required_inline
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'est obligatoire';

wwv_flow_api.create_message (
  p_id=>566905615822266986 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_ITEM_REQUIRED_INLINE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_tabform_column_required
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%label est obligatoire';

wwv_flow_api.create_message (
  p_id=>566908814140266988 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_TABFORM_COLUMN_REQUIRED',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_tabform_greater_or_equal
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La valeur du champ %label doit être supérieure ou égale à la valeur "<b>%0</b>"';

wwv_flow_api.create_message (
  p_id=>566912042727266990 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_TABFORM_GREATER_OR_EQUAL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_tabform_invalid_format
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Le format de la valeur du champ <span class="t18Requiredlabel">%label</span> est invalide ("%0" (ex. %1))';

wwv_flow_api.create_message (
  p_id=>566915221002266991 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_TABFORM_INVALID_FORMAT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_tabform_less_or_equal
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La valeur du champ <span class="t18Requiredlabel">%label</span> doit être inférieure ou égale à la valeur "<b>%0</b>"';

wwv_flow_api.create_message (
  p_id=>566918442935266993 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_TABFORM_LESS_OR_EQUAL',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexlib_tabform_row_prefix
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangée %0:';

wwv_flow_api.create_message (
  p_id=>566921637968266995 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXLIB_TABFORM_ROW_PREFIX',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message flow_single_validation_error
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'<b>Il s''est produit une erreur :</b>';

wwv_flow_api.create_message (
  p_id=>566924842254266996 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FLOW.SINGLE_VALIDATION_ERROR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message flow_validation_error
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'<b>Il s''est produit %0 erreurs :</b>';

wwv_flow_api.create_message (
  p_id=>566928031613266998 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FLOW.VALIDATION_ERROR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message form_of
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 de %1';

wwv_flow_api.create_message (
  p_id=>566931237116267000 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FORM_OF',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message out_of_range
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La plage de données est invalide.';

wwv_flow_api.create_message (
  p_id=>566934419007267002 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'OUT_OF_RANGE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message pagination_next
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Suivant';

wwv_flow_api.create_message (
  p_id=>566937623246267004 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGINATION.NEXT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message pagination_previous
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Précédent';

wwv_flow_api.create_message (
  p_id=>566940830853267006 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGINATION.PREVIOUS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message reset
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Réinitialiser';

wwv_flow_api.create_message (
  p_id=>566944024340267008 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'RESET',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message since_minutes_ago
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'minutes.';

wwv_flow_api.create_message (
  p_id=>566947241855267009 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'SINCE_MINUTES_AGO',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message wwv_render_report3_sort_by_this_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Trier par cette colonne';

wwv_flow_api.create_message (
  p_id=>566950422429267012 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message wwv_render_report3_x_y_of_more_than_z
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangée(s) %0 - %1 de plus que %2';

wwv_flow_api.create_message (
  p_id=>566953632155267015 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message wwv_render_report3_x_y_of_z
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangée(s) %0 - %1 de %2';

wwv_flow_api.create_message (
  p_id=>566956819321267017 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message wwv_render_report3_x_y_of_z_2
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 - %1 de %2';

wwv_flow_api.create_message (
  p_id=>566960016009267019 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_download
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Permet de télécharger le jeu de données courant. Les types de fichiers disponibles diffèrent selon votre installation. Les différents types sont CSV, XLS, PDF et RTF.';

wwv_flow_api.create_message (
  p_id=>1106045329314907952 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_DOWNLOAD',
  p_message_language=>'fr_ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_view_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Voir tableau';

wwv_flow_api.create_message (
  p_id=>1109907112839125031 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VIEW_REPORT ',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_add
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Add';

wwv_flow_api.create_message (
  p_id=>1109907231647125031 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ADD',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_aggregate
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aggréger';

wwv_flow_api.create_message (
  p_id=>1109907317152125031 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGGREGATE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_aggregation
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aggrégation';

wwv_flow_api.create_message (
  p_id=>1109907406305125031 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGGREGATION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_agg_avg
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Moyenne';

wwv_flow_api.create_message (
  p_id=>1109907518664125031 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGG_AVG',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_agg_count
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Calculer';

wwv_flow_api.create_message (
  p_id=>1109907625746125031 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGG_COUNT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_agg_median
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Médianne';

wwv_flow_api.create_message (
  p_id=>1109907734208125031 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGG_MEDIAN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_agg_sum
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Somme';

wwv_flow_api.create_message (
  p_id=>1109907812443125031 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AGG_SUM',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_all
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Tout';

wwv_flow_api.create_message (
  p_id=>1109907925880125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ALL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_all_columns
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Toutes les colonnes';

wwv_flow_api.create_message (
  p_id=>1109908029906125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ALL_COLUMNS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_and
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'AND';

wwv_flow_api.create_message (
  p_id=>1109908102563125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AND',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_apply
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Save';

wwv_flow_api.create_message (
  p_id=>1109908207337125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_APPLY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_ascending
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Ascendant';

wwv_flow_api.create_message (
  p_id=>1109908302299125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ASCENDING',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_as_of
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Il y a ';

wwv_flow_api.create_message (
  p_id=>1109908409578125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_AS_OF',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_between
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'entre (BETWEEN)';

wwv_flow_api.create_message (
  p_id=>1109908509388125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_BETWEEN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_bgcolor
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Couleur de fond';

wwv_flow_api.create_message (
  p_id=>1109908612683125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_BGCOLOR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_blue
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Bleu';

wwv_flow_api.create_message (
  p_id=>1109908704545125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_BLUE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_bottom
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'En bas';

wwv_flow_api.create_message (
  p_id=>1109908834040125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_BOTTOM',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_calendar
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Calendar';

wwv_flow_api.create_message (
  p_id=>1109908907049125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CALENDAR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_cancel
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Cancel';

wwv_flow_api.create_message (
  p_id=>1109909026029125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CANCEL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_category
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Category';

wwv_flow_api.create_message (
  p_id=>1109909133421125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CATEGORY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_cell
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Cellule';

wwv_flow_api.create_message (
  p_id=>1109909226925125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CELL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_chart
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Graphique';

wwv_flow_api.create_message (
  p_id=>1109909311414125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CHART',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_chart_initializing
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Initialisation...';

wwv_flow_api.create_message (
  p_id=>1109909406849125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CHART_INITIALIZING',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_chart_type
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Type de graphique';

wwv_flow_api.create_message (
  p_id=>1109909518883125032 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CHART_TYPE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_choose_download_format
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Choisir le format de téléchargement du rapport';

wwv_flow_api.create_message (
  p_id=>1109909628549125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_close
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Fermer';

wwv_flow_api.create_message (
  p_id=>1109909731951125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CLOSE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Column';

wwv_flow_api.create_message (
  p_id=>1109909831903125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COLUMN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_columns
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonnes';

wwv_flow_api.create_message (
  p_id=>1109909927795125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COLUMNS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_column_heading
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Entête de la colonne';

wwv_flow_api.create_message (
  p_id=>1109910010567125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COLUMN_HEADING',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_contains
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'contient';

wwv_flow_api.create_message (
  p_id=>1109910131580125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_CONTAINS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_doesnot_contain
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'ne contient pas';

wwv_flow_api.create_message (
  p_id=>1109910229020125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_in
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'est dans (IN)';

wwv_flow_api.create_message (
  p_id=>1109910317603125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_IN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_isnot_in_last
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'n''est pas dans le dernier';

wwv_flow_api.create_message (
  p_id=>1109910403775125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_isnot_in_next
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'n''est pas dans le suivant';

wwv_flow_api.create_message (
  p_id=>1109910534040125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_is_in_last
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'est dans le dernier';

wwv_flow_api.create_message (
  p_id=>1109910622186125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_IS_IN_LAST',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_is_in_next
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'est dans le suivant';

wwv_flow_api.create_message (
  p_id=>1109910715553125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_IS_IN_NEXT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_is_not_null
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'n''est pas nul (IS NOT NULL)';

wwv_flow_api.create_message (
  p_id=>1109910805562125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_IS_NOT_NULL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_is_null
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'est nul (IS NULL)';

wwv_flow_api.create_message (
  p_id=>1109910921410125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_IS_NULL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_like
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'comme (LIKE)';

wwv_flow_api.create_message (
  p_id=>1109911002160125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_LIKE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_not_in
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'n''est pas dans (NOT IN)';

wwv_flow_api.create_message (
  p_id=>1109911113800125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_NOT_IN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_not_like
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'pas comme (NOT LIKE)';

wwv_flow_api.create_message (
  p_id=>1109911201859125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_NOT_LIKE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_comparison_regexp_like
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'expression dans';

wwv_flow_api.create_message (
  p_id=>1109911334440125034 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPARISON_REGEXP_LIKE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_computation
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Calcul';

wwv_flow_api.create_message (
  p_id=>1109911427818125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPUTATION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_computation_footer
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Créer un calcul en utilisant un alias pour les colonnes.'||unistr('\000a')||
'';

wwv_flow_api.create_message (
  p_id=>1109911534066125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPUTATION_FOOTER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_compute
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Calculer';

wwv_flow_api.create_message (
  p_id=>1109911628830125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COMPUTE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_control_break
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Regroupement';

wwv_flow_api.create_message (
  p_id=>1109911720016125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CONTROL_BREAK',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_control_breaks
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Regrouper';

wwv_flow_api.create_message (
  p_id=>1109911832898125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CONTROL_BREAKS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_data_as_of
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Données telles qu''elle était il y a %0 minute(s)';

wwv_flow_api.create_message (
  p_id=>1109911912640125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DATA_AS_OF',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_default
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Default';

wwv_flow_api.create_message (
  p_id=>1109912019330125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DEFAULT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_delete_confirm
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Voulez-vous vraiment supprimer cette paramétrisation?';

wwv_flow_api.create_message (
  p_id=>1109912102281125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DELETE_CONFIRM',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_delete_confirm_js_dialog
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Voulez-vous vraiment supprimer cet enregistrement?';

wwv_flow_api.create_message (
  p_id=>1109912208880125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DELETE_CONFIRM_JS_DIALOG',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_descending
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Descendant';

wwv_flow_api.create_message (
  p_id=>1109912324902125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DESCENDING',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_detail_view
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Détail';

wwv_flow_api.create_message (
  p_id=>1109912414746125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DETAIL_VIEW',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_disable
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Désactiver';

wwv_flow_api.create_message (
  p_id=>1109912523409125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISABLE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_disabled
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Désactivé';

wwv_flow_api.create_message (
  p_id=>1109912605903125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISABLED',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_displayed
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Affiché';

wwv_flow_api.create_message (
  p_id=>1109912708666125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISPLAYED',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_displayed_columns
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonne(s) affichée(s)';

wwv_flow_api.create_message (
  p_id=>1109912828478125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISPLAYED_COLUMNS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_down
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Descendre';

wwv_flow_api.create_message (
  p_id=>1109912904584125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DOWN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_download
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Télécharger';

wwv_flow_api.create_message (
  p_id=>1109913032640125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DOWNLOAD',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_do_not_aggregate
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Ne pas aggréger -'||unistr('\000a')||
'';

wwv_flow_api.create_message (
  p_id=>1109913129789125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DO_NOT_AGGREGATE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_do_not_display
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonne(s) à ne pas afficher';

wwv_flow_api.create_message (
  p_id=>1109913210605125035 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DO_NOT_DISPLAY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_edit_chart
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Modifier les paramètres du graphique';

wwv_flow_api.create_message (
  p_id=>1109913321749125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EDIT_CHART',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_edit_highlight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Modifier la mise en évidence';

wwv_flow_api.create_message (
  p_id=>1109913417924125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EDIT_HIGHLIGHT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_enabled
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Activé';

wwv_flow_api.create_message (
  p_id=>1109913519978125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ENABLED',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_enable_disable_alt
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Activer/Désactiver';

wwv_flow_api.create_message (
  p_id=>1109913619215125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ENABLE_DISABLE_ALT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_error
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Error';

wwv_flow_api.create_message (
  p_id=>1109913732566125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ERROR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_exclude_null
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Exclure les valeurs nulles';

wwv_flow_api.create_message (
  p_id=>1109913813333125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EXCLUDE_NULL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_filter
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Filtrer';

wwv_flow_api.create_message (
  p_id=>1109913930239125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FILTER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_finder_alt
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Choisir les colonnes pour la recherche';

wwv_flow_api.create_message (
  p_id=>1109914032106125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FINDER_ALT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_flashback
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Retour en arrière';

wwv_flow_api.create_message (
  p_id=>1109914107918125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FLASHBACK',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_flashback_description
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Une requête avec retour en arrière permet de voir les données telles qu''elles étaient au moment choisi.'||unistr('\000a')||
'';

wwv_flow_api.create_message (
  p_id=>1109914213125125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FLASHBACK_DESCRIPTION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_format_mask
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Masque de saisie';

wwv_flow_api.create_message (
  p_id=>1109914328202125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FORMAT_MASK',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_function
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Fonction';

wwv_flow_api.create_message (
  p_id=>1109914428642125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FUNCTION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_functions
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Fonctions';

wwv_flow_api.create_message (
  p_id=>1109914528650125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FUNCTIONS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_go
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Search';

wwv_flow_api.create_message (
  p_id=>1109914629466125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_GO',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_green
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Vert';

wwv_flow_api.create_message (
  p_id=>1109914720630125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_GREEN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_hcolumn
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonne horizontale';

wwv_flow_api.create_message (
  p_id=>1109914804854125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HCOLUMN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_reset
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Réinitialiser le rapport avec les paramètres initiaux, supprimer toutes les personnalisations que vous avez fait.';

wwv_flow_api.create_message (
  p_id=>1109914922964125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_RESET',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_hide_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Cacher colonne';

wwv_flow_api.create_message (
  p_id=>1109915028712125037 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HIDE_COLUMN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_highlight_condition
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Condition de mise en évidence';

wwv_flow_api.create_message (
  p_id=>1109915120853125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HIGHLIGHT_CONDITION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_highlight_type
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Type de mise en évidence';

wwv_flow_api.create_message (
  p_id=>1109915227255125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HIGHLIGHT_TYPE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_highlight_when
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Mis en évidence quand';

wwv_flow_api.create_message (
  p_id=>1109915315867125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HIGHLIGHT_WHEN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_invalid
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Invalide';

wwv_flow_api.create_message (
  p_id=>1109915406256125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_INVALID',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_keypad
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Touche du clavier numérique';

wwv_flow_api.create_message (
  p_id=>1109915519856125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_KEYPAD',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_label
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Label';

wwv_flow_api.create_message (
  p_id=>1109915621258125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LABEL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_label_axis_title
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Titre (axe des X)';

wwv_flow_api.create_message (
  p_id=>1109915709026125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LABEL_AXIS_TITLE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_move
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Déplacer';

wwv_flow_api.create_message (
  p_id=>1109915802297125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_MOVE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_move_all
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Déplacer tout';

wwv_flow_api.create_message (
  p_id=>1109915905036125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_MOVE_ALL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_new_aggregation
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Nouvelle aggrégation';

wwv_flow_api.create_message (
  p_id=>1109916022240125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEW_AGGREGATION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_new_category
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Nouvelle catégorie -';

wwv_flow_api.create_message (
  p_id=>1109916101993125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEW_CATEGORY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_no
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'No';

wwv_flow_api.create_message (
  p_id=>1109916208365125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NO',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_none
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- None -';

wwv_flow_api.create_message (
  p_id=>1109916321535125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NONE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_no_aggregation_defined
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aucune aggrégation définie';

wwv_flow_api.create_message (
  p_id=>1109916428085125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NO_AGGREGATION_DEFINED',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_no_computation_defined
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aucun calcul défini';

wwv_flow_api.create_message (
  p_id=>1109916526809125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NO_COMPUTATION_DEFINED',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_nulls_always_first
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Valeur nulle toujours au début';

wwv_flow_api.create_message (
  p_id=>1109916625718125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NULLS_ALWAYS_FIRST',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_nulls_always_last
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Valeur nulle toujours à la fin';

wwv_flow_api.create_message (
  p_id=>1109916725236125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NULLS_ALWAYS_LAST',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_numeric_flashback_time
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Le moment du retour en arrière doit être numérique';

wwv_flow_api.create_message (
  p_id=>1109916817415125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_numeric_sequence
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La séquence doit être numérique';

wwv_flow_api.create_message (
  p_id=>1109916918835125038 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NUMERIC_SEQUENCE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_num_rows
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangées';

wwv_flow_api.create_message (
  p_id=>1109917028825125040 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NUM_ROWS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_operator
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Opérateur';

wwv_flow_api.create_message (
  p_id=>1109917113851125040 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_OPERATOR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_other
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Autre';

wwv_flow_api.create_message (
  p_id=>1109917226008125040 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_OTHER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_red
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rouge';

wwv_flow_api.create_message (
  p_id=>1109917318394125040 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_RED',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enlever';

wwv_flow_api.create_message (
  p_id=>1109917429522125040 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_aggregate
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enlever toutes les aggrégations';

wwv_flow_api.create_message (
  p_id=>1109917521364125040 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_AGGREGATE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_all
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enlever tout';

wwv_flow_api.create_message (
  p_id=>1109917626407125040 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_ALL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_control_break
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enlever le regroupement';

wwv_flow_api.create_message (
  p_id=>1109917734559125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_CONTROL_BREAK',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_row_text_contains
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La rangée contient';

wwv_flow_api.create_message (
  p_id=>1109917827825125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ROW_TEXT_CONTAINS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_save
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Save';

wwv_flow_api.create_message (
  p_id=>1109917903484125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_saved_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rapport sauvé';

wwv_flow_api.create_message (
  p_id=>1109918027498125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVED_REPORT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_saved_report_msg
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rapport sauvé = "%0"';

wwv_flow_api.create_message (
  p_id=>1109918132910125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVED_REPORT_MSG',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_save_as_default
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Sauvegardée en tant que valeur par défaut';

wwv_flow_api.create_message (
  p_id=>1109918212212125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVE_AS_DEFAULT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_save_default_confirm
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La paramétrisation du rapport courant est utilisée comme valeur par défaut pour tous les utilisateurs';

wwv_flow_api.create_message (
  p_id=>1109918318585125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_save_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enregistrer rapport';

wwv_flow_api.create_message (
  p_id=>1109918408016125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SAVE_REPORT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_search_bar
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Barre de recherche';

wwv_flow_api.create_message (
  p_id=>1109918533944125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SEARCH_BAR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_category
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Choose category -';

wwv_flow_api.create_message (
  p_id=>1109918624742125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_CATEGORY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Choose a column -';

wwv_flow_api.create_message (
  p_id=>1109918710883125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_COLUMN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_columns
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Choisir colonnes';

wwv_flow_api.create_message (
  p_id=>1109918802421125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_COLUMNS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_function
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'- Choose function -';

wwv_flow_api.create_message (
  p_id=>1109918930304125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_FUNCTION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_select_value
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Valeur sélectionnée';

wwv_flow_api.create_message (
  p_id=>1109919027831125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SELECT_VALUE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_sequence
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Séquence';

wwv_flow_api.create_message (
  p_id=>1109919126324125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SEQUENCE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_sort
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Trier';

wwv_flow_api.create_message (
  p_id=>1109919218661125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SORT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_sort_ascending
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Tri ascendant';

wwv_flow_api.create_message (
  p_id=>1109919304425125041 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SORT_ASCENDING',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_sort_descending
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Tri descendant';

wwv_flow_api.create_message (
  p_id=>1109919414045125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SORT_DESCENDING',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_text_color
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Couleur du texte';

wwv_flow_api.create_message (
  p_id=>1109919504081125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_TEXT_COLOR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_top
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'En haut';

wwv_flow_api.create_message (
  p_id=>1109919607957125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_TOP',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_up
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Monter';

wwv_flow_api.create_message (
  p_id=>1109919716896125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_UP',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_yellow
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Jaune';

wwv_flow_api.create_message (
  p_id=>1109919830186125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_YELLOW',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_yes
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Yes';

wwv_flow_api.create_message (
  p_id=>1109919906904125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_YES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message flow_single_validation_error
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'<b>Il s''est produit une erreur :</b>';

wwv_flow_api.create_message (
  p_id=>1109920024863125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FLOW.SINGLE_VALIDATION_ERROR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message flow_validation_error
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'<b>Il s''est produit %0 erreurs :</b>';

wwv_flow_api.create_message (
  p_id=>1109920124549125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FLOW.VALIDATION_ERROR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message pagination_next
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Suivant';

wwv_flow_api.create_message (
  p_id=>1109920232750125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGINATION.NEXT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message pagination_previous
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Précédent';

wwv_flow_api.create_message (
  p_id=>1109920333228125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGINATION.PREVIOUS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message reset
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Reset';

wwv_flow_api.create_message (
  p_id=>1109920411326125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'RESET',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message since_minutes_ago
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'minutes.';

wwv_flow_api.create_message (
  p_id=>1109920521184125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'SINCE_MINUTES_AGO',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message wwv_render_report3_sort_by_this_column
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Trier par cette colonne';

wwv_flow_api.create_message (
  p_id=>1109920632464125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message wwv_render_report3_x_y_of_more_than_z
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangée(s) %0 - %1 de plus que %2';

wwv_flow_api.create_message (
  p_id=>1109920712126125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message wwv_render_report3_x_y_of_z
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangée(s) %0 - %1 de %2';

wwv_flow_api.create_message (
  p_id=>1109920831114125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message wwv_render_report3_x_y_of_z_2
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 - %1 de %2';

wwv_flow_api.create_message (
  p_id=>1109920928833125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_rows
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangées';

wwv_flow_api.create_message (
  p_id=>1109921018983125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ROWS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_reset
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Reset';

wwv_flow_api.create_message (
  p_id=>1109921108767125043 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_RESET',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_reset_confirm
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Réinitialiser le rapport avec les paramètres initiaux.';

wwv_flow_api.create_message (
  p_id=>1109921227892125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_RESET_CONFIRM',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_view_chart
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Voir graphique';

wwv_flow_api.create_message (
  p_id=>1109921308216125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VIEW_CHART',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_view_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Voir tableau';

wwv_flow_api.create_message (
  p_id=>1109921425183125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VIEW_REPORT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_edit_chart2
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Paramètres du graphique';

wwv_flow_api.create_message (
  p_id=>1109921529027125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EDIT_CHART2',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_working_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Vue générale';

wwv_flow_api.create_message (
  p_id=>1109921631620125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_WORKING_REPORT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_value_axis_title
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Titre (axe des Y)';

wwv_flow_api.create_message (
  p_id=>1109921702710125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VALUE_AXIS_TITLE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_delete
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Delete';

wwv_flow_api.create_message (
  p_id=>1109921818697125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DELETE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_delete_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Effacer le rapport';

wwv_flow_api.create_message (
  p_id=>1109921907992125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DELETE_REPORT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_display
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Afficher';

wwv_flow_api.create_message (
  p_id=>1109922017618125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISPLAY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_display_in_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Colonne(s) à afficher';

wwv_flow_api.create_message (
  p_id=>1109922127427125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_DISPLAY_IN_REPORT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_edit_filter
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Modifier le filtre';

wwv_flow_api.create_message (
  p_id=>1109922212930125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EDIT_FILTER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_examples
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Exemples';

wwv_flow_api.create_message (
  p_id=>1109922326343125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_EXAMPLES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_filters
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Filtres';

wwv_flow_api.create_message (
  p_id=>1109922415299125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FILTERS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_flashback_error_msg
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Impossible d''exécutée la requête avec retour en arrière';

wwv_flow_api.create_message (
  p_id=>1109922517730125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_FLASHBACK_ERROR_MSG',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Help';

wwv_flow_api.create_message (
  p_id=>1109922619656125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_highlight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Mettre en évidence';

wwv_flow_api.create_message (
  p_id=>1109922728650125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HIGHLIGHT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_invalid_computation
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Expression de calcul invalide';

wwv_flow_api.create_message (
  p_id=>1109922831366125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_INVALID_COMPUTATION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_name
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Name';

wwv_flow_api.create_message (
  p_id=>1109922904129125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NAME',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_new_computation
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Nouveau calcul';

wwv_flow_api.create_message (
  p_id=>1109923006041125045 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEW_COMPUTATION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_value
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Value';

wwv_flow_api.create_message (
  p_id=>1109923105071125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VALUE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_3d
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'3D';

wwv_flow_api.create_message (
  p_id=>1109923224015125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_3D',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_download
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Permet de télécharger le jeu de données courant. Les types de fichiers disponibles diffèrent selon votre installation. Les différents types sont CSV, XLS, PDF et RTF.';

wwv_flow_api.create_message (
  p_id=>1109923308710125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_DOWNLOAD',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_01
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Un rapport interactif affiche un jeu de colonne prédéterminé. Le rapport peut être personnalisé davantage avec l''utilisation d''un filtre initial, d''un tri par défaut, des bris, du surlignage, des calculs, des aggrégations et d''un graphique. Chaque rapport interactif peuvent donc être personnalisés davantage et les résultats peuvent être visionnés, téléchargés et la définition du rapport peut être ';

h:=h||'sauvegardé pour une utilisation ultérieure.<p/>Un rapport interactif peut est personnalisé à trois niveaux: la barre de recherche, le menu d''action et l''entête des menus.';

wwv_flow_api.create_message (
  p_id=>1109923402509125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_01',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_actions_menu
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Le menu d''actions est utilisé pour personnaliser l''affchage de votre rapport interactif.';

wwv_flow_api.create_message (
  p_id=>1109923508778125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_ACTIONS_MENU',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_aggregate
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Les aggrégations sont des calculs mathématiques applicables sur une colonne. Les aggrégations sont affichés après chaque bri et à la fin du rapport dans les colonnes sur lesquelles ils sont définis.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<ul><li><b>Aggréger</b> permet de sélectionner et d''éditer une aggrégation définie précédemment.</li>'||unistr('\000a')||
'<li><b>Fonction</b> est utilisé pour choisir la fonction qui sera appliquée (ex.: Somme, Minim';

h:=h||'um).</li>'||unistr('\000a')||
'<li><b>Colonne</b> est utilisé pour choisir la colonne sur laquelle on appliquera la fonction mathématique. Seulement les colonnes numériques seront affichées.</li></ul>';

wwv_flow_api.create_message (
  p_id=>1109923617234125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_AGGREGATE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_chart
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Vous pouvez inclure un graphique pour chaque rapport interactif. Une fois défini, vous pouvez basculer entre la vue du graphique et celle du rapport en utilisant les liens sous la barre de recherche.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<ul><li><b>Type de graphique</b> identifie le type de graphique à inclure. Choisir entre barres horizontales, barres verticales, tarte ou lignes.</li>'||unistr('\000a')||
'<li><b>Libellé</b> identifie la colonne util';

h:=h||'isée pour le libellé.</li>'||unistr('\000a')||
'<li><b>Titre (axe des X)</b> identifie le titre affiché sur l''axe associé à la colonne sélectionnée pour le Libellé. Non disponible pour le graphique en tarte.</li>'||unistr('\000a')||
'<li><b>Valeur</b> identifie la colonne utilisée pour la valeur.</li>'||unistr('\000a')||
'<li><b>Titre (axe des Y)</b> identifie le titre affiché sur l''axe associé à la colonne sélectionnée pour la Valeur. Non disponible pour le ';

h:=h||'graphique en tarte.</li>'||unistr('\000a')||
'<li><b>Fonction</b> est une fonction facultative pouvant être appliquée sur la colonne sélectionnées pour la Valeur.</li></ul>';

wwv_flow_api.create_message (
  p_id=>1109923726614125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_CHART',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_column_heading_menu
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Lorsqu''on clique sur un entête de colonne, un menu d''entête s''affiche.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<ul><li><b>Icône de tri ascendant</b> trie le rapport par cette colonne en ordre ascendant.</li>'||unistr('\000a')||
'<li><b>Icône de tri descendant</b> trie le rapport par cette colonne en ordre descendant.</li>'||unistr('\000a')||
'<li><b>Cacher colonne</b> cache la colonne.</li>'||unistr('\000a')||
'<li><b>Regroupement</b> crée un bri sur la colonne.</li>'||unistr('\000a')||
'<li><b>Aide</b> affiche l''';

h:=h||'aide à propose de la colonne.</li>'||unistr('\000a')||
'<li><b>Zone de texte</b> est utilisé pour saisir un critère recherche. Lorsqu''on saisi une valeur, la liste de valeurs au bas du menu va être réduite. Vous pouvez ensuite sélectionner une valeur dans le bas et cette valeur créera un filtre en utilisant ''='' (ex.: colonne = ''ABC''). Alternativement, vous pouvez cliquer sur l''icône de la lampe de poche et la valeur e';

h:=h||'ntrée créera un ''LIKE'' (ex.: colonne LIKE ''%ABC%'').'||unistr('\000a')||
'<li><b>Liste de valeurs uniques</b> contient les 500 premières valeurs uniques qui correspondent aux filtres. Si la colonne est une date, une liste de dates sera affichée. Vous pouvez sélectionner une valeur, un filtre sera créé en utilisant ''='' (ex.: colonne = ''ABC'').</li></ul>';

wwv_flow_api.create_message (
  p_id=>1109923832757125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_report_settings
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Si vous avez personnalisé votre rapport interactif, les paramètres seront affichés en-dessous la barre de recherche et au-dessus du rapport. Si vous avez sauvegardés des rapports personnalisés, ils s''afficheront sous la forme d''onglets. Vous pouvez accéder aux vues alternatives en cliquant sur les onglets. Les paramètres du rapport seront affichés sous les onglets. Cette zone peut être ouverte ou ';

h:=h||'fermée en utilisant l''icône à gauche.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'Pour chaque paramètre du rapport, vous pouvez:'||unistr('\000a')||
'<ul><li><b>Éditer</b> en cliquant le nom.</li>'||unistr('\000a')||
'<li><b>Désactiver/Activer</b> en cochant la boîte d''activation et de désactivation. On utilise cette option pour activer/désactiver temporairement un paramètre.</li>'||unistr('\000a')||
'<li><b>Supprimer</b> en cliquant l''icône de suppression. On utilise cette option pour supprimer u';

h:=h||'n paramètre de façon permanente.</li></ul>'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'Si vous avez créé un graphique, vous pouvez basculter entre le rapport et le graphique en utilisant les liens à droite. Si vous êtes entrain de visionner un graphique, vous pouvez utiliser le lien d''édition pour éditer les paramètres du graphique.';

wwv_flow_api.create_message (
  p_id=>1109923920354125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_REPORT_SETTINGS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_select_columns
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Utilisé pour modifier les colonnes affichées. Les colonnes à droite sont affichées. Les colonnes à gauche sont cachés. Vous pouvez repositionner les colonnes affichées en utilisant les flèches à l''extrême droite. Les colonnes calculées sont préfixées par <b>**</b>.';

wwv_flow_api.create_message (
  p_id=>1109924001922125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_SELECT_COLUMNS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_control_break
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Utilisé pour créer un regroupement sur une ou plusieurs colonnes. On sort les colonnes du rapport interactif et on les affiche comme des colonnes de bri.';

wwv_flow_api.create_message (
  p_id=>1109924113735125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_CONTROL_BREAK',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_actions_menu
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Menu d''actions';

wwv_flow_api.create_message (
  p_id=>1109924212341125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ACTIONS_MENU',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_save_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Sauvegarde le rapport personnalisé pour une utilisation utltérieure. Vous devez fournir un nom et une description optionnelle.';

wwv_flow_api.create_message (
  p_id=>1109924314485125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_SAVE_REPORT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_interactive_report_help
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Aide pour le rapport interactif';

wwv_flow_api.create_message (
  p_id=>1109924407819125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_INTERACTIVE_REPORT_HELP',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_report_settings
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Paramètres d''un rapport';

wwv_flow_api.create_message (
  p_id=>1109924514760125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REPORT_SETTINGS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_column_heading_menu
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Menu d''entête de colonne';

wwv_flow_api.create_message (
  p_id=>1109924608031125046 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_COLUMN_HEADING_MENU',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_flashback
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Exécute une requête de « retour en arrière » permettant de voir les données telles qu''elles étaient dans le passé à un moment donné. Le « retour en arrière » par défaut est de 3 heures (ou 180 minutes) mais ce chiffre diffère selon la base de données.';

wwv_flow_api.create_message (
  p_id=>1109924710860125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_FLASHBACK',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_filter
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Sert à ajouter ou modifier un énoncé WHERE pour la requête. D''abord, choisir une colonne (il n''est pas nécessaire qu''elle soit affichée), choisir parmi la liste des opérateurs Oracle (=, !=, not in, between), saisir une expression pour la comparaison. L''expression est sensible à la casse et vous pouvez utiliser % comme caractère de remplacement (ex.: NOM_PROVINCE like Q%).';

wwv_flow_api.create_message (
  p_id=>1109924825741125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_FILTER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_sort
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Utilisé pour changer l''ordonnancement des colonnes (ascandant et descandat). Vous pouvez aussi spécifier commet gérer les valeurs nulles (utilise le paramètre par défaut, toujours afficher en premier ou en dernier). Une icône affichera le type de tri à la droite de l''entête d''une colonne.';

wwv_flow_api.create_message (
  p_id=>1109924925039125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_SORT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_search_bar
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Au dessus de chaque rapport, il y a une région de recherche. Cette région contient ces fonctionnalités:'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<ul><li><b>L''icône de colonnes</b> permet de choisir sur quelle(s) colonne(s) rechercher.</li>'||unistr('\000a')||
'<li><b>Zone de texte</b> permet de faire une recherche non sensible sur la casse (pas besoin d''utiliser des caractères de remplacement).</li>'||unistr('\000a')||
'<li><b>Rows</b> selects the number of records to displ';

h:=h||'ay per page.</li>'||unistr('\000a')||
'<li><b>Bouton [Rechercher]</b> exécute la recherche.</li>'||unistr('\000a')||
'<li><b>L''icône du menu des actions</b> affiche le menu des actions.</li></ul>'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'Veuillez noter que ce ne sont pas toutes les fonctionnalités qui sont disponibles pour chaque rapport.';

wwv_flow_api.create_message (
  p_id=>1109925021329125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_SEARCH_BAR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_help_highlight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'La mise en évidence définit un filtre. Les rangées qui correspondent au filtre sont mises en évidence en utilisant les caractéristiques associées au filtre.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<ul><li><b>Nom</b> est utilisé seulement pour l''affichage.</li>'||unistr('\000a')||
'<li><b>Séquence</b> identifie l''ordre dans lequel sera évalué les règles.</li>'||unistr('\000a')||
'<li><b>Actif</b> identifie si la règle est activée ou désactivée.</li>'||unistr('\000a')||
'<li><b>Type de mise en é';

h:=h||'vidence</b> identifie si ce sera la rangée ou la cellule qui sera mise en évidence.</li>'||unistr('\000a')||
'<li><b>Couleur d''arrière plan</b> est la couleur utilisée pour mettre en évidence une zone.</li>'||unistr('\000a')||
'<li><b>Couleur de texte</b> est la couleur utilisée pour mettre en évidence le texte d''une zone.</li>'||unistr('\000a')||
'<li><b>Conditions de la mise en évidence</b> définit les conditions du filtre.</li></ul>';

wwv_flow_api.create_message (
  p_id=>1109925105830125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_HIGHLIGHT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_enable
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Activer';

wwv_flow_api.create_message (
  p_id=>1109925233051125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ENABLE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_space_as_in_one_empty_string
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'espace';

wwv_flow_api.create_message (
  p_id=>1109925315331125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_filter
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Supprimer filtre';

wwv_flow_api.create_message (
  p_id=>1109925416017125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_FILTER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_highlight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Supprimer la mise en évidence';

wwv_flow_api.create_message (
  p_id=>1109925525472125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_HIGHLIGHT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_status
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Statut';

wwv_flow_api.create_message (
  p_id=>1109925631220125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_STATUS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_row
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangée';

wwv_flow_api.create_message (
  p_id=>1109925707819125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_ROW',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_clear
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'effacer';

wwv_flow_api.create_message (
  p_id=>1109925808486125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_CLEAR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_remove_flashback
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Supprimer Retour en arrière';

wwv_flow_api.create_message (
  p_id=>1109925932802125048 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_FLASHBACK',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_value
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Valeur';

wwv_flow_api.create_message (
  p_id=>1121841449741582074 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_VALUE',
  p_message_language=>'fr_ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_3d
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'3D';

wwv_flow_api.create_message (
  p_id=>1121841841112582075 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_3D',
  p_message_language=>'fr_ca',
  p_message_text=>h);
null;
 
end;
/

--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations
--
prompt  ...Shortcuts
--
--application/shared_components/user_interface/shortcuts/afw_13_liste_navgt
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'declare'||unistr('\000a')||
'         vva_optio_liste_navgt varchar2 (32767)'||unistr('\000a')||
'                           default afw_13_page_pkg.genr_elemn_liste_navgt;'||unistr('\000a')||
'      begin'||unistr('\000a')||
'          -- Ne pas generer si la liste est vide'||unistr('\000a')||
'         -- Exclure la page de connexion'||unistr('\000a')||
'         if     vva_optio_liste_navgt is not null'||unistr('\000a')||
'            and afw_13_page_pkg.obten_page_sesn !='||unistr('\000a')||
'                   afw_11_aplic_pkg.obten_page_conxn'||unistr('\000a')||
'         then';

c1:=c1||''||unistr('\000a')||
'            return vva_optio_liste_navgt;'||unistr('\000a')||
'         end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_shortcut (
 p_id=> 80435804002784708 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'AFW_13_LISTE_NAVGT',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/delete_confirm_msg_1
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'Would you like to perform this delete action?';

wwv_flow_api.create_shortcut (
 p_id=> 510918240751910677 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG_1',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/delete_confirm_msg
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'return afw_07_util_pkg.obten_mesg_suprs();';

wwv_flow_api.create_shortcut (
 p_id=> 1102122548885988644 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/afw_13_obten_libl
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'return afw_13_page_item_pkg.obten_tradc_libl(#CURRENT_ITEM_ID#);';

wwv_flow_api.create_shortcut (
 p_id=> 1104429734204616815 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'AFW_13_OBTEN_LIBL',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_error_text=> 'Erreur',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/afw_19_obten_titre_atrib
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'return afw_19_fonct_pkg.obten_titre_atrib(afw_07_util_pkg.nv(''P1040_SEQNC''),#CURRENT_ITEM_ID#);';

wwv_flow_api.create_shortcut (
 p_id=> 1110357424396331329 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'AFW_19_OBTEN_TITRE_ATRIB',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_error_text=> 'Erreur',
 p_shortcut=> c1);
end;
null;
 
end;
/

prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/afw_21_authentification_utilisateur_12
prompt  ......authentication 3711921554898031
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 3711921554898031 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'AFW - 21 - Authentification Utilisateur (12)'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTHE_12_UTILS'
 ,p_invalid_session_type => 'URL'
 ,p_invalid_session_url => 'f?p=&APP_ID.:101'
 ,p_logout_url => 'f?p=&APP_ID.:101'
 ,p_cookie_name => 'AFW'
 ,p_use_secure_cookie_yn => 'N'
 ,p_reference_id => 762051053662194539
 ,p_comments => 'Authentification AFW'
  );
null;
 
end;
/

--application/shared_components/security/authentication/afw_21_authentification_utilisateur_11
prompt  ......authentication 1103643152851936300
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 1103643152851936300 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'AFW - 21 - Authentification Utilisateur (11)'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTHE_11_UTILS'
 ,p_invalid_session_type => 'URL'
 ,p_invalid_session_url => 'f?p=&APP_ID.:101'
 ,p_logout_url => 'f?p=&APP_ID.:101'
 ,p_cookie_name => 'AFW'
 ,p_use_secure_cookie_yn => 'N'
 ,p_comments => 'Authentification AFW'
  );
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

prompt  ...plugins
--
--application/shared_components/plugins/dynamic_action/io_afw_21_favr
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 43844053588498001 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_FAVR'
 ,p_display_name => 'AFW - 21 - Favoris'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_favr'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_favr'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 43856030185177334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43844053588498001 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Classe CSS (Ajout favoris)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'icon-star'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 43857851523182659 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43844053588498001 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Texte (Ajout favoris)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'Supprimer de vos favoris'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 43858546347185025 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43844053588498001 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Classe CSS (Supprimer favoris)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'icon-star-empty'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 43859141818187131 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43844053588498001 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Texte (Suppression favoris)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'Ajouter aux favoris'
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/io_afw_21_bascl_favr
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 45343929367808951 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'IO_AFW_21_BASCL_FAVR'
 ,p_display_name => 'AFW - 21 - Basculer Favoris'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_item_pkg.genr_bascl_favr'
 ,p_ajax_function => 'afw_21_item_pkg.ajax_bascl_favr'
 ,p_standard_attributes => 'VISIBLE'
 ,p_substitute_attributes => true
 ,p_reference_id => 44505019410159859
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45919840050770327 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343929367808951 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Classe CSS (Voir favoris)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45920231834770327 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343929367808951 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Texte (Voir favoris)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'Show everything'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45920638103770327 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343929367808951 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Classe CSS (Voir tous)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45921049885770328 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343929367808951 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Texte (Voir tous)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'Show favorites'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45921436197770328 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343929367808951 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Item Toggle'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_default_value => 'PX_TOGL_FAVRT'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45921835355770328 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343929367808951 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Gestion filtre'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45922251786770329 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343929367808951 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Item contenant filtre'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_default_value => 'PX_FILTR_FAVRT'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 45921835355770328 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45922656326770329 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343929367808951 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Filtre (SQL)'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => false
 ,p_default_value => 'exists (select 1 '||unistr('\000a')||
'          from vd_afw_12_favr f '||unistr('\000a')||
'         where f.ref_struc_aplic_formt = :A_AFW_04_CONTX '||unistr('\000a')||
'           and f.ref_seqnc_struc_aplic = [PARENT_ALIAS].[SEQNC])'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 45921835355770328 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
 ,p_help_text => 'Replace:'||unistr('\000a')||
' [PARENT_ALIAS] by alias used in parent SQL;'||unistr('\000a')||
' [SEQNC] by primary key stocked in apexframework favorite table. (Concept seqnc)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 45924344026770331 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343929367808951 + wwv_flow_api.g_id_offset
 ,p_name => 'favr_togl'
 ,p_display_name => 'after Toggle'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/io_afw_21_favr
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 67344055059297760 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'IO_AFW_21_FAVR'
 ,p_display_name => 'AFW - 21 - Favoris'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_item_pkg.genr_favr'
 ,p_ajax_function => 'afw_21_item_pkg.ajax_favr'
 ,p_standard_attributes => 'VISIBLE'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<p>'||unistr('\000a')||
'	Based on Dynamic Action configuration (Icon + title)</p>'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 67344347080301413 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 67344055059297760 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Item structure applicative (code)'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_default_value => 'A_AFW_04_CONTX'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 67344664320308644 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 67344055059297760 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Item séquence (Concept)'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_default_value => 'A_AFW_04_SEQNC_CONTX'
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_navgt_enreg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 81198815408244318 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_NAVGT_ENREG'
 ,p_display_name => 'AFW - 21 - Navigation par enregistrement'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_afw_21_navgt_enreg'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_afw_21_navgt_enreg'
 ,p_substitute_attributes => true
 ,p_reference_id => 81196430746244314
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_initl_comps
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 160150320222079149 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_INITL_COMPS'
 ,p_display_name => 'AFW - 21 - Initialisation composants'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_initl_comps'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/io_afw_21_selct_2
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'IO_AFW_21_SELCT_2'
 ,p_display_name => 'AFW - 21 - select2'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_item_pkg.genr_selct_2'
 ,p_ajax_function => 'afw_21_item_pkg.ajax_selct_2'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:READONLY:ESCAPE_OUTPUT:QUICKPICK:SOURCE:ELEMENT:WIDTH:ELEMENT_OPTION:PLACEHOLDER:ENCRYPT:LOV:LOV_REQUIRED:LOV_DISPLAY_NULL:CASCADING_LOV'
 ,p_sql_min_column_count => 2
 ,p_sql_max_column_count => 6
 ,p_sql_examples => 'select display, return, [group, html_selection_format, html_result_format, search_string]'||unistr('\000a')||
'  from dual'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 51373612087601693 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Include CSS'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206249012747670743 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Type'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'SINGL_VALUE'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206249305846673941 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206249012747670743 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Single-value'
 ,p_return_value => 'SINGL_VALUE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206249703258675154 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206249012747670743 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Mutliple-value'
 ,p_return_value => 'MULTP_VALUE'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206348226707486853 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Allow clear'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206249012747670743 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'SINGL_VALUE'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206326627990257278 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Loading Remote Data'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206327005992267450 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Minimum number of results'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '10'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206326627990257278 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'N'
 ,p_help_text => 'The minimum number of results that must be initially (after opening the dropdown for the first time) populated in order to keep the search field. This is useful for cases where local data is used with just a few results, in which case the search box is not very useful and wastes screen space.'||unistr('\000a')||
''||unistr('\000a')||
'The option can be set to a negative value to permanently hide the search field.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206334999434908537 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Maximum number of results'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '100'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206327614606278691 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Maximum number of items that can be selected'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '0'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206249012747670743 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'MULTP_VALUE'
 ,p_help_text => 'The maximum number of items that can be selected in a multi-select control. If this number is less than 1 selection is not limited.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206328510281295877 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Number of characters necessary to start a search'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206328807693297076 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Maximum number of characters that can be entered for an input.'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206329128599302572 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 90
 ,p_prompt => 'Separator'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => ':'
 ,p_is_translatable => false
 ,p_help_text => 'Separator character or string used to delimit ids in value attribute of the multi-valued selects.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206335599624938823 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 35
 ,p_prompt => 'Search type'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'LIKE_IGNORE'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206326627990257278 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
 ,p_help_text => 'CONTAINS_CASE   -- uses INSTR'||unistr('\000a')||
'CONTAINS_IGNORE -- uses INSTR with UPPER'||unistr('\000a')||
'EXACT_CASE      -- uses LIKE value%'||unistr('\000a')||
'EXACT_IGNORE    -- uses LIKE VALUE% with UPPER'||unistr('\000a')||
'LIKE_CASE       -- uses LIKE %value%'||unistr('\000a')||
'LIKE_IGNORE     -- uses LIKE %VALUE% with UPPER'||unistr('\000a')||
'LOOKUP          -- uses = value'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206335922688943402 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335599624938823 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Contains case'
 ,p_return_value => 'CONTAINS_CASE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206336417512945803 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335599624938823 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Contains ignore'
 ,p_return_value => 'CONTAINS_IGNORE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206336815355946753 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335599624938823 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Exact case'
 ,p_return_value => 'EXACT_CASE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206337213199947773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335599624938823 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'Exact ignore'
 ,p_return_value => 'EXACT_IGNORE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206337811042948791 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335599624938823 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'Like case'
 ,p_return_value => 'LIKE_CASE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206338208454949928 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335599624938823 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 60
 ,p_display_value => 'Like ignore'
 ,p_return_value => 'LIKE_IGNORE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206338705651951237 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335599624938823 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 70
 ,p_display_value => 'Lookup'
 ,p_return_value => 'LOOKUP'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206354329977241075 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 11
 ,p_display_sequence => 110
 ,p_prompt => 'initSelection Query'
 ,p_attribute_type => 'SQL'
 ,p_is_required => false
 ,p_default_value => 'select nom d, seqnc r'||unistr('\000a')||
'    from vd_afw_13_page'||unistr('\000a')||
'order by 1'
 ,p_sql_min_column_count => 2
 ,p_sql_max_column_count => 4
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 35904438734629980 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 12
 ,p_display_sequence => 120
 ,p_prompt => 'Width'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => '100%'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 36603544946980322 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 13
 ,p_display_sequence => 130
 ,p_prompt => 'Allow insertion'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 36593155663248773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 14
 ,p_display_sequence => 140
 ,p_prompt => 'Search column'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => '1'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 36593653507249846 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 36593155663248773 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Display column (1)'
 ,p_return_value => '1'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 36594050056251425 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 36593155663248773 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Custom search column (6)'
 ,p_return_value => '6'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206254228207704646 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_blur'
 ,p_display_name => 'blur'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206251404167704644 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_close'
 ,p_display_name => 'close'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206253826463704646 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_focus'
 ,p_display_name => 'focus'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206251818921704645 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_highlight'
 ,p_display_name => 'highlight'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206253429880704646 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_loaded'
 ,p_display_name => 'loaded'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206251018299704644 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_open'
 ,p_display_name => 'open'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206250705174704643 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_opening'
 ,p_display_name => 'opening'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206253028878704645 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_removed'
 ,p_display_name => 'removed'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206252625141704645 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_removing'
 ,p_display_name => 'removing'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206252207311704645 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245800757569928 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_selecting'
 ,p_display_name => 'selecting'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_aide_page
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 517440727890285204 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_AIDE_PAGE'
 ,p_display_name => 'AFW - 21 - Aide page'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_aide_page'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_aide_page'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_event (
  p_id => 517441030014314244 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 517440727890285204 + wwv_flow_api.g_id_offset
 ,p_name => 'afw_21_actio_dynmq_aide_page_afich'
 ,p_display_name => 'Afficher'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_menu
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 866665845333410854 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_MENU'
 ,p_display_name => 'AFW - 21 - Menu'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_afw_13_menu'
 ,p_substitute_attributes => true
 ,p_reference_id => 174315002511187337
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 515605605421232289 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 866665845333410854 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Code du menu'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_modfr_mdp
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 907286463316504532 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_MODFR_MDP'
 ,p_display_name => 'AFW - 21 - modifier mot passe'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_afw_12_modfr_mot_passe'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_event (
  p_id => 907286639206507064 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 907286463316504532 + wwv_flow_api.g_id_offset
 ,p_name => 'afw_21_actio_dynmq_modfr_mp_afich'
 ,p_display_name => 'Afficher'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_aide_page_item
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 926524145914250895 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_AIDE_PAGE_ITEM'
 ,p_display_name => 'AFW - 21 - Aide page item'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_aide_page_item'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_aide_page_item'
 ,p_substitute_attributes => true
 ,p_reference_id => 420769810180509321
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 926596759844543552 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 926524145914250895 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Afficher plusieurs à la fois'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_menu_redrc
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 926530665971379619 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_MENU_REDRC'
 ,p_display_name => 'AFW - 21 - Menu redirection'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_menu_redrc'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_menu_redrc'
 ,p_substitute_attributes => true
 ,p_reference_id => 420470922400147878
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_confr_sauvg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1070644411571491790 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_CONFR_SAUVG'
 ,p_display_name => 'AFW - 21 - Confirmer la sauvegarde (Initialisation)'
 ,p_category => 'NOTIFICATION'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_plugn_confr_sauvg'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_plugn_confr_sauvg'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1070644612311520390 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1070644411571491790 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Message de confirmation'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => 'Des modifications au formulaire ne sont pas sauvegardées.'
 ,p_is_translatable => true
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_depsm_tablr_form
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1070668318375206413 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_DEPSM_TABLR_FORM'
 ,p_display_name => 'AFW - 21 - Dépassement Tabular Form'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_afw_18_depsm_tablr_form'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_afw_18_depsm_tablr_form'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_navgt_tablr_form
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1070670128556994760 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_NAVGT_TABLR_FORM'
 ,p_display_name => 'AFW - 21 - Navigation Tabular Form'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_plugn_navgt_tablr_form'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_gestn_tablr_form
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1070670821594040071 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_GESTN_TABLR_FORM'
 ,p_display_name => 'AFW - 21 - Gestion Tabular Form'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_plugn_gestn_tablr_form'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/io_afw_21_item_popup_arbor
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1071498911997720209 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'IO_AFW_21_ITEM_POPUP_ARBOR'
 ,p_display_name => 'AFW - 21 - Popup LOV Arborescence'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_item_pkg.genr_plugn_item_popup_arbor'
 ,p_standard_attributes => 'VISIBLE:READONLY:SOURCE:ELEMENT:WIDTH:ELEMENT_OPTION:LOV:LOV_DISPLAY_NULL'
 ,p_sql_min_column_count => 2
 ,p_sql_max_column_count => 2
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1071499317800740805 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071498911997720209 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Librairie JavaScript du plugin'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_default_value => '&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
 ,p_display_length => 60
 ,p_is_translatable => false
 ,p_help_text => 'URL'||unistr('\000a')||
''||unistr('\000a')||
'ex.: &A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1071499821609741930 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071498911997720209 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Fichier CSS du plugin'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_default_value => '&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
 ,p_display_length => 60
 ,p_is_translatable => false
 ,p_help_text => 'URL'||unistr('\000a')||
''||unistr('\000a')||
'ex.: &A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1071502313738796385 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071498911997720209 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Logo ouvrir popup'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => '/i/lov_16x16.gif'
 ,p_display_length => 60
 ,p_is_translatable => true
 ,p_help_text => 'URL'||unistr('\000a')||
''||unistr('\000a')||
'ex.: /i/lov_16x16.gif'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1071502834170802349 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071498911997720209 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Largeur du popup'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '600'
 ,p_display_length => 10
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1071503309713804666 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071498911997720209 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Hauteur du popup'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '600'
 ,p_display_length => 10
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_arbre_ajax
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_ARBRE_AJAX'
 ,p_display_name => 'AFW - 21 - Arborescence'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_plugn_regn_arbre'
 ,p_ajax_function => 'afw_21_regn_pkg.ajax_plugn_regn_arbre'
 ,p_standard_attributes => 'SOURCE_PLAIN'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1071571434074726810 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Item qui contient le ID du noeud'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 60
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1491816022821087848 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Selecteur jQuery identifiant éléments externes (droppable)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1491817394208089059 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Selecteur jQuery identifiant éléments externes (draggable)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1491818799403090548 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Item qui reçoit l''id de l''élément glissé'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1491808021201945514 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Item qui contient le code de l''arbre'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 1071778217270816246 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_name => 'close_node.jstree'
 ,p_display_name => 'Fermer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1071779627013847423 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_name => 'create_node.jstree'
 ,p_display_name => 'Ajouter un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1071779019956835921 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_name => 'delete_node.jstree'
 ,p_display_name => 'Supprimer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1071779324112837152 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_name => 'move_node.jstree'
 ,p_display_name => 'Déplacer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1071776202800717421 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_name => 'open_node.jstree'
 ,p_display_name => 'Ouvrir un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1071778628352819429 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_name => 'rename_node.jstree'
 ,p_display_name => 'Renommer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1071797929972329409 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1071571115935712068 + wwv_flow_api.g_id_offset
 ,p_name => 'select_node.jstree'
 ,p_display_name => 'Sélectionner un noeud'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_afich_prodt_autor
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1072372413952364742 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_AFICH_PRODT_AUTOR'
 ,p_display_name => 'AFW - 21 - Afficher la liste des produits autorisés'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_afich_prodt_autor'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_afich_prodt_autor'
 ,p_standard_attributes => 'JQUERY_SELECTOR'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/io_afw_21_page_item_masq
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1073035648444781394 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'IO_AFW_21_PAGE_ITEM_MASQ'
 ,p_display_name => 'AFW - 21 - Masque pour la saisie'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_item_pkg.genr_plugn_item_masq'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:READONLY:ESCAPE_OUTPUT:SOURCE:ELEMENT:WIDTH'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1073052343661309936 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1073035648444781394 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Type de masque'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'PERSN'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1071037517599782235 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1073052343661309936 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 5
 ,p_display_value => 'Personnalisé'
 ,p_return_value => 'PERSN'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1073053553011312673 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1073052343661309936 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Téléphone'
 ,p_return_value => '999-999-9999'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1073053923706313672 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1073052343661309936 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Code postal (Canada)'
 ,p_return_value => 'a9a 9a9'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1073054528901315177 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1073052343661309936 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Permis de conduire'
 ,p_return_value => 'a9999-999999-99'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1071038307688788774 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1073035648444781394 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Masque personnalisé'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => true
 ,p_depending_on_attribute_id => 1073052343661309936 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'PERSN'
 ,p_help_text => 'a - Représente un caractère alphabétique (A-Z, a-z)'||unistr('\000a')||
'9 - Représente un caractère numérique (0-9)'||unistr('\000a')||
'* - Représente un caractère alphanumérique (AZ, az ,0-9)'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1071038829290804527 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1073035648444781394 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Caractère de soulignement'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => '_'
 ,p_display_length => 1
 ,p_max_length => 1
 ,p_is_translatable => true
 ,p_help_text => 'Si vous n''êtes pas satisfait avec le caractère de soulignement (''_'') comme un espace réservé, vous pouvez passer un argument optionnel.'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_barre_rechr_ir
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1075555703084928589 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_BARRE_RECHR_IR'
 ,p_display_name => 'AFW - 21 - Barre recherche IR'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_plugn_regn_barre_rechr_ir'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_acord
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1075863424311131980 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_ACORD'
 ,p_display_name => 'AFW - 21 - Accordion'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_plugn_regn_acord'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1075863616131139119 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1075863424311131980 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Largeur (px)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => '215'
 ,p_is_translatable => false
 ,p_help_text => '1- Exemple: 215'||unistr('\000a')||
'2- Exemple: P1_LARGR_REGN_ACORD'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1077733733979949394 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1075863424311131980 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Largeur par défaut (px)'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '215'
 ,p_is_translatable => false
 ,p_help_text => 'Exemple: 215'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_confr_sauvg_reintl
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1076078316993838931 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_CONFR_SAUVG_REINTL'
 ,p_display_name => 'AFW - 21 - Confirmer la sauvegarde (Réinitilisation)'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_plugn_confr_sauvg_reint'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_cliqr_selct_texte
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1077507829742114701 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_CLIQR_SELCT_TEXTE'
 ,p_display_name => 'AFW - 21 - Cliquer pour sélectionner tout le texte'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_plugn_cliqr_selct_texte'
 ,p_standard_attributes => 'ITEM'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_afich_mesg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1096945690919863768 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_AFICH_MESG'
 ,p_display_name => 'AFW - 21 - Afficher message'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_afw_01_afich_mesg'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1096953696113865246 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1096945690919863768 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Numéro de message	'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_pile_mesg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1096973814121870470 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_PILE_MESG'
 ,p_display_name => 'AFW - 21 - Pile messages'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_afw_01_err_apex'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_contx_fil_arian
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1115248297154770665 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_CONTX_FIL_ARIAN'
 ,p_display_name => 'AFW - 21 - Contexte fil d''ariane'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.defnr_contx_afw_04_fil_arian'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1115271903266838698 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1115248297154770665 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Informations supplémentaires (HTML)'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => false
 ,p_max_length => 4000
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1115276319542843391 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1115248297154770665 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Informations supplémentaires'
 ,p_attribute_type => 'PLSQL EXPRESSION'
 ,p_is_required => false
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_matrc_raprt_sql
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1143900922972542670 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_MATRC_RAPRT_SQL'
 ,p_display_name => 'AFW - 21 - Matrice rapport SQL'
 ,p_category => 'COMPONENT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_matrc_raprt_sql'
 ,p_standard_attributes => 'REGION'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1143906716671111524 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1143900922972542670 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Nombre de colonnes à gauche'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '1'
 ,p_is_translatable => false
 ,p_help_text => 'Nombre de dimensions verticales.<br/>Ex.: 1'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1143907628792115034 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1143900922972542670 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Surligner des lignes'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_default_value => 'Total,**Tous**'
 ,p_is_translatable => true
 ,p_help_text => 'Permet de mettre en évidence certaines lignes (totaux).<br/>Ex.: Total,**Tous**'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_dialg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1153065515529532163 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_DIALG'
 ,p_display_name => 'AFW - 21 - Boîte de dialogue'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_plugn_regn_dialg'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1153767498874796521 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1153065515529532163 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Modale'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1154212305964031932 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1153065515529532163 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Redimensionner'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1154212926742037900 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1153065515529532163 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Fermer avec la touche "Échap" (Esc)'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1154213629990048277 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1153065515529532163 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Classe CSS'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 100
 ,p_is_translatable => false
 ,p_help_text => 'Pour cacher le bouton "Fermer" (X). Ajouter la classe: no-close.<br />Ex.: ui-afw no-close'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1154214611728449877 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1153065515529532163 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Ouvrir automatiquement'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1154215330082455199 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1153065515529532163 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Déplaçable'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1143268609152183929 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1153065515529532163 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Largeur'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '300'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 1153876805393980037 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1153065515529532163 + wwv_flow_api.g_id_offset
 ,p_name => 'ouvridialg'
 ,p_display_name => 'Ouvrir le dialogue'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_prodt_contx_a
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1166928805734568629 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_PRODT_CONTX_A'
 ,p_display_name => 'AFW - 21 - Produit contexte autorisé'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_prodt_contx_autor'
 ,p_ajax_function => 'afw_21_regn_pkg.ajax_prodt_contx_autor'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1060181822196063096 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1166928805734568629 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Changement de produits'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1220200206376277632 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1166928805734568629 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Afficher date dernière m-à-j référentiel AFW'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1252852595776295622 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1166928805734568629 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Produits affichés'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'TOUS'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1252857097854296216 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1252852595776295622 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Tous les produits'
 ,p_return_value => 'TOUS'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1252861400971297103 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1252852595776295622 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Exclure les produits AFW'
 ,p_return_value => 'EXCLU_AFW'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1252888107551299018 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1252852595776295622 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Seulement les produits AFW'
 ,p_return_value => 'SEULM_AFW'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1252692017538197871 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1166928805734568629 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Produits SAF'
 ,p_attribute_type => 'CHECKBOXES'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 1252852595776295622 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'SEULM_AFW'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1252696521693199049 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1252692017538197871 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'SAFP'
 ,p_return_value => 'SAFP'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1252700790657199547 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1252692017538197871 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'SAFD'
 ,p_return_value => 'SAFD'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1252705092388200052 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1252692017538197871 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'SAFU'
 ,p_return_value => 'SAFU'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1252709394466200646 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1252692017538197871 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'SAFS'
 ,p_return_value => 'SAFS'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1252713697583201518 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1252692017538197871 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'SGA'
 ,p_return_value => 'SGA'
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_initl_menu
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1174135264506495444 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_INITL_MENU'
 ,p_display_name => 'AFW - 21 - Initialisation menu'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.reint_afw_13_menu'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1174144374782040528 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1174135264506495444 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Code du menu'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/io_afw_21_champ_rechr
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1219027591813122052 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'IO_AFW_21_CHAMP_RECHR'
 ,p_display_name => 'AFW - 21 - Champ de recherche'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_item_pkg.genr_champ_rechr'
 ,p_ajax_function => 'afw_21_item_pkg.ajax_champ_rechr'
 ,p_standard_attributes => 'VISIBLE:SOURCE:WIDTH'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1219332402511172474 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1219027591813122052 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Filigrane'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'Recherche...'
 ,p_is_translatable => true
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1219336913246175508 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1219027591813122052 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Nombre critères en mémoire'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_fermr_dialg_ifram
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1238861924122956170 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_FERMR_DIALG_IFRAM'
 ,p_display_name => 'AFW - 21 - Fermer dialogue (iFrame)'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.fermr_dialg_ifram'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1321217644586585173 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1238861924122956170 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Fenêtre parent (Item clé étrangère) - Valeur de retour'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/authorization_type/io_afw_21_autor_acces_page
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1264169922148169327 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_ACCES_PAGE'
 ,p_display_name => 'AFW - 21 - Autorisation Accès Page'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_acces_page'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/authorization_type/io_afw_21_autor_suprs
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1264312808042222099 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_SUPRS'
 ,p_display_name => 'AFW - 21 - Autorisation Suppression'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_suprs'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/authorization_type/io_afw_21_autor_admin_domn
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1264579916279319035 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_ADMIN_DOMN'
 ,p_display_name => 'AFW - 21 - Autorisation administrateur Domaine'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_admin_domn'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/authorization_type/io_afw_21_autor_opert_dml
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1264638825114359443 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_OPERT_DML'
 ,p_display_name => 'AFW - 21 - Autorisation Opération DML'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_opert_dml'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/authorization_type/io_afw_21_autor_modfc
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1264912323027633192 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_MODFC'
 ,p_display_name => 'AFW - 21 - Autorisation Modification'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_modfc'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/authorization_type/io_afw_21_autor_admin_prodt
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1265152730748767842 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_ADMIN_PRODT'
 ,p_display_name => 'AFW - 21 - Autorisation administrateur Produit'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_admin_prodt'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/authorization_type/io_afw_21_autor_devlp_prodt
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1265326494910795401 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_DEVLP_PRODT'
 ,p_display_name => 'AFW - 21 - Autorisation développeur Produit'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_devlp_prodt'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/authentication_type/io_afw_21_authe_11_utils
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1270030996950649835 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_name => 'IO_AFW_21_AUTHE_11_UTILS'
 ,p_display_name => 'AFW - 21 - Authentification Utilisateur (AFW_11_UTILS)'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_session_sentry_function => 'afw_21_authe_pkg.sentn'
 ,p_authentication_function => 'afw_21_authe_pkg.authe_11_utils'
 ,p_standard_attributes => 'INVALID_SESSION'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/authentication_type/io_afw_21_authe_12_utils
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1270042916343655462 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_name => 'IO_AFW_21_AUTHE_12_UTILS'
 ,p_display_name => 'AFW - 21 - Authentification Utilisateur (AFW_12_UTILS)'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_session_sentry_function => 'afw_21_authe_pkg.sentn'
 ,p_authentication_function => 'afw_21_authe_pkg.authe_12_utils'
 ,p_standard_attributes => 'INVALID_SESSION'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_liste_navgt
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1304708019343596682 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_LISTE_NAVGT'
 ,p_display_name => 'AFW - 21 - Liste de navigation'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_afw_13_liste_navgt'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1304749709431603263 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1304708019343596682 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Icône'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'ui-icon-arrowthick-1-e'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1304754111855604028 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1304749709431603263 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'ui-icon-arrowthick-1-e'
 ,p_return_value => 'ui-icon-arrowthick-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1304758413586604520 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1304749709431603263 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'ui-icon-arrow-1-e'
 ,p_return_value => 'ui-icon-arrow-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1304762714972604923 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1304749709431603263 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'ui-icon-carat-1-e'
 ,p_return_value => 'ui-icon-carat-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1304767016703605373 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1304749709431603263 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'ui-icon-triangle-1-e'
 ,p_return_value => 'ui-icon-triangle-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1304771319127606076 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1304749709431603263 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'ui-icon-circle-arrow-e'
 ,p_return_value => 'ui-icon-circle-arrow-e'
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_trait_mess_err
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1313888519666963654 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_TRAIT_MESS_ERR'
 ,p_display_name => 'AFW - 21 - Traiter messages d''erreur'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.trait_mesgs_err'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1313898696248966330 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1313888519666963654 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Traiter messages'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/authorization_type/io_afw_21_autor_creat
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1314265737543584229 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_CREAT'
 ,p_display_name => 'AFW - 21 - Autorisation Création'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_creat'
 ,p_substitute_attributes => true
 ,p_reference_id => 256326647326815230
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_defnr_item_page
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1320912220363379541 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_DEFNR_ITEM_PAGE'
 ,p_display_name => 'AFW - 21 - Définir item(s) page'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.defnr_item_page'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1320954415393444317 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1320912220363379541 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Définir ces éléments'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1320958821627446147 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1320912220363379541 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Avec ces valeurs'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 1320954415393444317 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'NOT_NULL'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_fermr_dialg_ifram
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1329672413507217813 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_FERMR_DIALG_IFRAM'
 ,p_display_name => 'AFW - 21 - Fermer dialogue (iFrame)'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_fermr_dialg_ifram'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_inser_trace
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1399919206338109425 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_INSER_TRACE'
 ,p_display_name => 'AFW - 21 - Insérer trace'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.inser_trace'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1400384199261296676 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1399919206338109425 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Valeur 1'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1400388702378297551 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1399919206338109425 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Valeur 2'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/authorization_type/io_afw_21_autor_super_utils
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1458147810392729839 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_SUPER_UTILS'
 ,p_display_name => 'AFW - 21 - Autorisation super utilisateur'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_super_utils'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_confr_sauvg_reqt
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1478118921060476579 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_CONFR_SAUVG_REQT'
 ,p_display_name => 'AFW - 21 - Confirmer la sauvegarde (Requêtes)'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.defnr_afw_21_confr_sauvg'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1478119907814241910 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1478118921060476579 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Message de confirmation'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => true
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1478120416125244279 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1478118921060476579 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Requêtes'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => false
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_regn_afich_mesg_in
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1478170812849811108 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_REGN_AFICH_MESG_IN'
 ,p_display_name => 'AFW - 21 - Afficher message informatif'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_afich_mesg_infor'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_afich_mesg_infor'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_afich_dialg_ifram
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_AFICH_DIALG_IFRAM'
 ,p_display_name => 'AFW - 21 - Afficher dialogue (iFrame)'
 ,p_category => 'NOTIFICATION'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_afich_dialg_ifram'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_afich_dialg_ifram'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1481402749818588046 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Titre'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 30
 ,p_max_length => 50
 ,p_is_translatable => true
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1209583834012478754 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 105
 ,p_prompt => 'SCPI'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1481411574322614077 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Largeur'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '640'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1481723667139469479 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Hauteur'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '480'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1481415961639619825 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Classe CSS'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 30
 ,p_max_length => 100
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1207817731870948230 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 130
 ,p_prompt => 'SAPC'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1481424749996625982 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Redimensionner'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1481429161424629279 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Fermer avec la touche "Échap" (Esc)'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1481433576661633660 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 90
 ,p_prompt => 'Déplaçable'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1391979964286820428 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 100
 ,p_prompt => 'Définir élément SSPC'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1469301264817736373 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 11
 ,p_display_sequence => 110
 ,p_prompt => 'Définir élément SSPI'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1470396753369631906 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 12
 ,p_display_sequence => 120
 ,p_prompt => 'Item clé étrangère'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1206126946866034818 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 14
 ,p_display_sequence => 18
 ,p_prompt => 'Application'
 ,p_attribute_type => 'PLSQL EXPRESSION'
 ,p_is_required => true
 ,p_default_value => 'afw_11_prodt_pkg.obten_numr_apex_prodt'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1206135452061036319 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 15
 ,p_display_sequence => 19
 ,p_prompt => 'Page'
 ,p_attribute_type => 'PLSQL EXPRESSION'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389140033615922100 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogbeforeclose'
 ,p_display_name => 'beforeClose'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389189139980933390 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogclose'
 ,p_display_name => 'close'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1400367448024835114 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogclose_actio_dynmq'
 ,p_display_name => 'close Dynamic Action Plugin'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1400371859106838318 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogclose_procs'
 ,p_display_name => 'close Process Plugin'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389160754047928028 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogdrag'
 ,p_display_name => 'drag'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389156551623927278 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogdragstart'
 ,p_display_name => 'dragStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389164957510929039 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogdragstop'
 ,p_display_name => 'dragStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389152348160926301 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogfocus'
 ,p_display_name => 'focus'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389148145043925393 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogopen'
 ,p_display_name => 'open'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389180733053931428 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogresize'
 ,p_display_name => 'resize'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389169160281929845 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogresizestart'
 ,p_display_name => 'resizeStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389184936170932334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481386973451575988 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogresizestop'
 ,p_display_name => 'resizeStop'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_redrc_url
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1481419908007983576 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_REDRC_URL'
 ,p_display_name => 'AFW - 21 - Redirection URL'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_redrc_url'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1481420115757995254 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481419908007983576 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'URL'
 ,p_attribute_type => 'PLSQL EXPRESSION'
 ,p_is_required => true
 ,p_default_value => 'afw_08_url_pkg.genr_url([saisir les paramètres])'
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_trans_ident_coln
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1482129610232997391 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_TRANS_IDENT_COLN'
 ,p_display_name => 'AFW - 21 - Transformer les identifiants de colonnes d''un IR'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_trans_ident_coln_ir'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1482130005170005426 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1482129610232997391 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Identifiants'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => true
 ,p_help_text => '"A":"Libellé A","B":"Libellé B"'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_pris_charg_navgt
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1488703219552904234 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_PRIS_CHARG_NAVGT'
 ,p_display_name => 'AFW - 21 - Prise en charge du navigateur'
 ,p_category => 'NOTIFICATION'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_pris_charg_navgt'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1488703599597907863 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1488703219552904234 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Titre'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'Avertissement'
 ,p_display_length => 80
 ,p_is_translatable => true
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1488704210333910960 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1488703219552904234 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Message'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'La version de votre navigateur n''est pas supportée. Veuillez en faire la mise à jour ou utilisez un autre navigateur.'
 ,p_display_length => 80
 ,p_max_length => 1000
 ,p_is_translatable => true
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_chang_libl_fil_ari
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1491583102304013373 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_CHANG_LIBL_FIL_ARI'
 ,p_display_name => 'AFW - 21 - Changer libellé fil d''ariane'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.chang_libl_fil_arian'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1491583317195017709 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1491583102304013373 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Nouveau libellé'
 ,p_attribute_type => 'PLSQL EXPRESSION'
 ,p_is_required => true
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_fermr_regn_dialg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1522044434276032206 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_FERMR_REGN_DIALG'
 ,p_display_name => 'AFW - 21 - Fermer dialogue (Région)'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_fermr_regn_dialg'
 ,p_standard_attributes => 'REGION'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_mode_page
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1529647313123277221 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_MODE_PAGE'
 ,p_display_name => 'AFW - 21 - Définir le mode de la page (AFW_04)'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.defnr_afw_04_mode_page'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1529655324897280632 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1529647313123277221 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Item cible'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1529751416979306808 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1529647313123277221 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Valeur par défaut'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_defnr_prodt_safp
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1549135339494598644 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_DEFNR_PRODT_SAFP'
 ,p_display_name => 'AFW - 21 - Définir produit SAFP'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.defnr_prodt_safp'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_afich_regn_dialg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1641842030654281560 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_AFICH_REGN_DIALG'
 ,p_display_name => 'AFW - 21 - Afficher dialogue (Région)'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_afich_regn_dialg'
 ,p_standard_attributes => 'REGION'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1519872739929191724 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1641842030654281560 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Largeur'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 10
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/io_afw_21_tokn_input
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'IO_AFW_21_TOKN_INPUT'
 ,p_display_name => 'AFW - 21 - Token Input'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_item_pkg.genr_tokn_input'
 ,p_ajax_function => 'afw_21_item_pkg.ajax_tokn_input'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:SOURCE:LOV:LOV_REQUIRED'
 ,p_sql_min_column_count => 2
 ,p_sql_max_column_count => 2
 ,p_sql_examples => 'select 1, 2 from dual'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1657790735849369231 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'minChars'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '1'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1667923249849192911 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'prePopulate'
 ,p_attribute_type => 'PLSQL EXPRESSION'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1667923767164197869 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'hintText'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'Tapez un terme de recherche'
 ,p_is_translatable => true
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1667924246516201389 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'noResultsText'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'Aucun résultat'
 ,p_is_translatable => true
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1667925151842212422 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'searchingText'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'Recherche...'
 ,p_is_translatable => true
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1667925654744222634 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'tokenLimit'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1667926163055225057 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'preventDuplicates'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1667931255744320603 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Lazy Load'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1595141623761721600 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 90
 ,p_prompt => 'Largeur (px)'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '400'
 ,p_display_length => 10
 ,p_max_length => 10
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 1667926963879234793 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_name => 'onadd'
 ,p_display_name => 'onAdd'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1667927266649235590 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_name => 'ondelete'
 ,p_display_name => 'onDelete'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1667927573575237560 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_name => 'onready'
 ,p_display_name => 'onReady'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1667926661108233944 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1667921650336928060 + wwv_flow_api.g_id_offset
 ,p_name => 'onresult'
 ,p_display_name => 'onResult'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_group_entet_raprt_sql
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1807448148192677379 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_GROUP_ENTET_RAPRT_SQL'
 ,p_display_name => 'AFW - 21 - Groupe entêtes rapport SQL'
 ,p_category => 'COMPONENT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_group_entet_raprt_sql'
 ,p_standard_attributes => 'REGION'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1807481450900193034 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1807448148192677379 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Ligne 1 - Entêtes '
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => 'Liste des libellés dans les entêtes.<br/>Ex.: ,Valeur,%'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1807481960597195784 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1807448148192677379 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Ligne 1 - colspan/rowspan'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => 'Formatage des entêtes.<br/>Ex.: 1;1,4;1,4;1<br/><br/>colspan;rowspan,colspan;rowspan,colspan;rowspan'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1807483142027199927 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1807448148192677379 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Ligne 2 - Entête'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => true
 ,p_help_text => 'Liste des libellés dans les entêtes.<br/>Ex.: ,Valeur,%'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1807483646183201115 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1807448148192677379 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Ligne 2 - colspan/rowspan'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => 'Formatage des entêtes.<br/>Ex.: 1;1,4;1,4;1<br/><br/>colspan;rowspan,colspan;rowspan,colspan;rowspan'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1807484557611204428 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1807448148192677379 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Ligne 3 - Entêtes'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => true
 ,p_help_text => 'Liste des libellés dans les entêtes.<br/>Ex.: ,Valeur,%'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1807485058996204844 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1807448148192677379 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Ligne 3 - colspan/rowspan'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => 'Formatage des entêtes.<br/>Ex.: 1;1,4;1,4;1<br/><br/>colspan;rowspan,colspan;rowspan,colspan;rowspan'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1494330993677625130 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1807448148192677379 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Classe CSS surlignement'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_default_value => 'ir_matrc_surlg_tous'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1494331790709785046 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1807448148192677379 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Sélecteur jQuery surlignement'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_default_value => 'tr:contains(''**Tous**''), tr:contains(''Total'')'
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_group_entet_raprt
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_GROUP_ENTET_RAPRT'
 ,p_display_name => 'AFW - 21 - Groupe entêtes rapport interactif'
 ,p_category => 'COMPONENT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_group_entet_raprt_inter'
 ,p_standard_attributes => 'REGION'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1838931683153417811 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Ligne 1 - Entêtes/colspan/rowspan'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 100
 ,p_max_length => 1000
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1838943889733419715 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Ligne 2 - Entêtes/colspan/rowspan'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 100
 ,p_max_length => 1000
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1838948292503420489 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Ligne 3 - Entêtes/colspan/rowspan'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 100
 ,p_max_length => 1000
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1637376416522755596 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Libellé à transformer'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 4000
 ,p_is_translatable => false
 ,p_help_text => 'Syntax is [COLUMN_ID];[NEW_LABEL],[OTHER_COLUMN_ID];[OTHER_NEW_LABEL]...'||unistr('\000a')||
''||unistr('\000a')||
'Ex: CODE_1;Label_1,CODE_2;Label_2'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1637799117402113064 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Gérer ventilation'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1637799629176116508 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Classe CSS ventilation'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 1637799117402113064 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1637800617879122676 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Classe CSS ventilation horizontale'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 1637799117402113064 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1637801124805124712 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Classe CSS ventilation verticale'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 1637799117402113064 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1637815635249581964 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 90
 ,p_prompt => 'Classe CSS ventilation gauche'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 1637799117402113064 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1637824117363860702 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 100
 ,p_prompt => 'Nombre colonnes ventilation gauche'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '1'
 ,p_display_length => 5
 ,p_max_length => 5
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 1637799117402113064 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1494008810876857620 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 11
 ,p_display_sequence => 110
 ,p_prompt => 'Classe CSS surlignement'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_default_value => 'ir_matrc_surlg_tous'
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1494009319880860156 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1838798967344347009 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 12
 ,p_display_sequence => 120
 ,p_prompt => 'Sélecteur jQuery surlignement'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_default_value => 'table.apexir_WORKSHEET_DATA tr:contains(''**Tous**'')'
 ,p_display_length => 100
 ,p_max_length => 1000
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_regn_afich_mesg_pr
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1906770408955205332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_REGN_AFICH_MESG_PR'
 ,p_display_name => 'AFW - 21 - Afficher message processus'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_afich_mesg_procs'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_afich_mesg_procs'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_fil_arian
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1908572113871945184 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_FIL_ARIAN'
 ,p_display_name => 'AFW - 21 - Fil d''ariane'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_afw_04_fil_arian'
 ,p_substitute_attributes => true
 ,p_reference_id => 448659041313949161
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1908576283874946010 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908572113871945184 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Icône'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'ui-icon-arrowthick-1-e'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908576682849946017 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908576283874946010 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'ui-icon-arrowthick-1-e'
 ,p_return_value => 'ui-icon-arrowthick-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908577200302946017 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908576283874946010 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'ui-icon-arrow-1-e'
 ,p_return_value => 'ui-icon-arrow-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908577706113946018 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908576283874946010 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'ui-icon-carat-1-e'
 ,p_return_value => 'ui-icon-carat-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908578183842946018 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908576283874946010 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'ui-icon-triangle-1-e'
 ,p_return_value => 'ui-icon-triangle-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908578685296946020 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908576283874946010 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'ui-icon-circle-arrow-e'
 ,p_return_value => 'ui-icon-circle-arrow-e'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1908579208659946023 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908572113871945184 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Préfixe'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 30
 ,p_max_length => 50
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1908579588053946023 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908572113871945184 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Mode'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'AVANC'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908580008242946024 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908579588053946023 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Classique'
 ,p_return_value => 'CLASQ'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908580485916946024 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908579588053946023 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Avancé'
 ,p_return_value => 'AVANC'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1908581012459946024 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908572113871945184 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Afficher informations supplémentaires'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1908581389383946024 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908572113871945184 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Inclure le contexte'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 1908581012459946024 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1001879440270525055 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908572113871945184 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Afficher premier niveau'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_valdt_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1922901631536438599 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_VALDT_CLOB'
 ,p_display_name => 'AFW - 21 - Validation - CLOB'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.valdt_afw_21_colct_clob'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1922924729590447421 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1922901631536438599 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Type de validation'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'NOT_NULL'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1922929135823449257 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1922924729590447421 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'La valeur n''est pas nulle'
 ,p_return_value => 'NOT_NULL'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1922960339763459879 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1922901631536438599 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Numéro message'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 30
 ,p_max_length => 20
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1922980326389465458 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1922901631536438599 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Item'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1922988633661467591 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1922901631536438599 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Colonne'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 60
 ,p_max_length => 30
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_surpm_colct_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1930530128907752315 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_SURPM_COLCT_CLOB'
 ,p_display_name => 'AFW - 21 - Supprimer collection - CLOB'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.suprm_afw_21_colct_clob'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_suprm_item_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1932756931975774974 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_SUPRM_ITEM_CLOB'
 ,p_display_name => 'AFW - 21 - Supprimer contenu items - CLOB'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_suprm_item_clob'
 ,p_standard_attributes => 'STOP_EXECUTION_ON_ERROR'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1932764905094776707 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1932756931975774974 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Liste des items (clob)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 1932781411898844904 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1932756931975774974 + wwv_flow_api.g_id_offset
 ,p_name => 'suprm_item_clob_delete_termn'
 ,p_display_name => 'Supprimer items CLOB terminé (DELETE)'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_calnd
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_CALND'
 ,p_display_name => 'AFW - 21 - Calendrier'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_plugn_regn_calnd'
 ,p_ajax_function => 'afw_21_regn_pkg.ajax_plugn_regn_calnd'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1492442719392556823 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Code du calendrier'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 2073043140537620477 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'dayclick'
 ,p_display_name => 'dayClick'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064436245165419696 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'drop'
 ,p_display_name => 'drop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064386125295404514 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventafterrender'
 ,p_display_name => 'eventAfterRender'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2073043445039621788 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventclick'
 ,p_display_name => 'eventClick'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064415127157414471 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventdragstart'
 ,p_display_name => 'eventDragStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064410923002413323 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventdragstop'
 ,p_display_name => 'eventDragStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064419331313415706 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventdrop'
 ,p_display_name => 'eventDrop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064365145287353546 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventmouseout'
 ,p_display_name => 'eventMouseout'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064360832474349826 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventmouseover'
 ,p_display_name => 'eventMouseover'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064381926025357439 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventrender'
 ,p_display_name => 'eventRender'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064431940663418373 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventresize'
 ,p_display_name => 'eventResize'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064423533737416404 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventresizestart'
 ,p_display_name => 'eventResizeStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064427736161417154 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'eventresizestop'
 ,p_display_name => 'eventResizeStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064377722562356392 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'loading'
 ,p_display_name => 'loading'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1477560904483464961 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'loadingstart'
 ,p_display_name => 'loadingStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1477561309678466430 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'loadingstop'
 ,p_display_name => 'loadingStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064369348057354340 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'select'
 ,p_display_name => 'select'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064373551174355178 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'unselect'
 ,p_display_name => 'unselect'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064390330143405896 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'viewdisplay'
 ,p_display_name => 'viewDisplay'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2064394533260406759 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2072930249391134537 + wwv_flow_api.g_id_offset
 ,p_name => 'windowresize'
 ,p_display_name => 'windowResize'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_soumt_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2326168999202100331 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_SOUMT_CLOB'
 ,p_display_name => 'AFW - 21 - Soumettre - CLOB'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_soumt_clob'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_soumt_clob'
 ,p_standard_attributes => 'STOP_EXECUTION_ON_ERROR'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2326188791714107677 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2326168999202100331 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Liste des items (clob)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 2328381785281666989 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2326168999202100331 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_create_clob_termn'
 ,p_display_name => 'Soumettre CLOB terminé (CREATE)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1914006933265747854 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2326168999202100331 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_delete_clob_termn'
 ,p_display_name => 'Soumettre CLOB terminé (DELETE)'||unistr('\000a')||
''
  );
wwv_flow_api.create_plugin_event (
  p_id => 1914002723915745215 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2326168999202100331 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_save_clob_termn'
 ,p_display_name => 'Soumettre CLOB terminé (SAVE)'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_dml_obten_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2329278175015947872 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_DML_OBTEN_CLOB'
 ,p_display_name => 'AFW - 21 - Extraction de ligne automatisée (DML) - CLOB'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_dml_obten_clob'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_dml_obten_clob'
 ,p_standard_attributes => 'STOP_EXECUTION_ON_ERROR'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2329439377009967408 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2329278175015947872 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Table (Vue)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 60
 ,p_max_length => 92
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2329484361210972332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2329278175015947872 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Elément contenant la valeur de colonne de clé primaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2329488768482974374 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2329278175015947872 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Colonne de clé primaire'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 60
 ,p_max_length => 30
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2329493174716976207 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2329278175015947872 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Elément contenant la valeur de colonne de clé secondaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2329497585797979372 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2329278175015947872 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Colonne de clé secondaire'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 30
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2330466474117382894 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2329278175015947872 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Liste des items (séparées par des virgules)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2330504483814385627 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2329278175015947872 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Liste des colonnes (séparées par des virgules)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 100
 ,p_max_length => 200
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/process_type/io_afw_21_dml_maj_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2345263745030597796 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_DML_MAJ_CLOB'
 ,p_display_name => 'AFW - 21 - Traitement de ligne automatique (DML) - CLOB'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.dml_maj_clob'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2345359847023617340 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2345263745030597796 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Table (Vue)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 60
 ,p_max_length => 92
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2345364255681619843 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2345263745030597796 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Elément contenant la valeur de colonne de clé primaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2345368660876621255 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2345263745030597796 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Colonne de clé primaire'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 60
 ,p_max_length => 30
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2345373033995622977 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2345263745030597796 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Elément contenant la valeur de colonne de clé secondaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2345377438843624401 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2345263745030597796 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Colonne de clé secondaire'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 30
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2345396958236629982 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2345263745030597796 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Liste des items (séparées par des virgules)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2345401334126632480 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2345263745030597796 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Liste des colonnes (séparées par des virgules)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 100
 ,p_max_length => 200
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_telvr_fichr
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 4474183196331934827 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_TELVR_FICHR'
 ,p_display_name => 'AFW - 21 - Téléversement des fichiers'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_telvr_fichr'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.9'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3007721884343401504 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4474183196331934827 + wwv_flow_api.g_id_offset
 ,p_name => 'selct_termn_regn'
 ,p_display_name => 'Sélection terminée'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_soumt_blob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 4480561477858286677 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_SOUMT_BLOB'
 ,p_display_name => 'AFW - 21 - Soumettre - BLOB'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_soumt_blob'
 ,p_ajax_function => 'afw_21_actio_dynmq_pkg.ajax_soumt_blob'
 ,p_standard_attributes => 'STOP_EXECUTION_ON_ERROR'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3031344459892601030 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480561477858286677 + wwv_flow_api.g_id_offset
 ,p_name => 'debut_telvr'
 ,p_display_name => 'Débuter téléversement'
  );
wwv_flow_api.create_plugin_event (
  p_id => 4480585479721296683 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480561477858286677 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_create_blob_termn'
 ,p_display_name => 'Soumettre BLOB terminé (CREATE)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 4480589683184297611 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480561477858286677 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_delete_blob_termn'
 ,p_display_name => 'Soumettre BLOB terminé (DELETE)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3031348867164603129 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480561477858286677 + wwv_flow_api.g_id_offset
 ,p_name => 'termn_telvr'
 ,p_display_name => 'Terminer téléversement'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/com_skillbuilders_sbip_password
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'COM_SKILLBUILDERS_SBIP_PASSWORD'
 ,p_display_name => 'SkillBuilders Password'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'FUNCTION sbip_password_render ('||unistr('\000a')||
'   p_item                IN APEX_PLUGIN.T_PAGE_ITEM,'||unistr('\000a')||
'   p_plugin              IN APEX_PLUGIN.T_PLUGIN,'||unistr('\000a')||
'   p_value               IN VARCHAR2,'||unistr('\000a')||
'   p_is_readonly         IN BOOLEAN,'||unistr('\000a')||
'   p_is_printer_friendly IN BOOLEAN '||unistr('\000a')||
')'||unistr('\000a')||
''||unistr('\000a')||
'   RETURN APEX_PLUGIN.T_PAGE_ITEM_RENDER_RESULT'||unistr('\000a')||
'   '||unistr('\000a')||
'IS'||unistr('\000a')||
''||unistr('\000a')||
'   l_retval             APEX_PLUGIN.T_PAGE_ITEM_RENDER_RESULT;'||unistr('\000a')||
'   l_name               VARCHAR'||
'2(30);'||unistr('\000a')||
'   l_submit_on_enter    VARCHAR2(1) := NVL(p_item.attribute_01, ''Y'');'||unistr('\000a')||
'   l_message_icon       VARCHAR2(20) := NVL(p_item.attribute_02, ''ui-icon-alert'');'||unistr('\000a')||
'   l_message_text       VARCHAR2(500) := NVL(p_item.attribute_03, ''Caps Lock is enabled.'');'||unistr('\000a')||
'   l_message_width      PLS_INTEGER := NVL(p_item.attribute_04, 150);'||unistr('\000a')||
'   l_message_alignment  VARCHAR2(20) := NVL(p_item.attribute_05, ''center botto'||
'm'');'||unistr('\000a')||
'   l_password_alignment VARCHAR2(20) := NVL(p_item.attribute_06, ''center top'');'||unistr('\000a')||
'   l_offset             VARCHAR2(20) := NVL(p_item.attribute_07, ''0'');'||unistr('\000a')||
'   l_jqueryui_theme     VARCHAR2(30) := p_plugin.attribute_01;'||unistr('\000a')||
'   l_onload_code        VARCHAR2(32767);'||unistr('\000a')||
'   l_crlf               CHAR(2) := CHR(13)||CHR(10);'||unistr('\000a')||
'   '||unistr('\000a')||
'BEGIN'||unistr('\000a')||
''||unistr('\000a')||
'   IF apex_application.g_debug'||unistr('\000a')||
'   THEN'||unistr('\000a')||
'      apex_plugin_util.debug_page_ite'||
'm ('||unistr('\000a')||
'         p_plugin              => p_plugin,'||unistr('\000a')||
'         p_page_item           => p_item,'||unistr('\000a')||
'         p_value               => p_value,'||unistr('\000a')||
'         p_is_readonly         => p_is_readonly,'||unistr('\000a')||
'         p_is_printer_friendly => p_is_printer_friendly'||unistr('\000a')||
'      );'||unistr('\000a')||
'   END IF;'||unistr('\000a')||
''||unistr('\000a')||
'   l_name := apex_plugin.get_input_name_for_page_item(FALSE);'||unistr('\000a')||
''||unistr('\000a')||
'   IF p_is_readonly OR p_is_printer_friendly'||unistr('\000a')||
'   THEN'||unistr('\000a')||
'      NULL;--Password sho'||
'uld not be displayed'||unistr('\000a')||
'   ELSE'||unistr('\000a')||
'      sys.htp.p('||unistr('\000a')||
'            ''<input type="password" name="'' || l_name || ''" id="'' || p_item.name || ''" value="'' '||unistr('\000a')||
'         || p_value || ''" size="'' || p_item.element_width || ''" maxlength="'' || p_item.element_max_length '||unistr('\000a')||
'         || ''" '' || p_item.element_attributes || '' '''||unistr('\000a')||
'         || CASE'||unistr('\000a')||
'               WHEN l_submit_on_enter = ''Y'''||unistr('\000a')||
'               THEN ''onkeypress="ret'||
'urn submitEnter(this,event)"'''||unistr('\000a')||
'            END'||unistr('\000a')||
'         || ''/>'''||unistr('\000a')||
'      );'||unistr('\000a')||
''||unistr('\000a')||
'      apex_javascript.add_library('||unistr('\000a')||
'         p_name      => ''com_skillbuilders_sbip_password.min'','||unistr('\000a')||
'         p_directory => p_plugin.file_prefix,'||unistr('\000a')||
'         p_version   => NULL'||unistr('\000a')||
'      );'||unistr('\000a')||
''||unistr('\000a')||
'      l_onload_code := ''apex.jQuery("input#'' || p_item.name || ''").sbip_password({'' || l_crlf'||unistr('\000a')||
'         || ''   '' || apex_javascript.add_attribute'||
'(''warningMsgIcon'', l_message_icon) || l_crlf'||unistr('\000a')||
'         || ''   '' || apex_javascript.add_attribute(''warningMsgText'', l_message_text) || l_crlf'||unistr('\000a')||
'         || ''   '' || apex_javascript.add_attribute(''warningMsgWidth'', l_message_width) || l_crlf'||unistr('\000a')||
'         || ''   '' || apex_javascript.add_attribute(''warningMsgAlignment'', l_message_alignment) || l_crlf'||unistr('\000a')||
'         || ''   '' || apex_javascript.add_attribute(''passwo'||
'rdAlignment'', l_password_alignment) || l_crlf'||unistr('\000a')||
'         || ''   '' || apex_javascript.add_attribute(''offset'', l_offset, TRUE, FALSE) || l_crlf'||unistr('\000a')||
'         || ''});'';'||unistr('\000a')||
'         '||unistr('\000a')||
'      apex_javascript.add_onload_code('||unistr('\000a')||
'         p_code => l_onload_code'||unistr('\000a')||
'      ); '||unistr('\000a')||
'      '||unistr('\000a')||
'      IF l_jqueryui_theme IS NOT NULL'||unistr('\000a')||
'      THEN'||unistr('\000a')||
'         apex_css.add_file('||unistr('\000a')||
'            p_name      => ''jquery-ui'','||unistr('\000a')||
'            p_directory ='||
'> apex_application.g_image_prefix || ''libraries/jquery-ui/1.8/themes/'' || l_jqueryui_theme || ''/'','||unistr('\000a')||
'            p_version   => NULL'||unistr('\000a')||
'         );'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
''||unistr('\000a')||
'      l_retval.is_navigable := TRUE;'||unistr('\000a')||
'   END IF;'||unistr('\000a')||
'        '||unistr('\000a')||
'   RETURN l_retval;'||unistr('\000a')||
'    '||unistr('\000a')||
'END sbip_password_render;'
 ,p_render_function => 'sbip_password_render'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:ELEMENT:WIDTH:HEIGHT:ENCRYPT'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '1'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Theme'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => '<p>Use this setting to control the basic color scheme of the warning message. Other aspects of the warning message, including the icon, text, width, and placement on the page, are configured via components settings.</p>'||unistr('\000a')||
''||unistr('\000a')||
'<p style="font-style:italic">Tip: The Theme setting adds a link to a CSS file on the APEX page where the component is used. If possible, it’s best to manually add the link to the CSS file in the page template where the component is used. This can improve performance/caching while decreasing the likelihood of a conflict due to another plug-in linking to a different CSS file. This setting can then be disabled by selecting the null value (- Select Theme-).</p>'||unistr('\000a')||
''||unistr('\000a')||
'<p style="font-style:italic">Tip: The plug-in is skinned using the jQuery UI CSS Framework . To learn more or create a custom theme visit:  http://docs.jquery.com/UI/Theming and http://jqueryui.com/themeroller.  </p>'||unistr('\000a')||
''
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764694167479740415 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Base (APEX Default)'
 ,p_return_value => 'base'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764694570942741411 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Black Tie'
 ,p_return_value => 'black-tie'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764713474406742382 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Blitzer'
 ,p_return_value => 'blitzer'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764722079254743755 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'Cupertino'
 ,p_return_value => 'cupertino'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764722582024744574 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'Dark Hive'
 ,p_return_value => 'dark-hive'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764723385141745537 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 60
 ,p_display_value => 'Dot Luv'
 ,p_return_value => 'dot-luv'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764723755490746437 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 70
 ,p_display_value => 'Eggplant'
 ,p_return_value => 'eggplant'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764739658953747392 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 80
 ,p_display_value => 'Excite Bike'
 ,p_return_value => 'excite-bike'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764740162762748506 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 90
 ,p_display_value => 'Flick'
 ,p_return_value => 'flick'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764740565879749375 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 100
 ,p_display_value => 'Hot Sneaks'
 ,p_return_value => 'hot-sneaks'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764852965196824857 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 110
 ,p_display_value => 'Humanity'
 ,p_return_value => 'humanity'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764853467966825713 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 120
 ,p_display_value => 'Le Frog'
 ,p_return_value => 'le-frog'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764853971083826570 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 130
 ,p_display_value => 'Mint Choc'
 ,p_return_value => 'mint-choc'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764854374200827486 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 140
 ,p_display_value => 'Overcast'
 ,p_return_value => 'overcast'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764861877316828341 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 150
 ,p_display_value => 'Pepper Grinder'
 ,p_return_value => 'pepper-grinder'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764862979740829115 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 160
 ,p_display_value => 'Smoothness'
 ,p_return_value => 'smoothness'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764863884935830630 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 170
 ,p_display_value => 'South Street'
 ,p_return_value => 'south-street'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764864287705831389 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 180
 ,p_display_value => 'Start'
 ,p_return_value => 'start'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764864758054832254 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 190
 ,p_display_value => 'Sunny'
 ,p_return_value => 'sunny'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764865260478832992 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 200
 ,p_display_value => 'Swanky Purse'
 ,p_return_value => 'swanky-purse'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764865663941833968 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 210
 ,p_display_value => 'Trontastic'
 ,p_return_value => 'trontastic'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764867571214836097 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 220
 ,p_display_value => 'UI Darkness'
 ,p_return_value => 'ui-darkness'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764868174331837010 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 230
 ,p_display_value => 'UI Lightness'
 ,p_return_value => 'ui-lightness'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9764869278833838324 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9764677262631739006 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 240
 ,p_display_value => 'Vader'
 ,p_return_value => 'vader'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 9716645777190251786 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Submit when Enter pressed'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_help_text => 'Use this setting the control whether or not the page will be submitted if the user presses the Enter button when this field has focus.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 9716575771865240813 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Warning Message Icon'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'ui-icon-alert'
 ,p_is_translatable => false
 ,p_help_text => 'Use this setting to change the icon that is displayed to the left of the warning message text.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9716593674289241496 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9716575771865240813 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Alert'
 ,p_return_value => 'ui-icon-alert'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9716617177059242292 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9716575771865240813 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Info'
 ,p_return_value => 'ui-icon-info'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9716619485370244726 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9716575771865240813 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Notice'
 ,p_return_value => 'ui-icon-notice'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 9716572557666236693 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Warning Message Text'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'Caps Lock is enabled.'
 ,p_display_length => 50
 ,p_max_length => 100
 ,p_is_translatable => false
 ,p_help_text => 'Use this setting to change the text that is displayed to the user if the Caps Lock is on when keys are pressed in the password field.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 9716665481954272104 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Warning Message Width'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_default_value => '170'
 ,p_display_length => 2
 ,p_max_length => 3
 ,p_is_translatable => false
 ,p_help_text => 'Use this setting to set the width of the warning message in pixels. '
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 9759659963708342014 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Warning Message Alignment'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'center bottom'
 ,p_is_translatable => false
 ,p_help_text => 'Use this setting to specify which part the warning message should align with the password element.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759662274097344943 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759659963708342014 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Left Top'
 ,p_return_value => 'left top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759662777214345913 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759659963708342014 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Left Center'
 ,p_return_value => 'left center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759663381023346971 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759659963708342014 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Left Bottom'
 ,p_return_value => 'left bottom'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759664985872348401 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759659963708342014 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'Center Top'
 ,p_return_value => 'center top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759674458991350120 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759659963708342014 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'Center Center'
 ,p_return_value => 'center center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759675462800351216 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759659963708342014 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 60
 ,p_display_value => 'Center Bottom'
 ,p_return_value => 'center bottom'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759676066263352147 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759659963708342014 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 70
 ,p_display_value => 'Right Top'
 ,p_return_value => 'right top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759676970765353425 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759659963708342014 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 80
 ,p_display_value => 'Right Center'
 ,p_return_value => 'right center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759677773882354347 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759659963708342014 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 90
 ,p_display_value => 'Right Bottom'
 ,p_return_value => 'right bottom'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 9759756861986417123 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Password Element Alignment'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'center top'
 ,p_is_translatable => false
 ,p_help_text => 'Use this setting to specify which part of the password element the warning message should align with.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759758065449418155 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759756861986417123 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Left Top'
 ,p_return_value => 'left top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759777270297419542 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759756861986417123 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Left Center'
 ,p_return_value => 'left center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759778374106420637 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759756861986417123 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Left Bottom'
 ,p_return_value => 'left bottom'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759780377916421776 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759756861986417123 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'Center Top'
 ,p_return_value => 'center top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759793582071422986 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759756861986417123 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'Center Center'
 ,p_return_value => 'center center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9759921885535423990 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759756861986417123 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 60
 ,p_display_value => 'Center Bottom'
 ,p_return_value => 'center bottom'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9760630457269425286 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759756861986417123 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 70
 ,p_display_value => 'Right Top'
 ,p_return_value => 'right top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9760882559693425916 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759756861986417123 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 80
 ,p_display_value => 'Right Center'
 ,p_return_value => 'right center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 9760883062117426624 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 9759756861986417123 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 90
 ,p_display_value => 'Right Bottom'
 ,p_return_value => 'right bottom'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 9760897284889452105 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Offset'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => '0'
 ,p_display_length => 5
 ,p_max_length => 7
 ,p_is_translatable => false
 ,p_help_text => 'Use this setting to specify how many pixels the warning message should be offset from the element. Up to 2 numbers can be specified (separated by a blank space). These numbers represent the left and top offsets respectively. If only one number is specified then it will be used for both the top and left offsets.'
  );
null;
 
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
 
wwv_flow_api.create_plugin_file (
  p_id => 10266250079298838092 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 9574386768627312912 + wwv_flow_api.g_id_offset
 ,p_file_name => 'com_skillbuilders_sbip_password.min.js'
 ,p_mime_type => 'application/x-javascript'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

prompt  ...data loading
--
prompt  ...post import process
 
begin
 
wwv_flow_api.post_import_process(p_flow_id => wwv_flow.g_flow_id);
null;
 
end;
/

--application/end_environment
commit;
commit;

--export elap=           9.2788
