set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 1000002 - Connexion
--
-- Application Export:
--   Application:     1000002
--   Name:            Connexion
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
--   Pages:                      5
--     Items:                   27
--     Computations:             7
--     Processes:               16
--     Regions:                  9
--     Buttons:                  3
--     Dynamic Actions:         13
--   Shared Components:
--     Logic:
--       Items:                 47
--       Processes:              9
--       Computations:           2
--     Navigation:
--       Lists:                  6
--       Breadcrumbs:            1
--     Security:
--       Authentication:         1
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
--       LOVs:                  15
--       Shortcuts:              2
--       Plug-ins:              69
--     Globalization:
--       Messages:             255
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,1000002);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,1000002));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,1000002));
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
  p_id    => nvl(wwv_flow_application_install.get_application_id,1000002),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,1000002),
  p_owner => nvl(wwv_flow_application_install.get_schema,'APEXFRAMEWORK'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Connexion'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'1000002'),
  p_application_group=>19694313105945939,
  p_application_group_name=>'AFW',
  p_application_group_comment=>'',
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt_last_reset => '20150610131643',
  p_max_session_length_sec=> 28800,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'fr-ca',
  p_flow_language_derived_from=> 'FLOW_PRIMARY_LANGUAGE',
  p_allow_feedback_yn=> 'N',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 1231061370856744225 + wwv_flow_api.g_id_offset,
  p_logout_url=> '',
  p_application_tab_set=> 0,
  p_logo_image => '&A_AFW_11_DOSR_FICHR.images/logo_sem_application_fr.gif',
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
  p_default_error_display_loc=> 'INLINE_WITH_FIELD',
  p_substitution_string_01 => 'APEX_DML_LOCK_WAIT_TIME',
  p_substitution_value_01  => '5',
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
  p_id => 80454429232834338 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_ui_type_name => 'DESKTOP'
 ,p_display_name => 'Desktop'
 ,p_display_seq => 10
 ,p_use_auto_detect => true
 ,p_is_default => true
 ,p_theme_id => 313
 ,p_home_url => 'f?p=&APP_ID.:101:&SESSION.'
 ,p_login_url => 'f?p=&APP_ID.:101'
 ,p_global_page_id => 0
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
--application/plug-in setting/item_type_plugin_io_afw_21_selct_2
wwv_flow_api.create_plugin_setting (
  p_id => 7778814649172515 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'PLUGIN_IO_AFW_21_SELCT_2'
 ,p_attribute_01 => 'Y'
  );
--application/plug-in setting/item_type_native_yes_no
wwv_flow_api.create_plugin_setting (
  p_id => 82821743204035352 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_03 => 'N'
  );
--application/plug-in setting/item_type_plugin_io_afw_21_item_popup_arbor
wwv_flow_api.create_plugin_setting (
  p_id => 959821868737650019 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'PLUGIN_IO_AFW_21_ITEM_POPUP_ARBOR'
 ,p_attribute_01 => '&A_AFW_11_DOSR_FICHR_AFW.plugin/javascript/afw_13_plugn_popup_lov_ir.js'
 ,p_attribute_02 => '&A_AFW_11_DOSR_FICHR_AFW.plugin/css/afw_13_plugn_popup_lov_ir.css'
  );
null;
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
null;
 
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
--application/shared_components/logic/application_processes/javascript_au_chargement
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_01_javsc_pkg.ajout_scrip_charg ();'||unistr('\000a')||
'afw_07_javsc_pkg.ajout_scrip_charg ();';

wwv_flow_api.create_flow_process(
  p_id => 1088515371178568948 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 10000002,
  p_process_point => 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'JavaScript au chargement',
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

--application/shared_components/logic/application_processes/afw_04_synchroniser_variables_fil_d_ariane
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_04_fil_arian_pkg.synch_varbl();';

wwv_flow_api.create_flow_process(
  p_id => 946098349595762929 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Synchroniser variables fil d''Ariane',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> 'afw_13_page_pkg.obten_page_sesn  <>  afw_11_prodt_pkg.obten_page_conxn');
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
  p_id => 946098748687772136 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.1,
  p_process_point => 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Valider info de provenance avant Submit',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Erreur lors de la validation de la provenance.',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> 'afw_13_page_pkg.obten_page_sesn  <>  afw_11_prodt_pkg.obten_page_conxn');
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
  p_id => 946098536913768749 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.2,
  p_process_point => 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Synchroniser variables contexte',
  p_process_sql_clob=> p,
  p_process_error_message=> '#SQLERRM#',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> 'afw_13_page_pkg.obten_page_sesn  <>  afw_11_prodt_pkg.obten_page_conxn');
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
  p_id => 946098133318758193 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1000000000.1,
  p_process_point => 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 04 - Mettre à jour le contexte',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> 'afw_13_page_pkg.obten_page_sesn  <>  afw_11_prodt_pkg.obten_page_conxn');
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
  p_id => 1069997089023794004 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1.2,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - 11 - Définir la langue',
  p_process_sql_clob=> p,
  p_process_error_message=> 'err',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'FSP_LANGUAGE_PREFERENCE',
  p_process_when_type=> 'ITEM_IS_NULL',
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
  p_id => 1230822179636680458 + wwv_flow_api.g_id_offset,
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

--application/shared_components/logic/application_processes/afw_04_synchroniser_fil_d_ariane
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'afw_04_fil_arian_pkg.synch;';

wwv_flow_api.create_flow_process(
  p_id => 946097734573749084 + wwv_flow_api.g_id_offset,
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
  p_process_comment=> 'afw_13_page_pkg.obten_page_sesn  <>  afw_11_prodt_pkg.obten_page_conxn');
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
  p_id => 946097941845751226 + wwv_flow_api.g_id_offset,
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
  p_process_comment=> 'afw_13_page_pkg.obten_page_sesn  <>  afw_11_prodt_pkg.obten_page_conxn');
end;
 
null;
 
end;
/

prompt  ...application items
--
--application/shared_components/logic/application_items/a_afw_04_actio
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1047746588331004567 + wwv_flow_api.g_id_offset
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
  p_id => 1047460280439727181 + wwv_flow_api.g_id_offset
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
  p_id => 1047746797335007167 + wwv_flow_api.g_id_offset
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
  p_id => 1230084267543554039 + wwv_flow_api.g_id_offset
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
  p_id => 1047747000452008028 + wwv_flow_api.g_id_offset
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
  p_id => 1047747405646009536 + wwv_flow_api.g_id_offset
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
  p_id => 1047747202876008788 + wwv_flow_api.g_id_offset
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
  p_id => 1230209368713563773 + wwv_flow_api.g_id_offset
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
  p_id => 959500245860802453 + wwv_flow_api.g_id_offset
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
  p_id => 1048138387098645080 + wwv_flow_api.g_id_offset
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
  p_id => 1047747608070010313 + wwv_flow_api.g_id_offset
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
  p_id => 1048826184795509119 + wwv_flow_api.g_id_offset
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
  p_id => 1089308700277646577 + wwv_flow_api.g_id_offset
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
  p_id => 1035274278872360949 + wwv_flow_api.g_id_offset
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
  p_id => 9238421334980372 + wwv_flow_api.g_id_offset
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
  p_id => 1230217570791564406 + wwv_flow_api.g_id_offset
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
  p_id => 531593329780014018 + wwv_flow_api.g_id_offset
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
  p_id => 1230100273430555723 + wwv_flow_api.g_id_offset
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
  p_id => 1230181161787561769 + wwv_flow_api.g_id_offset
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
  p_id => 1230076265119553278 + wwv_flow_api.g_id_offset
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
  p_id => 1230116278971557334 + wwv_flow_api.g_id_offset
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
  p_id => 1230144250705558601 + wwv_flow_api.g_id_offset
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
  p_id => 1230048357847551234 + wwv_flow_api.g_id_offset
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
  p_id => 9238624286980372 + wwv_flow_api.g_id_offset
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
  p_id => 9238911629980373 + wwv_flow_api.g_id_offset
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
  p_id => 160033841618555444 + wwv_flow_api.g_id_offset
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
  p_id => 160092235735233820 + wwv_flow_api.g_id_offset
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
  p_id => 530859329917982984 + wwv_flow_api.g_id_offset
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
  p_id => 1230152553476559411 + wwv_flow_api.g_id_offset
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
  p_id => 1230108276893556683 + wwv_flow_api.g_id_offset
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
  p_id => 1230056359924551809 + wwv_flow_api.g_id_offset
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
  p_id => 1230169159363561067 + wwv_flow_api.g_id_offset
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
  p_id => 1230193163865562419 + wwv_flow_api.g_id_offset
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
  p_id => 530859241085982982 + wwv_flow_api.g_id_offset
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
  p_id => 533291637366822255 + wwv_flow_api.g_id_offset
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
  p_id => 1230040355076550404 + wwv_flow_api.g_id_offset
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
  p_id => 1230068262695552629 + wwv_flow_api.g_id_offset
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
  p_id => 1230092269967554717 + wwv_flow_api.g_id_offset
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
  p_id => 1230160856592560269 + wwv_flow_api.g_id_offset
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
  p_id => 1230128181395557998 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_LIEN_EDITN_RAPRT'
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
  p_id => 14459731279804839 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_MESG_CONFR_SUPRS'
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
  p_id => 1069996883698783026 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_AFW_13_PAGE_TITRE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_enap_libl_indic_champ_oblig
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1014004371912186604 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_ENAP_LIBL_INDIC_CHAMP_OBLIG'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/a_enap_ui_css_scope
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 1013996368449185539 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'A_ENAP_UI_CSS_SCOPE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/ek_ml_search
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 84610933819823926 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'EK_ML_SEARCH'
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
  p_id => 1046704186505297861 + wwv_flow_api.g_id_offset
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
  p_id => 1069996679542781821 + wwv_flow_api.g_id_offset
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
 
