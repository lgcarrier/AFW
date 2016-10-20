SET DEFINE OFF;
create or replace package afw_11_insta_afw_pkg
as
  --A ajouter avant l'execution de afw_11_insta_afw_pkg
  --grant execute on apex_050000.wwv_flow_security to apexframework;
  --grant insert on apex_050000.wwv_flow_items to apexframework;
  --grant insert on apex_050000.wwv_flow_page_plugs to apexframework;
  --grant insert on apex_050000.wwv_flow_step_items to apexframework;
  --grant insert on apex_050000.wwv_flow_processing to apexframework;
  --grant insert on apex_050000.wwv_flow_shortcuts to apexframework;
  --grant insert on apex_050000.wwv_flow_plugins to apexframework;
  --grant execute on apex_050000.wwv_flow_wizard_api to apexframework;
  --grant delete on apex_050000.wwv_flow_page_da_actions to apexframework;
  --grant insert on apex_050000.wwv_flow_page_da_actions to apexframework;
  --grant insert on apex_050000.wwv_flow_authentications to apexframework;
  --grant update on apex_050000.wwv_flows to apexframework;
  --grant insert on apex_050000.wwv_flow_security_schemes to apexframework;

  --JIRA AFW-75.1

  --  grant insert on apex_050000.wwv_flow_plugin_events to apexframework;
  --
  --  grant insert on apex_050000.wwv_flow_plugin_attributes to apexframework;
  --
  --  grant insert on apex_050000.wwv_flow_plugin_attr_values to apexframework;
  --
  --  grant insert on apex_050000.wwv_flow_plugin_files to apexframework;
  --
  --  grant insert on apex_050000.wwv_flow_plugin_settings to apexframework;

  --FIN JIRA AFW-75.1

  /******************************************************
  *
  *   Auteur : CONAL
  *   Version : AFW_040200 et apex_050000
  *
  *   À noter : Il est important de tenir à jour chacune
  *   des procédures à chaque version AFW et APEX, et ce,
  *   jusqu'à ce qu'une version dynamique de ce module
  *   soit disponible.
  *
  *   Mode d'emploi
  *
  *   1 - Vérifier l'existance de la page globale et
  *       ajuster la constante "knu_page_globl"
  *   2 - Si elle n'est pas existante, la créer par APEX
  *   3 - exec afw_11_insta_afw_pkg.insta_afw_aplic_apex([NUMR_APLIC_APEX]);
  *
  ******************************************************/

  type typ_plugn is table of number
    index by apex_050000.wwv_flow_plugins.name%type;

  gta_id_plugn         typ_plugn;

  type typ_atrib_plugn is table of number
    index by varchar2 (100);

  gta_id_atrib_plugn   typ_atrib_plugn;

  procedure insta_afw_aplic_apex (pnu_id_apex in number);

  procedure verfr_afw_insta (pnu_numr_apex in number);

  procedure anals_versn_plugn (pnu_id_apex in number);

  --Supposons qu'il y a eu installation AVANT l'ajout des plugn_evenm et plugn_atrib
  procedure maj_evenm_atrib_plugn (pnu_numr_apex in number);
end afw_11_insta_afw_pkg;
/
