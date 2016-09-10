set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 1000008 - Assurance qualité
--
-- Application Export:
--   Application:     1000008
--   Name:            Assurance qualité
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
--   Pages:                      8
--     Items:                   25
--     Processes:               13
--     Regions:                 25
--     Buttons:                  1
--     Dynamic Actions:          5
--   Shared Components:
--     Logic:
--       Items:                 96
--       Processes:             36
--       Computations:           1
--     Navigation:
--       Lists:                  4
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
--       Shortcuts:              7
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,1000008);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,1000008));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,1000008));
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
  p_id    => nvl(wwv_flow_application_install.get_application_id,1000008),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,1000008),
  p_owner => nvl(wwv_flow_application_install.get_schema,'APEXFRAMEWORK'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Assurance qualité'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'1000008'),
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
  p_authentication_id=> 3712208183904221 + wwv_flow_api.g_id_offset,
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
  p_id => 3673421501533763 + wwv_flow_api.g_id_offset
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
  p_id => 3593011126314109 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_03 => 'N'
  );
--application/plug-in setting/item_type_plugin_io_afw_21_selct_2
wwv_flow_api.create_plugin_setting (
  p_id => 7780321107184708 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'PLUGIN_IO_AFW_21_SELCT_2'
 ,p_attribute_01 => 'Y'
  );
--application/plug-in setting/item_type_plugin_io_afw_21_item_popup_arbor
wwv_flow_api.create_plugin_setting (
  p_id => 1977907041890320032 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'PLUGIN_IO_AFW_21_ITEM_POPUP_ARBOR'
 ,p_attribute_01 => '&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
 ,p_attribute_02 => '&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
  );