--application/shared_components/logic/application_computations/a_enap_ui_css_scope
wwv_flow_api.create_flow_computation (
  p_id => 1014059571696195969 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'A_ENAP_UI_CSS_SCOPE',
  p_computation_point    => 'BEFORE_HEADER',
  p_computation_type => 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'ui-dso-inter',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
--application/shared_components/logic/application_computations/a_enap_libl_indic_champ_oblig
wwv_flow_api.create_flow_computation (
  p_id => 1014086080354198481 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'A_ENAP_LIBL_INDIC_CHAMP_OBLIG',
  p_computation_point    => 'BEFORE_HEADER',
  p_computation_type => 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'null',
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
--application/shared_components/user_interface/lov/lov_defnt_acces
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1050195782523251934 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_DEFNT_ACCES',
  p_lov_query=> '.'||to_char(1050195782523251934 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050196106878251936 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050195782523251934 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Refusé',
  p_lov_return_value=>'REFS',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050196299516251936 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050195782523251934 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Accordé',
  p_lov_return_value=>'ACORD',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050196502018251936 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050195782523251934 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Utilisateur lié',
  p_lov_return_value=>'ACUCS',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050196677634251936 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050195782523251934 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'Structure inférieure liée',
  p_lov_return_value=>'ACSIN',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050270292721009948 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050195782523251934 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>5,
  p_lov_disp_value=>'Structure immédiate liée',
  p_lov_return_value=>'ACSTI',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050196887913251936 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050195782523251934 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>6,
  p_lov_disp_value=>'Structure supérieure liée',
  p_lov_return_value=>'ACSSU',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050270804842013420 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050195782523251934 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>7,
  p_lov_disp_value=>'Structure globale liée',
  p_lov_return_value=>'ACSTG',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_erer_oracl
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1048615695839841959 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_ERER_ORACL',
  p_lov_query=> 'select libl d, err_code r'||unistr('\000a')||
'from VD_AFW_01_CODE_ERR_ORCL'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_espac_travl
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1050051793840415816 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_ESPAC_TRAVL',
  p_lov_query=> 'select nom_formt d, seqnc r'||unistr('\000a')||
'  from vd_afw_12_espac_travl');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_impla_prodt
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1049653286707036441 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_IMPLA_PRODT',
  p_lov_query=> 'select nom_formt d, seqnc r'||unistr('\000a')||
'  from vd_afw_11_impla_prodt'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_mesg
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1047511599729300425 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_MESG',
  p_lov_query=> 'select libl_mesg d, numr_mesg r'||unistr('\000a')||
'  from (select mes.numr_mesg||'' - ''||mel.mesg libl_mesg, mes.numr_mesg'||unistr('\000a')||
'          from vd_afw_01_mesg mes,'||unistr('\000a')||
'               vd_afw_01_mesg_lang mel'||unistr('\000a')||
'         where mel.ref_numr_mesg(+) = mes.numr_mesg'||unistr('\000a')||
'           and mel.lang(+) = ''FR'')');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_o
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1047453296575646711 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_O',
  p_lov_query=> '.'||to_char(1047453296575646711 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1047453590556646713 + wwv_flow_api.g_id_offset,
  p_lov_id=>1047453296575646711 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'&nbsp;',
  p_lov_return_value=>'O',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_oui_non
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1049581803585883970 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_OUI_NON',
  p_lov_query=> '.'||to_char(1049581803585883970 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1049582087859883973 + wwv_flow_api.g_id_offset,
  p_lov_id=>1049581803585883970 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Oui',
  p_lov_return_value=>'O',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1049582290782883975 + wwv_flow_api.g_id_offset,
  p_lov_id=>1049581803585883970 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Non',
  p_lov_return_value=>'N',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_prodt
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1046724087529926913 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_PRODT',
  p_lov_query=> 'select   code || '' :: '' || nom d,'||unistr('\000a')||
'         seqnc r'||unistr('\000a')||
'    from vd_afw_11_prodt'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_struc_aplic
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1049653795626057986 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_STRUC_APLIC',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_afw_12_struc_aplic'||unistr('\000a')||
' order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_contx
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1047763794442422688 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_CONTX',
  p_lov_query=> 'select ctx.code || '' :: '' || ctx.descr d, ctx.seqnc'||unistr('\000a')||
'   from vd_afw_04_type_contx ctx'||unistr('\000a')||
'  order by 1'||unistr('\000a')||
'');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_domn_valr
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1050453406168145992 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_DOMN_VALR',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'    from vd_afw_14_type_domn_valr'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_don
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1049935304319548864 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_DON',
  p_lov_query=> '.'||to_char(1049935304319548864 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1049935587568548866 + wwv_flow_api.g_id_offset,
  p_lov_id=>1049935304319548864 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Alphanumérique',
  p_lov_return_value=>'V',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1049935784166548867 + wwv_flow_api.g_id_offset,
  p_lov_id=>1049935304319548864 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Numérique',
  p_lov_return_value=>'N',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1049935998023548867 + wwv_flow_api.g_id_offset,
  p_lov_id=>1049935304319548864 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Date',
  p_lov_return_value=>'D',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_liais
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1048055280561609202 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_LIAIS',
  p_lov_query=> '.'||to_char(1048055280561609202 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1048055601065609205 + wwv_flow_api.g_id_offset,
  p_lov_id=>1048055280561609202 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'1 - Produit, page, type d''erreur et contrainte ou table/colonne',
  p_lov_return_value=>'1',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1048055802387609205 + wwv_flow_api.g_id_offset,
  p_lov_id=>1048055280561609202 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'2 - Produit, page et type d''erreur',
  p_lov_return_value=>'2',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1048056005302609205 + wwv_flow_api.g_id_offset,
  p_lov_id=>1048055280561609202 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'3 - Produit et page',
  p_lov_return_value=>'3',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1048056192416609205 + wwv_flow_api.g_id_offset,
  p_lov_id=>1048055280561609202 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'4 - Produit, type d''erreur et contrainte ou table/colonne',
  p_lov_return_value=>'4',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1048056379023609205 + wwv_flow_api.g_id_offset,
  p_lov_id=>1048055280561609202 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>5,
  p_lov_disp_value=>'5 - Produit et type d''erreur',
  p_lov_return_value=>'5',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1048056585840609205 + wwv_flow_api.g_id_offset,
  p_lov_id=>1048055280561609202 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>6,
  p_lov_disp_value=>'6 - Type d''erreur et contrainte ou table/colonne',
  p_lov_return_value=>'6',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1048056800304609206 + wwv_flow_api.g_id_offset,
  p_lov_id=>1048055280561609202 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>7,
  p_lov_disp_value=>'7 - Type d''erreur',
  p_lov_return_value=>'7',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1048057000184609206 + wwv_flow_api.g_id_offset,
  p_lov_id=>1048055280561609202 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>8,
  p_lov_disp_value=>'8 - Message générique par produit',
  p_lov_return_value=>'8',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1048057181052609206 + wwv_flow_api.g_id_offset,
  p_lov_id=>1048055280561609202 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>9,
  p_lov_disp_value=>'9 - Message générique',
  p_lov_return_value=>'9',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_mesg
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1050329196689315428 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_MESG',
  p_lov_query=> '.'||to_char(1050329196689315428 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050329493495315430 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050329196689315428 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Erreur',
  p_lov_return_value=>'E',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050329703803315431 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050329196689315428 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Informatif',
  p_lov_return_value=>'I',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050329885944315431 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050329196689315428 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Aide',
  p_lov_return_value=>'A',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>1050330097723315431 + wwv_flow_api.g_id_offset,
  p_lov_id=>1050329196689315428 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'Avertissement',
  p_lov_return_value=>'W',
  p_lov_data_comment=> '');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/lov_type_struc
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1050053097566435870 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'LOV_TYPE_STRUC',
  p_lov_query=> 'select nom d, seqnc r'||unistr('\000a')||
'  from vd_afw_12_type_struc'||unistr('\000a')||
'');
 
null;
 
end;
/

prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
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
 ,p_user_interface_id => 80454429232834338 + wwv_flow_api.g_id_offset
 ,p_name => 'Page commune'
 ,p_step_title => 'Page commune'
 ,p_step_sub_title => 'Sie'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
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
  p_id=> 827057442890126739 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Messages informatifs',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_07',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_IO_AFW_21_REGN_PILE_MESG',
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
  p_id=> 1047712704186736128 + wwv_flow_api.g_id_offset,
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
  p_id=>946099443801818005 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SADA',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
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
  p_id=>1047408577273397431 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SIDF',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
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
  p_field_template=> 605393249466561724+wwv_flow_api.g_id_offset,
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
  p_id=>1047408804747397433 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SSPC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
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
  p_id=>1047408979737397433 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SCPC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
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
  p_id=>1047747798159016914 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SAPC',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
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
  p_id=>1056902576846998330 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SNPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
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
  p_id=>1079692379389630127 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SCPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
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
  p_id=>1079692585968632021 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SSPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
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
  p_id=>1079692790124633251 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'SAPI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
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

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 160521854237298087 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'AFW'
 ,p_event_sequence => 10
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
  );
wwv_flow_api.create_page_da_action (
  p_id => 160522337166299004 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 160521854237298087 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AIDE_PAGE_ITEM'
 ,p_attribute_01 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 160522150369298087 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 160521854237298087 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AIDE_PAGE'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 160522535656299723 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 160521854237298087 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_INITL_COMPS'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 81197025219244317 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 160521854237298087 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 100
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_NAVGT_ENREG'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 22079206849561317 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 160521854237298087 + wwv_flow_api.g_id_offset
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
 
---------------------------------------
-- ...updatable report columns for page 0
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00101
prompt  ...PAGE 101: Connexion
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 101
 ,p_user_interface_id => 80454429232834338 + wwv_flow_api.g_id_offset
 ,p_name => 'Connexion'
 ,p_step_title => 'Connexion'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Login'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 605373028098561701 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_browser_cache => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'LGCARRIER'
 ,p_last_upd_yyyymmddhh24miss => '20150113103709'
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
  p_id=> 1049189585646501538 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Connectez-vous',
  p_region_name=>'',
  p_region_css_classes=>'form-signin',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 605380851048561711+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => false,
  p_plug_grid_column_span => 12,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_column_width => 'valign=top',
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
 
wwv_flow_api.create_page_branch(
  p_id=>1042643473223184908 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_branch_name=> '',
  p_branch_action=> 'return afw_12_authe_apex_pkg.obten_url_creat_utils;',
  p_branch_point=> 'BEFORE_COMPUTATION',
  p_branch_type=> 'BRANCH_TO_FUNCTION_RETURNING_URL',
  p_branch_when_button_id=>128570236007105658+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 16-NOV. -2011 15:27 by LGCARRIERBEDARD');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>128559938022013552 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_CODE_UTILS_OUBLI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 1049189585646501538+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Code utilisateur oublié ?',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_css_classes=> 'btn-default btn-block',
  p_tag_attributes  => 'template:'||to_char(605396045843561727 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 12,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_button_image_attr=> 'icon-user',
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_button_execute_validations=>'N',
  p_button_action => 'DEFINED_BY_DA',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>128569455429081507 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_MOT_PASSE_OUBLI',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 1049189585646501538+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Mot de passe oublié ?',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_css_classes=> 'btn-default btn-block',
  p_tag_attributes  => 'template:'||to_char(605396045843561727 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 12,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_button_image_attr=> 'icon-key',
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_button_execute_validations=>'N',
  p_button_action => 'DEFINED_BY_DA',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>128570236007105658 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_CREER_UTILS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 1049189585646501538+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Créer un compte utilisateur',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_css_classes=> 'btn-primary btn-block',
  p_tag_attributes  => 'template:'||to_char(605396045843561727 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 12,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_button_image_attr=> 'icon-plus',
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when_type=>'NEVER',
  p_is_persistent=> 'Y',
  p_button_execute_validations=>'N',
  p_button_action => 'DEFINED_BY_DA',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>160685640623078711 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_TYPE_REQT_INTER_CODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
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
  p_id=>946412145016900399 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_MODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
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
  p_id=>1036105686874589465 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LANG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'FR',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'FR',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'RIGHT-CENTER',
  p_display_when_type=>'NEVER',
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
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
  p_id=>1037269989518434319 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_DOMN',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1049189585646501538+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Domaine',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 60,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'autofocus=""',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 12,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P101_force_domn',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_encrypt_session_state_yn=> 'Y',
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
  p_id=>1037271397717578596 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_FORCE_DOMN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 1047712704186736128+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
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
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
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
  p_id=>1049189795328501541 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_CODE_UTILS',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1049189585646501538+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Code utilisateur',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 12,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_encrypt_session_state_yn=> 'Y',
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
  p_id=>1049189993521501541 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_MOT_PASSE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1049189585646501538+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Mot de passe',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 12,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_encrypt_session_state_yn=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1049190198946501541 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 1049189585646501538+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default=> 'CONXN',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Connexion',
  p_source=>'CONXN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_css_classes=> 'btn-success btn-large btn-block',
  p_tag_attributes  => 'template:'||to_char(605394231047561726 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 12,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_button_execute_validations=>'Y',
  p_button_action => 'DEFINED_BY_DA',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 946416852663129680 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_computation_sequence => 10,
  p_computation_item=> 'P101_MODE',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '',
  p_compute_when => 'CONXN',
  p_compute_when_type=>'REQUEST_EQUALS_CONDITION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 946417237210134671 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_computation_sequence => 20,
  p_computation_item=> 'SAPC',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '',
  p_compute_when => 'CONXN',
  p_compute_when_type=>'REQUEST_EQUALS_CONDITION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 946417445868137172 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_computation_sequence => 30,
  p_computation_item=> 'A_AFW_04_ACTIO',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '',
  p_compute_when => 'CONXN',
  p_compute_when_type=>'REQUEST_EQUALS_CONDITION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 1041641189856271268 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Focus P101_DOMN'
 ,p_event_sequence => 10
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
 ,p_display_when_type => 'PLSQL_EXPRESSION'
 ,p_display_when_cond => ':P101_DOMN is null'
  );
wwv_flow_api.create_page_da_action (
  p_id => 1041641379106271268 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 1041641189856271268 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_FOCUS'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P101_DOMN'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 1041639789893224050 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Focus P101_CODE_UTILS'
 ,p_event_sequence => 20
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
 ,p_display_when_type => 'PLSQL_EXPRESSION'
 ,p_display_when_cond => ':P101_DOMN is not null and :P101_CODE_UTILS is null'
  );
wwv_flow_api.create_page_da_action (
  p_id => 1041639982810224062 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 1041639789893224050 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_FOCUS'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P101_CODE_UTILS'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 1037283886464431493 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Focus P101_MOT_PASSE'
 ,p_event_sequence => 30
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
 ,p_display_when_type => 'PLSQL_EXPRESSION'
 ,p_display_when_cond => ':P101_DOMN is not null and :P101_CODE_UTILS is not null'
  );
wwv_flow_api.create_page_da_action (
  p_id => 1037284194118431526 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 1037283886464431493 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_FOCUS'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P101_MOT_PASSE'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 1042455073485853831 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Soumettre P101_CREER_UTILS (P101_CREER_UTILS)'
 ,p_event_sequence => 40
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 128570236007105658 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
 ,p_display_when_type => 'NEVER'
  );
wwv_flow_api.create_page_da_action (
  p_id => 1042455354483853836 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 1042455073485853831 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_01 => 'P101_CREER_UTILS'
 ,p_attribute_02 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 946185658264718148 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Mot passe oublié - Afficher dialogue'
 ,p_event_sequence => 50
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 128569455429081507 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 946185959452718149 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946185658264718148 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
 ,p_attribute_01 => 'Réinitialiser un mot de passe oublié'
 ,p_attribute_03 => '520'
 ,p_attribute_04 => '320'
 ,p_attribute_05 => 'dialg_mot_passe_oubli'
 ,p_attribute_07 => 'N'
 ,p_attribute_08 => 'N'
 ,p_attribute_09 => 'N'
 ,p_attribute_14 => 'afw_11_aplic_pkg.obten_numr_apex_aplic'
 ,p_attribute_15 => '103'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 946195751767397474 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Mot passe oublié - Fermer dialogue'
 ,p_event_sequence => 60
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'div.dialg_mot_passe_oubli div.afw_21_actio_dynmq_dialg'
 ,p_bind_type => 'live'
 ,p_bind_delegate_to_selector => 'body'
 ,p_bind_event_type => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
  );
wwv_flow_api.create_page_da_action (
  p_id => 946196036048397476 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946195751767397474 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 946199161857428740 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946195751767397474 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 946196934929402121 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946195751767397474 + wwv_flow_api.g_id_offset
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
  p_id => 946433352784113664 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Code utilisateur oublié - Afficher dialogue'
 ,p_event_sequence => 70
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 128559938022013552 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 946433660837113668 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946433352784113664 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
 ,p_attribute_01 => 'Obtenir un code utilisateur oublié'
 ,p_attribute_03 => '520'
 ,p_attribute_04 => '320'
 ,p_attribute_05 => 'dialg_code_utils_oubli'
 ,p_attribute_07 => 'N'
 ,p_attribute_08 => 'N'
 ,p_attribute_09 => 'N'
 ,p_attribute_14 => 'afw_11_aplic_pkg.obten_numr_apex_aplic'
 ,p_attribute_15 => '104'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 946434452615151493 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Code utilisateur oublié - Fermer dialogue'
 ,p_event_sequence => 80
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'div.dialg_code_utils_oubli div.afw_21_actio_dynmq_dialg'
 ,p_bind_type => 'live'
 ,p_bind_delegate_to_selector => 'body'
 ,p_bind_event_type => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
  );
wwv_flow_api.create_page_da_action (
  p_id => 946434744853151494 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946434452615151493 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 946435155182151495 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946434452615151493 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_REGN_AFICH_MESG_PR'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 946434935707151494 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946434452615151493 + wwv_flow_api.g_id_offset
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
  p_id => 946408331145745080 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Réintialiser le mot de passe - Afficher dialogue'
 ,p_event_sequence => 90
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
 ,p_display_when_type => 'VAL_OF_ITEM_IN_COND_EQ_COND2'
 ,p_display_when_cond => 'P101_TYPE_REQT_INTER_CODE'
 ,p_display_when_cond2 => 'REINT_MOT_PASSE'
 ,p_da_event_comment => 'apex.item(''P101_MODE'').getValue() == ''REINT_MOT_PASSE'''
  );
wwv_flow_api.create_page_da_action (
  p_id => 946417859028141004 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946408331145745080 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'begin'||unistr('\000a')||
'  afw_12_reqt_inter_utils_pkg.defnr_aplic_authe_redrc_cible ('||unistr('\000a')||
'    :a_afw_04_actio);'||unistr('\000a')||
'end;'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 946408630906745081 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946408331145745080 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM'
 ,p_attribute_01 => 'Réinitialiser un mot de passe'
 ,p_attribute_03 => '520'
 ,p_attribute_04 => '320'
 ,p_attribute_05 => 'dialg_reint_mot_passe'
 ,p_attribute_06 => '&P101_MODE.'
 ,p_attribute_07 => 'N'
 ,p_attribute_08 => 'N'
 ,p_attribute_09 => 'N'
 ,p_attribute_14 => 'afw_11_aplic_pkg.obten_numr_apex_aplic'
 ,p_attribute_15 => '105'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 946409641796767084 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Réintialiser le mot de passe - Fermer dialogue'
 ,p_event_sequence => 100
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'div.dialg_reint_mot_passe div.afw_21_actio_dynmq_dialg'
 ,p_bind_type => 'live'
 ,p_bind_delegate_to_selector => 'body'
 ,p_bind_event_type => 'PLUGIN_IO_AFW_21_AFICH_DIALG_IFRAM|DYNAMIC ACTION|dialogbeforeclose'
  );
wwv_flow_api.create_page_da_action (
  p_id => 946409948996767084 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946409641796767084 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'afw_21_plugn_dialg_ifram_pkg.defnr_contx_apres_fermt_dialg();'||unistr('\000a')||
':P101_MODE := null;'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 947324857387526274 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 946409641796767084 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_IO_AFW_21_REDRC_URL'
 ,p_attribute_01 => 'afw_08_url_pkg.genr_url (pva_nom_varbl_1   => ''SAPC'','||unistr('\000a')||
'                           pva_valr_varbl_1  => null)'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 160710149140046348 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Soumettre CONXN (Cliquer P101_LOGIN)'
 ,p_event_sequence => 110
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 1049190198946501541 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 160710443778046348 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 160710149140046348 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_01 => 'CONXN'
 ,p_attribute_02 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 80473909969345102 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_name => 'Soumettre CONXN (Enter P101_MOT_PASSE)'
 ,p_event_sequence => 120
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P101_MOT_PASSE'
 ,p_triggering_condition_type => 'JAVASCRIPT_EXPRESSION'
 ,p_triggering_expression => 'this.browserEvent.which === 13'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'keypress'
  );
wwv_flow_api.create_page_da_action (
  p_id => 80474224395345109 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 101
 ,p_event_id => 80473909969345102 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_01 => 'CONXN'
 ,p_attribute_02 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
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
  p_id     => 1049191183496501544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Définir les témoins (cookies)',
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
p:=p||'begin'||unistr('\000a')||
'  afw_12_authe_apex_pkg.exect_procd_persn();'||unistr('\000a')||
'  afw_12_authe_apex_pkg.authe_redrg ('||unistr('\000a')||
'    pva_code_utils        => :p101_code_utils,'||unistr('\000a')||
'    pva_mot_passe         => :p101_mot_passe,'||unistr('\000a')||
'    pva_domn              => :p101_domn,'||unistr('\000a')||
'    pnu_numr_apex_aplic   => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_NUMR_APEX_APLIC''),'||unistr('\000a')||
'    pnu_numr_apex_page    => afw_07_sesn_pkg.obten';

p:=p||'_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_NUMR_APEX_PAGE''),'||unistr('\000a')||
'    pbo_indic_forcr_sspc  => true,'||unistr('\000a')||
'    pbo_indic_forcr_sidf  => true,'||unistr('\000a')||
'    pva_scpc              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SCPC''),'||unistr('\000a')||
'    pnu_sspc              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SSPC''),'||unistr('\000a')||
'    pva_sapc          ';

p:=p||'    => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SAPC''),'||unistr('\000a')||
'    pva_scpi              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SCPI''),'||unistr('\000a')||
'    pnu_sspi              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SSPI''),'||unistr('\000a')||
'    pva_sapi              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'           ';

p:=p||'                   ''S_AUTHE_CIBLE_SAPI''),'||unistr('\000a')||
'    pnu_snpi              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SNPI''),'||unistr('\000a')||
'    pnu_sidf              => afw_07_sesn_pkg.obten_valr_sesn ('||unistr('\000a')||
'                              ''S_AUTHE_CIBLE_SIDF''));'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 1049190801572501542 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'AFW - Connexion',
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
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 1049191395541501544 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Effacer la cache de la page de connexion',
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
p := null;
wwv_flow_api.create_page_process(
  p_id     => 946411834973897567 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLUGIN_IO_AFW_21_MODE_PAGE',
  p_process_name=> 'Définir le mode',
  p_process_sql_clob => p,
  p_attribute_01=> 'P101_MODE',
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
p:=p||'begin'||unistr('\000a')||
'   :p101_type_reqt_inter_code :='||unistr('\000a')||
'      afw_12_reqt_inter_utils_pkg.obten_type_reqt_inter_code (:p101_mode);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 160692833518722381 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Définir type requête intervention',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P101_MODE',
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
p:=p||'begin'||unistr('\000a')||
'  afw_12_reqt_inter_utils_pkg.trait_reqt_activ_compt_utils (:a_afw_04_actio);'||unistr('\000a')||
''||unistr('\000a')||
'  afw_12_reqt_inter_utils_pkg.defnr_aplic_authe_redrc_cible (:a_afw_04_actio);'||unistr('\000a')||
''||unistr('\000a')||
'  :p101_mode :=                   null;'||unistr('\000a')||
'  :p101_type_reqt_inter_code :=   null;'||unistr('\000a')||
''||unistr('\000a')||
'  afw_08_url_pkg.redrg_page_postn ('||unistr('\000a')||
'    afw_08_url_pkg.genr_url (pva_nom_varbl_1   => ''SAPC'','||unistr('\000a')||
'                             pva_valr_varbl_1  => null));'||unistr('\000a')||
'en';

p:=p||'d;';

wwv_flow_api.create_page_process(
  p_id     => 946524438011003740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 60,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Activer compte utilisateur',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P101_TYPE_REQT_INTER_CODE',
  p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_process_when2=>'ACTIV_COMPT_UTILS',
  p_process_when_type2=>'',
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
p:=p||'afw_12_authe_apex_pkg.defnr_url_creat_utils ('||unistr('\000a')||
'    afw_12_authe_apex_pkg.genr_url ('||unistr('\000a')||
'      pnu_numr_apex_aplic   => afw_11_aplic_pkg.obten_numr_apex_aplic,'||unistr('\000a')||
'      pnu_numr_apex_page    => 102));';

wwv_flow_api.create_page_process(
  p_id     => 825902358576913631 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 70,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Définir page création utilisateur',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'afw_12_authe_apex_pkg.obten_url_creat_utils is null',
  p_process_when_type=>'PLSQL_EXPRESSION',
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
p:=p||':P101_force_domn := ''&SS_FORCE_DOMN.'';'||unistr('\000a')||
':P101_domn := lower(:P101_force_domn);';

wwv_flow_api.create_page_process(
  p_id     => 1037271472699590326 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 80,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Alimenter force_domn',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':P101_force_organ is null',
  p_process_when_type=>'',
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
  p_id     => 1037270273850448715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 90,
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
  p_id     => 1049190583874501542 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 100,
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

 
--application/pages/page_00103
prompt  ...PAGE 103: Mot de passe oublié
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 103
 ,p_user_interface_id => 80454429232834338 + wwv_flow_api.g_id_offset
 ,p_name => 'Mot de passe oublié'
 ,p_step_title => 'Mot de passe oublié'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 605374253082561704 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_browser_cache => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'CARLO'
 ,p_last_upd_yyyymmddhh24miss => '20140220151643'
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
  p_id=> 1011102071386165692 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 103,
  p_plug_name=> 'Saisir les identifiants uniques liés à votre compte',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 605380851048561711+ wwv_flow_api.g_id_offset,
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
  p_id=> 1013691279081056229 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 103,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 605378439884561709+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 1013721658265097484 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 103,
  p_button_sequence=> 10,
  p_button_plug_id => 1013691279081056229+wwv_flow_api.g_id_offset,
  p_button_name    => 'REINT_MOT_PASSE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(605396045843561727+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Envoyer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-envelope-alt',
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
wwv_flow_api.create_page_item(
  p_id=>946102658309869481 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_name=>'P103_CODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1011102071386165692+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Code utilisateur',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
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
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
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
  p_id=>946102936622872704 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_name=>'P103_COURL',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1011102071386165692+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Courriel',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
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
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
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
  p_id=>946182137045655306 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_name=>'P103_DOMN',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1011102071386165692+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Domaine',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 60,
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
  p_display_when=>':P101_FORCE_DOMN is null or :P101_DOMN is null',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
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

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 946382550352870115 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_computation_sequence => 10,
  p_computation_item=> 'P103_DOMN',
  p_computation_point=> 'AFTER_HEADER',
  p_computation_type=> 'ITEM_VALUE',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'P101_domn',
  p_compute_when => 'p103_domn',
  p_compute_when_type=>'ITEM_IS_NULL');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 946182743541676110 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_computation_sequence => 20,
  p_computation_item=> 'P103_DOMN',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'ITEM_VALUE',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'P101_domn',
  p_compute_when => 'p103_domn',
  p_compute_when_type=>'ITEM_IS_NULL');
 
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
'  vnu_numr_apex_aplic    number'||unistr('\000a')||
'    default afw_07_sesn_pkg.obten_valr_sesn (''S_AUTHE_CIBLE_NUMR_APEX_APLIC'');'||unistr('\000a')||
'  vnu_numr_apex_page     number'||unistr('\000a')||
'    default afw_07_sesn_pkg.obten_valr_sesn (''S_AUTHE_CIBLE_NUMR_APEX_PAGE'');'||unistr('\000a')||
''||unistr('\000a')||
'  vnu_prodt_aplic_sesn   number (10)'||unistr('\000a')||
'    default afw_11_aplic_pkg.obten_prodt ('||unistr('\000a')||
'              afw_11_aplic_pkg.obten_aplic_sesn ());'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Contourner l''erreur SEC.00';

p:=p||'0022'||unistr('\000a')||
'  if vnu_numr_apex_aplic is null'||unistr('\000a')||
'     or vnu_numr_apex_page is null then'||unistr('\000a')||
'    vnu_numr_apex_aplic      :='||unistr('\000a')||
'      afw_11_prodt_pkg.obten_numr_apex_aplic_acuei (vnu_prodt_aplic_sesn);'||unistr('\000a')||
'    vnu_numr_apex_page      :='||unistr('\000a')||
'      afw_11_prodt_pkg.obten_numr_apex_page_acuei (vnu_prodt_aplic_sesn);'||unistr('\000a')||
''||unistr('\000a')||
'    afw_07_sesn_pkg.defnr_valr_sesn (''S_AUTHE_CIBLE_NUMR_APEX_APLIC'','||unistr('\000a')||
'                                     vn';

p:=p||'u_numr_apex_aplic);'||unistr('\000a')||
'    afw_07_sesn_pkg.defnr_valr_sesn (''S_AUTHE_CIBLE_NUMR_APEX_PAGE'','||unistr('\000a')||
'                                     vnu_numr_apex_page);'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'  afw_12_reqt_inter_utils_pkg.demnd_reint_mot_passe_oubli ('||unistr('\000a')||
'    :p103_code,'||unistr('\000a')||
'    :p103_courl,'||unistr('\000a')||
'    :p103_domn,'||unistr('\000a')||
'    afw_07_sesn_pkg.obten_valr_sesn (''S_AUTHE_CIBLE_NUMR_APEX_APLIC''),'||unistr('\000a')||
'    afw_07_sesn_pkg.obten_valr_sesn (''S_AUTHE_CIBLE';

p:=p||'_NUMR_APEX_PAGE''));'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 1013858972295139334 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Demande de réinitialisation du mot de passe oublié',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>1013721658265097484 + wwv_flow_api.g_id_offset,
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
  p_id     => 946184846012705233 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM',
  p_process_name=> 'Fermer dialogue',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>1013721658265097484 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 103
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00104
prompt  ...PAGE 104: Code d'utilisateur oublié
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 104
 ,p_user_interface_id => 80454429232834338 + wwv_flow_api.g_id_offset
 ,p_name => 'Code d''utilisateur oublié'
 ,p_step_title => 'Code d''utilisateur oublié'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Code d''utilisateur oublié'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 605374253082561704 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_browser_cache => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'CARLO'
 ,p_last_upd_yyyymmddhh24miss => '20140220151658'
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
  p_id=> 1016838061967722309 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 104,
  p_plug_name=> 'Saisir un identifiant unique lié à votre compte',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 605380851048561711+ wwv_flow_api.g_id_offset,
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
  p_id=> 1016838861043722319 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 104,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 605378439884561709+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 1016839079764722320 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 104,
  p_button_sequence=> 10,
  p_button_plug_id => 1016838861043722319+wwv_flow_api.g_id_offset,
  p_button_name    => 'OBTEN_CODE_UTILS',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(605396045843561727+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Envoyer',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-success',
  p_button_cattributes=>'icon-envelope-alt',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>1016839978693722350 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 104,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>1016839079764722320+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 09-NOV. -2011 13:48 by LGCARRIERBEDARD');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>946439547392272922 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 104,
  p_name=>'P104_DOMN',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 1016838061967722309+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Domaine',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 60,
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
  p_display_when=>':P101_FORCE_DOMN is null or :P101_DOMN is null',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
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
  p_id=>1016838465234722319 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 104,
  p_name=>'P104_COURL',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1016838061967722309+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Courriel',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 200,
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
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
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

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 946440043714281312 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 104,
  p_computation_sequence => 10,
  p_computation_item=> 'P104_DOMN',
  p_computation_point=> 'AFTER_HEADER',
  p_computation_type=> 'ITEM_VALUE',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'P101_domn',
  p_compute_when => 'p104_domn',
  p_compute_when_type=>'ITEM_IS_NULL');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 946440246484282097 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 104,
  p_computation_sequence => 20,
  p_computation_item=> 'P104_DOMN',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'ITEM_VALUE',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'P101_domn',
  p_compute_when => 'p104_domn',
  p_compute_when_type=>'ITEM_IS_NULL');
 
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
'  vnu_numr_apex_aplic    number'||unistr('\000a')||
'    default afw_07_sesn_pkg.obten_valr_sesn (''S_AUTHE_CIBLE_NUMR_APEX_APLIC'');'||unistr('\000a')||
'  vnu_numr_apex_page     number'||unistr('\000a')||
'    default afw_07_sesn_pkg.obten_valr_sesn (''S_AUTHE_CIBLE_NUMR_APEX_PAGE'');'||unistr('\000a')||
''||unistr('\000a')||
'  vnu_prodt_aplic_sesn   number (10)'||unistr('\000a')||
'    default afw_11_aplic_pkg.obten_prodt ('||unistr('\000a')||
'              afw_11_aplic_pkg.obten_aplic_sesn ());'||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- Contourner l''erreur SEC.00';

p:=p||'0022'||unistr('\000a')||
'  if vnu_numr_apex_aplic is null'||unistr('\000a')||
'     or vnu_numr_apex_page is null then'||unistr('\000a')||
'    vnu_numr_apex_aplic      :='||unistr('\000a')||
'      afw_11_prodt_pkg.obten_numr_apex_aplic_acuei (vnu_prodt_aplic_sesn);'||unistr('\000a')||
'    vnu_numr_apex_page      :='||unistr('\000a')||
'      afw_11_prodt_pkg.obten_numr_apex_page_acuei (vnu_prodt_aplic_sesn);'||unistr('\000a')||
''||unistr('\000a')||
'    afw_07_sesn_pkg.defnr_valr_sesn (''S_AUTHE_CIBLE_NUMR_APEX_APLIC'','||unistr('\000a')||
'                                     vn';

p:=p||'u_numr_apex_aplic);'||unistr('\000a')||
'    afw_07_sesn_pkg.defnr_valr_sesn (''S_AUTHE_CIBLE_NUMR_APEX_PAGE'','||unistr('\000a')||
'                                     vnu_numr_apex_page);'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'end;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'  afw_12_reqt_inter_utils_pkg.demnd_code_utils_oubli ('||unistr('\000a')||
'    pva_courl                  => :p104_courl,'||unistr('\000a')||
'    pva_code_domn              => :p104_domn,'||unistr('\000a')||
'    pnu_numr_aplic_apex_cible  => afw_07_sesn_pkg.obten_valr_sesn (''S_AUTHE_CIBLE_N';

p:=p||'UMR_APEX_APLIC''),'||unistr('\000a')||
'    pnu_numr_page_apex_cible   => afw_07_sesn_pkg.obten_valr_sesn (''S_AUTHE_CIBLE_NUMR_APEX_PAGE'')'||unistr('\000a')||
'  );'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 1016839278785722328 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 104,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Obtenir le code utilisateur',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>1016839079764722320 + wwv_flow_api.g_id_offset,
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
  p_id     => 946448651651406607 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 104,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM',
  p_process_name=> 'Fermer dialogue',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>1016839079764722320 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 104
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00105
prompt  ...PAGE 105: Réinitialiser un mot de passe
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 105
 ,p_user_interface_id => 80454429232834338 + wwv_flow_api.g_id_offset
 ,p_name => 'Réinitialiser un mot de passe'
 ,p_step_title => 'Réinitialiser un mot de passe'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Réinitialiser le mot de passe'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 605374253082561704 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'CARLO'
 ,p_last_upd_yyyymmddhh24miss => '20131030003237'
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
  p_id=> 946394442915692449 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 105,
  p_plug_name=> 'Réinitialiser un mot de passe',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 605380851048561711+ wwv_flow_api.g_id_offset,
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
  p_id=> 946395457776692457 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 105,
  p_plug_name=> 'Barre de bouton (nav bar)',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 605378439884561709+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
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
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 946395663096692457 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 105,
  p_button_sequence=> 10,
  p_button_plug_id => 946395457776692457+wwv_flow_api.g_id_offset,
  p_button_name    => 'REINT_MOT_PASSE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(605394231047561726+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Réinitialiser',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_css_classes=>'btn-success',
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
wwv_flow_api.create_page_item(
  p_id=>946398563184725301 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_MOT_PASSE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 946394442915692449+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Mot de passe',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_PASSWORD',
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
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>946398740459728193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 105,
  p_name=>'P105_CONFR_MOT_PASSE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 946394442915692449+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Confirmation',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_PASSWORD',
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
  p_field_template=> 605393124552561724+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'Y',
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
p:=p||'begin'||unistr('\000a')||
'  afw_12_reqt_inter_utils_pkg.trait_reqt_reint_mot_passe (:a_afw_04_actio,'||unistr('\000a')||
'                                                          :p105_mot_passe,'||unistr('\000a')||
'                                                          :p105_confr_mot_passe);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 946398849117730651 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 105,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Réinitialiser le mot de passe',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>946395663096692457 + wwv_flow_api.g_id_offset,
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
  p_id     => 946396244881692465 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 105,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLUGIN_IO_AFW_21_FERMR_DIALG_IFRAM',
  p_process_name=> 'Fermer dialogue',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>946395663096692457 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 105
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/menu
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Menu',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 1046710389511407920 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>5,
  p_list_item_link_text=> 'Pilotage général',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::SIDF::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1049982781424639825 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>5,
  p_list_item_link_text=> 'Domaines de valeurs',
  p_list_item_link_target=> '',
  p_parent_list_item_id=> 1046710389511407920 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1050456978650251572 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>160,
  p_list_item_link_text=> 'Types de domaines de valeurs',
  p_list_item_link_target=> 'f?p=&APP_ID.:14031:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1049982781424639825 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1050456801375248625 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>170,
  p_list_item_link_text=> 'Définition des domaines',
  p_list_item_link_target=> 'f?p=&APP_ID.:14010:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1049982781424639825 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1048223001396882231 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Structure logicielle',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 1046710389511407920 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1047718790857120252 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>130,
  p_list_item_link_text=> 'Liste des pages',
  p_list_item_link_target=> 'f?p=&APP_ID.:12031:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1048223001396882231 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046745903861966442 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>135,
  p_list_item_link_text=> 'Groupes de pages',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1048223001396882231 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046712580690737531 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>55,
  p_list_item_link_text=> 'Sécurité',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1046710389511407920 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046744891609953472 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>85,
  p_list_item_link_text=> 'Utilisateurs',
  p_list_item_link_target=> 'f?p=&APP_ID.:12010:&SESSION.::&DEBUG.:12010:SIDF::',
  p_parent_list_item_id=> 1046712580690737531 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046745100266955936 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>86,
  p_list_item_link_text=> 'Groupes utilisateur',
  p_list_item_link_target=> 'f?p=&APP_ID.:12121:&SESSION.::&DEBUG.:12121:SIDF::',
  p_parent_list_item_id=> 1046712580690737531 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046744686414951909 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>87,
  p_list_item_link_text=> 'Définition accès',
  p_list_item_link_target=> 'f?p=&APP_ID.:13053:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1046712580690737531 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1050051081458393394 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>90,
  p_list_item_link_text=> 'Structures administratives',
  p_list_item_link_target=> 'f?p=&APP_ID.:12141:&SESSION.::&DEBUG.:12141:SIDF::',
  p_parent_list_item_id=> 1046712580690737531 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1050066403808513402 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>91,
  p_list_item_link_text=> 'Types structure',
  p_list_item_link_target=> 'f?p=&APP_ID.:12326:&SESSION.::&DEBUG.:12326:SIDF::',
  p_parent_list_item_id=> 1046712580690737531 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046745491394962813 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>115,
  p_list_item_link_text=> 'Opérations',
  p_list_item_link_target=> 'f?p=&APP_ID.:13032:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1046712580690737531 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046745694510963792 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>125,
  p_list_item_link_text=> 'Groupes opération',
  p_list_item_link_target=> 'f?p=&APP_ID.:13011:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1046712580690737531 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1049305907464778405 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>126,
  p_list_item_link_text=> 'Espaces travail',
  p_list_item_link_target=> 'f?p=&APP_ID.:12101:&SESSION.::&DEBUG.:12101:SIDF::',
  p_parent_list_item_id=> 1046712580690737531 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1049700397442757250 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>130,
  p_list_item_link_text=> 'Structures applicatives',
  p_list_item_link_target=> 'f?p=&APP_ID.:12305:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1046712580690737531 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046704779644475638 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Gestion des messages d''erreur',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::SIDF::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046713087863884095 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>65,
  p_list_item_link_text=> 'Codes d''erreur Oracle',
  p_list_item_link_target=> 'f?p=&APP_ID.:10010:&SESSION.::&DEBUG.:RP:SIDF::',
  p_parent_list_item_id=> 1046704779644475638 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1047569595806791397 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>70,
  p_list_item_link_text=> 'Liaison des messages',
  p_list_item_link_target=> 'f?p=&APP_ID.:1310:&SESSION.::&DEBUG.:RP,1310:SIDF::',
  p_parent_list_item_id=> 1046704779644475638 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1047597905117231905 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>80,
  p_list_item_link_text=> 'Messages',
  p_list_item_link_target=> 'f?p=&APP_ID.:1330:&SESSION.::&DEBUG.:RP,1330:SIDF::',
  p_parent_list_item_id=> 1046704779644475638 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046705177135493892 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>15,
  p_list_item_link_text=> 'Documents',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::SIDF::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046704992111479264 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Journalisation',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::SIDF::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046705387871496967 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>25,
  p_list_item_link_text=> 'Fil d''ariane',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::SIDF::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1047727196812918819 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>145,
  p_list_item_link_text=> 'Contextes de pages par défaut',
  p_list_item_link_target=> 'f?p=&APP_ID.:4011:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1046705387871496967 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046705592373498239 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Formules',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::SIDF::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046705791465507495 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'DBA',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::SIDF::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1050114101414774766 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>160,
  p_list_item_link_text=> 'Simulation en contexte SIE',
  p_list_item_link_target=> 'f?p=&APP_ID.:99999:&SESSION.::&DEBUG.::SIDF::',
  p_parent_list_item_id=> 1046705791465507495 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1046705997352509217 + wwv_flow_api.g_id_offset,
  p_list_id=> 1046704581591466766 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>45,
  p_list_item_link_text=> 'Serveur de rapports',
  p_list_item_link_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::SIDF::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/navigation_messages
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1047478581160954486 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Navigation messages',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/navigation_liaison_message
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1048064887365027469 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Navigation Liaison message',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/navgt_espac_travl
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1049265383560345688 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'navgt_espac_travl',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 1049301880967732864 + wwv_flow_api.g_id_offset,
  p_list_id=> 1049265383560345688 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Groupe utilisateur',
  p_list_item_link_target=> 'f?p=&APP_ID.:12121:&SESSION.::&DEBUG.:12121:SIDF:&SIDF.:',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '12121,12131',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 1049326982604376742 + wwv_flow_api.g_id_offset,
  p_list_id=> 1049265383560345688 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>70,
  p_list_item_link_text=> 'Structures',
  p_list_item_link_target=> 'f?p=&APP_ID.:12141:&SESSION.::&DEBUG.:12141:SIDF:&SIDF.:',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '12141,12151',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/navgt_struc
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1049783377682068114 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'navgt_struc',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/navgt_goup_utils
 
begin
 
wwv_flow_api.create_list (
  p_id=> 1050098986305094994 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'navgt_goup_utils',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 1046703485725297708 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> ' Breadcrumb');
 
null;
 
end;
/

prompt  ...page templates for application: 1000002
--
--application/shared_components/user_interface/templates/page/without_tab
prompt  ......Page template 605372228554561700
 
begin
 
wwv_flow_api.create_template (
  p_id => 605372228554561700 + wwv_flow_api.g_id_offset
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
prompt  ......Page template 605372446799561700
 
begin
 
wwv_flow_api.create_template (
  p_id => 605372446799561700 + wwv_flow_api.g_id_offset
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
prompt  ......Page template 605373028098561701
 
begin
 
wwv_flow_api.create_template (
  p_id => 605373028098561701 + wwv_flow_api.g_id_offset
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
prompt  ......Page template 605374253082561704
 
begin
 
wwv_flow_api.create_template (
  p_id => 605374253082561704 + wwv_flow_api.g_id_offset
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
prompt  ......Page template 605374541140561704
 
begin
 
wwv_flow_api.create_template (
  p_id => 605374541140561704 + wwv_flow_api.g_id_offset
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
prompt  ......Button Template 605394231047561726
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 605394231047561726 + wwv_flow_api.g_id_offset
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
prompt  ......Button Template 605395038322561727
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 605395038322561727 + wwv_flow_api.g_id_offset
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
prompt  ......Button Template 605395831006561727
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 605395831006561727 + wwv_flow_api.g_id_offset
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
prompt  ......Button Template 605396045843561727
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 605396045843561727 + wwv_flow_api.g_id_offset
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
prompt  ......Button Template 605396239076561727
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 605396239076561727 + wwv_flow_api.g_id_offset
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
prompt  ......region template 164602831813237900
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 164602831813237900 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605376045093561707
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605376045093561707 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605376931631561707
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605376931631561707 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605377851060561708
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605377851060561708 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605378439884561709
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605378439884561709 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605380851048561711
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605380851048561711 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605381136478561711
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605381136478561711 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605381433094561711
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605381433094561711 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605383853177561713
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605383853177561713 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605384141262561713
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605384141262561713 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605384440033561713
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605384440033561713 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605384726970561713
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605384726970561713 + wwv_flow_api.g_id_offset
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
prompt  ......region template 605385032722561714
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 605385032722561714 + wwv_flow_api.g_id_offset
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
prompt  ......list template 605391037627561721
 
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
  p_id=>605391037627561721 + wwv_flow_api.g_id_offset,
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
prompt  ......list template 605391644725561722
 
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
  p_id=>605391644725561722 + wwv_flow_api.g_id_offset,
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
prompt  ......report template 605385928912561718
 
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
  p_id=> 605385928912561718 + wwv_flow_api.g_id_offset,
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
  p_id => 605385928912561718 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr class="grid-row highl">',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 605386837488561719
 
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
  p_id=> 605386837488561719 + wwv_flow_api.g_id_offset,
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
  p_id => 605386837488561719 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr class="grid-row highl">',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 605387128465561719
 
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
  p_id=> 605387128465561719 + wwv_flow_api.g_id_offset,
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
  p_id => 605387128465561719 + wwv_flow_api.g_id_offset,
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
prompt  ......label template 605393124552561724
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 605393124552561724 + wwv_flow_api.g_id_offset,
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
prompt  ......label template 605393249466561724
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 605393249466561724 + wwv_flow_api.g_id_offset,
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
prompt  ......label template 605393336501561724
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 605393336501561724 + wwv_flow_api.g_id_offset,
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
prompt  ......label template 605393431236561724
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 605393431236561724 + wwv_flow_api.g_id_offset,
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
prompt  ......label template 605393535096561724
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 605393535096561724 + wwv_flow_api.g_id_offset,
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
prompt  ......template 605396941418561728
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 605396941418561728 + wwv_flow_api.g_id_offset,
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
prompt  ......template 605396627655561728
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 605396627655561728 + wwv_flow_api.g_id_offset,
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
prompt  ......theme 605397127091561729
begin
wwv_flow_api.create_theme (
  p_id =>605397127091561729 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 313,
  p_theme_name=>'AFW - Bootstrap 3.0.0',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>605372228554561700 + wwv_flow_api.g_id_offset,
  p_error_template=>605374541140561704 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>null + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>605373028098561701 + wwv_flow_api.g_id_offset,
  p_default_button_template=>605396239076561727 + wwv_flow_api.g_id_offset,
  p_default_region_template=>605384440033561713 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>null + wwv_flow_api.g_id_offset,
  p_default_form_template  =>605381136478561711 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>605384141262561713 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>605380851048561711 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>605377238784561707 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>null + wwv_flow_api.g_id_offset,
  p_default_listr_template=>605384141262561713 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>605384726970561713 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>605387128465561719 + wwv_flow_api.g_id_offset,
  p_default_label_template=>605393249466561724 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>null + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>605396627655561728 + wwv_flow_api.g_id_offset,
  p_default_list_template=>null + wwv_flow_api.g_id_offset,
  p_default_option_label=>605393336501561724 + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>605393535096561724 + wwv_flow_api.g_id_offset);
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
  p_id =>605397127091561729 + wwv_flow_api.g_id_offset,
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
prompt  ...Language Maps for Application 1000002
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...text messages
--
prompt  ......Message apexir_reports_reports
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rapports';

wwv_flow_api.create_message (
  p_id=>136815028765796371 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REPORTS.REPORTS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_reports_reports
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rapports';

wwv_flow_api.create_message (
  p_id=>148298833182828469 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REPORTS REPORTS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apex_authorization_access_denied_application
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Accès refusé par la sécurité de l''application';

wwv_flow_api.create_message (
  p_id=>150557444684867816 + wwv_flow_api.g_id_offset,
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
  p_id=>150590534531867829 + wwv_flow_api.g_id_offset,
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
  p_id=>150623730376867841 + wwv_flow_api.g_id_offset,
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
 
h:=h||'Atteindre le champ en erreur';

wwv_flow_api.create_message (
  p_id=>150656256794867853 + wwv_flow_api.g_id_offset,
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
  p_id=>150681939319867863 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apex_number_field_value_invalid2
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'#LABEL# ne respecte pas le bon format (Exemple: %1).';

wwv_flow_api.create_message (
  p_id=>150715153006867875 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2',
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
  p_id=>150748353863867888 + wwv_flow_api.g_id_offset,
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
  p_id=>150781545194867900 + wwv_flow_api.g_id_offset,
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
  p_id=>150814827491867912 + wwv_flow_api.g_id_offset,
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
  p_id=>150848055711867925 + wwv_flow_api.g_id_offset,
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
  p_id=>150881231886867937 + wwv_flow_api.g_id_offset,
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
  p_id=>150914453988867949 + wwv_flow_api.g_id_offset,
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
 
h:=h||'Moyenne';

wwv_flow_api.create_message (
  p_id=>150941449832867961 + wwv_flow_api.g_id_offset,
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
  p_id=>150972550437867974 + wwv_flow_api.g_id_offset,
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
  p_id=>151005729569867986 + wwv_flow_api.g_id_offset,
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
  p_id=>151038947204867999 + wwv_flow_api.g_id_offset,
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
  p_id=>151072137758868021 + wwv_flow_api.g_id_offset,
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
  p_id=>151105351438868033 + wwv_flow_api.g_id_offset,
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
  p_id=>151138654192868045 + wwv_flow_api.g_id_offset,
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
  p_id=>151168249226868056 + wwv_flow_api.g_id_offset,
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
  p_id=>151196751763868067 + wwv_flow_api.g_id_offset,
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
  p_id=>151229947825868079 + wwv_flow_api.g_id_offset,
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
  p_id=>151263238109868092 + wwv_flow_api.g_id_offset,
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
  p_id=>151296428444868104 + wwv_flow_api.g_id_offset,
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
  p_id=>151329636903868116 + wwv_flow_api.g_id_offset,
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
  p_id=>151362842209868128 + wwv_flow_api.g_id_offset,
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
  p_id=>151396039120868141 + wwv_flow_api.g_id_offset,
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
  p_id=>151428654406868153 + wwv_flow_api.g_id_offset,
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
  p_id=>151454348821868163 + wwv_flow_api.g_id_offset,
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
  p_id=>151487535481868175 + wwv_flow_api.g_id_offset,
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
  p_id=>151520739571868187 + wwv_flow_api.g_id_offset,
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
  p_id=>151553944276868199 + wwv_flow_api.g_id_offset,
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
  p_id=>151587254725868212 + wwv_flow_api.g_id_offset,
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
  p_id=>151620453825868225 + wwv_flow_api.g_id_offset,
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
  p_id=>151653649233868238 + wwv_flow_api.g_id_offset,
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
  p_id=>151686835994868250 + wwv_flow_api.g_id_offset,
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
  p_id=>151712931911868260 + wwv_flow_api.g_id_offset,
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
  p_id=>151744944653868272 + wwv_flow_api.g_id_offset,
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
  p_id=>151778128695868285 + wwv_flow_api.g_id_offset,
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
  p_id=>151811335718868297 + wwv_flow_api.g_id_offset,
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
  p_id=>151844541180868309 + wwv_flow_api.g_id_offset,
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
  p_id=>151877757221868321 + wwv_flow_api.g_id_offset,
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
  p_id=>151910928996868334 + wwv_flow_api.g_id_offset,
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
  p_id=>151944153392868346 + wwv_flow_api.g_id_offset,
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
  p_id=>151972956310868357 + wwv_flow_api.g_id_offset,
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
  p_id=>152002339492868368 + wwv_flow_api.g_id_offset,
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
  p_id=>152035532506868381 + wwv_flow_api.g_id_offset,
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
  p_id=>152068749465868393 + wwv_flow_api.g_id_offset,
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
  p_id=>152101945852868405 + wwv_flow_api.g_id_offset,
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
  p_id=>152135144605868418 + wwv_flow_api.g_id_offset,
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
  p_id=>152168346956868430 + wwv_flow_api.g_id_offset,
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
  p_id=>152201526530868442 + wwv_flow_api.g_id_offset,
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
  p_id=>152232842188868454 + wwv_flow_api.g_id_offset,
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
  p_id=>152259629294868465 + wwv_flow_api.g_id_offset,
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
  p_id=>152292848583868477 + wwv_flow_api.g_id_offset,
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
  p_id=>152326149730868490 + wwv_flow_api.g_id_offset,
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
  p_id=>152359341161868502 + wwv_flow_api.g_id_offset,
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
  p_id=>152392558062868514 + wwv_flow_api.g_id_offset,
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
  p_id=>152425742879868527 + wwv_flow_api.g_id_offset,
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
  p_id=>152458929056868539 + wwv_flow_api.g_id_offset,
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
  p_id=>152492238555868551 + wwv_flow_api.g_id_offset,
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
  p_id=>152517538476868561 + wwv_flow_api.g_id_offset,
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
  p_id=>152550328219868573 + wwv_flow_api.g_id_offset,
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
  p_id=>152583545446868586 + wwv_flow_api.g_id_offset,
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
  p_id=>152616754084868598 + wwv_flow_api.g_id_offset,
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
  p_id=>152650048861868610 + wwv_flow_api.g_id_offset,
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
  p_id=>152683227152868623 + wwv_flow_api.g_id_offset,
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
  p_id=>152716432738868635 + wwv_flow_api.g_id_offset,
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
  p_id=>152749651380868647 + wwv_flow_api.g_id_offset,
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
  p_id=>152777730969868658 + wwv_flow_api.g_id_offset,
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
  p_id=>152807755908868669 + wwv_flow_api.g_id_offset,
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
  p_id=>152840957119868682 + wwv_flow_api.g_id_offset,
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
  p_id=>152874133458868694 + wwv_flow_api.g_id_offset,
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
  p_id=>152907357927868706 + wwv_flow_api.g_id_offset,
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
  p_id=>152940650191868718 + wwv_flow_api.g_id_offset,
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
  p_id=>152973836119868731 + wwv_flow_api.g_id_offset,
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
  p_id=>153007034111868743 + wwv_flow_api.g_id_offset,
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
  p_id=>153037953769868754 + wwv_flow_api.g_id_offset,
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
  p_id=>153065145682868765 + wwv_flow_api.g_id_offset,
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
  p_id=>153098443233868783 + wwv_flow_api.g_id_offset,
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
  p_id=>153131657671868796 + wwv_flow_api.g_id_offset,
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
  p_id=>153164825354868809 + wwv_flow_api.g_id_offset,
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
  p_id=>153198029798868821 + wwv_flow_api.g_id_offset,
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
  p_id=>153231247179868842 + wwv_flow_api.g_id_offset,
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
  p_id=>153263146096868853 + wwv_flow_api.g_id_offset,
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
  p_id=>153289449029868864 + wwv_flow_api.g_id_offset,
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
  p_id=>153322647151868876 + wwv_flow_api.g_id_offset,
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
  p_id=>153355855437868888 + wwv_flow_api.g_id_offset,
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
  p_id=>153389131478868901 + wwv_flow_api.g_id_offset,
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
  p_id=>153422338211868913 + wwv_flow_api.g_id_offset,
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
  p_id=>153455550117868925 + wwv_flow_api.g_id_offset,
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
  p_id=>153488733225868938 + wwv_flow_api.g_id_offset,
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
  p_id=>153521941458868950 + wwv_flow_api.g_id_offset,
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
  p_id=>153548138762868960 + wwv_flow_api.g_id_offset,
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
  p_id=>153580154463868972 + wwv_flow_api.g_id_offset,
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
  p_id=>153613349213868984 + wwv_flow_api.g_id_offset,
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
  p_id=>153646548596868997 + wwv_flow_api.g_id_offset,
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
  p_id=>153679742964869009 + wwv_flow_api.g_id_offset,
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
  p_id=>153713030959869021 + wwv_flow_api.g_id_offset,
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
  p_id=>153746250613869034 + wwv_flow_api.g_id_offset,
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
  p_id=>153779457854869046 + wwv_flow_api.g_id_offset,
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
  p_id=>153808425934869057 + wwv_flow_api.g_id_offset,
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
  p_id=>153837551632869068 + wwv_flow_api.g_id_offset,
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
  p_id=>153870758062869080 + wwv_flow_api.g_id_offset,
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
  p_id=>153903945037869093 + wwv_flow_api.g_id_offset,
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
  p_id=>153937134491869105 + wwv_flow_api.g_id_offset,
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
  p_id=>153970450044869118 + wwv_flow_api.g_id_offset,
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
  p_id=>154003656278869130 + wwv_flow_api.g_id_offset,
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
  p_id=>154036852346869142 + wwv_flow_api.g_id_offset,
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
  p_id=>154068249903869154 + wwv_flow_api.g_id_offset,
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
  p_id=>154094939263869164 + wwv_flow_api.g_id_offset,
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
  p_id=>154128138838869177 + wwv_flow_api.g_id_offset,
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
  p_id=>154161354306869189 + wwv_flow_api.g_id_offset,
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
  p_id=>154194549574869201 + wwv_flow_api.g_id_offset,
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
  p_id=>154227729470869214 + wwv_flow_api.g_id_offset,
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
  p_id=>154260935223869226 + wwv_flow_api.g_id_offset,
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
  p_id=>154294157826869239 + wwv_flow_api.g_id_offset,
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
  p_id=>154327338244869251 + wwv_flow_api.g_id_offset,
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
  p_id=>154352646272869261 + wwv_flow_api.g_id_offset,
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
  p_id=>154385426345869273 + wwv_flow_api.g_id_offset,
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
  p_id=>154418631780869286 + wwv_flow_api.g_id_offset,
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
  p_id=>154451847343869298 + wwv_flow_api.g_id_offset,
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
  p_id=>154485029023869310 + wwv_flow_api.g_id_offset,
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
  p_id=>154518228343869323 + wwv_flow_api.g_id_offset,
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
  p_id=>154551455114869335 + wwv_flow_api.g_id_offset,
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
  p_id=>154584630369869347 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_INVALID_COMPUTATION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_is_in_the_last
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 dans le dernier %1';

wwv_flow_api.create_message (
  p_id=>154612547399869358 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_IS_IN_THE_LAST',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_is_in_the_next
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 dans le prochain %1';

wwv_flow_api.create_message (
  p_id=>154642730361869369 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_IS_IN_THE_NEXT',
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
  p_id=>154676040880869382 + wwv_flow_api.g_id_offset,
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
  p_id=>154709225463869394 + wwv_flow_api.g_id_offset,
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
  p_id=>154742450500869407 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LABEL_AXIS_TITLE',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_last_day
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Jour dernier';

wwv_flow_api.create_message (
  p_id=>154775628369869420 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LAST_DAY',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_last_hour
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Heure dernière';

wwv_flow_api.create_message (
  p_id=>154808935724869432 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LAST_HOUR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_last_month
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Mois dernier';

wwv_flow_api.create_message (
  p_id=>154842154015869445 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LAST_MONTH',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_last_week
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Semaine dernière';

wwv_flow_api.create_message (
  p_id=>154871751152869456 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LAST_WEEK',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_last_x_days
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 derniers jours';

wwv_flow_api.create_message (
  p_id=>154900229913869467 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LAST_X_DAYS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_last_x_hours
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 dernières heures';

wwv_flow_api.create_message (
  p_id=>154933429326869480 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LAST_X_HOURS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_last_x_months
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 derniers mois';

wwv_flow_api.create_message (
  p_id=>154966726950869492 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LAST_X_MONTHS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_last_x_weeks
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 dernières semaines';

wwv_flow_api.create_message (
  p_id=>154999955365869505 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LAST_X_WEEKS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_last_x_years
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 dernières années';

wwv_flow_api.create_message (
  p_id=>155033155080869517 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LAST_X_YEARS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_last_year
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Année dernière';

wwv_flow_api.create_message (
  p_id=>155066332356869529 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_LAST_YEAR',
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
  p_id=>155099535614869542 + wwv_flow_api.g_id_offset,
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
  p_id=>155131042870869554 + wwv_flow_api.g_id_offset,
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
  p_id=>155157837671869564 + wwv_flow_api.g_id_offset,
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
  p_id=>155191050633869577 + wwv_flow_api.g_id_offset,
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
  p_id=>155223938575869720 + wwv_flow_api.g_id_offset,
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
  p_id=>155249128247869731 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEW_COMPUTATION',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_next_day
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Jour prochain';

wwv_flow_api.create_message (
  p_id=>155282349032869744 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEXT_DAY',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_next_hour
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Heure prochaine';

wwv_flow_api.create_message (
  p_id=>155312629666869755 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEXT_HOUR',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_next_month
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Mois prochain';

wwv_flow_api.create_message (
  p_id=>155340426268869766 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEXT_MONTH',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_next_week
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Semaine prochaine';

wwv_flow_api.create_message (
  p_id=>155373642038869796 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEXT_WEEK',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_next_x_days
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 prochains jours';

wwv_flow_api.create_message (
  p_id=>155406852048869808 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEXT_X_DAYS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_next_x_hours
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 prochaines heures';

wwv_flow_api.create_message (
  p_id=>155440149343869820 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEXT_X_HOURS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_next_x_months
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 prochains mois';

wwv_flow_api.create_message (
  p_id=>155473345823869833 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEXT_X_MONTHS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_next_x_weeks
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 prochaines semaines';

wwv_flow_api.create_message (
  p_id=>155506530867869845 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEXT_X_WEEKS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_next_x_years
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 prochaines années';

wwv_flow_api.create_message (
  p_id=>155535956790869856 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEXT_X_YEARS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_next_year
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Année prochaine';

wwv_flow_api.create_message (
  p_id=>155564732003869867 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_NEXT_YEAR',
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
  p_id=>155597957880869879 + wwv_flow_api.g_id_offset,
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
  p_id=>155631150044869892 + wwv_flow_api.g_id_offset,
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
  p_id=>155664344998869904 + wwv_flow_api.g_id_offset,
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
  p_id=>155697528070869916 + wwv_flow_api.g_id_offset,
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
  p_id=>155730738170869929 + wwv_flow_api.g_id_offset,
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
  p_id=>155763934273869941 + wwv_flow_api.g_id_offset,
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
  p_id=>155796137519869953 + wwv_flow_api.g_id_offset,
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
  p_id=>155822038563869963 + wwv_flow_api.g_id_offset,
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
  p_id=>155855254417869975 + wwv_flow_api.g_id_offset,
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
  p_id=>155888554463869988 + wwv_flow_api.g_id_offset,
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
  p_id=>155921737964870001 + wwv_flow_api.g_id_offset,
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
  p_id=>155954939598870013 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_OTHER',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_primary_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Vue principale';

wwv_flow_api.create_message (
  p_id=>155988155215870026 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_PRIMARY_REPORT',
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
  p_id=>156021449231870038 + wwv_flow_api.g_id_offset,
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
  p_id=>156054642260870050 + wwv_flow_api.g_id_offset,
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
  p_id=>156080436310870060 + wwv_flow_api.g_id_offset,
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
  p_id=>156112736559870072 + wwv_flow_api.g_id_offset,
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
  p_id=>156145948440870085 + wwv_flow_api.g_id_offset,
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
  p_id=>156179227635870097 + wwv_flow_api.g_id_offset,
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
  p_id=>156212447750870110 + wwv_flow_api.g_id_offset,
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
  p_id=>156245644475870122 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REMOVE_HIGHLIGHT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_reports
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rapports';

wwv_flow_api.create_message (
  p_id=>156278835241870134 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_REPORTS',
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
  p_id=>156312043299870147 + wwv_flow_api.g_id_offset,
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
  p_id=>156340326777870158 + wwv_flow_api.g_id_offset,
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
  p_id=>156370251593870169 + wwv_flow_api.g_id_offset,
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
  p_id=>156403442557870181 + wwv_flow_api.g_id_offset,
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
  p_id=>156436631258870194 + wwv_flow_api.g_id_offset,
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
  p_id=>156469850929870206 + wwv_flow_api.g_id_offset,
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
  p_id=>156503149607870218 + wwv_flow_api.g_id_offset,
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
  p_id=>156536346792870231 + wwv_flow_api.g_id_offset,
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
  p_id=>156569543886870243 + wwv_flow_api.g_id_offset,
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
  p_id=>156600036713870255 + wwv_flow_api.g_id_offset,
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
  p_id=>156627654621870265 + wwv_flow_api.g_id_offset,
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
  p_id=>156660846341870278 + wwv_flow_api.g_id_offset,
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
  p_id=>156694029754870290 + wwv_flow_api.g_id_offset,
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
  p_id=>156727251116870303 + wwv_flow_api.g_id_offset,
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
  p_id=>156760432178870316 + wwv_flow_api.g_id_offset,
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
  p_id=>156793733920870328 + wwv_flow_api.g_id_offset,
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
  p_id=>156826932503870341 + wwv_flow_api.g_id_offset,
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
  p_id=>156859052881870353 + wwv_flow_api.g_id_offset,
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
  p_id=>156885053478870363 + wwv_flow_api.g_id_offset,
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
  p_id=>156918242716870375 + wwv_flow_api.g_id_offset,
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
  p_id=>156951557607870388 + wwv_flow_api.g_id_offset,
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
  p_id=>156984755315870400 + wwv_flow_api.g_id_offset,
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
  p_id=>157017950996870412 + wwv_flow_api.g_id_offset,
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
  p_id=>157051132396870425 + wwv_flow_api.g_id_offset,
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
  p_id=>157084425356870437 + wwv_flow_api.g_id_offset,
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
  p_id=>157117637593870449 + wwv_flow_api.g_id_offset,
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
  p_id=>157144025417870459 + wwv_flow_api.g_id_offset,
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
  p_id=>157175732368870471 + wwv_flow_api.g_id_offset,
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
  p_id=>157208948901870484 + wwv_flow_api.g_id_offset,
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
  p_id=>157242249827870496 + wwv_flow_api.g_id_offset,
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
  p_id=>157275451771870508 + wwv_flow_api.g_id_offset,
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
  p_id=>157308644987870521 + wwv_flow_api.g_id_offset,
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
  p_id=>157341827877870533 + wwv_flow_api.g_id_offset,
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
  p_id=>157375053168870545 + wwv_flow_api.g_id_offset,
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
  p_id=>157403946982870658 + wwv_flow_api.g_id_offset,
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
  p_id=>157433350109870670 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_WORKING_REPORT',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_x_days
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 jours';

wwv_flow_api.create_message (
  p_id=>157466534652870683 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_X_DAYS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_x_hours
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 heures';

wwv_flow_api.create_message (
  p_id=>157499737560870695 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_X_HOURS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_x_mins
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 minutes';

wwv_flow_api.create_message (
  p_id=>157532951019870718 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_X_MINS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_x_months
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 mois';

wwv_flow_api.create_message (
  p_id=>157566233412870730 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_X_MONTHS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_x_weeks
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 semaines';

wwv_flow_api.create_message (
  p_id=>157599457704870743 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_X_WEEKS',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apexir_x_years
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 années';

wwv_flow_api.create_message (
  p_id=>157630254714870755 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_X_YEARS',
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
  p_id=>157657649740870765 + wwv_flow_api.g_id_offset,
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
  p_id=>157690844306870777 + wwv_flow_api.g_id_offset,
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
  p_id=>157724129705870790 + wwv_flow_api.g_id_offset,
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
  p_id=>157757353603870802 + wwv_flow_api.g_id_offset,
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
  p_id=>157790544504870815 + wwv_flow_api.g_id_offset,
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
  p_id=>157823733898870827 + wwv_flow_api.g_id_offset,
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
  p_id=>157856949363870839 + wwv_flow_api.g_id_offset,
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
  p_id=>157890147510870852 + wwv_flow_api.g_id_offset,
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
  p_id=>157915038957870861 + wwv_flow_api.g_id_offset,
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
  p_id=>157948228835870874 + wwv_flow_api.g_id_offset,
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
  p_id=>157981440631870886 + wwv_flow_api.g_id_offset,
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
  p_id=>158014656376870898 + wwv_flow_api.g_id_offset,
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
  p_id=>158047843205870911 + wwv_flow_api.g_id_offset,
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
  p_id=>158081035754870923 + wwv_flow_api.g_id_offset,
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
  p_id=>158114254792870936 + wwv_flow_api.g_id_offset,
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
  p_id=>158147554816870948 + wwv_flow_api.g_id_offset,
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
  p_id=>158174844274870959 + wwv_flow_api.g_id_offset,
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
  p_id=>158205750829870971 + wwv_flow_api.g_id_offset,
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
  p_id=>158238927537870983 + wwv_flow_api.g_id_offset,
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
  p_id=>158272130698870995 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'RESET',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message row
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangée %0';

wwv_flow_api.create_message (
  p_id=>158305326116871008 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'ROW',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message saved_reports_primary_report
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Vue principale';

wwv_flow_api.create_message (
  p_id=>158338557652871020 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'SAVED_REPORTS.PRIMARY_REPORT',
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
  p_id=>158371739624871032 + wwv_flow_api.g_id_offset,
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
  p_id=>158404943616871045 + wwv_flow_api.g_id_offset,
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
  p_id=>158434339337871056 + wwv_flow_api.g_id_offset,
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
  p_id=>158463055061871067 + wwv_flow_api.g_id_offset,
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
  p_id=>158496242762871080 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message wwv_render_report_row
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangée';

wwv_flow_api.create_message (
  p_id=>565909134185958241 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT.ROW',
  p_message_language=>'fr-ca',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message wwv_render_report2_row
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Rangée';

wwv_flow_api.create_message (
  p_id=>565933941021961519 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'WWV_RENDER_REPORT2.ROW',
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
  p_id=>1038422573184455438 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEXIR_HELP_DOWNLOAD',
  p_message_language=>'fr_ca',
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
  p_id=>1054229097721129563 + wwv_flow_api.g_id_offset,
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
  p_id=>1054229486518129565 + wwv_flow_api.g_id_offset,
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
 p_id=> 83877047150521541 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'AFW_13_LISTE_NAVGT',
 p_shortcut_type=> 'FUNCTION_BODY',
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
c1:=c1||'Would you like to perform this delete action?';

wwv_flow_api.create_shortcut (
 p_id=> 1046715999751152869 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
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
prompt  ......authentication 1231061370856744225
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 1231061370856744225 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'AFW - 21 - Authentification utilisateur (12)'
 ,p_scheme_type => 'PLUGIN_IO_AFW_21_AUTHE_12_UTILS'
 ,p_invalid_session_type => 'URL'
 ,p_invalid_session_url => 'f?p=&APP_ID.:101'
 ,p_logout_url => 'f?p=&APP_ID.:101'
 ,p_cookie_name => 'AFW'
 ,p_use_secure_cookie_yn => 'N'
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
  p_id => 43843547355496158 + wwv_flow_api.g_id_offset
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
  p_id => 43855523952175491 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43843547355496158 + wwv_flow_api.g_id_offset
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
  p_id => 43857345290180816 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43843547355496158 + wwv_flow_api.g_id_offset
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
  p_id => 43858040114183182 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43843547355496158 + wwv_flow_api.g_id_offset
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
  p_id => 43858635585185288 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 43843547355496158 + wwv_flow_api.g_id_offset
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
  p_id => 45343424172807401 + wwv_flow_api.g_id_offset
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
  p_id => 45919334855768777 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343424172807401 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Classe CSS (Voir favoris)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45919726639768777 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343424172807401 + wwv_flow_api.g_id_offset
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
  p_id => 45920132908768777 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343424172807401 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Classe CSS (Voir tous)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45920544690768778 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343424172807401 + wwv_flow_api.g_id_offset
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
  p_id => 45920931002768778 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343424172807401 + wwv_flow_api.g_id_offset
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
  p_id => 45921330160768778 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343424172807401 + wwv_flow_api.g_id_offset
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
  p_id => 45921746591768779 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343424172807401 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Item contenant filtre'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_default_value => 'PX_FILTR_FAVRT'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 45921330160768778 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 45922151131768779 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343424172807401 + wwv_flow_api.g_id_offset
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
 ,p_depending_on_attribute_id => 45921330160768778 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
 ,p_help_text => 'Replace:'||unistr('\000a')||
' [PARENT_ALIAS] by alias used in parent SQL;'||unistr('\000a')||
' [SEQNC] by primary key stocked in apexframework favorite table. (Concept seqnc)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 45923838831768781 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 45343424172807401 + wwv_flow_api.g_id_offset
 ,p_name => 'favr_togl'
 ,p_display_name => 'after Toggle'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/io_afw_21_favr
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 67343550557296432 + wwv_flow_api.g_id_offset
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
  p_id => 67343842578300085 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 67343550557296432 + wwv_flow_api.g_id_offset
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
  p_id => 67344159818307316 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 67343550557296432 + wwv_flow_api.g_id_offset
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
  p_id => 81196813612244317 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/item_type/io_afw_21_selct_2
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 206244993353558318 + wwv_flow_api.g_id_offset
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
  p_id => 51372804683590083 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
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
  p_id => 206248205343659133 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
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
  p_id => 206248498442662331 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206248205343659133 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Single-value'
 ,p_return_value => 'SINGL_VALUE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206248895854663544 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206248205343659133 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Mutliple-value'
 ,p_return_value => 'MULTP_VALUE'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206347419303475243 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Allow clear'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206248205343659133 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'SINGL_VALUE'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206325820586245668 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
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
  p_id => 206326198588255840 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Minimum number of results'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '10'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206325820586245668 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'N'
 ,p_help_text => 'The minimum number of results that must be initially (after opening the dropdown for the first time) populated in order to keep the search field. This is useful for cases where local data is used with just a few results, in which case the search box is not very useful and wastes screen space.'||unistr('\000a')||
''||unistr('\000a')||
'The option can be set to a negative value to permanently hide the search field.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206334192030896927 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
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
  p_id => 206326807202267081 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Maximum number of items that can be selected'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '0'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206248205343659133 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'MULTP_VALUE'
 ,p_help_text => 'The maximum number of items that can be selected in a multi-select control. If this number is less than 1 selection is not limited.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206327702877284267 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Number of characters necessary to start a search'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206328000289285466 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Maximum number of characters that can be entered for an input.'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206328321195290962 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
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
  p_id => 206334792220927213 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 35
 ,p_prompt => 'Search type'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'LIKE_IGNORE'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 206325820586245668 + wwv_flow_api.g_id_offset
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
  p_id => 206335115284931792 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206334792220927213 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Contains case'
 ,p_return_value => 'CONTAINS_CASE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206335610108934193 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206334792220927213 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Contains ignore'
 ,p_return_value => 'CONTAINS_IGNORE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206336007951935143 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206334792220927213 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Exact case'
 ,p_return_value => 'EXACT_CASE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206336405795936163 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206334792220927213 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'Exact ignore'
 ,p_return_value => 'EXACT_IGNORE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206337003638937181 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206334792220927213 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'Like case'
 ,p_return_value => 'LIKE_CASE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206337401050938318 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206334792220927213 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 60
 ,p_display_value => 'Like ignore'
 ,p_return_value => 'LIKE_IGNORE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 206337898247939627 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 206334792220927213 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 70
 ,p_display_value => 'Lookup'
 ,p_return_value => 'LOOKUP'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 206353522573229465 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
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
  p_id => 35903631330618370 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
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
  p_id => 36602737542968712 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
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
  p_id => 36592348259237163 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
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
  p_id => 36592846103238236 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 36592348259237163 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Display column (1)'
 ,p_return_value => '1'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 36593242652239815 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 36592348259237163 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Custom search column (6)'
 ,p_return_value => '6'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206253420803693036 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_blur'
 ,p_display_name => 'blur'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206250596763693034 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_close'
 ,p_display_name => 'close'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206253019059693036 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_focus'
 ,p_display_name => 'focus'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206251011517693035 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_highlight'
 ,p_display_name => 'highlight'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206252622476693036 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_loaded'
 ,p_display_name => 'loaded'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206250210895693034 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_open'
 ,p_display_name => 'open'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206249897770693033 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_opening'
 ,p_display_name => 'opening'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206252221474693035 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_removed'
 ,p_display_name => 'removed'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206251817737693035 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_removing'
 ,p_display_name => 'removing'
  );
wwv_flow_api.create_plugin_event (
  p_id => 206251399907693035 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 206244993353558318 + wwv_flow_api.g_id_offset
 ,p_name => 'selct2_selecting'
 ,p_display_name => 'selecting'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_initl_comps
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 240516667222690555 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_aide_page
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 597791047410604903 + wwv_flow_api.g_id_offset
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
  p_id => 597791349534633943 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 597791047410604903 + wwv_flow_api.g_id_offset
 ,p_name => 'afw_21_actio_dynmq_aide_page_afich'
 ,p_display_name => 'Afficher'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_fil_arian
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 862558474599932067 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_FIL_ARIAN'
 ,p_display_name => 'AFW - 21 - Fil d''ariane'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_afw_04_fil_arian'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 870384968245176286 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 862558474599932067 + wwv_flow_api.g_id_offset
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
  p_id => 870389471708177284 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 870384968245176286 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'ui-icon-arrowthick-1-e'
 ,p_return_value => 'ui-icon-arrowthick-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 870393780366179702 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 870384968245176286 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'ui-icon-arrow-1-e'
 ,p_return_value => 'ui-icon-arrow-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 870398085907181344 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 870384968245176286 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'ui-icon-carat-1-e'
 ,p_return_value => 'ui-icon-carat-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 870402357641182644 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 870384968245176286 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'ui-icon-triangle-1-e'
 ,p_return_value => 'ui-icon-triangle-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 870406676341188049 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 870384968245176286 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'ui-icon-circle-arrow-e'
 ,p_return_value => 'ui-icon-circle-arrow-e'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 870672180384331191 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 862558474599932067 + wwv_flow_api.g_id_offset
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
  p_id => 872449955158828352 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 862558474599932067 + wwv_flow_api.g_id_offset
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
  p_id => 872454457582829030 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 872449955158828352 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Classique'
 ,p_return_value => 'CLASQ'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 872458759314829505 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 872449955158828352 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Avancé'
 ,p_return_value => 'AVANC'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 884062078788777287 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 862558474599932067 + wwv_flow_api.g_id_offset
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
  p_id => 884134376382927999 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 862558474599932067 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Inclure le contexte'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 884062078788777287 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_pile_mesg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 865968083156214032 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/region_type/io_afw_21_regn_menu
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 947014689524718817 + wwv_flow_api.g_id_offset
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
  p_id => 595954449612540252 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 947014689524718817 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/process_type/io_afw_21_chang_libl_fil_ari
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 957805445026277136 + wwv_flow_api.g_id_offset
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
  p_id => 957805659917281472 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 957805445026277136 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_confr_sauvg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 958929276959348466 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 12705321354722791
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946224537727629931 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 958929276959348466 + wwv_flow_api.g_id_offset
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
  p_id => 958955081124071716 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 12729228158437414
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
  p_id => 958963188975916193 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_GESTN_TABLR_FORM'
 ,p_display_name => 'AFW - 21 - Gestion Tabular Form'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_plugn_gestn_tablr_form'
 ,p_substitute_attributes => true
 ,p_reference_id => 12731731377271072
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
  p_id => 958974197024899570 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_NAVGT_TABLR_FORM'
 ,p_display_name => 'AFW - 21 - Navigation Tabular Form'
 ,p_category => 'INIT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_plugn_navgt_tablr_form'
 ,p_substitute_attributes => true
 ,p_reference_id => 12731038340225761
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
  p_id => 959821868737650019 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 13559821780951210
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946263052497700455 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959821868737650019 + wwv_flow_api.g_id_offset
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
  p_id => 946263437957700455 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959821868737650019 + wwv_flow_api.g_id_offset
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
  p_id => 946263846276700456 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959821868737650019 + wwv_flow_api.g_id_offset
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
  p_id => 946264243132700456 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959821868737650019 + wwv_flow_api.g_id_offset
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
  p_id => 946264645794700456 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959821868737650019 + wwv_flow_api.g_id_offset
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
  p_id => 959983775192699399 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 13632025718943069
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 956548431058796459 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
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
  p_id => 956548849336796460 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Selecteur jQuery identifiant éléments externes (droppable)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 956549260688796460 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Selecteur jQuery identifiant éléments externes (draggable)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 956549647774796460 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Item qui reçoit l''id de l''élément glissé'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 956550036051796461 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Item qui contient le code de l''arbre'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 956551333940796463 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_name => 'close_node.jstree'
 ,p_display_name => 'Fermer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 956551732311796463 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_name => 'create_node.jstree'
 ,p_display_name => 'Ajouter un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 956552162601796463 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_name => 'delete_node.jstree'
 ,p_display_name => 'Supprimer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 956552553971796463 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_name => 'move_node.jstree'
 ,p_display_name => 'Déplacer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 956552937868796463 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_name => 'open_node.jstree'
 ,p_display_name => 'Ouvrir un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 956553339219796464 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_name => 'rename_node.jstree'
 ,p_display_name => 'Renommer un noeud'
  );
wwv_flow_api.create_plugin_event (
  p_id => 956553759709796464 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 959983775192699399 + wwv_flow_api.g_id_offset
 ,p_name => 'select_node.jstree'
 ,p_display_name => 'Sélectionner un noeud'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_afich_prodt_autor
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 960653474015210395 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 14433323735595743
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
  p_id => 961376503930720368 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'IO_AFW_21_PAGE_ITEM_MASQ'
 ,p_display_name => 'AFW - 21 - Masque pour la saisie'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_item_pkg.genr_plugn_item_masq'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:READONLY:ESCAPE_OUTPUT:SOURCE:ELEMENT:WIDTH'
 ,p_substitute_attributes => true
 ,p_reference_id => 15096558228012395
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946281456091710922 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 961376503930720368 + wwv_flow_api.g_id_offset
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
  p_id => 946281848081710922 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946281456091710922 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 5
 ,p_display_value => 'Personnalisé'
 ,p_return_value => 'PERSN'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946282338843710922 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946281456091710922 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Téléphone'
 ,p_return_value => '999-999-9999'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946282853074710923 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946281456091710922 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Code postal (Canada)'
 ,p_return_value => 'a9a 9a9'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946283341091710923 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946281456091710922 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Permis de conduire'
 ,p_return_value => 'a9999-999999-99'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946283849383710923 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 961376503930720368 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Masque personnalisé'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 60
 ,p_max_length => 200
 ,p_is_translatable => true
 ,p_depending_on_attribute_id => 946281456091710922 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'PERSN'
 ,p_help_text => 'a - Représente un caractère alphabétique (A-Z, a-z)'||unistr('\000a')||
'9 - Représente un caractère numérique (0-9)'||unistr('\000a')||
'* - Représente un caractère alphanumérique (AZ, az ,0-9)'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946284261986710924 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 961376503930720368 + wwv_flow_api.g_id_offset
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
  p_id => 963973068574917765 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_BARRE_RECHR_IR'
 ,p_display_name => 'AFW - 21 - Barre recherche IR'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_plugn_regn_barre_rechr_ir'
 ,p_substitute_attributes => true
 ,p_reference_id => 17616612868159590
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
  p_id => 964273169369115209 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_ACORD'
 ,p_display_name => 'AFW - 21 - Accordion'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_plugn_regn_acord'
 ,p_substitute_attributes => true
 ,p_reference_id => 17924334094362981
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946349537352752843 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 964273169369115209 + wwv_flow_api.g_id_offset
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
  p_id => 946349956022752843 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 964273169369115209 + wwv_flow_api.g_id_offset
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
  p_id => 964364370392701536 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_CONFR_SAUVG_REINTL'
 ,p_display_name => 'AFW - 21 - Confirmer la sauvegarde (Réinitilisation)'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_plugn_confr_sauvg_reint'
 ,p_substitute_attributes => true
 ,p_reference_id => 18139226777069932
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
  p_id => 965791987164969041 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 19568739525345702
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
  p_id => 985357142557848868 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_AFICH_MESG'
 ,p_display_name => 'AFW - 21 - Afficher message'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_afw_01_afich_mesg'
 ,p_substitute_attributes => true
 ,p_reference_id => 39006600703094769
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946351144278754875 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 985357142557848868 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/process_type/io_afw_21_contx_fil_arian
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1003633365584722813 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_CONTX_FIL_ARIAN'
 ,p_display_name => 'AFW - 21 - Contexte fil d''ariane'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.defnr_contx_afw_04_fil_arian'
 ,p_substitute_attributes => true
 ,p_reference_id => 57309206938001666
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946324862455722205 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1003633365584722813 + wwv_flow_api.g_id_offset
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
  p_id => 946325256479722205 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1003633365584722813 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_aide_page_item
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1006875764788598762 + wwv_flow_api.g_id_offset
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
  p_id => 1006948378718891419 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1006875764788598762 + wwv_flow_api.g_id_offset
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
  p_id => 1006880096442693038 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_group_entet_raprt_sql
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1032178775304178036 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 749509057975908380
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 959042934749209164 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1032178775304178036 + wwv_flow_api.g_id_offset
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
  p_id => 959043363102209166 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1032178775304178036 + wwv_flow_api.g_id_offset
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
  p_id => 959043748327209167 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1032178775304178036 + wwv_flow_api.g_id_offset
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
  p_id => 959044156711209167 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1032178775304178036 + wwv_flow_api.g_id_offset
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
  p_id => 959044554402209167 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1032178775304178036 + wwv_flow_api.g_id_offset
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
  p_id => 959044961517209167 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1032178775304178036 + wwv_flow_api.g_id_offset
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
  p_id => 959045337106209167 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1032178775304178036 + wwv_flow_api.g_id_offset
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
  p_id => 959045745179209168 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1032178775304178036 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_matrc_raprt_sql
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1032202570661441495 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 85961832755773671
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946241441022668743 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1032202570661441495 + wwv_flow_api.g_id_offset
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
  p_id => 946241840786668744 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1032202570661441495 + wwv_flow_api.g_id_offset
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
  p_id => 1041494263489525704 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_DIALG'
 ,p_display_name => 'AFW - 21 - Boîte de dialogue'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_plugn_regn_dialg'
 ,p_substitute_attributes => true
 ,p_reference_id => 95126425312763164
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946369040946763347 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1041494263489525704 + wwv_flow_api.g_id_offset
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
  p_id => 946369433378763347 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1041494263489525704 + wwv_flow_api.g_id_offset
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
  p_id => 946369856360763347 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1041494263489525704 + wwv_flow_api.g_id_offset
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
  p_id => 946370247136763347 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1041494263489525704 + wwv_flow_api.g_id_offset
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
  p_id => 946370639780763347 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1041494263489525704 + wwv_flow_api.g_id_offset
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
  p_id => 946371062985763348 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1041494263489525704 + wwv_flow_api.g_id_offset
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
  p_id => 946371447401763348 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1041494263489525704 + wwv_flow_api.g_id_offset
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
  p_id => 946372148315763348 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1041494263489525704 + wwv_flow_api.g_id_offset
 ,p_name => 'ouvridialg'
 ,p_display_name => 'Ouvrir le dialogue'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_prodt_contx_a
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1055362967892566254 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_PRODT_CONTX_A'
 ,p_display_name => 'AFW - 21 - Produit contexte autorisé'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_prodt_contx_autor'
 ,p_ajax_function => 'afw_21_regn_pkg.ajax_prodt_contx_autor'
 ,p_substitute_attributes => true
 ,p_reference_id => 108989715517799630
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946375255837767594 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1055362967892566254 + wwv_flow_api.g_id_offset
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
  p_id => 946375656873767595 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1055362967892566254 + wwv_flow_api.g_id_offset
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
  p_id => 946376031470767595 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1055362967892566254 + wwv_flow_api.g_id_offset
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
  p_id => 946376447774767595 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946376031470767595 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Tous les produits'
 ,p_return_value => 'TOUS'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946376935358767595 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946376031470767595 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Exclure les produits AFW'
 ,p_return_value => 'EXCLU_AFW'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946377431646767596 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946376031470767595 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Seulement les produits AFW'
 ,p_return_value => 'SEULM_AFW'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946377939200767596 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1055362967892566254 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Produits SAF'
 ,p_attribute_type => 'CHECKBOXES'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 946376031470767595 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'SEULM_AFW'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946378359085767597 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946377939200767596 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'SAFP'
 ,p_return_value => 'SAFP'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946378857232767597 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946377939200767596 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'SAFD'
 ,p_return_value => 'SAFD'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946379349490767597 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946377939200767596 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'SAFU'
 ,p_return_value => 'SAFU'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946379849997767597 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946377939200767596 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'SAFS'
 ,p_return_value => 'SAFS'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946380348090767598 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946377939200767596 + wwv_flow_api.g_id_offset
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
  p_id => 1107363333447056955 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 161088501596353053
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946275534620704752 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1107363333447056955 + wwv_flow_api.g_id_offset
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
  p_id => 946275961452704752 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1107363333447056955 + wwv_flow_api.g_id_offset
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
  p_id => 1127106792254886495 + wwv_flow_api.g_id_offset
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
  p_id => 1209462512718515498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1127106792254886495 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/authorization_type/io_afw_21_autor_admin_domn
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1130104660632114448 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/authorization_type/io_afw_21_autor_admin_prodt
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1130657803021561808 + wwv_flow_api.g_id_offset
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
  p_id => 1130870945150592466 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/authorization_type/io_afw_21_autor_acces_page
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1152447764286990851 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_ACCES_PAGE'
 ,p_display_name => 'AFW - 21 - Autorisation Accès Page'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_acces_page'
 ,p_substitute_attributes => true
 ,p_reference_id => 206230831931400328
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
  p_id => 1152593156330064389 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_SUPRS'
 ,p_display_name => 'AFW - 21 - Autorisation Suppression'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_suprs'
 ,p_substitute_attributes => true
 ,p_reference_id => 206373717825453100
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
  p_id => 1152918380890194427 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_OPERT_DML'
 ,p_display_name => 'AFW - 21 - Autorisation Opération DML'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_opert_dml'
 ,p_substitute_attributes => true
 ,p_reference_id => 206699734897590444
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
  p_id => 1153191168068465033 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'IO_AFW_21_AUTOR_MODFC'
 ,p_display_name => 'AFW - 21 - Autorisation Modification'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_autor_pkg.genr_autor_modfc'
 ,p_substitute_attributes => true
 ,p_reference_id => 52690428432185071
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
  p_id => 1158308149001464843 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 212091906733880836
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
  p_id => 1174134751692491750 + wwv_flow_api.g_id_offset
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
  p_id => 1174143861968036834 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1174134751692491750 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/region_type/io_afw_21_liste_navgt
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1193113586780576918 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_LISTE_NAVGT'
 ,p_display_name => 'AFW - 21 - Liste de navigation'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_afw_13_liste_navgt'
 ,p_substitute_attributes => true
 ,p_reference_id => 246768929126827683
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946345761809750443 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1193113586780576918 + wwv_flow_api.g_id_offset
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
  p_id => 946348158698750444 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946345761809750443 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'ui-icon-arrowthick-1-e'
 ,p_return_value => 'ui-icon-arrowthick-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946346161198750443 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946345761809750443 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'ui-icon-arrow-1-e'
 ,p_return_value => 'ui-icon-arrow-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946346632724750443 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946345761809750443 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'ui-icon-carat-1-e'
 ,p_return_value => 'ui-icon-carat-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946347145221750443 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946345761809750443 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'ui-icon-triangle-1-e'
 ,p_return_value => 'ui-icon-triangle-1-e'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 946347653047750443 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946345761809750443 + wwv_flow_api.g_id_offset
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
  p_id => 1202289570827939221 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_TRAIT_MESS_ERR'
 ,p_display_name => 'AFW - 21 - Traiter messages d''erreur'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.trait_mesgs_err'
 ,p_substitute_attributes => true
 ,p_reference_id => 255949429450194655
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946340745186745636 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1202289570827939221 + wwv_flow_api.g_id_offset
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
  p_id => 1202544290764408986 + wwv_flow_api.g_id_offset
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
  p_id => 1209298963644333831 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_DEFNR_ITEM_PAGE'
 ,p_display_name => 'AFW - 21 - Définir item(s) page'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.defnr_item_page'
 ,p_substitute_attributes => true
 ,p_reference_id => 262973130146610542
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946326840769725410 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1209298963644333831 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Définir ces éléments'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946327249578725411 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1209298963644333831 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Avec ces valeurs'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 946326840769725410 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'NOT_NULL'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_fermr_dialg_ifram
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1217917076791146744 + wwv_flow_api.g_id_offset
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
  p_id => 1288316159100075941 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_INSER_TRACE'
 ,p_display_name => 'AFW - 21 - Insérer trace'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.inser_trace'
 ,p_substitute_attributes => true
 ,p_reference_id => 341980116121340426
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946336746441736531 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1288316159100075941 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Valeur 1'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946337158408736531 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1288316159100075941 + wwv_flow_api.g_id_offset
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
  p_id => 1323633178509522609 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_regn_afich_mesg_in
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1363195168462135427 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 420231722633042109
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
  p_id => 1366502281525426433 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_CONFR_SAUVG_REQT'
 ,p_display_name => 'AFW - 21 - Confirmer la sauvegarde (Requêtes)'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.defnr_afw_21_confr_sauvg'
 ,p_substitute_attributes => true
 ,p_reference_id => 420179830843707580
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946323154490719907 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1366502281525426433 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Message de confirmation'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => true
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946323561440719907 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1366502281525426433 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_redrc_url
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1369725366563895056 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'IO_AFW_21_REDRC_URL'
 ,p_display_name => 'AFW - 21 - Redirection URL'
 ,p_category => 'EXECUTE'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_actio_dynmq_pkg.genr_redrc_url'
 ,p_substitute_attributes => true
 ,p_reference_id => 423480817791214577
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946245153274681774 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1369725366563895056 + wwv_flow_api.g_id_offset
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

--application/shared_components/plugins/dynamic_action/io_afw_21_fermr_regn_dialg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1410336093692906067 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 464105344059263207
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
  p_id => 1418045975927246611 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_MODE_PAGE'
 ,p_display_name => 'AFW - 21 - Définir le mode de la page (AFW_04)'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.defnr_afw_04_mode_page'
 ,p_substitute_attributes => true
 ,p_reference_id => 471708222906508222
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946338456137739364 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1418045975927246611 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Item cible'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946338852369739364 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1418045975927246611 + wwv_flow_api.g_id_offset
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
  p_id => 1437524393857556140 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_DEFNR_PRODT_SAFP'
 ,p_display_name => 'AFW - 21 - Définir produit SAFP'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.defnr_prodt_safp'
 ,p_substitute_attributes => true
 ,p_reference_id => 491196249277829645
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
  p_id => 1443133681399626116 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_name => 'IO_AFW_21_AUTHE_12_UTILS'
 ,p_display_name => 'AFW - 21 - Authentification Utilisateur (12)'
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

--application/shared_components/plugins/dynamic_action/io_afw_21_afich_regn_dialg
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1530123799721129828 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 583902940437512561
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946221432056618808 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1530123799721129828 + wwv_flow_api.g_id_offset
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
  p_id => 1556267720020871053 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 609982560120159061
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946286530942713180 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
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
  p_id => 946286943337713182 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'prePopulate'
 ,p_attribute_type => 'PLSQL EXPRESSION'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946287348208713182 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
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
  p_id => 946287732063713182 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
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
  p_id => 946288144163713182 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
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
  p_id => 946288547828713183 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'tokenLimit'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946288963125713183 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
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
  p_id => 946289357463713183 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
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
  p_id => 946289757720713183 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
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
  p_id => 946290749165713184 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
 ,p_name => 'onadd'
 ,p_display_name => 'onAdd'
  );
wwv_flow_api.create_plugin_event (
  p_id => 946291147750713184 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
 ,p_name => 'ondelete'
 ,p_display_name => 'onDelete'
  );
wwv_flow_api.create_plugin_event (
  p_id => 946291535669713184 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
 ,p_name => 'onready'
 ,p_display_name => 'onReady'
  );
wwv_flow_api.create_plugin_event (
  p_id => 946291963495713184 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1556267720020871053 + wwv_flow_api.g_id_offset
 ,p_name => 'onresult'
 ,p_display_name => 'onResult'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_afich_dialg_ifram
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1558763284862568786 + wwv_flow_api.g_id_offset
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
  p_id => 1558779061229580844 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
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
  p_id => 1286960145423471552 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 105
 ,p_prompt => 'SCPI'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1558787885733606875 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
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
  p_id => 1559099978550462277 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
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
  p_id => 1558792273050612623 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
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
  p_id => 1285194043281941028 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 130
 ,p_prompt => 'SAPC'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1558801061407618780 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
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
  p_id => 1558805472835622077 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
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
  p_id => 1558809888072626458 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
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
  p_id => 1469356275697813226 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 100
 ,p_prompt => 'Définir élément SSPC'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1546677576228729171 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 11
 ,p_display_sequence => 110
 ,p_prompt => 'Définir élément SSPI'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1547773064780624704 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 12
 ,p_display_sequence => 120
 ,p_prompt => 'Item clé étrangère'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 1283503258277027616 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
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
  p_id => 1283511763472029117 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 15
 ,p_display_sequence => 19
 ,p_prompt => 'Page'
 ,p_attribute_type => 'PLSQL EXPRESSION'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 1466516345026914898 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogbeforeclose'
 ,p_display_name => 'beforeClose'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1466565451391926188 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogclose'
 ,p_display_name => 'close'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1477743759435827912 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogclose_actio_dynmq'
 ,p_display_name => 'close Dynamic Action Plugin'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1477748170517831116 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogclose_procs'
 ,p_display_name => 'close Process Plugin'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1466537065458920826 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogdrag'
 ,p_display_name => 'drag'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1466532863034920076 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogdragstart'
 ,p_display_name => 'dragStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1466541268921921837 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogdragstop'
 ,p_display_name => 'dragStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1466528659571919099 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogfocus'
 ,p_display_name => 'focus'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1466524456454918191 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogopen'
 ,p_display_name => 'open'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1466557044464924226 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogresize'
 ,p_display_name => 'resize'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1466545471692922643 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogresizestart'
 ,p_display_name => 'resizeStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1466561247581925132 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1558763284862568786 + wwv_flow_api.g_id_offset
 ,p_name => 'dialogresizestop'
 ,p_display_name => 'resizeStop'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_regn_afich_mesg_pr
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1795030273191853559 + wwv_flow_api.g_id_offset
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
  p_id => 1811303890315416302 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_VALDT_CLOB'
 ,p_display_name => 'AFW - 21 - Validation - CLOB'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.valdt_afw_21_colct_clob'
 ,p_substitute_attributes => true
 ,p_reference_id => 864962541319669600
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946342353497748011 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1811303890315416302 + wwv_flow_api.g_id_offset
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
  p_id => 946342733606748011 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 946342353497748011 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'La valeur n''est pas nulle'
 ,p_return_value => 'NOT_NULL'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946343234423748011 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1811303890315416302 + wwv_flow_api.g_id_offset
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
  p_id => 946343653247748012 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1811303890315416302 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Item'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946344061612748014 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1811303890315416302 + wwv_flow_api.g_id_offset
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
  p_id => 1818930498637723783 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_SURPM_COLCT_CLOB'
 ,p_display_name => 'AFW - 21 - Supprimer collection - CLOB'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.suprm_afw_21_colct_clob'
 ,p_substitute_attributes => true
 ,p_reference_id => 872591038690983316
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
  p_id => 1821073792740696469 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 874817841759005975
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946256557560692429 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1821073792740696469 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Liste des items (clob)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 946257255210692429 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1821073792740696469 + wwv_flow_api.g_id_offset
 ,p_name => 'suprm_item_clob_delete_termn'
 ,p_display_name => 'Supprimer items CLOB terminé (DELETE)'
  );
null;
 
end;
/

--application/shared_components/plugins/region_type/io_afw_21_regn_calnd
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'IO_AFW_21_REGN_CALND'
 ,p_display_name => 'AFW - 21 - Calendrier'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'afw_21_regn_pkg.genr_plugn_regn_calnd'
 ,p_ajax_function => 'afw_21_regn_pkg.ajax_plugn_regn_calnd'
 ,p_substitute_attributes => true
 ,p_reference_id => 1014991159174365538
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 957175348248538496 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Code du calendrier'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 957177962130538498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'dayclick'
 ,p_display_name => 'dayClick'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957178347729538498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'drop'
 ,p_display_name => 'drop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957178763323538498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventafterrender'
 ,p_display_name => 'eventAfterRender'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957179144182538498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventclick'
 ,p_display_name => 'eventClick'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957179554161538498 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventdragstart'
 ,p_display_name => 'eventDragStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957179956114538499 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventdragstop'
 ,p_display_name => 'eventDragStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957180345607538499 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventdrop'
 ,p_display_name => 'eventDrop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957180750904538499 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventmouseout'
 ,p_display_name => 'eventMouseout'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957181130907538499 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventmouseover'
 ,p_display_name => 'eventMouseover'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957181549339538499 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventrender'
 ,p_display_name => 'eventRender'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957181948057538499 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventresize'
 ,p_display_name => 'eventResize'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957182361297538500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventresizestart'
 ,p_display_name => 'eventResizeStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957182737833538500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'eventresizestop'
 ,p_display_name => 'eventResizeStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957183150087538500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'loading'
 ,p_display_name => 'loading'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957183540057538500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'loadingstart'
 ,p_display_name => 'loadingStart'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957183935952538500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'loadingstop'
 ,p_display_name => 'loadingStop'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957184336156538500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'select'
 ,p_display_name => 'select'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957184758672538501 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'unselect'
 ,p_display_name => 'unselect'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957185132019538501 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'viewdisplay'
 ,p_display_name => 'viewDisplay'
  );
wwv_flow_api.create_plugin_event (
  p_id => 957185544885538501 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 1961348321807125627 + wwv_flow_api.g_id_offset
 ,p_name => 'windowresize'
 ,p_display_name => 'windowResize'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_soumt_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2214475667801014688 + wwv_flow_api.g_id_offset
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
  p_id => 2214495460313022034 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2214475667801014688 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Liste des items (clob)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_event (
  p_id => 2216688453880581346 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2214475667801014688 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_create_clob_termn'
 ,p_display_name => 'Soumettre CLOB terminé (CREATE)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 1802313601864662211 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2214475667801014688 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_delete_clob_termn'
 ,p_display_name => 'Soumettre CLOB terminé (DELETE)'||unistr('\000a')||
''
  );
wwv_flow_api.create_plugin_event (
  p_id => 1802309392514659572 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2214475667801014688 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_save_clob_termn'
 ,p_display_name => 'Soumettre CLOB terminé (SAVE)'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_dml_obten_clob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2217565616078816390 + wwv_flow_api.g_id_offset
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
 ,p_reference_id => 1271339084799178873
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946227735434638727 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2217565616078816390 + wwv_flow_api.g_id_offset
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
  p_id => 946228139948638728 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2217565616078816390 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Elément contenant la valeur de colonne de clé primaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946228535342638728 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2217565616078816390 + wwv_flow_api.g_id_offset
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
  p_id => 946228951498638728 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2217565616078816390 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Elément contenant la valeur de colonne de clé secondaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946229347524638728 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2217565616078816390 + wwv_flow_api.g_id_offset
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
  p_id => 946229749776638728 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2217565616078816390 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Liste des items (séparées par des virgules)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946230133555638729 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2217565616078816390 + wwv_flow_api.g_id_offset
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
  p_id => 2233653506319557376 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_name => 'IO_AFW_21_DML_MAJ_CLOB'
 ,p_display_name => 'AFW - 21 - Traitement de ligne automatique (DML) - CLOB'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => 'afw_21_procs_pkg.dml_maj_clob'
 ,p_substitute_attributes => true
 ,p_reference_id => 1287324654813828797
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.8'
 ,p_about_url => 'http://www.afw.io'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946330061201731296 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2233653506319557376 + wwv_flow_api.g_id_offset
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
  p_id => 946330436854731296 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2233653506319557376 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Elément contenant la valeur de colonne de clé primaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946330857169731296 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2233653506319557376 + wwv_flow_api.g_id_offset
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
  p_id => 946331234003731296 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2233653506319557376 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Elément contenant la valeur de colonne de clé secondaire'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => false
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946331633828731296 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2233653506319557376 + wwv_flow_api.g_id_offset
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
  p_id => 946332040922731297 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2233653506319557376 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Liste des items (séparées par des virgules)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 946332436798731297 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2233653506319557376 + wwv_flow_api.g_id_offset
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
  p_id => 4474182687327932181 + wwv_flow_api.g_id_offset
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
  p_id => 3007721375339398858 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4474182687327932181 + wwv_flow_api.g_id_offset
 ,p_name => 'selct_termn_regn'
 ,p_display_name => 'Sélection terminée'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/io_afw_21_soumt_blob
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 4480560968162283861 + wwv_flow_api.g_id_offset
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
  p_id => 3031343950196598214 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480560968162283861 + wwv_flow_api.g_id_offset
 ,p_name => 'debut_telvr'
 ,p_display_name => 'Débuter téléversement'
  );
wwv_flow_api.create_plugin_event (
  p_id => 4480584970025293867 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480560968162283861 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_create_blob_termn'
 ,p_display_name => 'Soumettre BLOB terminé (CREATE)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 4480589173488294795 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480560968162283861 + wwv_flow_api.g_id_offset
 ,p_name => 'soumt_delete_blob_termn'
 ,p_display_name => 'Soumettre BLOB terminé (DELETE)'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3031348357468600313 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 4480560968162283861 + wwv_flow_api.g_id_offset
 ,p_name => 'termn_telvr'
 ,p_display_name => 'Terminer téléversement'
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

--export elap=           2.7054