--application/plug-in setting/item_type_plugin_com_skillbuilders_sbip_password
wwv_flow_api.create_plugin_setting (
  p_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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
  p_id => 1981905334856346683 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Administrateur SAF'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''SUPER_UTILS'');'
 ,p_error_message => 'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/administrateur_produit
wwv_flow_api.create_security_scheme (
  p_id => 1981906043298358637 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Administrateur produit'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''ADMIN'');'
 ,p_error_message => 'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/développeur
wwv_flow_api.create_security_scheme (
  p_id => 1981906254034361692 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Développeur'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'return afw_11_utils_pkg.verfc_role_prodt(afw_12_utils_pkg.obten_usagr_conct, ''SAFP'', ''DEVLP'');'
 ,p_error_message => 'Vous n''avez pas les autorisations d''accès adéquates pour accéder à cette page.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/création
wwv_flow_api.create_security_scheme (
  p_id => 2175330032991920251 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Création'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTOR_CREAT'
 ,p_error_message => 'Accès refusé.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/modification
wwv_flow_api.create_security_scheme (
  p_id => 2177331147039463610 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Modification'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTOR_MODFC'
 ,p_error_message => 'Accès refusé.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/suppression
wwv_flow_api.create_security_scheme (
  p_id => 2177343020159465284 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Suppression'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTOR_SUPRS'
 ,p_error_message => 'Accès refusé.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/opération_dml
wwv_flow_api.create_security_scheme (
  p_id => 2177358825700466914 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Opération DML'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTOR_OPERT_DML'
 ,p_error_message => 'Accès refusé.'
 ,p_caching => 'BY_USER_BY_PAGE_VIEW'
  );
--application/shared_components/security/authorization/accès_page
wwv_flow_api.create_security_scheme (
  p_id => 2178262948948852109 + wwv_flow_api.g_id_offset
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
  p_id => 2009914358633506713 + wwv_flow_api.g_id_offset,
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
  p_id => 2009509572501508595 + wwv_flow_api.g_id_offset,
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
  p_id => 2009509160726505171 + wwv_flow_api.g_id_offset,
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
  p_id => 2018660751830489222 + wwv_flow_api.g_id_offset,
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
  p_id => 2015786259633506227 + wwv_flow_api.g_id_offset,
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
  p_id => 2010104158926751971 + wwv_flow_api.g_id_offset,
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
  p_id => 2009706366926276889 + wwv_flow_api.g_id_offset,
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
  p_id => 2051261736812270545 + wwv_flow_api.g_id_offset,
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
  p_id => 1978376444526854174 + wwv_flow_api.g_id_offset,
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
  p_id => 1994899535678627556 + wwv_flow_api.g_id_offset,
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
  p_id => 1994715141293534519 + wwv_flow_api.g_id_offset,
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
  p_id => 2010321357900439936 + wwv_flow_api.g_id_offset,
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
  p_id => 2069798981438274133 + wwv_flow_api.g_id_offset,
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
  p_id => 2034870331929053322 + wwv_flow_api.g_id_offset,
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
  p_id => 2112908835870904922 + wwv_flow_api.g_id_offset,
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
  p_id => 2020478435462590971 + wwv_flow_api.g_id_offset,
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
  p_id => 2009588067414244492 + wwv_flow_api.g_id_offset,
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
  p_id => 2009587560142242340 + wwv_flow_api.g_id_offset,
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
  p_id => 1978368737394587155 + wwv_flow_api.g_id_offset,
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
  p_id => 2020478844943603207 + wwv_flow_api.g_id_offset,
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
  p_id => 2051245926077267403 + wwv_flow_api.g_id_offset,
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
  p_id => 1981937349821306516 + wwv_flow_api.g_id_offset,
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
  p_id => 2013649558593739947 + wwv_flow_api.g_id_offset,
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
  p_id => 2013649252013738068 + wwv_flow_api.g_id_offset,
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
  p_id => 1977109464455980780 + wwv_flow_api.g_id_offset,
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
  p_id => 2009277361292220067 + wwv_flow_api.g_id_offset,
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
  p_id => 2009508784144502493 + wwv_flow_api.g_id_offset,
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
  p_id => 2010102467883726112 + wwv_flow_api.g_id_offset,
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
  p_id => 2010221358905051246 + wwv_flow_api.g_id_offset,
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
  p_id => 2015793340857595488 + wwv_flow_api.g_id_offset,
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
  p_id => 2020479235031609786 + wwv_flow_api.g_id_offset,
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
  p_id => 2020479445420612769 + wwv_flow_api.g_id_offset,
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
  p_id => 2020480163213627368 + wwv_flow_api.g_id_offset,
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
  p_id => 2009277875837224226 + wwv_flow_api.g_id_offset,
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
  p_id => 2010103879573748434 + wwv_flow_api.g_id_offset,
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
  p_id => 1978376261364849578 + wwv_flow_api.g_id_offset,
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
  p_id => 2009561267358440165 + wwv_flow_api.g_id_offset
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
  p_id => 2009274959467162779 + wwv_flow_api.g_id_offset
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
  p_id => 2009561476362442765 + wwv_flow_api.g_id_offset
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
  p_id => 2093553932299290146 + wwv_flow_api.g_id_offset
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
  p_id => 2009561679479443626 + wwv_flow_api.g_id_offset
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
  p_id => 2009562084673445134 + wwv_flow_api.g_id_offset
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
  p_id => 2009561881903444386 + wwv_flow_api.g_id_offset
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
  p_id => 2093561939572292253 + wwv_flow_api.g_id_offset
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
  p_id => 2401208225836433349 + wwv_flow_api.g_id_offset
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
  p_id => 2009953066126080678 + wwv_flow_api.g_id_offset
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
  p_id => 2009562287097445911 + wwv_flow_api.g_id_offset
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
  p_id => 2010640863822944717 + wwv_flow_api.g_id_offset
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
  p_id => 2063403671582694929 + wwv_flow_api.g_id_offset
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
  p_id => 2009369171863406115 + wwv_flow_api.g_id_offset
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
  p_id => 9243208086980375 + wwv_flow_api.g_id_offset
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
  p_id => 1994997244251648910 + wwv_flow_api.g_id_offset
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
  p_id => 1813575493885871424 + wwv_flow_api.g_id_offset
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
  p_id => 1978836458099656525 + wwv_flow_api.g_id_offset
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
  p_id => 1978835161946610361 + wwv_flow_api.g_id_offset
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
  p_id => 1994989236979646795 + wwv_flow_api.g_id_offset
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
  p_id => 2039775630469856079 + wwv_flow_api.g_id_offset
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
  p_id => 2084196144856938316 + wwv_flow_api.g_id_offset
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
  p_id => 2039767625621854727 + wwv_flow_api.g_id_offset
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
  p_id => 9243418160980375 + wwv_flow_api.g_id_offset
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
  p_id => 9243729602980376 + wwv_flow_api.g_id_offset
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
  p_id => 79667621624940765 + wwv_flow_api.g_id_offset
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
  p_id => 79726012841619140 + wwv_flow_api.g_id_offset
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
  p_id => 1812843894018840400 + wwv_flow_api.g_id_offset
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
  p_id => 2082690740768066629 + wwv_flow_api.g_id_offset
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
  p_id => 2082706746655068328 + wwv_flow_api.g_id_offset
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
  p_id => 2082714749079069056 + wwv_flow_api.g_id_offset
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
  p_id => 2082698743192067366 + wwv_flow_api.g_id_offset
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
  p_id => 2220036238252493980 + wwv_flow_api.g_id_offset
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
  p_id => 1812843791495840399 + wwv_flow_api.g_id_offset
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
  p_id => 1362923168908118941 + wwv_flow_api.g_id_offset
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
  p_id => 1995013050138650580 + wwv_flow_api.g_id_offset
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
  p_id => 2007530840402484040 + wwv_flow_api.g_id_offset
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
  p_id => 1966757529587732176 + wwv_flow_api.g_id_offset
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
  p_id => 2069798167932270231 + wwv_flow_api.g_id_offset
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
  p_id => 2196290948164025089 + wwv_flow_api.g_id_offset
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
  p_id => 2214714630973298316 + wwv_flow_api.g_id_offset
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
  p_id => 14460913667804848 + wwv_flow_api.g_id_offset
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
  p_id => 2112838938462867907 + wwv_flow_api.g_id_offset
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
  p_id => 2212108727005710522 + wwv_flow_api.g_id_offset
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
  p_id => 2212019636655684903 + wwv_flow_api.g_id_offset
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
  p_id => 2211996429036682715 + wwv_flow_api.g_id_offset
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
  p_id => 2211792843833630264 + wwv_flow_api.g_id_offset
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
  p_id => 2112830933614866453 + wwv_flow_api.g_id_offset
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
  p_id => 2222779326795081586 + wwv_flow_api.g_id_offset
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
  p_id => 1978367951677572393 + wwv_flow_api.g_id_offset
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
  p_id => 2010322063919451091 + wwv_flow_api.g_id_offset
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
  p_id => 2010321860109449980 + wwv_flow_api.g_id_offset
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
  p_id => 2020481847854689175 + wwv_flow_api.g_id_offset
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
  p_id => 2035686139569352119 + wwv_flow_api.g_id_offset
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
  p_id => 2038434857214830489 + wwv_flow_api.g_id_offset
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
  p_id => 2017722839745721185 + wwv_flow_api.g_id_offset
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
  p_id => 2017727647148732819 + wwv_flow_api.g_id_offset
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
  p_id => 2017727445763732375 + wwv_flow_api.g_id_offset
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
  p_id => 2017723751173724546 + wwv_flow_api.g_id_offset
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
  p_id => 2017724053250725152 + wwv_flow_api.g_id_offset
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
  p_id => 2017721658314717072 + wwv_flow_api.g_id_offset
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
  p_id => 2017722064201718827 + wwv_flow_api.g_id_offset
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
  p_id => 2017723041476721750 + wwv_flow_api.g_id_offset
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
  p_id => 2017721860392717722 + wwv_flow_api.g_id_offset
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
  p_id => 2017723243554722286 + wwv_flow_api.g_id_offset
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
  p_id => 2017723446324723125 + wwv_flow_api.g_id_offset
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
  p_id => 2017727042300731414 + wwv_flow_api.g_id_offset
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
  p_id => 2017724354982725661 + wwv_flow_api.g_id_offset
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
  p_id => 2018658054675395461 + wwv_flow_api.g_id_offset
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
  p_id => 2017726235374729425 + wwv_flow_api.g_id_offset
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
  p_id => 2017724756714726129 + wwv_flow_api.g_id_offset
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
  p_id => 2017722436282720239 + wwv_flow_api.g_id_offset
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
  p_id => 2017722638013720707 + wwv_flow_api.g_id_offset
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
  p_id => 2017726437451729996 + wwv_flow_api.g_id_offset
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
  p_id => 2017725058445726597 + wwv_flow_api.g_id_offset
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
  p_id => 2017726639183730483 + wwv_flow_api.g_id_offset
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
  p_id => 2017725260177727094 + wwv_flow_api.g_id_offset
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
  p_id => 2018658257446396232 + wwv_flow_api.g_id_offset
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
  p_id => 2017726840568730918 + wwv_flow_api.g_id_offset
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
  p_id => 2017725461908727580 + wwv_flow_api.g_id_offset
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
  p_id => 2017725663293727983 + wwv_flow_api.g_id_offset
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
  p_id => 2017725831911728411 + wwv_flow_api.g_id_offset
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
  p_id => 2017726033642728957 + wwv_flow_api.g_id_offset
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
  p_id => 2017727244031731882 + wwv_flow_api.g_id_offset
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
  p_id => 2017722233511719430 + wwv_flow_api.g_id_offset
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
  p_id => 1995021151308660380 + wwv_flow_api.g_id_offset
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
  p_id => 2069797762737268662 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_DATE_SYSTM'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_required_patch => 2025353179896159765 + wwv_flow_api.g_id_offset
  );
 
end;
/

--application/shared_components/logic/application_items/a_nombr_boutn
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1978969063640505478 + wwv_flow_api.g_id_offset
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
  p_id => 1978968860523504547 + wwv_flow_api.g_id_offset
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
  p_id => 1978969233989506366 + wwv_flow_api.g_id_offset
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
  p_id => 1978969437105507236 + wwv_flow_api.g_id_offset
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
  p_id => 2036093075676568265 + wwv_flow_api.g_id_offset
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
  p_id => 2396290150936132265 + wwv_flow_api.g_id_offset
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
  p_id => 1981833348690056519 + wwv_flow_api.g_id_offset
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
  p_id => 2008518865532733459 + wwv_flow_api.g_id_offset
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
  p_id => 2010321162833422461 + wwv_flow_api.g_id_offset
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
  p_id => 2069799264946278842 + wwv_flow_api.g_id_offset,
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
  p_id       => 1984681163110895608 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_AFW_21_PLUGN_ARBRE_MODE_CACHE',
  p_lov_query=> '.'||to_char(1984681163110895608 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1984681458768895612 + wwv_flow_api.g_id_offset,
  p_lov_id=>1984681163110895608 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Session',
  p_lov_return_value=>'SESN',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1984681838322895614 + wwv_flow_api.g_id_offset,
  p_lov_id=>1984681163110895608 + wwv_flow_api.g_id_offset,
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
  p_id       => 2036598960589346656 + wwv_flow_api.g_id_offset,
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
  p_id       => 2396267225218550873 + wwv_flow_api.g_id_offset,
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
  p_id       => 2009550770938170429 + wwv_flow_api.g_id_offset,
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
  p_id       => 2020413153773467272 + wwv_flow_api.g_id_offset,
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
  p_id       => 2031564968848927957 + wwv_flow_api.g_id_offset,
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
  p_id       => 1983700152835647476 + wwv_flow_api.g_id_offset,
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
  p_id       => 1982233351393668216 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_CONTX_EXECT',
  p_lov_query=> '.'||to_char(1982233351393668216 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1982233655835668216 + wwv_flow_api.g_id_offset,
  p_lov_id=>1982233351393668216 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Propriétaire',
  p_lov_return_value=>'N',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1982233840853668216 + wwv_flow_api.g_id_offset,
  p_lov_id=>1982233351393668216 + wwv_flow_api.g_id_offset,
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
  p_id       => 2153304835802009129 + wwv_flow_api.g_id_offset,
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
  p_id       => 2153304639710009129 + wwv_flow_api.g_id_offset,
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
  p_id       => 2012010461550687532 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_DEFNT_ACCES',
  p_lov_query=> '.'||to_char(2012010461550687532 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2012010978543687534 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012010461550687532 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Accordé',
  p_lov_return_value=>'ACORD',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2012011181045687534 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012010461550687532 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Utilisateur lié',
  p_lov_return_value=>'ACUCS',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2012011356661687534 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012010461550687532 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Structure inférieure liée',
  p_lov_return_value=>'ACSIN',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2012084971748445546 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012010461550687532 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'Structure immédiate liée',
  p_lov_return_value=>'ACSTI',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2012011566940687534 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012010461550687532 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>5,
  p_lov_disp_value=>'Structure supérieure liée',
  p_lov_return_value=>'ACSSU',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2012085483869449018 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012010461550687532 + wwv_flow_api.g_id_offset,
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
  p_id       => 1983660450628587167 + wwv_flow_api.g_id_offset,
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
  p_id       => 2010430374867277557 + wwv_flow_api.g_id_offset,
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
  p_id       => 2058976766971961397 + wwv_flow_api.g_id_offset,
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
  p_id       => 2030910281680108595 + wwv_flow_api.g_id_offset,
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
  p_id       => 2019777752299328350 + wwv_flow_api.g_id_offset,
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
  p_id       => 2031980973471357453 + wwv_flow_api.g_id_offset,
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
  p_id       => 2036054183512211043 + wwv_flow_api.g_id_offset,
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
  p_id       => 2009326278756736023 + wwv_flow_api.g_id_offset,
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
  p_id       => 1362407944864864933 + wwv_flow_api.g_id_offset,
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
  p_id       => 2032306159524808329 + wwv_flow_api.g_id_offset,
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
  p_id       => 2009267975603082309 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_O',
  p_lov_query=> '.'||to_char(2009267975603082309 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2009268269584082311 + wwv_flow_api.g_id_offset,
  p_lov_id=>2009267975603082309 + wwv_flow_api.g_id_offset,
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
  p_id       => 1980129155242468071 + wwv_flow_api.g_id_offset,
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
  p_id       => 2153436222498022694 + wwv_flow_api.g_id_offset,
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
  p_id       => 2011396482613319568 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_OUI_NON',
  p_lov_query=> '.'||to_char(2011396482613319568 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2011396766887319571 + wwv_flow_api.g_id_offset,
  p_lov_id=>2011396482613319568 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Oui',
  p_lov_return_value=>'O',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2011396969810319573 + wwv_flow_api.g_id_offset,
  p_lov_id=>2011396482613319568 + wwv_flow_api.g_id_offset,
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
  p_id       => 2020390251330615027 + wwv_flow_api.g_id_offset,
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
  p_id       => 2020787331939654293 + wwv_flow_api.g_id_offset,
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
  p_id       => 2017695045523046525 + wwv_flow_api.g_id_offset,
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
  p_id       => 2016838140565687124 + wwv_flow_api.g_id_offset,
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
  p_id       => 2023209958778754591 + wwv_flow_api.g_id_offset,
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
  p_id       => 2009171377883735773 + wwv_flow_api.g_id_offset,
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
  p_id       => 2009355272304712501 + wwv_flow_api.g_id_offset,
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
  p_id       => 2020341851793304785 + wwv_flow_api.g_id_offset,
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
  p_id       => 2039042882946807134 + wwv_flow_api.g_id_offset,
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
  p_id       => 2036625161307974367 + wwv_flow_api.g_id_offset,
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
  p_id       => 2035397732974912583 + wwv_flow_api.g_id_offset,
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
  p_id       => 2038415448259735447 + wwv_flow_api.g_id_offset,
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
  p_id       => 2036343232058520727 + wwv_flow_api.g_id_offset,
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
  p_id       => 2038415749668735453 + wwv_flow_api.g_id_offset,
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
  p_id       => 2013656032629875943 + wwv_flow_api.g_id_offset,
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
  p_id       => 1977295448312026225 + wwv_flow_api.g_id_offset,
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
  p_id       => 2058967363330955890 + wwv_flow_api.g_id_offset,
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
  p_id       => 2058966787085955890 + wwv_flow_api.g_id_offset,
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
  p_id       => 2030063474795289490 + wwv_flow_api.g_id_offset,
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
  p_id       => 1980605048312863416 + wwv_flow_api.g_id_offset,
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
  p_id       => 2008538766557362511 + wwv_flow_api.g_id_offset,
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
  p_id       => 2036671280622815092 + wwv_flow_api.g_id_offset,
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
  p_id       => 2066652281870331780 + wwv_flow_api.g_id_offset,
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
  p_id       => 2011468474653493584 + wwv_flow_api.g_id_offset,
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
  p_id       => 2383770124343050147 + wwv_flow_api.g_id_offset,
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
  p_id       => 2017148245317543805 + wwv_flow_api.g_id_offset,
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
  p_id       => 2034648375128870868 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_APPEL_REPRT',
  p_lov_query=> '.'||to_char(2034648375128870868 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2034648673659870878 + wwv_flow_api.g_id_offset,
  p_lov_id=>2034648375128870868 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Strict',
  p_lov_return_value=>'S',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2034648872260870882 + wwv_flow_api.g_id_offset,
  p_lov_id=>2034648375128870868 + wwv_flow_api.g_id_offset,
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
  p_id       => 2016699047578202079 + wwv_flow_api.g_id_offset,
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
  p_id       => 1985448535452470683 + wwv_flow_api.g_id_offset,
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
  p_id       => 2012268085195581590 + wwv_flow_api.g_id_offset,
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
  p_id       => 2011749983346984462 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_DON',
  p_lov_query=> '.'||to_char(2011749983346984462 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2011750266595984464 + wwv_flow_api.g_id_offset,
  p_lov_id=>2011749983346984462 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Alphanumérique',
  p_lov_return_value=>'V',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2011750463193984465 + wwv_flow_api.g_id_offset,
  p_lov_id=>2011749983346984462 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Numérique',
  p_lov_return_value=>'N',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2011750677050984465 + wwv_flow_api.g_id_offset,
  p_lov_id=>2011749983346984462 + wwv_flow_api.g_id_offset,
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
  p_id       => 1983693534079537946 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_DON2',
  p_lov_query=> '.'||to_char(1983693534079537946 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1983693851202537947 + wwv_flow_api.g_id_offset,
  p_lov_id=>1983693534079537946 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Date',
  p_lov_return_value=>'D',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1983694050250537948 + wwv_flow_api.g_id_offset,
  p_lov_id=>1983693534079537946 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Number',
  p_lov_return_value=>'N',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1983694249366537949 + wwv_flow_api.g_id_offset,
  p_lov_id=>1983693534079537946 + wwv_flow_api.g_id_offset,
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
  p_id       => 2019765836743200872 + wwv_flow_api.g_id_offset,
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
  p_id       => 2017160855976691816 + wwv_flow_api.g_id_offset,
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
  p_id       => 2036603983970391278 + wwv_flow_api.g_id_offset,
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
  p_id       => 2010331872953957668 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_LARGR',
  p_lov_query=> '.'||to_char(2010331872953957668 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2010332165366957679 + wwv_flow_api.g_id_offset,
  p_lov_id=>2010331872953957668 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Pouce',
  p_lov_return_value=>'POUCE',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2010332586621957682 + wwv_flow_api.g_id_offset,
  p_lov_id=>2010331872953957668 + wwv_flow_api.g_id_offset,
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
  p_id       => 2009869959589044800 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_LIAIS',
  p_lov_query=> '.'||to_char(2009869959589044800 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2009870280093044803 + wwv_flow_api.g_id_offset,
  p_lov_id=>2009869959589044800 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'1 - Page, type d''erreur, contrainte et table/colonne',
  p_lov_return_value=>'1',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2009870481415044803 + wwv_flow_api.g_id_offset,
  p_lov_id=>2009869959589044800 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'2 - Page et type d''erreur',
  p_lov_return_value=>'2',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2009870684330044803 + wwv_flow_api.g_id_offset,
  p_lov_id=>2009869959589044800 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'3 - Page',
  p_lov_return_value=>'3',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2009870871444044803 + wwv_flow_api.g_id_offset,
  p_lov_id=>2009869959589044800 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'4 - Type d''erreur, contrainte et table/colonne',
  p_lov_return_value=>'4',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2009871058051044803 + wwv_flow_api.g_id_offset,
  p_lov_id=>2009869959589044800 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>5,
  p_lov_disp_value=>'5 - Type d''erreur',
  p_lov_return_value=>'5',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2009871679212044804 + wwv_flow_api.g_id_offset,
  p_lov_id=>2009869959589044800 + wwv_flow_api.g_id_offset,
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
  p_id       => 2058967083480955890 + wwv_flow_api.g_id_offset,
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
  p_id       => 2151431844197795305 + wwv_flow_api.g_id_offset,
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
  p_id       => 2012143875716751026 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_MESG',
  p_lov_query=> '.'||to_char(2012143875716751026 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2012144172522751028 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012143875716751026 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Erreur',
  p_lov_return_value=>'E',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2063355158126618861 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012143875716751026 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Erreur critique',
  p_lov_return_value=>'C',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2012144382830751029 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012143875716751026 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Informatif',
  p_lov_return_value=>'I',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2012144564971751029 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012143875716751026 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'Aide',
  p_lov_return_value=>'A',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2012144776750751029 + wwv_flow_api.g_id_offset,
  p_lov_id=>2012143875716751026 + wwv_flow_api.g_id_offset,
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
  p_id       => 1982230242540476443 + wwv_flow_api.g_id_offset,
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
  p_id       => 2020356738997802591 + wwv_flow_api.g_id_offset,
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
  p_id       => 1983560840142167542 + wwv_flow_api.g_id_offset,
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
  p_id       => 2011867776593871468 + wwv_flow_api.g_id_offset,
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
  p_id       => 2036670172180803231 + wwv_flow_api.g_id_offset,
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
  p_id       => 2036627061963021787 + wwv_flow_api.g_id_offset,
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
  p_id       => 1982214547369976418 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_VERSN_BD_APLIC',
  p_lov_query=> '.'||to_char(1982214547369976418 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1982214840660976422 + wwv_flow_api.g_id_offset,
  p_lov_id=>1982214547369976418 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'10g',
  p_lov_return_value=>'10g',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1982215060998976426 + wwv_flow_api.g_id_offset,
  p_lov_id=>1982214547369976418 + wwv_flow_api.g_id_offset,
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
  p_id       => 1983658350141501882 + wwv_flow_api.g_id_offset,
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
  p_id       => 2384349721977015659 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'P19000_OPERT',
  p_lov_query=> '.'||to_char(2384349721977015659 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2384350026251015661 + wwv_flow_api.g_id_offset,
  p_lov_id=>2384349721977015659 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'=',
  p_lov_return_value=>'=',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2384350245730015661 + wwv_flow_api.g_id_offset,
  p_lov_id=>2384349721977015659 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'>',
  p_lov_return_value=>'>',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2384350446680015661 + wwv_flow_api.g_id_offset,
  p_lov_id=>2384349721977015659 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'>=',
  p_lov_return_value=>'>=',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2384350634004015661 + wwv_flow_api.g_id_offset,
  p_lov_id=>2384349721977015659 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'<',
  p_lov_return_value=>'<',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2384350833518015661 + wwv_flow_api.g_id_offset,
  p_lov_id=>2384349721977015659 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>5,
  p_lov_disp_value=>'<=',
  p_lov_return_value=>'<=',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2384351039729015662 + wwv_flow_api.g_id_offset,
  p_lov_id=>2384349721977015659 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>6,
  p_lov_disp_value=>'!=',
  p_lov_return_value=>'!=',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2384351236237015662 + wwv_flow_api.g_id_offset,
  p_lov_id=>2384349721977015659 + wwv_flow_api.g_id_offset,
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
  p_id=>2008523763756671809 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'1000 - Gestion des messages d''erreur',
  p_group_desc=>'');
 
wwv_flow_api.create_page_group(
  p_id=>2008524082456677146 + wwv_flow_api.g_id_offset,
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
 ,p_user_interface_id => 3673421501533763 + wwv_flow_api.g_id_offset
 ,p_name => 'Page commune'
 ,p_step_title => 'Page commune'
 ,p_step_sub_title => 'Sie'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_required_role => 2178262948948852109 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'ACONSIGNY'
 ,p_last_upd_yyyymmddhh24miss => '20150416155448'
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
  p_id=> 1982273139096252287 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Recherche',
  p_region_name=>'',
  p_region_attributes=> 'class="filtr_rechr_globl"',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959249463916063+ wwv_flow_api.g_id_offset,
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
  p_id=> 2007992144041465163 + wwv_flow_api.g_id_offset,
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
  p_id=> 2009527383214171726 + wwv_flow_api.g_id_offset,
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
  p_id=> 2010022147503216619 + wwv_flow_api.g_id_offset,
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
  p_id=> 2146617921468397925 + wwv_flow_api.g_id_offset,
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
  p_id=> 2401360623051675343 + wwv_flow_api.g_id_offset,
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
  p_id=>1979678257017752121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SADA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
  p_id=>2009223256300833029 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SIDF',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974647869916079+wwv_flow_api.g_id_offset,
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
  p_id=>2009223483774833031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SSPC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
  p_id=>2009223658764833031 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SCPC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
  p_id=>2009562477186452512 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SAPC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
  p_id=>2031046961177509176 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SNPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974647869916079+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>2053787277574676809 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SCPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
  p_id=>2053787482769678332 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SSPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
  p_id=>2053787687617679679 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SAPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
  p_id=>2125501021274740622 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_RECHR_GLOBL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 1982273139096252287+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974522955916079+wwv_flow_api.g_id_offset,
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
  p_id => 2040793748895158815 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'AFW'
 ,p_event_sequence => 10
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
  );
wwv_flow_api.create_page_da_action (
  p_id => 2040794021449158817 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2040793748895158815 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_CONFR_SAUVG'
 ,p_attribute_01 => 'Êtes-vous certain de vouloir quitter cette page sans sauvegarder les modifications apportées?'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 2040817228940162498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2040793748895158815 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_DEPSM_TABLR_FORM'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 2040825232403163532 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2040793748895158815 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_NAVGT_TABLR_FORM'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 2040833235520164339 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2040793748895158815 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 40
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_GESTN_TABLR_FORM'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 80177418253030816 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2040793748895158815 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 60
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_MENU_REDRC'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 80177714155032724 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2040793748895158815 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 70
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AIDE_PAGE_ITEM'
 ,p_attribute_01 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 80178112430033532 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2040793748895158815 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 80
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AIDE_PAGE'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1813690381453902315 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2040793748895158815 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 90
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_MODFR_MDP'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 81199401342244319 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2040793748895158815 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 100
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_NAVGT_ENREG'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 22072610311448494 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2040793748895158815 + wwv_flow_api.g_id_offset
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
  p_id => 2383261431311205578 + wwv_flow_api.g_id_offset
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
  p_id => 2383261741952205580 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2383261431311205578 + wwv_flow_api.g_id_offset
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
  p_id => 2383262029365214458 + wwv_flow_api.g_id_offset
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
  p_id => 2383262322759214459 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2383262029365214458 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 2383262644948218987 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2383262029365214458 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 2387903332829026000 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 2383262029365214458 + wwv_flow_api.g_id_offset
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
  p_id => 1813690474967957222 + wwv_flow_api.g_id_offset
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
  p_id => 1813690768369957224 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1813690474967957222 + wwv_flow_api.g_id_offset
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
  p_id => 1813690895052962932 + wwv_flow_api.g_id_offset
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
  p_id => 1813691188629962934 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1813690895052962932 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1813691387213962934 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1813690895052962932 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 1813691589837962934 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 1813690895052962932 + wwv_flow_api.g_id_offset
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
prompt  ...PAGE 1: Liste des produits
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 3673421501533763 + wwv_flow_api.g_id_offset
 ,p_name => 'Liste des produits'
 ,p_step_title => 'Liste des produits'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Liste des produits'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_required_role => 2178262948948852109 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20131031160452'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select "SEQNC", '||unistr('\000a')||
'"CODE",'||unistr('\000a')||
'"NOM"/*,'||unistr('\000a')||
'"DESCR"*/'||unistr('\000a')||
'from VD_AFW_11_PRODT';

wwv_flow_api.create_page_plug (
  p_id=> 457003525108900897 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Liste des produits',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 524965539665916068+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
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
a1:=a1||'select "SEQNC", '||unistr('\000a')||
'"CODE",'||unistr('\000a')||
'"NOM"/*,'||unistr('\000a')||
'"DESCR"*/'||unistr('\000a')||
'from VD_AFW_11_PRODT';

wwv_flow_api.create_worksheet(
  p_id=> 457003717781900900+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_region_id=> 457003525108900897+wwv_flow_api.g_id_offset,
  p_name=> 'Liste des systèmes',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '10000',
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
  p_button_template=> 524975629450916081+wwv_flow_api.g_id_offset,
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'Y',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_actions_menu_icon=>'&A_AFW_11_DOSR_FICHR_AFW.images/raprt_inter/actio.png',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'N',
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
  p_download_formats=>'CSV',
  p_detail_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP:SIDF,SCPI,SSPI:&SIDF.,PRODT,#SEQNC#',
  p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'GINFR',
  p_internal_uid=> 1);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 457003805532900903+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 457003717781900900+wwv_flow_api.g_id_offset,
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
  p_id => 457003925159900904+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 457003717781900900+wwv_flow_api.g_id_offset,
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
  p_display_text_as        =>'WITHOUT_MODIFICATION',
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
  p_id => 457004019979900904+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 457003717781900900+wwv_flow_api.g_id_offset,
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
  p_display_text_as        =>'WITHOUT_MODIFICATION',
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
rc1:=rc1||'SEQNC:CODE:NOM:DESCR';

wwv_flow_api.create_worksheet_rpt(
  p_id => 457004118761900904+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 457003717781900900+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'4534115',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'NOM',
  p_sort_direction_1        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
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

 
--application/pages/page_00002
prompt  ...PAGE 2: Liste des applications d'un produit
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 2
 ,p_user_interface_id => 3673421501533763 + wwv_flow_api.g_id_offset
 ,p_name => 'Liste des applications d''un produit'
 ,p_step_title => 'Liste des applications d''un produit'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Liste des applications d''un produit'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 649770022267519179 + wwv_flow_api.g_id_offset
 ,p_required_role => 2178262948948852109 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'Aucune aide disponible pour cette page.'
 ,p_last_upd_yyyymmddhh24miss => '20131031160452'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select seqnc,'||unistr('\000a')||
'       code,'||unistr('\000a')||
'       nom_formt,'||unistr('\000a')||
'       numr_aplic_apex'||unistr('\000a')||
'  from vd_afw_11_aplic'||unistr('\000a')||
' where ref_prodt = afw_04_contx_pkg.obten_seqnc_contx (''PRODT'')';

wwv_flow_api.create_page_plug (
  p_id=> 457008511064059575 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Applications',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 524965539665916068+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
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
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_output_show_link=> 'Y',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'INCHES',
  p_prn_paper_size=> 'LEGAL',
  p_prn_width=> 11,
  p_prn_height=> 8.5,
  p_prn_orientation=> 'HORIZONTAL',
  p_prn_page_header_font_color=> '#000000',
  p_prn_page_header_font_family=> 'Helvetica',
  p_prn_page_header_font_weight=> 'normal',
  p_prn_page_header_font_size=> '12',
  p_prn_page_footer_font_color=> '#000000',
  p_prn_page_footer_font_family=> 'Helvetica',
  p_prn_page_footer_font_weight=> 'normal',
  p_prn_page_footer_font_size=> '12',
  p_prn_header_bg_color=> '#9bafde',
  p_prn_header_font_color=> '#ffffff',
  p_prn_header_font_family=> 'Helvetica',
  p_prn_header_font_weight=> 'normal',
  p_prn_header_font_size=> '10',
  p_prn_body_bg_color=> '#efefef',
  p_prn_body_font_color=> '#000000',
  p_prn_body_font_family=> 'Helvetica',
  p_prn_body_font_weight=> 'normal',
  p_prn_body_font_size=> '10',
  p_prn_border_width=> .5,
  p_prn_page_header_alignment=> 'CENTER',
  p_prn_page_footer_alignment=> 'CENTER',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select seqnc,'||unistr('\000a')||
'       code,'||unistr('\000a')||
'       nom_formt,'||unistr('\000a')||
'       numr_aplic_apex'||unistr('\000a')||
'  from vd_afw_11_aplic'||unistr('\000a')||
' where ref_prodt = afw_04_contx_pkg.obten_seqnc_contx (''PRODT'')';

wwv_flow_api.create_worksheet(
  p_id=> 457008715436059576+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_region_id=> 457008511064059575+wwv_flow_api.g_id_offset,
  p_name=> 'Liste des applications',
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
  p_button_template=> 524975629450916081+wwv_flow_api.g_id_offset,
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
  p_detail_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:SIDF,SCPI,SSPI:&SIDF.,APLIC,#SEQNC#',
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
  p_id => 457008829018059578+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_worksheet_id => 457008715436059576+wwv_flow_api.g_id_offset,
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
  p_id => 457008930651059578+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_worksheet_id => 457008715436059576+wwv_flow_api.g_id_offset,
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
  p_id => 457009035090059578+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_worksheet_id => 457008715436059576+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'NOM_FORMT',
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
  p_id => 457009316289059578+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_worksheet_id => 457008715436059576+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'NUMR_APLIC_APEX',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Numéro',
  p_report_label           =>'Numéro',
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
rc1:=rc1||'CODE:NUMR_APLIC_APEX:NOM_FORMT:REF_NUMR_VERSN_FORMT:DATE_DERNR_MAJ_REFRN_APEX:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 457009422092059578+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_worksheet_id => 457008715436059576+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'4534168',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'NUMR_APLIC_APEX',
  p_sort_direction_1        =>'ASC',
  p_sort_column_2           =>'CODE',
  p_sort_direction_2        =>'ASC',
  p_sort_column_3           =>'0',
  p_sort_direction_3        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
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
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p := null;
wwv_flow_api.create_page_process(
  p_id     => 457010826795059591 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLUGIN_IO_AFW_21_CHANG_LIBL_FIL_ARI',
  p_process_name=> 'Changer libellé fil ariane',
  p_process_sql_clob => p,
  p_attribute_01=> 'afw_11_prodt_pkg.obten_code_prodt(afw_04_contx_pkg.obten_seqnc_contx(''PRODT'')) ||'': Applications''',
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
-- ...updatable report columns for page 2
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00003
prompt  ...PAGE 3: Liste des pages d'une application
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 3
 ,p_user_interface_id => 3673421501533763 + wwv_flow_api.g_id_offset
 ,p_name => 'Liste des pages d''une application'
 ,p_step_title => 'Liste des pages d''une application'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Liste des pages d''une application'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 649770022267519179 + wwv_flow_api.g_id_offset
 ,p_required_role => 2178262948948852109 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'Aucune aide disponible pour cette page.'
 ,p_last_upd_yyyymmddhh24miss => '20131031160452'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select p.seqnc,'||unistr('\000a')||
'       p.numr_apex,'||unistr('\000a')||
'       p.nom nom'||unistr('\000a')||
'  from vd_afw_13_page p'||unistr('\000a')||
'  where p.ref_aplic = afw_04_contx_pkg.obten_seqnc_contx(''APLIC'')';

wwv_flow_api.create_page_plug (
  p_id=> 457015213645073190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_plug_name=> 'Pages',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524965539665916068+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
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
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select p.seqnc,'||unistr('\000a')||
'       p.numr_apex,'||unistr('\000a')||
'       p.nom nom'||unistr('\000a')||
'  from vd_afw_13_page p'||unistr('\000a')||
'  where p.ref_aplic = afw_04_contx_pkg.obten_seqnc_contx(''APLIC'')';

wwv_flow_api.create_worksheet(
  p_id=> 457015424176073191+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_region_id=> 457015213645073190+wwv_flow_api.g_id_offset,
  p_name=> 'Liste des pages',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '10000',
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
  p_button_template=> 524975629450916081+wwv_flow_api.g_id_offset,
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'Y',
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
  p_download_formats=>'CSV',
  p_detail_link=>'f?p=&APP_ID.:1011:&SESSION.::&DEBUG.::SIDF,SCPI,SSPI:&SIDF.,PAGE,#SEQNC#',
  p_detail_link_text=>'&A_AFW_13_LIEN_EDITN_RAPRT.',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'PRIBR',
  p_internal_uid=> 1);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 457015535932073191+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 457015424176073191+wwv_flow_api.g_id_offset,
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
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 457015618298073191+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 457015424176073191+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'NUMR_APEX',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Numéro',
  p_report_label           =>'Numéro',
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
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'RIGHT',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 457015722812073191+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 457015424176073191+wwv_flow_api.g_id_offset,
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
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'NUMR_APEX:NOM:REF_STRUC_APLIC_FORMT::REF_APLIC_FORMT';

wwv_flow_api.create_worksheet_rpt(
  p_id => 457016338025073198+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_worksheet_id => 457015424176073191+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'4534237',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'NUMR_APEX',
  p_sort_direction_1        =>'ASC',
  p_sort_column_2           =>'NOM',
  p_sort_direction_2        =>'ASC',
  p_sort_column_3           =>'REF_ESPAC_TRAVL_FORMT',
  p_sort_direction_3        =>'ASC',
  p_sort_column_4           =>'REF_PRODT_FORMT',
  p_sort_direction_4        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'453732427718342976';

wwv_flow_api.create_page_plug (
  p_id=> 457326417050661924 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_plug_name=> 'Onglets principaux',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 457325133195657082 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 524972436030916076+ wwv_flow_api.g_id_offset,
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
 
null;
 
end;
/

 
begin
 
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
  p_id     => 457018327712073200 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLUGIN_IO_AFW_21_CHANG_LIBL_FIL_ARI',
  p_process_name=> 'Changer libellé fil ariane',
  p_process_sql_clob => p,
  p_attribute_01=> 'afw_11_aplic_pkg.obten_code_aplic(afw_04_contx_pkg.obten_seqnc_contx(''APLIC'')) ||'': Pages''',
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
-- ...updatable report columns for page 3
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
 ,p_user_interface_id => 3673421501533763 + wwv_flow_api.g_id_offset
 ,p_name => 'Page de connexion'
 ,p_step_title => 'Page de connexion'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Page de connexion'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 524954426501916056 + wwv_flow_api.g_id_offset
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
  p_id=> 1979976835484309271 + wwv_flow_api.g_id_offset,
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
  p_id=>1979977037017309273 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_CODE_UTILS',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1979976835484309271+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974829639916079+wwv_flow_api.g_id_offset,
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
  p_id=>1979977245401309274 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_MOT_PASSE',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1979976835484309271+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974829639916079+wwv_flow_api.g_id_offset,
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
  p_id=>1979977434732309274 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 1979976835484309271+wwv_flow_api.g_id_offset,
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
  p_tag_attributes  => 'template:'||to_char(524977637479916082 + wwv_flow_api.g_id_offset),
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
  p_id=>1979977637285309274 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_DOMN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1979976835484309271+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974829639916079+wwv_flow_api.g_id_offset,
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
  p_id=>1979977837249309275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LANG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 1979976835484309271+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974522955916079+wwv_flow_api.g_id_offset,
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
  p_id=>1979978030730309275 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_FORCE_DOMN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
  p_id     => 1979978447396309277 + wwv_flow_api.g_id_offset,
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
  p_id     => 1979978231455309276 + wwv_flow_api.g_id_offset,
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
  p_id     => 1979978839729309277 + wwv_flow_api.g_id_offset,
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
  p_id     => 1979979021710309277 + wwv_flow_api.g_id_offset,
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
  p_id     => 1979978651254309277 + wwv_flow_api.g_id_offset,
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
  p_id     => 2003256241887040230 + wwv_flow_api.g_id_offset,
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
 ,p_user_interface_id => 3673421501533763 + wwv_flow_api.g_id_offset
 ,p_name => 'Commentaire'
 ,p_alias => 'FEEDBACK_102'
 ,p_step_title => 'Commentaire'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 524955651485916059 + wwv_flow_api.g_id_offset
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
  p_id=> 2383218127159644642 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 102,
  p_plug_name=> 'Commentaire',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 524962831497916066+ wwv_flow_api.g_id_offset,
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
  p_id=> 2383259025630118849 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 102,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524959838287916064+ wwv_flow_api.g_id_offset,
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
  p_id             => 2383220949445644647 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 102,
  p_button_sequence=> 10,
  p_button_plug_id => 2383259025630118849+wwv_flow_api.g_id_offset,
  p_button_name    => 'SUBMIT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(524977444246916082+wwv_flow_api.g_id_offset),
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
  p_id=>2383218344958644642 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_APPLICATION_ID',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 2383218127159644642+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974647869916079+wwv_flow_api.g_id_offset,
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
  p_id=>2383218848782644645 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_PAGE_ID',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 2383218127159644642+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974647869916079+wwv_flow_api.g_id_offset,
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
  p_id=>2383219328709644645 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_A',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 2383218127159644642+wwv_flow_api.g_id_offset,
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
  p_id=>2383219545635644646 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_FEEDBACK',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 2383218127159644642+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974829639916079+wwv_flow_api.g_id_offset,
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
  p_id=>2383220043730644647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_X',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 2383218127159644642+wwv_flow_api.g_id_offset,
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
  p_id=>2383220251672644647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_FEEDBACK_TYPE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 2383218127159644642+wwv_flow_api.g_id_offset,
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
  p_field_template=> 524974647869916079+wwv_flow_api.g_id_offset,
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
  p_id=>2383220751443644647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 102,
  p_name=>'P102_Y',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 2383218127159644642+wwv_flow_api.g_id_offset,
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
  p_id     => 2383221349442644648 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 102,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Submit Feedback',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>2383220949445644647 + wwv_flow_api.g_id_offset,
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
  p_id     => 2383263124563241484 + wwv_flow_api.g_id_offset,
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

 
--application/pages/page_01001
prompt  ...PAGE 1001: Validations
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1001
 ,p_user_interface_id => 3673421501533763 + wwv_flow_api.g_id_offset
 ,p_name => 'Validations'
 ,p_step_title => 'Validations'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Validations d''application'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'CARLO'
 ,p_last_upd_yyyymmddhh24miss => '20130129154754'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'453732427718342976';

wwv_flow_api.create_page_plug (
  p_id=> 457341328721882852 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1001,
  p_plug_name=> 'Onglets principaux',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 457325133195657082 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 524972436030916076+ wwv_flow_api.g_id_offset,
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
s:=s||'Validations globales pour l''ensemble de l''application APEX';

wwv_flow_api.create_page_plug (
  p_id=> 457343033831903240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1001,
  p_plug_name=> 'Instructions',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524962831497916066+ wwv_flow_api.g_id_offset,
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
s:=s||'453749201342581375';

wwv_flow_api.create_page_plug (
  p_id=> 457343919548918057 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1001,
  p_plug_name=> 'Onglets secondaires',
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
  p_plug_source_type=> 457341906819895481 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 524972436030916076+ wwv_flow_api.g_id_offset,
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
s:=s||'select NOM_RACRC'||unistr('\000a')||
'  from afw_29_aq_apex_aplic_racrc_dcm'||unistr('\000a')||
'where numr_aplic_apex = afw_11_aplic_pkg.obten_numr_apex_aplic (afw_04_contx_pkg.obten_seqnc_contx(''APLIC''))';

wwv_flow_api.create_report_region (
  p_id=> 457327712639679706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1001,
  p_name=> 'Raccourcis',
  p_region_name=>'',
  p_parent_plug_id=>457343919548918057 + wwv_flow_api.g_id_offset,
  p_template=> 524966125373916068+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'REGION_POSITION_06',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 524967327315916073+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
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
  p_id=> 457328118649679712 + wwv_flow_api.g_id_offset,
  p_region_id=> 457327712639679706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'NOM_RACRC',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Nom',
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
  p_id=>457344617602926889 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1001,
  p_name=>'P1001_MODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
p := null;
wwv_flow_api.create_page_process(
  p_id     => 457344726259929412 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1001,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLUGIN_IO_AFW_21_MODE_PAGE',
  p_process_name=> 'Définir le mode par défaut',
  p_process_sql_clob => p,
  p_attribute_01=> 'P1001_MODE',
  p_attribute_02=> 'MESG',
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
-- ...updatable report columns for page 1001
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01011
prompt  ...PAGE 1011: Validations
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1011
 ,p_user_interface_id => 3673421501533763 + wwv_flow_api.g_id_offset
 ,p_name => 'Validations'
 ,p_step_title => 'Validations'
 ,p_step_sub_title => 'Validations'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'CONAL'
 ,p_last_upd_yyyymmddhh24miss => '20131106111409'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'453749201342581375';

wwv_flow_api.create_page_plug (
  p_id=> 457393226755440489 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_plug_name=> 'Onglets secondaires',
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
  p_plug_source_type=> 457392119482438321 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 524972436030916076+ wwv_flow_api.g_id_offset,
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
s:=s||'select numr_page_apex,'||unistr('\000a')||
'       nom_regn,'||unistr('\000a')||
'       seqnc_afich,'||unistr('\000a')||
'       reqt,'||unistr('\000a')||
'       libl,'||unistr('\000a')||
'       actio,'||unistr('\000a')||
'       actio_dml'||unistr('\000a')||
'  from afw_29_aq_boutn_dml_sans_autor'||unistr('\000a')||
' where numr_aplic_apex ='||unistr('\000a')||
'         afw_11_aplic_pkg.obten_numr_apex_aplic ('||unistr('\000a')||
'           afw_04_contx_pkg.obten_seqnc_contx (''APLIC''))'||unistr('\000a')||
'       and (numr_page_apex ='||unistr('\000a')||
'              afw_13_page_pkg.obten_numr_apex_page ('||unistr('\000a')||
'                afw_04_contx_pk';

s:=s||'g.obten_seqnc_contx (''PAGE''))'||unistr('\000a')||
'            or afw_04_contx_pkg.obten_seqnc_contx (''PAGE'') is null)';

wwv_flow_api.create_report_region (
  p_id=> 457346022839989195 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_name=> 'Boutons DML sans schéma d''autorisation',
  p_region_name=>'',
  p_parent_plug_id=>457393226755440489 + wwv_flow_api.g_id_offset,
  p_template=> 524966125373916068+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 40,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'REGION_POSITION_06',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'P1011_MODE',
  p_display_when_cond2=> 'BOUTN',
  p_display_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 524967327315916073+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
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
  p_id=> 457346427919989202 + wwv_flow_api.g_id_offset,
  p_region_id=> 457346022839989195 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'NUMR_PAGE_APEX',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Numéro page',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>1,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> 'afw_04_contx_pkg.obten_seqnc_contx (''PAGE'') is null',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 457346526371989202 + wwv_flow_api.g_id_offset,
  p_region_id=> 457346022839989195 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'NOM_REGN',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Région',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>2,
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
  p_id=> 457346632547989202 + wwv_flow_api.g_id_offset,
  p_region_id=> 457346022839989195 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'SEQNC_AFICH',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Séquence',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>3,
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
  p_id=> 457346709992989202 + wwv_flow_api.g_id_offset,
  p_region_id=> 457346022839989195 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'REQT',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Requête',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  p_id=> 457346811362989202 + wwv_flow_api.g_id_offset,
  p_region_id=> 457346022839989195 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'LIBL',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Libellé',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  p_id=> 457346932786989202 + wwv_flow_api.g_id_offset,
  p_region_id=> 457346022839989195 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'ACTIO',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Action',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  p_id=> 457347030971989202 + wwv_flow_api.g_id_offset,
  p_region_id=> 457346022839989195 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'ACTIO_DML',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Action DML',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select numr_page_apex,'||unistr('\000a')||
'       nom_regn,'||unistr('\000a')||
'       seqnc_afich,'||unistr('\000a')||
'       nom_item'||unistr('\000a')||
'  from afw_29_aq_apex_item_cache'||unistr('\000a')||
' where numr_aplic_apex ='||unistr('\000a')||
'         afw_11_aplic_pkg.obten_numr_apex_aplic ('||unistr('\000a')||
'           afw_04_contx_pkg.obten_seqnc_contx (''APLIC''))'||unistr('\000a')||
'       and (numr_page_apex ='||unistr('\000a')||
'              afw_13_page_pkg.obten_numr_apex_page ('||unistr('\000a')||
'                afw_04_contx_pkg.obten_seqnc_contx (''PAGE''))'||unistr('\000a')||
'            or s';

s:=s||'ie_04_contx_pkg.obten_seqnc_contx (''PAGE'') is null)';

wwv_flow_api.create_report_region (
  p_id=> 457394427925450260 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_name=> 'Items cachés dans la mauvaise région',
  p_region_name=>'',
  p_parent_plug_id=>457393226755440489 + wwv_flow_api.g_id_offset,
  p_template=> 524966125373916068+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 50,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'REGION_POSITION_06',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'P1011_MODE',
  p_display_when_cond2=> 'ITEM',
  p_display_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 524967327315916073+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
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
  p_id=> 457394726114450265 + wwv_flow_api.g_id_offset,
  p_region_id=> 457394427925450260 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'NUMR_PAGE_APEX',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Numéro page',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>1,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> 'afw_04_contx_pkg.obten_seqnc_contx(''PAGE'') is null',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 457394824091450266 + wwv_flow_api.g_id_offset,
  p_region_id=> 457394427925450260 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'NOM_REGN',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Région',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>2,
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
  p_id=> 457394932674450266 + wwv_flow_api.g_id_offset,
  p_region_id=> 457394427925450260 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'SEQNC_AFICH',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Séquence',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>3,
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
  p_id=> 457395020831450266 + wwv_flow_api.g_id_offset,
  p_region_id=> 457394427925450260 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'NOM_ITEM',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Item',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select numr_page_apex_item,'||unistr('\000a')||
'       seqnc_afich,'||unistr('\000a')||
'       nom_item,'||unistr('\000a')||
'       numr_aplic_apex_regn,'||unistr('\000a')||
'       numr_page_apex_regn,'||unistr('\000a')||
'       nom_regn'||unistr('\000a')||
'  from afw_29_aq_apex_item_mauvs_regn'||unistr('\000a')||
' where numr_aplic_apex_item ='||unistr('\000a')||
'         afw_11_aplic_pkg.obten_numr_apex_aplic ('||unistr('\000a')||
'           afw_04_contx_pkg.obten_seqnc_contx (''APLIC''))'||unistr('\000a')||
'       and (numr_page_apex_item ='||unistr('\000a')||
'              afw_13_page_pkg.obten_numr_apex_page ('||unistr('\000a')||
'';

s:=s||'                afw_04_contx_pkg.obten_seqnc_contx (''PAGE''))'||unistr('\000a')||
'            or afw_04_contx_pkg.obten_seqnc_contx (''PAGE'') is null)';

wwv_flow_api.create_report_region (
  p_id=> 457404334467499456 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_name=> 'Items dans une région d''une autre application',
  p_region_name=>'',
  p_parent_plug_id=>457393226755440489 + wwv_flow_api.g_id_offset,
  p_template=> 524966125373916068+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 60,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'REGION_POSITION_06',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'P1011_MODE',
  p_display_when_cond2=> 'ITEM',
  p_display_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 524967327315916073+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
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
  p_id=> 457404618313499468 + wwv_flow_api.g_id_offset,
  p_region_id=> 457404334467499456 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'NUMR_PAGE_APEX_ITEM',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Numéro page',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>1,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> 'afw_04_contx_pkg.obten_seqnc_contx(''PAGE'') is null',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 457404722028499469 + wwv_flow_api.g_id_offset,
  p_region_id=> 457404334467499456 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'SEQNC_AFICH',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Séquence',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>2,
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
  p_id=> 457404815594499469 + wwv_flow_api.g_id_offset,
  p_region_id=> 457404334467499456 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'NOM_ITEM',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Item',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  p_id=> 457404909095499469 + wwv_flow_api.g_id_offset,
  p_region_id=> 457404334467499456 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'NUMR_APLIC_APEX_REGN',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Région<br />numéro application',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  p_id=> 457405030584499469 + wwv_flow_api.g_id_offset,
  p_region_id=> 457404334467499456 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'NUMR_PAGE_APEX_REGN',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Région<br />numéro page',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  p_id=> 457405124085499469 + wwv_flow_api.g_id_offset,
  p_region_id=> 457404334467499456 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'NOM_REGN',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Région',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select numr_page_apex, nom_raprt, mesg'||unistr('\000a')||
'  from afw_29_aq_raprt_mesg_aucun_don'||unistr('\000a')||
' where numr_aplic_apex ='||unistr('\000a')||
'         afw_11_aplic_pkg.obten_numr_apex_aplic ('||unistr('\000a')||
'           afw_04_contx_pkg.obten_seqnc_contx (''APLIC''))'||unistr('\000a')||
'       and (numr_page_apex ='||unistr('\000a')||
'              afw_13_page_pkg.obten_numr_apex_page ('||unistr('\000a')||
'                afw_04_contx_pkg.obten_seqnc_contx (''PAGE''))'||unistr('\000a')||
'            or afw_04_contx_pkg.obten_seqnc_cont';

s:=s||'x (''PAGE'') is null)';

wwv_flow_api.create_report_region (
  p_id=> 457417605976784517 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_name=> 'Message aucune donnée trouvée',
  p_region_name=>'',
  p_parent_plug_id=>457393226755440489 + wwv_flow_api.g_id_offset,
  p_template=> 524966125373916068+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 70,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'REGION_POSITION_06',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'P1011_MODE',
  p_display_when_cond2=> 'REGN',
  p_display_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 524967327315916073+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
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
  p_id=> 457417926057784522 + wwv_flow_api.g_id_offset,
  p_region_id=> 457417605976784517 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'NUMR_PAGE_APEX',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Numéro page',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> 'afw_04_contx_pkg.obten_seqnc_contx(''PAGE'') is null',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 457418027727784522 + wwv_flow_api.g_id_offset,
  p_region_id=> 457417605976784517 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'NOM_RAPRT',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Région',
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
  p_id=> 457418127442784522 + wwv_flow_api.g_id_offset,
  p_region_id=> 457417605976784517 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'MESG',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Message',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select numr_page_apex, nom_raprt, mesg'||unistr('\000a')||
'  from afw_29_aq_raprt_mesg_trop_don'||unistr('\000a')||
' where numr_aplic_apex ='||unistr('\000a')||
'         afw_11_aplic_pkg.obten_numr_apex_aplic ('||unistr('\000a')||
'           afw_04_contx_pkg.obten_seqnc_contx (''APLIC''))'||unistr('\000a')||
'       and (numr_page_apex ='||unistr('\000a')||
'              afw_13_page_pkg.obten_numr_apex_page ('||unistr('\000a')||
'                afw_04_contx_pkg.obten_seqnc_contx (''PAGE''))'||unistr('\000a')||
'            or afw_04_contx_pkg.obten_seqnc_contx';

s:=s||' (''PAGE'') is null)';

wwv_flow_api.create_report_region (
  p_id=> 457418809832814046 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_name=> 'Message trop données trouvées',
  p_region_name=>'',
  p_parent_plug_id=>457393226755440489 + wwv_flow_api.g_id_offset,
  p_template=> 524966125373916068+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 80,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'REGION_POSITION_06',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'P1011_MODE',
  p_display_when_cond2=> 'REGN',
  p_display_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 524967327315916073+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
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
  p_id=> 457419027974814050 + wwv_flow_api.g_id_offset,
  p_region_id=> 457418809832814046 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'NUMR_PAGE_APEX',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Numéro page',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'PLSQL_EXPRESSION',
  p_display_when_condition=> 'afw_04_contx_pkg.obten_seqnc_contx(''PAGE'') is null',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 457419117765814051 + wwv_flow_api.g_id_offset,
  p_region_id=> 457418809832814046 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'NOM_RAPRT',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Région',
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
  p_id=> 457419225726814051 + wwv_flow_api.g_id_offset,
  p_region_id=> 457418809832814046 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'MESG',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Message',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
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
  l_clob clob;
  l_length number := 1;
begin
s:=s||'Validations pour l''ensemble de la page APEX';

wwv_flow_api.create_page_plug (
  p_id=> 457402115982484637 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_plug_name=> 'Instructions',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 524962831497916066+ wwv_flow_api.g_id_offset,
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
s:=s||'453732427718342976';

wwv_flow_api.create_page_plug (
  p_id=> 457431929019904695 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1011,
  p_plug_name=> 'Onglets principaux',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 457325133195657082 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 524972436030916076+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => 'afw_04_contx_pkg.obten_seqnc_contx(''PAGE'') is null',
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

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>457398934420471079 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1011,
  p_name=>'P1011_MODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 2009527383214171726+wwv_flow_api.g_id_offset,
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
p := null;
wwv_flow_api.create_page_process(
  p_id     => 457366312136180840 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1011,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLUGIN_IO_AFW_21_CHANG_LIBL_FIL_ARI',
  p_process_name=> 'Changer libellé fil ariane',
  p_process_sql_clob => p,
  p_attribute_01=> 'afw_13_page_pkg.obten_numr_apex_page(afw_04_contx_pkg.obten_seqnc_contx(''PAGE''))||'': Validations''',
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
p := null;
wwv_flow_api.create_page_process(
  p_id     => 457399037537471911 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1011,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLUGIN_IO_AFW_21_MODE_PAGE',
  p_process_name=> 'Définir le mode par défaut',
  p_process_sql_clob => p,
  p_attribute_01=> 'P1011_MODE',
  p_attribute_02=> 'BOUTN',
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
-- ...updatable report columns for page 1011
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/aplic_ongle_princ
 
begin
 
wwv_flow_api.create_list (
  p_id=> 457325133195657082 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'APLIC_ONGLE_PRINC',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 457325333011657089 + wwv_flow_api.g_id_offset,
  p_list_id=> 457325133195657082 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Pages',
  p_list_item_link_target=> 'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::SIDF:&SIDF.:',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 457325617716657090 + wwv_flow_api.g_id_offset,
  p_list_id=> 457325133195657082 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Validations globales',
  p_list_item_link_target=> 'f?p=&APP_ID.:1001:&SESSION.::&DEBUG.::SIDF,SAPC:&SIDF.,XPP3:',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '1001',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 457431716898901186 + wwv_flow_api.g_id_offset,
  p_list_id=> 457325133195657082 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Validations pages',
  p_list_item_link_target=> 'f?p=&APP_ID.:1011:&SESSION.::&DEBUG.::SIDF,SAPC:&SIDF.,XPP3:',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '1001',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/aplic_valdt
 
begin
 
wwv_flow_api.create_list (
  p_id=> 457341906819895481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'APLIC_VALDT',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 457342434630895489 + wwv_flow_api.g_id_offset,
  p_list_id=> 457341906819895481 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Messages',
  p_list_item_link_target=> 'f?p=&APP_ID.:1001:&SESSION.::&DEBUG.::SIDF,SAPC:&SIDF.,MESG:',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'PLSQL_EXPRESSION',
  p_list_item_current_for_pages=> ':P1001_MODE = ''MESG''',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/page_valdt
 
begin
 
wwv_flow_api.create_list (
  p_id=> 457392119482438321 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'PAGE_VALDT',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 457392319009438324 + wwv_flow_api.g_id_offset,
  p_list_id=> 457392119482438321 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Boutons',
  p_list_item_link_target=> 'f?p=&APP_ID.:1011:&SESSION.::&DEBUG.::SIDF,SAPC:&SIDF.,BOUTN:',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'PLSQL_EXPRESSION',
  p_list_item_current_for_pages=> ':P1011_MODE = ''BOUTN''',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 457394215804446779 + wwv_flow_api.g_id_offset,
  p_list_id=> 457392119482438321 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Items',
  p_list_item_link_target=> 'f?p=&APP_ID.:1011:&SESSION.::&DEBUG.::SIDF,SAPC:&SIDF.,ITEM:',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'PLSQL_EXPRESSION',
  p_list_item_current_for_pages=> ':P1011_MODE = ''ITEM''',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 457406105770519528 + wwv_flow_api.g_id_offset,
  p_list_id=> 457392119482438321 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Régions',
  p_list_item_link_target=> 'f?p=&APP_ID.:1011:&SESSION.::&DEBUG.::SIDF,SAPC:&SIDF.,REGN:',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'PLSQL_EXPRESSION',
  p_list_item_current_for_pages=> ':P1011_MODE = ''REGN''',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/menu_acuei_safa
 
begin
 
wwv_flow_api.create_list (
  p_id=> 910030029749545693 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'MENU_ACUEI_SAFA',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 910030246713545696 + wwv_flow_api.g_id_offset,
  p_list_id=> 910030029749545693 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Planification',
  p_list_item_link_target=> 'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::SIDF:&SIDF.:',
  p_list_item_icon=> 'menu/chart_line_64.gif',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> 'f?p=135:1:&SESSION.',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 910032521876600150 + wwv_flow_api.g_id_offset,
  p_list_id=> 910030029749545693 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Développement',
  p_list_item_link_target=> 'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::SIDF:&SIDF.:',
  p_list_item_icon=> 'menu/todo_64.gif',
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
prompt  ...page templates for application: 1000008
--
--application/shared_components/user_interface/templates/page/without_tab
prompt  ......Page template 524953626957916055
 
begin
 
wwv_flow_api.create_template (
  p_id => 524953626957916055 + wwv_flow_api.g_id_offset
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
prompt  ......Page template 524953845202916055
 
begin
 
wwv_flow_api.create_template (
  p_id => 524953845202916055 + wwv_flow_api.g_id_offset
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
prompt  ......Page template 524954426501916056
 
begin
 
wwv_flow_api.create_template (
  p_id => 524954426501916056 + wwv_flow_api.g_id_offset
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
prompt  ......Page template 524955651485916059
 
begin
 
wwv_flow_api.create_template (
  p_id => 524955651485916059 + wwv_flow_api.g_id_offset
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
prompt  ......Page template 524955939543916059
 
begin
 
wwv_flow_api.create_template (
  p_id => 524955939543916059 + wwv_flow_api.g_id_offset
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
prompt  ......Button Template 524975629450916081
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 524975629450916081 + wwv_flow_api.g_id_offset
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
prompt  ......Button Template 524976436725916082
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 524976436725916082 + wwv_flow_api.g_id_offset
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
prompt  ......Button Template 524977229409916082
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 524977229409916082 + wwv_flow_api.g_id_offset
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
prompt  ......Button Template 524977444246916082
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 524977444246916082 + wwv_flow_api.g_id_offset
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
prompt  ......Button Template 524977637479916082
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 524977637479916082 + wwv_flow_api.g_id_offset
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
prompt  ......region template 84184230216592255
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 84184230216592255 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524957443496916062
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524957443496916062 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524958330034916062
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524958330034916062 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524959249463916063
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524959249463916063 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524959838287916064
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524959838287916064 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524962249451916066
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524962249451916066 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524962534881916066
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524962534881916066 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524962831497916066
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524962831497916066 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524965251580916068
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524965251580916068 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524965539665916068
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524965539665916068 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524965838436916068
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524965838436916068 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524966125373916068
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524966125373916068 + wwv_flow_api.g_id_offset
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
prompt  ......region template 524966431125916069
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 524966431125916069 + wwv_flow_api.g_id_offset
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
prompt  ......list template 524972436030916076
 
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
  p_id=>524972436030916076 + wwv_flow_api.g_id_offset,
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
prompt  ......list template 524973043128916077
 
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
  p_id=>524973043128916077 + wwv_flow_api.g_id_offset,
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
prompt  ......report template 524967327315916073
 
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
  p_id=> 524967327315916073 + wwv_flow_api.g_id_offset,
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
  p_id => 524967327315916073 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr class="grid-row highl">',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 524968235891916074
 
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
  p_id=> 524968235891916074 + wwv_flow_api.g_id_offset,
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
  p_id => 524968235891916074 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr class="grid-row highl">',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 524968526868916074
 
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
  p_id=> 524968526868916074 + wwv_flow_api.g_id_offset,
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
  p_id => 524968526868916074 + wwv_flow_api.g_id_offset,
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
prompt  ......label template 524974522955916079
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 524974522955916079 + wwv_flow_api.g_id_offset,
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
prompt  ......label template 524974647869916079
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 524974647869916079 + wwv_flow_api.g_id_offset,
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
prompt  ......label template 524974734904916079
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 524974734904916079 + wwv_flow_api.g_id_offset,
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
prompt  ......label template 524974829639916079
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 524974829639916079 + wwv_flow_api.g_id_offset,
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
prompt  ......label template 524974933499916079
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 524974933499916079 + wwv_flow_api.g_id_offset,
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
prompt  ......template 524978339821916083
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 524978339821916083 + wwv_flow_api.g_id_offset,
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
prompt  ......template 524978026058916083
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 524978026058916083 + wwv_flow_api.g_id_offset,
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
prompt  ......theme 524978525494916084
begin
wwv_flow_api.create_theme (
  p_id =>524978525494916084 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 313,
  p_theme_name=>'AFW - Bootstrap 3.0.0',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>524953626957916055 + wwv_flow_api.g_id_offset,
  p_error_template=>524955939543916059 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>null + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>524954426501916056 + wwv_flow_api.g_id_offset,
  p_default_button_template=>524977637479916082 + wwv_flow_api.g_id_offset,
  p_default_region_template=>524965838436916068 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>null + wwv_flow_api.g_id_offset,
  p_default_form_template  =>524962534881916066 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>524965539665916068 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>524962249451916066 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>524958637187916062 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>null + wwv_flow_api.g_id_offset,
  p_default_listr_template=>524965539665916068 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>524966125373916068 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>524968526868916074 + wwv_flow_api.g_id_offset,
  p_default_label_template=>524974647869916079 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>null + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>524978026058916083 + wwv_flow_api.g_id_offset,
  p_default_list_template=>null + wwv_flow_api.g_id_offset,
  p_default_option_label=>524974734904916079 + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>524974933499916079 + wwv_flow_api.g_id_offset);
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
  p_id =>524978525494916084 + wwv_flow_api.g_id_offset,
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
prompt  ...Language Maps for Application 1000008
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
  p_id=>566286505604269034 + wwv_flow_api.g_id_offset,
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
  p_id=>566288506262269036 + wwv_flow_api.g_id_offset,
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
  p_id=>566291414712269039 + wwv_flow_api.g_id_offset,
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
  p_id=>566294634619269041 + wwv_flow_api.g_id_offset,
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
  p_id=>566297836901269043 + wwv_flow_api.g_id_offset,
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
  p_id=>566301020015269045 + wwv_flow_api.g_id_offset,
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
  p_id=>566304225192269047 + wwv_flow_api.g_id_offset,
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
  p_id=>566307408306269050 + wwv_flow_api.g_id_offset,
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
  p_id=>566310127139269051 + wwv_flow_api.g_id_offset,
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
  p_id=>566313023139269057 + wwv_flow_api.g_id_offset,
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
  p_id=>566316216882269059 + wwv_flow_api.g_id_offset,
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
  p_id=>566319429089269062 + wwv_flow_api.g_id_offset,
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
  p_id=>566322622133269063 + wwv_flow_api.g_id_offset,
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
  p_id=>566325825866269065 + wwv_flow_api.g_id_offset,
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
  p_id=>566329021772269067 + wwv_flow_api.g_id_offset,
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
  p_id=>566332211454269069 + wwv_flow_api.g_id_offset,
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
  p_id=>566335407285269073 + wwv_flow_api.g_id_offset,
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
  p_id=>566338610779269078 + wwv_flow_api.g_id_offset,
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
  p_id=>566341811439269080 + wwv_flow_api.g_id_offset,
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
  p_id=>566345006081269081 + wwv_flow_api.g_id_offset,
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
  p_id=>566348205881269083 + wwv_flow_api.g_id_offset,
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
  p_id=>566351431119269085 + wwv_flow_api.g_id_offset,
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
  p_id=>566354628114269086 + wwv_flow_api.g_id_offset,
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
  p_id=>566357836004269088 + wwv_flow_api.g_id_offset,
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
  p_id=>566361013562269090 + wwv_flow_api.g_id_offset,
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
  p_id=>566364214174269092 + wwv_flow_api.g_id_offset,
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
  p_id=>566367420847269094 + wwv_flow_api.g_id_offset,
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
  p_id=>566370631070269096 + wwv_flow_api.g_id_offset,
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
  p_id=>566373831088269098 + wwv_flow_api.g_id_offset,
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
  p_id=>566377023424269100 + wwv_flow_api.g_id_offset,
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
  p_id=>566380309340269103 + wwv_flow_api.g_id_offset,
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
  p_id=>566383524550269105 + wwv_flow_api.g_id_offset,
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
  p_id=>566386731571269108 + wwv_flow_api.g_id_offset,
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
  p_id=>566389929165269112 + wwv_flow_api.g_id_offset,
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
  p_id=>566393118418269114 + wwv_flow_api.g_id_offset,
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
  p_id=>566396322069269118 + wwv_flow_api.g_id_offset,
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
  p_id=>566399526010269121 + wwv_flow_api.g_id_offset,
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
  p_id=>566402706813269124 + wwv_flow_api.g_id_offset,
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
  p_id=>566405912489269126 + wwv_flow_api.g_id_offset,
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
  p_id=>566409134371269135 + wwv_flow_api.g_id_offset,
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
  p_id=>566412330527269138 + wwv_flow_api.g_id_offset,
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
  p_id=>566415535207269140 + wwv_flow_api.g_id_offset,
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
  p_id=>566418726617269143 + wwv_flow_api.g_id_offset,
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
  p_id=>566421911784269146 + wwv_flow_api.g_id_offset,
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
  p_id=>566425133592269150 + wwv_flow_api.g_id_offset,
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
  p_id=>566427834468269154 + wwv_flow_api.g_id_offset,
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
  p_id=>566430735450269155 + wwv_flow_api.g_id_offset,
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
  p_id=>566433908059269158 + wwv_flow_api.g_id_offset,
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
  p_id=>566437128798269161 + wwv_flow_api.g_id_offset,
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
  p_id=>566440328140269163 + wwv_flow_api.g_id_offset,
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
  p_id=>566443518755269167 + wwv_flow_api.g_id_offset,
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
  p_id=>566446716534269170 + wwv_flow_api.g_id_offset,
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
  p_id=>566449914857269172 + wwv_flow_api.g_id_offset,
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
  p_id=>566453112119269175 + wwv_flow_api.g_id_offset,
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
  p_id=>566456326957269180 + wwv_flow_api.g_id_offset,
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
  p_id=>566459535663269193 + wwv_flow_api.g_id_offset,
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
  p_id=>566462728368269195 + wwv_flow_api.g_id_offset,
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
  p_id=>566465920188269198 + wwv_flow_api.g_id_offset,
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
  p_id=>566469117296269200 + wwv_flow_api.g_id_offset,
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
  p_id=>566472336255269202 + wwv_flow_api.g_id_offset,
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
  p_id=>566475512749269205 + wwv_flow_api.g_id_offset,
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
  p_id=>566478725717269206 + wwv_flow_api.g_id_offset,
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
  p_id=>566481917668269208 + wwv_flow_api.g_id_offset,
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
  p_id=>566485127005269210 + wwv_flow_api.g_id_offset,
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
  p_id=>566488314838269212 + wwv_flow_api.g_id_offset,
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
  p_id=>566491507192269213 + wwv_flow_api.g_id_offset,
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
  p_id=>566494728321269215 + wwv_flow_api.g_id_offset,
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
  p_id=>566497921731269216 + wwv_flow_api.g_id_offset,
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
  p_id=>566501121060269218 + wwv_flow_api.g_id_offset,
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
  p_id=>566504313758269221 + wwv_flow_api.g_id_offset,
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
  p_id=>566507521854269224 + wwv_flow_api.g_id_offset,
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
  p_id=>566510706599269231 + wwv_flow_api.g_id_offset,
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
  p_id=>566513922959269232 + wwv_flow_api.g_id_offset,
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
  p_id=>566517134143269234 + wwv_flow_api.g_id_offset,
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
  p_id=>566520308757269236 + wwv_flow_api.g_id_offset,
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
  p_id=>566523505667269238 + wwv_flow_api.g_id_offset,
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
  p_id=>566526717199269239 + wwv_flow_api.g_id_offset,
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
  p_id=>566529929426269242 + wwv_flow_api.g_id_offset,
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
  p_id=>566533137404269244 + wwv_flow_api.g_id_offset,
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
  p_id=>566536415341269245 + wwv_flow_api.g_id_offset,
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
  p_id=>566539605563269247 + wwv_flow_api.g_id_offset,
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
  p_id=>566542831345269249 + wwv_flow_api.g_id_offset,
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
  p_id=>566546030220269250 + wwv_flow_api.g_id_offset,
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
  p_id=>566548537150269252 + wwv_flow_api.g_id_offset,
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
  p_id=>566551627724269253 + wwv_flow_api.g_id_offset,
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
  p_id=>566554811218269255 + wwv_flow_api.g_id_offset,
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
  p_id=>566558013052269260 + wwv_flow_api.g_id_offset,
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
  p_id=>566561212205269262 + wwv_flow_api.g_id_offset,
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
  p_id=>566564430171269264 + wwv_flow_api.g_id_offset,
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
  p_id=>566567611022269266 + wwv_flow_api.g_id_offset,
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
  p_id=>566570816870269268 + wwv_flow_api.g_id_offset,
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
  p_id=>566574017812269270 + wwv_flow_api.g_id_offset,
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
  p_id=>566577230046269271 + wwv_flow_api.g_id_offset,
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
  p_id=>566580412317269273 + wwv_flow_api.g_id_offset,
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
  p_id=>566583612224269275 + wwv_flow_api.g_id_offset,
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
  p_id=>566586838089269276 + wwv_flow_api.g_id_offset,
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
  p_id=>566590016845269278 + wwv_flow_api.g_id_offset,
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
  p_id=>566593234551269279 + wwv_flow_api.g_id_offset,
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
  p_id=>566596407555269281 + wwv_flow_api.g_id_offset,
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
  p_id=>566599629509269284 + wwv_flow_api.g_id_offset,
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
  p_id=>566602817954269286 + wwv_flow_api.g_id_offset,
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
  p_id=>566606036755269290 + wwv_flow_api.g_id_offset,
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
  p_id=>566609216423269292 + wwv_flow_api.g_id_offset,
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
  p_id=>566612419200269294 + wwv_flow_api.g_id_offset,
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
  p_id=>566615633107269296 + wwv_flow_api.g_id_offset,
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
  p_id=>566618815851269298 + wwv_flow_api.g_id_offset,
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
  p_id=>566622024740269300 + wwv_flow_api.g_id_offset,
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
  p_id=>566625206642269302 + wwv_flow_api.g_id_offset,
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
  p_id=>566628434393269304 + wwv_flow_api.g_id_offset,
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
  p_id=>566631606645269306 + wwv_flow_api.g_id_offset,
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
  p_id=>566634823538269309 + wwv_flow_api.g_id_offset,
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
  p_id=>566638029202269311 + wwv_flow_api.g_id_offset,
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
  p_id=>566641231788269312 + wwv_flow_api.g_id_offset,
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
  p_id=>566644416298269314 + wwv_flow_api.g_id_offset,
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
  p_id=>566647608968269321 + wwv_flow_api.g_id_offset,
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
  p_id=>566650831066269322 + wwv_flow_api.g_id_offset,
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
  p_id=>566654007620269326 + wwv_flow_api.g_id_offset,
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
  p_id=>566657224321269328 + wwv_flow_api.g_id_offset,
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
  p_id=>566660415071269330 + wwv_flow_api.g_id_offset,
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
  p_id=>566663627072269332 + wwv_flow_api.g_id_offset,
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
  p_id=>566666814873269333 + wwv_flow_api.g_id_offset,
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
  p_id=>566670015348269335 + wwv_flow_api.g_id_offset,
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
  p_id=>566673215471269339 + wwv_flow_api.g_id_offset,
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
  p_id=>566676437181269343 + wwv_flow_api.g_id_offset,
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
  p_id=>566679613346269345 + wwv_flow_api.g_id_offset,
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
  p_id=>566682811897269347 + wwv_flow_api.g_id_offset,
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
  p_id=>566686021680269350 + wwv_flow_api.g_id_offset,
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
  p_id=>566688620937269352 + wwv_flow_api.g_id_offset,
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
  p_id=>566691733496269354 + wwv_flow_api.g_id_offset,
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
  p_id=>566694908842269357 + wwv_flow_api.g_id_offset,
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
  p_id=>566698117562269358 + wwv_flow_api.g_id_offset,
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
  p_id=>566701308539269363 + wwv_flow_api.g_id_offset,
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
  p_id=>566704512596269369 + wwv_flow_api.g_id_offset,
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
  p_id=>566707706173269371 + wwv_flow_api.g_id_offset,
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
  p_id=>566710924868269374 + wwv_flow_api.g_id_offset,
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
  p_id=>566714135309269379 + wwv_flow_api.g_id_offset,
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
  p_id=>566717324107269383 + wwv_flow_api.g_id_offset,
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
  p_id=>566720509002269388 + wwv_flow_api.g_id_offset,
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
  p_id=>566723737704269391 + wwv_flow_api.g_id_offset,
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
  p_id=>566726910613269399 + wwv_flow_api.g_id_offset,
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
  p_id=>566730115544269401 + wwv_flow_api.g_id_offset,
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
  p_id=>566733327563269403 + wwv_flow_api.g_id_offset,
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
  p_id=>566736522524269407 + wwv_flow_api.g_id_offset,
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
  p_id=>566739712780269410 + wwv_flow_api.g_id_offset,
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
  p_id=>566742937842269412 + wwv_flow_api.g_id_offset,
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
  p_id=>566746111671269414 + wwv_flow_api.g_id_offset,
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
  p_id=>566749316441269417 + wwv_flow_api.g_id_offset,
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
  p_id=>566752526954269420 + wwv_flow_api.g_id_offset,
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
  p_id=>566755715984269431 + wwv_flow_api.g_id_offset,
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
  p_id=>566758914565269434 + wwv_flow_api.g_id_offset,
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
  p_id=>566762128918269436 + wwv_flow_api.g_id_offset,
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
  p_id=>566765310630269441 + wwv_flow_api.g_id_offset,
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
  p_id=>566768511147269445 + wwv_flow_api.g_id_offset,
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
  p_id=>566771729070269450 + wwv_flow_api.g_id_offset,
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
  p_id=>566774509005269456 + wwv_flow_api.g_id_offset,
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
  p_id=>566777324730269458 + wwv_flow_api.g_id_offset,
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
  p_id=>566780524091269461 + wwv_flow_api.g_id_offset,
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
  p_id=>566783720362269465 + wwv_flow_api.g_id_offset,
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
  p_id=>566786909172269466 + wwv_flow_api.g_id_offset,
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
  p_id=>566790136988269471 + wwv_flow_api.g_id_offset,
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
  p_id=>566793327928269474 + wwv_flow_api.g_id_offset,
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
  p_id=>566796524272269478 + wwv_flow_api.g_id_offset,
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
  p_id=>566799721476269479 + wwv_flow_api.g_id_offset,
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
  p_id=>566802920261269482 + wwv_flow_api.g_id_offset,
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
  p_id=>566806133657269494 + wwv_flow_api.g_id_offset,
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
  p_id=>566809316218269496 + wwv_flow_api.g_id_offset,
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
  p_id=>566812510325269498 + wwv_flow_api.g_id_offset,
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
  p_id=>566815718061269500 + wwv_flow_api.g_id_offset,
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
  p_id=>566818924632269502 + wwv_flow_api.g_id_offset,
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
  p_id=>566822109502269503 + wwv_flow_api.g_id_offset,
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
  p_id=>566825310783269505 + wwv_flow_api.g_id_offset,
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
  p_id=>566828513484269507 + wwv_flow_api.g_id_offset,
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
  p_id=>566831722091269508 + wwv_flow_api.g_id_offset,
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
  p_id=>566834922549269510 + wwv_flow_api.g_id_offset,
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
  p_id=>566838130266269511 + wwv_flow_api.g_id_offset,
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
  p_id=>566841327514269513 + wwv_flow_api.g_id_offset,
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
  p_id=>566844519627269515 + wwv_flow_api.g_id_offset,
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
  p_id=>566847713367269517 + wwv_flow_api.g_id_offset,
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
  p_id=>566850915773269519 + wwv_flow_api.g_id_offset,
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
  p_id=>566854120718269523 + wwv_flow_api.g_id_offset,
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
  p_id=>566857315952269525 + wwv_flow_api.g_id_offset,
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
  p_id=>566860510620269528 + wwv_flow_api.g_id_offset,
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
  p_id=>566863717729269533 + wwv_flow_api.g_id_offset,
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
  p_id=>566866924321269535 + wwv_flow_api.g_id_offset,
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
  p_id=>566870114897269537 + wwv_flow_api.g_id_offset,
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
  p_id=>566873315324269540 + wwv_flow_api.g_id_offset,
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
  p_id=>566876526142269543 + wwv_flow_api.g_id_offset,
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
  p_id=>566879709131269546 + wwv_flow_api.g_id_offset,
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
  p_id=>566882925416269548 + wwv_flow_api.g_id_offset,
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
  p_id=>566886133614269549 + wwv_flow_api.g_id_offset,
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
  p_id=>566889136140269551 + wwv_flow_api.g_id_offset,
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
  p_id=>566891816612269552 + wwv_flow_api.g_id_offset,
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
  p_id=>566895028811269554 + wwv_flow_api.g_id_offset,
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
  p_id=>566898211211269556 + wwv_flow_api.g_id_offset,
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
  p_id=>566901415203269557 + wwv_flow_api.g_id_offset,
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
  p_id=>566904627811269559 + wwv_flow_api.g_id_offset,
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
  p_id=>566907811507269561 + wwv_flow_api.g_id_offset,
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
  p_id=>566911030027269562 + wwv_flow_api.g_id_offset,
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
  p_id=>566914234234269564 + wwv_flow_api.g_id_offset,
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
  p_id=>566917428898269566 + wwv_flow_api.g_id_offset,
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
  p_id=>566920630584269567 + wwv_flow_api.g_id_offset,
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
  p_id=>566923813254269569 + wwv_flow_api.g_id_offset,
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
  p_id=>566927038187269571 + wwv_flow_api.g_id_offset,
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
  p_id=>566930211159269572 + wwv_flow_api.g_id_offset,
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
  p_id=>566933417170269574 + wwv_flow_api.g_id_offset,
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
  p_id=>566936620276269576 + wwv_flow_api.g_id_offset,
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
  p_id=>566939809900269578 + wwv_flow_api.g_id_offset,
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
  p_id=>566943036539269580 + wwv_flow_api.g_id_offset,
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
  p_id=>566946205816269582 + wwv_flow_api.g_id_offset,
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
  p_id=>566949417292269584 + wwv_flow_api.g_id_offset,
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
  p_id=>566952635638269586 + wwv_flow_api.g_id_offset,
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
  p_id=>566955808262269588 + wwv_flow_api.g_id_offset,
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
  p_id=>566959036195269591 + wwv_flow_api.g_id_offset,
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
  p_id=>566962208391269593 + wwv_flow_api.g_id_offset,
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
  p_id=>566965410176269595 + wwv_flow_api.g_id_offset,
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
  p_id=>2012453459207507775 + wwv_flow_api.g_id_offset,
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
  p_id=>2016315242731724854 + wwv_flow_api.g_id_offset,
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
  p_id=>2016315361539724854 + wwv_flow_api.g_id_offset,
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
  p_id=>2016315447044724854 + wwv_flow_api.g_id_offset,
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
  p_id=>2016315536197724854 + wwv_flow_api.g_id_offset,
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
  p_id=>2016315648556724854 + wwv_flow_api.g_id_offset,
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
  p_id=>2016315755638724854 + wwv_flow_api.g_id_offset,
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
  p_id=>2016315864100724854 + wwv_flow_api.g_id_offset,
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
  p_id=>2016315942335724854 + wwv_flow_api.g_id_offset,
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
  p_id=>2016316055772724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016316159798724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016316232455724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016316337229724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016316432191724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016316539470724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016316639280724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016316742575724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016316834437724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016316963932724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016317036941724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016317155921724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016317263313724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016317356817724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016317441306724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016317536741724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016317648775724855 + wwv_flow_api.g_id_offset,
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
  p_id=>2016317758441724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016317861843724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016317961795724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016318057687724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016318140459724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016318261472724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016318358912724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016318447495724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016318533667724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016318663932724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016318752078724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016318845445724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016318935454724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016319051302724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016319132052724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016319243692724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016319331751724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016319464332724857 + wwv_flow_api.g_id_offset,
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
  p_id=>2016319557710724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016319663958724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016319758722724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016319849908724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016319962790724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016320042532724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016320149222724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016320232173724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016320338772724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016320454794724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016320544638724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016320653301724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016320735795724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016320838558724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016320958370724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016321034476724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016321162532724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016321259681724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016321340497724858 + wwv_flow_api.g_id_offset,
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
  p_id=>2016321451641724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016321547816724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016321649870724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016321749107724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016321862458724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016321943225724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016322060131724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016322161998724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016322237810724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016322343017724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016322458094724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016322558534724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016322658542724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016322759358724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016322850522724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016322934746724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016323052856724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016323158604724860 + wwv_flow_api.g_id_offset,
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
  p_id=>2016323250745724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016323357147724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016323445759724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016323536148724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016323649748724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016323751150724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016323838918724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016323932189724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016324034928724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016324152132724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016324231885724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016324338257724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016324451427724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016324557977724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016324656701724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016324755610724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016324855128724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016324947307724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016325048727724861 + wwv_flow_api.g_id_offset,
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
  p_id=>2016325158717724863 + wwv_flow_api.g_id_offset,
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
  p_id=>2016325243743724863 + wwv_flow_api.g_id_offset,
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
  p_id=>2016325355900724863 + wwv_flow_api.g_id_offset,
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
  p_id=>2016325448286724863 + wwv_flow_api.g_id_offset,
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
  p_id=>2016325559414724863 + wwv_flow_api.g_id_offset,
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
  p_id=>2016325651256724863 + wwv_flow_api.g_id_offset,
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
  p_id=>2016325756299724863 + wwv_flow_api.g_id_offset,
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
  p_id=>2016325864451724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016325957717724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016326033376724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016326157390724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016326262802724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016326342104724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016326448477724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016326537908724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016326663836724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016326754634724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016326840775724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016326932313724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016327060196724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016327157723724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016327256216724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016327348553724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016327434317724864 + wwv_flow_api.g_id_offset,
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
  p_id=>2016327543937724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016327633973724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016327737849724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016327846788724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016327960078724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016328036796724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016328154755724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016328254441724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016328362642724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016328463120724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016328541218724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016328651076724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016328762356724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016328842018724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016328961006724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016329058725724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016329148875724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016329238659724866 + wwv_flow_api.g_id_offset,
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
  p_id=>2016329357784724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016329438108724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016329555075724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016329658919724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016329761512724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016329832602724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016329948589724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016330037884724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016330147510724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016330257319724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016330342822724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016330456235724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016330545191724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016330647622724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016330749548724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016330858542724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016330961258724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016331034021724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016331135933724868 + wwv_flow_api.g_id_offset,
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
  p_id=>2016331234963724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016331353907724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016331438602724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016331532401724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016331638670724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016331747126724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016331856506724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016331962649724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016332050246724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016332131814724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016332243627724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016332342233724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016332444377724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016332537711724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016332644652724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016332737923724869 + wwv_flow_api.g_id_offset,
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
  p_id=>2016332840752724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016332955633724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016333054931724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016333151221724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016333235722724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016333362943724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016333445223724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016333545909724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016333655364724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016333761112724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016333837711724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016333938378724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2016334062694724871 + wwv_flow_api.g_id_offset,
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
  p_id=>2028249579634181897 + wwv_flow_api.g_id_offset,
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
  p_id=>2028249971005181898 + wwv_flow_api.g_id_offset,
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
 p_id=> 80435907192784717 + wwv_flow_api.g_id_offset,
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
 p_id=> 910170546068671893 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG_1',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/delete_confirm_msg_2
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'Would you like to perform this delete action?';

wwv_flow_api.create_shortcut (
 p_id=> 910209318608861351 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG_2',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/delete_confirm_msg_3
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'Would you like to perform this delete action?';

wwv_flow_api.create_shortcut (
 p_id=> 910304044227374620 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG_3',
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
 p_id=> 2008530678778588467 + wwv_flow_api.g_id_offset,
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
 p_id=> 2010837864097216638 + wwv_flow_api.g_id_offset,
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
 p_id=> 2016765554288931152 + wwv_flow_api.g_id_offset,
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
prompt  ......authentication 3712208183904221
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 3712208183904221 + wwv_flow_api.g_id_offset
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
prompt  ......authentication 2010051282744536123
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 2010051282744536123 + wwv_flow_api.g_id_offset
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
  p_id => 43844154973498360 + wwv_flow_api.g_id_offset
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
  p_id => 43856131570177693 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43844154973498360 + wwv_flow_api.g_id_offset
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
  p_id => 43857952908183018 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43844154973498360 + wwv_flow_api.g_id_offset
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
  p_id => 43858647732185384 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43844154973498360 + wwv_flow_api.g_id_offset
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
  p_id => 43859243203187490 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43844154973498360 + wwv_flow_api.g_id_offset
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
  p_id => 45344030752809303 + wwv_flow_api.g_id_offset
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
  p_id => 45919941435770679 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45344030752809303 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Classe CSS (Voir favoris)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45920333219770679 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45344030752809303 + wwv_flow_api.g_id_offset
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
  p_id => 45920739488770679 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45344030752809303 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Classe CSS (Voir tous)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45921151270770680 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45344030752809303 + wwv_flow_api.g_id_offset
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
  p_id => 45921537582770680 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45344030752809303 + wwv_flow_api.g_id_offset
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
  p_id => 45921936740770680 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45344030752809303 + wwv_flow_api.g_id_offset
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
  p_id => 45922353171770681 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45344030752809303 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Item contenant filtre'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_default_value => 'PX_FILTR_FAVRT'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 45921936740770680 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45922757711770681 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45344030752809303 + wwv_flow_api.g_id_offset
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
 ,p_depending_on_attribute_id => 45921936740770680 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
 ,p_help_text => 'Replace:'||unistr('\000a')||
' [PARENT_ALIAS] by alias used in parent SQL;'||unistr('\000a')||
' [SEQNC] by primary key stocked in apexframework favorite table. (Concept seqnc)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 45924445411770683 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45344030752809303 + wwv_flow_api.g_id_offset
 ,p_name => 'favr_togl'
 ,p_display_name => 'after Toggle'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/io_afw_21_favr
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 67344156098298015 + wwv_flow_api.g_id_offset
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
  p_id => 67344448119301668 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 67344156098298015 + wwv_flow_api.g_id_offset
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
  p_id => 67344765359308899 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 67344156098298015 + wwv_flow_api.g_id_offset
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
  p_id => 81199218844244319 + wwv_flow_api.g_id_offset
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
  p_id => 160150421954079568 + wwv_flow_api.g_id_offset
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
  p_id => 206245870067570572 + wwv_flow_api.g_id_offset
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
  p_id => 51373681397602337 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
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
  p_id => 206249082057671387 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
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
  p_id => 206249375156674585 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206249082057671387 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Single-value'
 ,p_return_value => 'SINGL_VALUE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206249772568675798 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206249082057671387 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Mutliple-value'
 ,p_return_value => 'MULTP_VALUE'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206348296017487497 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Allow clear'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206249082057671387 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'SINGL_VALUE'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206326697300257922 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
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
  p_id => 206327075302268094 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Minimum number of results'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '10'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206326697300257922 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'N'
 ,p_help_text => 'The minimum number of results that must be initially (after opening the dropdown for the first time) populated in order to keep the search field. This is useful for cases where local data is used with just a few results, in which case the search box is not very useful and wastes screen space.'||unistr('\000a')||
''||unistr('\000a')||
'The option can be set to a negative value to permanently hide the search field.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206335068744909181 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
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
  p_id => 206327683916279335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Maximum number of items that can be selected'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '0'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206249082057671387 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'MULTP_VALUE'
 ,p_help_text => 'The maximum number of items that can be selected in a multi-select control. If this number is less than 1 selection is not limited.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206328579591296521 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Number of characters necessary to start a search'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206328877003297720 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Maximum number of characters that can be entered for an input.'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206329197909303216 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
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
  p_id => 206335668934939467 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 35
 ,p_prompt => 'Search type'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'LIKE_IGNORE'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206326697300257922 + wwv_flow_api.g_id_offset
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
  p_id => 206335991998944046 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335668934939467 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Contains case'
 ,p_return_value => 'CONTAINS_CASE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206336486822946447 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335668934939467 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Contains ignore'
 ,p_return_value => 'CONTAINS_IGNORE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206336884665947397 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335668934939467 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Exact case'
 ,p_return_value => 'EXACT_CASE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206337282509948417 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335668934939467 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'Exact ignore'
 ,p_return_value => 'EXACT_IGNORE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206337880352949435 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335668934939467 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'Like case'
 ,p_return_value => 'LIKE_CASE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206338277764950572 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335668934939467 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 60
 ,p_display_value => 'Like ignore'
 ,p_return_value => 'LIKE_IGNORE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206338774961951881 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206335668934939467 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 70
 ,p_display_value => 'Lookup'
 ,p_return_value => 'LOOKUP'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206354399287241719 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
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
  p_id => 35904508044630624 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
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
  p_id => 36603614256980966 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
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
  p_id => 36593224973249417 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
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
  p_id => 36593722817250490 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 36593224973249417 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Display column (1)'
 ,p_return_value => '1'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 36594119366252069 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 36593224973249417 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Custom search column (6)'
 ,p_return_value => '6'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206254297517705290 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_blur'
 ,p_display_name => 'blur'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206251473477705288 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_close'
 ,p_display_name => 'close'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206253895773705290 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_focus'
 ,p_display_name => 'focus'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206251888231705289 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_highlight'
 ,p_display_name => 'highlight'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206253499190705290 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_loaded'
 ,p_display_name => 'loaded'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206251087609705288 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_open'
 ,p_display_name => 'open'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206250774484705287 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_opening'
 ,p_display_name => 'opening'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206253098188705289 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_removed'
 ,p_display_name => 'removed'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206252694451705289 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_removing'
 ,p_display_name => 'removing'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206252276621705289 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206245870067570572 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_selecting'
 ,p_display_name => 'selecting'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_aide_page
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 517440829621285694 + wwv_flow_api.g_id_offset
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
  p_id => 517441131745314734 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 517440829621285694 + wwv_flow_api.g_id_offset
 ,p_name => 'afw_21_actio_dynmq_aide_page_afich'
 ,p_display_name => 'Afficher'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_menu
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 866665949488412059 + wwv_flow_api.g_id_offset
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
  p_id => 515605709576233494 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 866665949488412059 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_aide_page_item
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 926524358035254431 + wwv_flow_api.g_id_offset
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
  p_id => 926596971965547088 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 926524358035254431 + wwv_flow_api.g_id_offset
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
  p_id => 926530767356380012 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/process_type/io_afw_21_initl_menu
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1174135366584496075 + wwv_flow_api.g_id_offset
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
  p_id => 1174144476860041159 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1174135366584496075 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_afich_dialg_ifram
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1481391276285590508 + wwv_flow_api.g_id_offset
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
  p_id => 1481407052652602566 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
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
  p_id => 1209588136846493274 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 105
 ,p_prompt => 'SCPI'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1481415877156628597 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
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
  p_id => 1481727969973483999 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
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
  p_id => 1481420264473634345 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
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
  p_id => 1207822034704962750 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 130
 ,p_prompt => 'SAPC'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1481429052830640502 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
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
  p_id => 1481433464258643799 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
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
  p_id => 1481437879495648180 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
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
  p_id => 1391984267120834948 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 100
 ,p_prompt => 'Définir élément SSPC'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1469305567651750893 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 11
 ,p_display_sequence => 110
 ,p_prompt => 'Définir élément SSPI'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1470401056203646426 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 12
 ,p_display_sequence => 120
 ,p_prompt => 'Item clé étrangère'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1206131249700049338 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
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
  p_id => 1206139754895050839 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 15
 ,p_display_sequence => 19
 ,p_prompt => 'Page'
 ,p_attribute_type => 'PLSQL EXPRESSION'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389144336449936620 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogbeforeclose'
 ,p_display_name => 'beforeClose'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389193442814947910 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogclose'
 ,p_display_name => 'close'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1400371750858849634 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogclose_actio_dynmq'
 ,p_display_name => 'close Dynamic Action Plugin'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1400376161940852838 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogclose_procs'
 ,p_display_name => 'close Process Plugin'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389165056881942548 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogdrag'
 ,p_display_name => 'drag'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389160854457941798 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogdragstart'
 ,p_display_name => 'dragStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389169260344943559 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogdragstop'
 ,p_display_name => 'dragStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389156650994940821 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogfocus'
 ,p_display_name => 'focus'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389152447877939913 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogopen'
 ,p_display_name => 'open'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389185035887945948 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogresize'
 ,p_display_name => 'resize'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389173463115944365 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogresizestart'
 ,p_display_name => 'resizeStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1389189239004946854 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1481391276285590508 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogresizestop'
 ,p_display_name => 'resizeStop'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_modfr_mdp
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1813694593209104355 + wwv_flow_api.g_id_offset
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
  p_id => 1813694769099106887 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1813694593209104355 + wwv_flow_api.g_id_offset
 ,p_name => 'afw_21_actio_dynmq_modfr_mp_afich'
 ,p_display_name => 'Afficher'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_fil_arian
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1908576216921950220 + wwv_flow_api.g_id_offset
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
  p_id => 1908580386924951046 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908576216921950220 + wwv_flow_api.g_id_offset
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
  p_id => 1908580785899951053 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908580386924951046 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'ui-icon-arrowthick-1-e'
 ,p_return_value => 'ui-icon-arrowthick-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908581303352951053 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908580386924951046 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'ui-icon-arrow-1-e'
 ,p_return_value => 'ui-icon-arrow-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908581809163951054 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908580386924951046 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'ui-icon-carat-1-e'
 ,p_return_value => 'ui-icon-carat-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908582286892951054 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908580386924951046 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'ui-icon-triangle-1-e'
 ,p_return_value => 'ui-icon-triangle-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908582788346951056 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908580386924951046 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'ui-icon-circle-arrow-e'
 ,p_return_value => 'ui-icon-circle-arrow-e'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1908583311709951059 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908576216921950220 + wwv_flow_api.g_id_offset
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
  p_id => 1908583691103951059 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908576216921950220 + wwv_flow_api.g_id_offset
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
  p_id => 1908584111292951060 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908583691103951059 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Classique'
 ,p_return_value => 'CLASQ'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1908584588966951060 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1908583691103951059 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Avancé'
 ,p_return_value => 'AVANC'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1908585115509951060 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908576216921950220 + wwv_flow_api.g_id_offset
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
  p_id => 1908585492433951060 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908576216921950220 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Inclure le contexte'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 1908585115509951060 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1001883543320530091 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1908576216921950220 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_confr_sauvg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1977052541464091613 + wwv_flow_api.g_id_offset
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
  p_id => 1977052742204120213 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977052541464091613 + wwv_flow_api.g_id_offset
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
  p_id => 1977076448267806236 + wwv_flow_api.g_id_offset
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
  p_id => 1977078258449594583 + wwv_flow_api.g_id_offset
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
  p_id => 1977078951486639894 + wwv_flow_api.g_id_offset
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
  p_id => 1977907041890320032 + wwv_flow_api.g_id_offset
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
  p_id => 1977907447693340628 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977907041890320032 + wwv_flow_api.g_id_offset
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
  p_id => 1977907951502341753 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977907041890320032 + wwv_flow_api.g_id_offset
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
  p_id => 1977910443631396208 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977907041890320032 + wwv_flow_api.g_id_offset
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
  p_id => 1977910964063402172 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977907041890320032 + wwv_flow_api.g_id_offset
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
  p_id => 1977911439606404489 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977907041890320032 + wwv_flow_api.g_id_offset
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
  p_id => 1977979245828311891 + wwv_flow_api.g_id_offset
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
  p_id => 1977979563967326633 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
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
  p_id => 2398224152713687671 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Selecteur jQuery identifiant éléments externes (droppable)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2398225524100688882 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Selecteur jQuery identifiant éléments externes (draggable)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2398226929295690371 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Item qui reçoit l''id de l''élément glissé'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2398216151094545337 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Item qui contient le code de l''arbre'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 1978186347163416069 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_name => 'close_node.jstree'
 ,p_display_name => 'Fermer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1978187756906447246 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_name => 'create_node.jstree'
 ,p_display_name => 'Ajouter un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1978187149849435744 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_name => 'delete_node.jstree'
 ,p_display_name => 'Supprimer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1978187454005436975 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_name => 'move_node.jstree'
 ,p_display_name => 'Déplacer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1978184332693317244 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_name => 'open_node.jstree'
 ,p_display_name => 'Ouvrir un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1978186758245419252 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_name => 'rename_node.jstree'
 ,p_display_name => 'Renommer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1978206059864929232 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1977979245828311891 + wwv_flow_api.g_id_offset
 ,p_name => 'select_node.jstree'
 ,p_display_name => 'Sélectionner un noeud'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_afich_prodt_autor
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1978780543844964565 + wwv_flow_api.g_id_offset
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
  p_id => 1979443778337381217 + wwv_flow_api.g_id_offset
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
  p_id => 1979460473553909759 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1979443778337381217 + wwv_flow_api.g_id_offset
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
  p_id => 1977445647492382058 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1979460473553909759 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 5
 ,p_display_value => 'Personnalisé'
 ,p_return_value => 'PERSN'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1979461682903912496 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1979460473553909759 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Téléphone'
 ,p_return_value => '999-999-9999'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1979462053598913495 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1979460473553909759 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Code postal (Canada)'
 ,p_return_value => 'a9a 9a9'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 1979462658793915000 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 1979460473553909759 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Permis de conduire'
 ,p_return_value => 'a9999-999999-99'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1977446437581388597 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1979443778337381217 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Masque personnalisé'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => true
 ,p_depending_on_attribute_id => 1979460473553909759 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'PERSN'
 ,p_help_text => 'a - Représente un caractère alphabétique (A-Z, a-z)'||unistr('\000a')||
'9 - Représente un caractère numérique (0-9)'||unistr('\000a')||
'* - Représente un caractère alphanumérique (AZ, az ,0-9)'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1977446959183404350 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1979443778337381217 + wwv_flow_api.g_id_offset
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
  p_id => 1981963832977528412 + wwv_flow_api.g_id_offset
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
  p_id => 1982271554203731803 + wwv_flow_api.g_id_offset
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
  p_id => 1982271746023738942 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1982271554203731803 + wwv_flow_api.g_id_offset
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
  p_id => 1984141863872549217 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1982271554203731803 + wwv_flow_api.g_id_offset
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
  p_id => 1982486446886438754 + wwv_flow_api.g_id_offset
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
  p_id => 1983915959634714524 + wwv_flow_api.g_id_offset
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
  p_id => 2003353820812463591 + wwv_flow_api.g_id_offset
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
  p_id => 2003361826006465069 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2003353820812463591 + wwv_flow_api.g_id_offset
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
  p_id => 2003381944014470293 + wwv_flow_api.g_id_offset
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
  p_id => 2021656427047370488 + wwv_flow_api.g_id_offset
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
  p_id => 2021680033159438521 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2021656427047370488 + wwv_flow_api.g_id_offset
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
  p_id => 2021684449435443214 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2021656427047370488 + wwv_flow_api.g_id_offset
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
  p_id => 2050309052865142493 + wwv_flow_api.g_id_offset
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
  p_id => 2050314846563711347 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2050309052865142493 + wwv_flow_api.g_id_offset
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
  p_id => 2050315758684714857 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2050309052865142493 + wwv_flow_api.g_id_offset
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
  p_id => 2059473645422131986 + wwv_flow_api.g_id_offset
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
  p_id => 2060175628767396344 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2059473645422131986 + wwv_flow_api.g_id_offset
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
  p_id => 2060620435856631755 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2059473645422131986 + wwv_flow_api.g_id_offset
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
  p_id => 2060621056634637723 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2059473645422131986 + wwv_flow_api.g_id_offset
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
  p_id => 2060621759882648100 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2059473645422131986 + wwv_flow_api.g_id_offset
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
  p_id => 2060622741621049700 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2059473645422131986 + wwv_flow_api.g_id_offset
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
  p_id => 2060623459975055022 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2059473645422131986 + wwv_flow_api.g_id_offset
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
  p_id => 2049676739044783752 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2059473645422131986 + wwv_flow_api.g_id_offset
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
  p_id => 2060284935286579860 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2059473645422131986 + wwv_flow_api.g_id_offset
 ,p_name => 'ouvridialg'
 ,p_display_name => 'Ouvrir le dialogue'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_prodt_contx_a
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2073336935627168452 + wwv_flow_api.g_id_offset
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
  p_id => 1966589952088662919 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2073336935627168452 + wwv_flow_api.g_id_offset
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
  p_id => 2126608336268877455 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2073336935627168452 + wwv_flow_api.g_id_offset
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
  p_id => 2159260725668895445 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2073336935627168452 + wwv_flow_api.g_id_offset
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
  p_id => 2159265227746896039 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2159260725668895445 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Tous les produits'
 ,p_return_value => 'TOUS'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2159269530863896926 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2159260725668895445 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Exclure les produits AFW'
 ,p_return_value => 'EXCLU_AFW'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2159296237443898841 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2159260725668895445 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Seulement les produits AFW'
 ,p_return_value => 'SEULM_AFW'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2159100147430797694 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2073336935627168452 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Produits SAF'
 ,p_attribute_type => 'CHECKBOXES'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 2159260725668895445 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'SEULM_AFW'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2159104651585798872 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2159100147430797694 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'SAFP'
 ,p_return_value => 'SAFP'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2159108920549799370 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2159100147430797694 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'SAFD'
 ,p_return_value => 'SAFD'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2159113222280799875 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2159100147430797694 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'SAFU'
 ,p_return_value => 'SAFU'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2159117524358800469 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2159100147430797694 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'SAFS'
 ,p_return_value => 'SAFS'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2159121827475801341 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2159100147430797694 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'SGA'
 ,p_return_value => 'SGA'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/io_afw_21_champ_rechr
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2125435721705721875 + wwv_flow_api.g_id_offset
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
  p_id => 2125740532403772297 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2125435721705721875 + wwv_flow_api.g_id_offset
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
  p_id => 2125745043138775331 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2125435721705721875 + wwv_flow_api.g_id_offset
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
  p_id => 2145270054015555993 + wwv_flow_api.g_id_offset
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
  p_id => 2227625774479184996 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2145270054015555993 + wwv_flow_api.g_id_offset
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
  p_id => 2170578052040769150 + wwv_flow_api.g_id_offset
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
  p_id => 2170720937934821922 + wwv_flow_api.g_id_offset
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
  p_id => 2170988046171918858 + wwv_flow_api.g_id_offset
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
  p_id => 2171046955006959266 + wwv_flow_api.g_id_offset
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
  p_id => 2171320452920233015 + wwv_flow_api.g_id_offset
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
  p_id => 2171560860641367665 + wwv_flow_api.g_id_offset
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
  p_id => 2171734624803395224 + wwv_flow_api.g_id_offset
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
  p_id => 2176439126843249658 + wwv_flow_api.g_id_offset
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
  p_id => 2176451046236255285 + wwv_flow_api.g_id_offset
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
  p_id => 2211116149236196505 + wwv_flow_api.g_id_offset
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
  p_id => 2211157839324203086 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2211116149236196505 + wwv_flow_api.g_id_offset
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
  p_id => 2211162241748203851 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2211157839324203086 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'ui-icon-arrowthick-1-e'
 ,p_return_value => 'ui-icon-arrowthick-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2211166543479204343 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2211157839324203086 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'ui-icon-arrow-1-e'
 ,p_return_value => 'ui-icon-arrow-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2211170844865204746 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2211157839324203086 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'ui-icon-carat-1-e'
 ,p_return_value => 'ui-icon-carat-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2211175146596205196 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2211157839324203086 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'ui-icon-triangle-1-e'
 ,p_return_value => 'ui-icon-triangle-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2211179449020205899 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2211157839324203086 + wwv_flow_api.g_id_offset
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
  p_id => 2220296649559563477 + wwv_flow_api.g_id_offset
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
  p_id => 2220306826141566153 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2220296649559563477 + wwv_flow_api.g_id_offset
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
  p_id => 2220673867436184052 + wwv_flow_api.g_id_offset
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
  p_id => 2227320350255979364 + wwv_flow_api.g_id_offset
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
  p_id => 2227362545286044140 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2227320350255979364 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Définir ces éléments'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2227366951520045970 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2227320350255979364 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Avec ces valeurs'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 2227362545286044140 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'NOT_NULL'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_fermr_dialg_ifram
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2236080543399817636 + wwv_flow_api.g_id_offset
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
  p_id => 2306327336230709248 + wwv_flow_api.g_id_offset
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
  p_id => 2306792329153896499 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2306327336230709248 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Valeur 1'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2306796832270897374 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2306327336230709248 + wwv_flow_api.g_id_offset
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
  p_id => 2364555940285329662 + wwv_flow_api.g_id_offset
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
  p_id => 2384527050953076402 + wwv_flow_api.g_id_offset
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
  p_id => 2384528037706841733 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2384527050953076402 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Message de confirmation'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => true
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2384528546017844102 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2384527050953076402 + wwv_flow_api.g_id_offset
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
  p_id => 2384578942742410931 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_redrc_url
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2387828037900583399 + wwv_flow_api.g_id_offset
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
  p_id => 2387828245650595077 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2387828037900583399 + wwv_flow_api.g_id_offset
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
  p_id => 2388537740125597214 + wwv_flow_api.g_id_offset
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
  p_id => 2388538135062605249 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2388537740125597214 + wwv_flow_api.g_id_offset
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
  p_id => 2395111349445504057 + wwv_flow_api.g_id_offset
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
  p_id => 2395111729490507686 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2395111349445504057 + wwv_flow_api.g_id_offset
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
  p_id => 2395112340226510783 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2395111349445504057 + wwv_flow_api.g_id_offset
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
  p_id => 2397991232196613196 + wwv_flow_api.g_id_offset
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
  p_id => 2397991447087617532 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2397991232196613196 + wwv_flow_api.g_id_offset
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
  p_id => 2428452564168632029 + wwv_flow_api.g_id_offset
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
  p_id => 2436055443015877044 + wwv_flow_api.g_id_offset
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
  p_id => 2436063454789880455 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2436055443015877044 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Item cible'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2436159546871906631 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2436055443015877044 + wwv_flow_api.g_id_offset
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
  p_id => 2455543469387198467 + wwv_flow_api.g_id_offset
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
  p_id => 2548250160546881383 + wwv_flow_api.g_id_offset
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
  p_id => 2426280869821791547 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2548250160546881383 + wwv_flow_api.g_id_offset
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
  p_id => 2574329780229527883 + wwv_flow_api.g_id_offset
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
  p_id => 2564198865741969054 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
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
  p_id => 2574331379741792734 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'prePopulate'
 ,p_attribute_type => 'PLSQL EXPRESSION'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2574331897056797692 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
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
  p_id => 2574332376408801212 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
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
  p_id => 2574333281734812245 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
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
  p_id => 2574333784636822457 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'tokenLimit'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2574334292947824880 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
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
  p_id => 2574339385636920426 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
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
  p_id => 2501549753654321423 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
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
  p_id => 2574335093771834616 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
 ,p_name => 'onadd'
 ,p_display_name => 'onAdd'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2574335396541835413 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
 ,p_name => 'ondelete'
 ,p_display_name => 'onDelete'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2574335703467837383 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
 ,p_name => 'onready'
 ,p_display_name => 'onReady'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2574334791000833767 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2574329780229527883 + wwv_flow_api.g_id_offset
 ,p_name => 'onresult'
 ,p_display_name => 'onResult'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_group_entet_raprt_sql
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2713856278085277202 + wwv_flow_api.g_id_offset
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
  p_id => 2713889580792792857 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2713856278085277202 + wwv_flow_api.g_id_offset
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
  p_id => 2713890090489795607 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2713856278085277202 + wwv_flow_api.g_id_offset
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
  p_id => 2713891271919799750 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2713856278085277202 + wwv_flow_api.g_id_offset
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
  p_id => 2713891776075800938 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2713856278085277202 + wwv_flow_api.g_id_offset
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
  p_id => 2713892687503804251 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2713856278085277202 + wwv_flow_api.g_id_offset
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
  p_id => 2713893188888804667 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2713856278085277202 + wwv_flow_api.g_id_offset
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
  p_id => 2400739123570224953 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2713856278085277202 + wwv_flow_api.g_id_offset
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
  p_id => 2400739920602384869 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2713856278085277202 + wwv_flow_api.g_id_offset
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
  p_id => 2745207097236946832 + wwv_flow_api.g_id_offset
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
  p_id => 2745339813046017634 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
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
  p_id => 2745352019626019538 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
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
  p_id => 2745356422396020312 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
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
  p_id => 2543784546415355419 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
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
  p_id => 2544207247294712887 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
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
  p_id => 2544207759068716331 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Classe CSS ventilation'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 2544207247294712887 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2544208747771722499 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Classe CSS ventilation horizontale'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 2544207247294712887 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2544209254697724535 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Classe CSS ventilation verticale'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 2544207247294712887 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2544223765142181787 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 90
 ,p_prompt => 'Classe CSS ventilation gauche'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 2544207247294712887 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2544232247256460525 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
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
 ,p_depending_on_attribute_id => 2544207247294712887 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2400416940769457443 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
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
  p_id => 2400417449773459979 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2745207097236946832 + wwv_flow_api.g_id_offset
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
  p_id => 2813178538847805155 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/process_type/io_afw_21_valdt_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2829309761429038422 + wwv_flow_api.g_id_offset
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
  p_id => 2829332859483047244 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2829309761429038422 + wwv_flow_api.g_id_offset
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
  p_id => 2829337265716049080 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2829332859483047244 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'La valeur n''est pas nulle'
 ,p_return_value => 'NOT_NULL'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2829368469656059702 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2829309761429038422 + wwv_flow_api.g_id_offset
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
  p_id => 2829388456282065281 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2829309761429038422 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Item'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2829396763554067414 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2829309761429038422 + wwv_flow_api.g_id_offset
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
  p_id => 2836938258800352138 + wwv_flow_api.g_id_offset
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
  p_id => 2839165061868374797 + wwv_flow_api.g_id_offset
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
  p_id => 2839173034987376530 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2839165061868374797 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Liste des items (clob)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 2839189541791444727 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2839165061868374797 + wwv_flow_api.g_id_offset
 ,p_name => 'suprm_item_clob_delete_termn'
 ,p_display_name => 'Supprimer items CLOB terminé (DELETE)'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_calnd
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2979338379283734360 + wwv_flow_api.g_id_offset
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
  p_id => 2398850849285156646 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Code du calendrier'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 2979451270430220300 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'dayclick'
 ,p_display_name => 'dayClick'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970844375058019519 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'drop'
 ,p_display_name => 'drop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970794255188004337 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventafterrender'
 ,p_display_name => 'eventAfterRender'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2979451574932221611 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventclick'
 ,p_display_name => 'eventClick'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970823257050014294 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventdragstart'
 ,p_display_name => 'eventDragStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970819052895013146 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventdragstop'
 ,p_display_name => 'eventDragStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970827461206015529 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventdrop'
 ,p_display_name => 'eventDrop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970773275179953369 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventmouseout'
 ,p_display_name => 'eventMouseout'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970768962366949649 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventmouseover'
 ,p_display_name => 'eventMouseover'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970790055917957262 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventrender'
 ,p_display_name => 'eventRender'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970840070556018196 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventresize'
 ,p_display_name => 'eventResize'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970831663630016227 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventresizestart'
 ,p_display_name => 'eventResizeStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970835866054016977 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'eventresizestop'
 ,p_display_name => 'eventResizeStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970785852454956215 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'loading'
 ,p_display_name => 'loading'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2383969034376064784 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'loadingstart'
 ,p_display_name => 'loadingStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2383969439571066253 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'loadingstop'
 ,p_display_name => 'loadingStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970777477949954163 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'select'
 ,p_display_name => 'select'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970781681066955001 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'unselect'
 ,p_display_name => 'unselect'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970798460036005719 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'viewdisplay'
 ,p_display_name => 'viewDisplay'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2970802663153006582 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2979338379283734360 + wwv_flow_api.g_id_offset
 ,p_name => 'windowresize'
 ,p_display_name => 'windowResize'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_soumt_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 3232577129094700154 + wwv_flow_api.g_id_offset
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
  p_id => 3232596921606707500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3232577129094700154 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Liste des items (clob)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 3234789915174266812 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3232577129094700154 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_create_clob_termn'
 ,p_display_name => 'Soumettre CLOB terminé (CREATE)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 2820415063158347677 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3232577129094700154 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_delete_clob_termn'
 ,p_display_name => 'Soumettre CLOB terminé (DELETE)'||unistr('\000a')||
''
  );
wwv_flow_api.create_plugin_event (
  p_id => 2820410853808345038 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3232577129094700154 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_save_clob_termn'
 ,p_display_name => 'Soumettre CLOB terminé (SAVE)'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_dml_obten_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 3235686304908547695 + wwv_flow_api.g_id_offset
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
  p_id => 3235847506902567231 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3235686304908547695 + wwv_flow_api.g_id_offset
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
  p_id => 3235892491103572155 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3235686304908547695 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Elément contenant la valeur de colonne de clé primaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3235896898375574197 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3235686304908547695 + wwv_flow_api.g_id_offset
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
  p_id => 3235901304609576030 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3235686304908547695 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Elément contenant la valeur de colonne de clé secondaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3235905715690579195 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3235686304908547695 + wwv_flow_api.g_id_offset
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
  p_id => 3236874604009982717 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3235686304908547695 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Liste des items (séparées par des virgules)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3236912613706985450 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3235686304908547695 + wwv_flow_api.g_id_offset
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
  p_id => 3251671874923197619 + wwv_flow_api.g_id_offset
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
  p_id => 3251767976916217163 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3251671874923197619 + wwv_flow_api.g_id_offset
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
  p_id => 3251772385574219666 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3251671874923197619 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Elément contenant la valeur de colonne de clé primaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3251776790769221078 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3251671874923197619 + wwv_flow_api.g_id_offset
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
  p_id => 3251781163888222800 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3251671874923197619 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Elément contenant la valeur de colonne de clé secondaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3251785568736224224 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3251671874923197619 + wwv_flow_api.g_id_offset
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
  p_id => 3251805088129229805 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3251671874923197619 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Liste des items (séparées par des virgules)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3251809464019232303 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3251671874923197619 + wwv_flow_api.g_id_offset
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
  p_id => 4474183297716935231 + wwv_flow_api.g_id_offset
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
  p_id => 3007721985728401908 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4474183297716935231 + wwv_flow_api.g_id_offset
 ,p_name => 'selct_termn_regn'
 ,p_display_name => 'Sélection terminée'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_soumt_blob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 4480561579590287150 + wwv_flow_api.g_id_offset
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
  p_id => 3031344561624601503 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480561579590287150 + wwv_flow_api.g_id_offset
 ,p_name => 'debut_telvr'
 ,p_display_name => 'Débuter téléversement'
  );
wwv_flow_api.create_plugin_event (
  p_id => 4480585581453297156 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480561579590287150 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_create_blob_termn'
 ,p_display_name => 'Soumettre BLOB terminé (CREATE)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 4480589784916298084 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480561579590287150 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_delete_blob_termn'
 ,p_display_name => 'Soumettre BLOB terminé (DELETE)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3031348968896603602 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480561579590287150 + wwv_flow_api.g_id_offset
 ,p_name => 'termn_telvr'
 ,p_display_name => 'Terminer téléversement'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/com_skillbuilders_sbip_password
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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
  p_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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
  p_id => 10671102297372340238 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Base (APEX Default)'
 ,p_return_value => 'base'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671102700835341234 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Black Tie'
 ,p_return_value => 'black-tie'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671121604299342205 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Blitzer'
 ,p_return_value => 'blitzer'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671130209147343578 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'Cupertino'
 ,p_return_value => 'cupertino'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671130711917344397 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'Dark Hive'
 ,p_return_value => 'dark-hive'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671131515034345360 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 60
 ,p_display_value => 'Dot Luv'
 ,p_return_value => 'dot-luv'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671131885383346260 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 70
 ,p_display_value => 'Eggplant'
 ,p_return_value => 'eggplant'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671147788846347215 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 80
 ,p_display_value => 'Excite Bike'
 ,p_return_value => 'excite-bike'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671148292655348329 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 90
 ,p_display_value => 'Flick'
 ,p_return_value => 'flick'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671148695772349198 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 100
 ,p_display_value => 'Hot Sneaks'
 ,p_return_value => 'hot-sneaks'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671261095089424680 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 110
 ,p_display_value => 'Humanity'
 ,p_return_value => 'humanity'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671261597859425536 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 120
 ,p_display_value => 'Le Frog'
 ,p_return_value => 'le-frog'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671262100976426393 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 130
 ,p_display_value => 'Mint Choc'
 ,p_return_value => 'mint-choc'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671262504093427309 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 140
 ,p_display_value => 'Overcast'
 ,p_return_value => 'overcast'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671270007209428164 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 150
 ,p_display_value => 'Pepper Grinder'
 ,p_return_value => 'pepper-grinder'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671271109633428938 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 160
 ,p_display_value => 'Smoothness'
 ,p_return_value => 'smoothness'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671272014828430453 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 170
 ,p_display_value => 'South Street'
 ,p_return_value => 'south-street'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671272417598431212 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 180
 ,p_display_value => 'Start'
 ,p_return_value => 'start'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671272887947432077 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 190
 ,p_display_value => 'Sunny'
 ,p_return_value => 'sunny'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671273390371432815 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 200
 ,p_display_value => 'Swanky Purse'
 ,p_return_value => 'swanky-purse'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671273793834433791 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 210
 ,p_display_value => 'Trontastic'
 ,p_return_value => 'trontastic'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671275701107435920 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 220
 ,p_display_value => 'UI Darkness'
 ,p_return_value => 'ui-darkness'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671276304224436833 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 230
 ,p_display_value => 'UI Lightness'
 ,p_return_value => 'ui-lightness'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10671277408726438147 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10671085392524338829 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 240
 ,p_display_value => 'Vader'
 ,p_return_value => 'vader'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 10623053907082851609 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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
  p_id => 10622983901757840636 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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
  p_id => 10623001804181841319 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10622983901757840636 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Alert'
 ,p_return_value => 'ui-icon-alert'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10623025306951842115 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10622983901757840636 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Info'
 ,p_return_value => 'ui-icon-info'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10623027615262844549 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10622983901757840636 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Notice'
 ,p_return_value => 'ui-icon-notice'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 10622980687558836516 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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
  p_id => 10623073611846871927 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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
  p_id => 10666068093600941837 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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
  p_id => 10666070403989944766 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666068093600941837 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Left Top'
 ,p_return_value => 'left top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666070907106945736 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666068093600941837 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Left Center'
 ,p_return_value => 'left center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666071510915946794 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666068093600941837 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Left Bottom'
 ,p_return_value => 'left bottom'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666073115764948224 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666068093600941837 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'Center Top'
 ,p_return_value => 'center top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666082588883949943 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666068093600941837 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'Center Center'
 ,p_return_value => 'center center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666083592692951039 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666068093600941837 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 60
 ,p_display_value => 'Center Bottom'
 ,p_return_value => 'center bottom'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666084196155951970 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666068093600941837 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 70
 ,p_display_value => 'Right Top'
 ,p_return_value => 'right top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666085100657953248 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666068093600941837 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 80
 ,p_display_value => 'Right Center'
 ,p_return_value => 'right center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666085903774954170 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666068093600941837 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 90
 ,p_display_value => 'Right Bottom'
 ,p_return_value => 'right bottom'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 10666164991879016946 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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
  p_id => 10666166195342017978 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666164991879016946 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Left Top'
 ,p_return_value => 'left top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666185400190019365 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666164991879016946 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Left Center'
 ,p_return_value => 'left center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666186503999020460 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666164991879016946 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Left Bottom'
 ,p_return_value => 'left bottom'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666188507809021599 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666164991879016946 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'Center Top'
 ,p_return_value => 'center top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666201711964022809 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666164991879016946 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'Center Center'
 ,p_return_value => 'center center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10666330015428023813 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666164991879016946 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 60
 ,p_display_value => 'Center Bottom'
 ,p_return_value => 'center bottom'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10667038587162025109 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666164991879016946 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 70
 ,p_display_value => 'Right Top'
 ,p_return_value => 'right top'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10667290689586025739 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666164991879016946 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 80
 ,p_display_value => 'Right Center'
 ,p_return_value => 'right center'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 10667291192010026447 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 10666164991879016946 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 90
 ,p_display_value => 'Right Bottom'
 ,p_return_value => 'right bottom'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 10667305414782051928 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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
  p_id => 11172658209191437915 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 10480794898519912735 + wwv_flow_api.g_id_offset
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

--export elap=           9.7475
