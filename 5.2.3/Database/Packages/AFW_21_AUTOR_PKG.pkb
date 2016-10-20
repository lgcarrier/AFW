SET DEFINE OFF;
create or replace package body afw_21_autor_pkg
is
  function genr_autor_acces_page (p_authorization   in apex_plugin.t_authorization
                                 ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result
  is
    rec_auto   apex_plugin.t_authorization_exec_result;
  begin
    rec_auto.is_authorized      :=
      afw_12_secrt_pkg.verfc_droit_acces_schem_apex (pbo_indic_acces   => true
                                                    ,pbo_indic_creat   => null
                                                    ,pbo_indic_modfc   => null
                                                    ,pbo_indic_suprs   => null);
    return rec_auto;
  end genr_autor_acces_page;

  function genr_autor_acces_item (p_authorization   in apex_plugin.t_authorization
                                 ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result
  is
    rec_auto   apex_plugin.t_authorization_exec_result;
  begin
    --TODO::LGCARRIER
    rec_auto.is_authorized   := afw_12_secrt_pkg.verfr_presn_opert_utils (pva_code_opert => '');

    return rec_auto;
  end genr_autor_acces_item;

  function genr_autor_creat (p_authorization   in apex_plugin.t_authorization
                            ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result
  is
    rec_auto   apex_plugin.t_authorization_exec_result;
  begin
    rec_auto.is_authorized      :=
      afw_12_secrt_pkg.verfc_droit_acces_schem_apex (pbo_indic_acces   => null
                                                    ,pbo_indic_creat   => true
                                                    ,pbo_indic_modfc   => null
                                                    ,pbo_indic_suprs   => null);
    return rec_auto;
  end genr_autor_creat;

  function genr_autor_modfc (p_authorization   in apex_plugin.t_authorization
                            ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result
  is
    rec_auto   apex_plugin.t_authorization_exec_result;
  begin
    rec_auto.is_authorized      :=
      afw_12_secrt_pkg.verfc_droit_acces_schem_apex (pbo_indic_acces   => null
                                                    ,pbo_indic_creat   => null
                                                    ,pbo_indic_modfc   => true
                                                    ,pbo_indic_suprs   => null);
    return rec_auto;
  end genr_autor_modfc;

  function genr_autor_suprs (p_authorization   in apex_plugin.t_authorization
                            ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result
  is
    rec_auto   apex_plugin.t_authorization_exec_result;
  begin
    rec_auto.is_authorized      :=
      afw_12_secrt_pkg.verfc_droit_acces_schem_apex (pbo_indic_acces   => null
                                                    ,pbo_indic_creat   => null
                                                    ,pbo_indic_modfc   => null
                                                    ,pbo_indic_suprs   => true);
    return rec_auto;
  end genr_autor_suprs;


  function genr_autor_super_utils (p_authorization   in apex_plugin.t_authorization
                                  ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result
  is
    rec_auto   apex_plugin.t_authorization_exec_result;
  begin
    rec_auto.is_authorized   := afw_12_secrt_pkg.verfr_presn_utils_group ('SUPER_UTILS');
    return rec_auto;
  end genr_autor_super_utils;


  function genr_autor_opert_dml (p_authorization   in apex_plugin.t_authorization
                                ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result
  is
    rec_auto        apex_plugin.t_authorization_exec_result;
    vva_opert_dml   varchar2 (1) default afw_13_page_pkg.obten_opert_dml ();
  begin
    rec_auto.is_authorized      :=
      afw_12_secrt_pkg.verfc_droit_acces_schem_apex ( /*Lecture*/
                                                     null
                                                    , /*Création*/
                                                     case when vva_opert_dml = 'I' then true else null end
                                                    , /*Modification*/
                                                     case when vva_opert_dml = 'U' then true else null end
                                                    , /*Suppression*/
                                                     case when vva_opert_dml = 'D' then true else null end);

    return rec_auto;
  end genr_autor_opert_dml;


  function genr_autor_admin_prodt (p_authorization   in apex_plugin.t_authorization
                                  ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result
  is
    rec_auto   apex_plugin.t_authorization_exec_result;
  begin
    rec_auto.is_authorized      :=
      afw_11_utils_pkg.verfc_role_prodt (afw_12_utils_pkg.obten_usagr_conct
                                        ,afw_11_prodt_pkg.obten_prodt_sesn
                                        ,'ADMIN');
    return rec_auto;
  end genr_autor_admin_prodt;


  function genr_autor_admin_domn (p_authorization   in apex_plugin.t_authorization
                                 ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result
  is
    rec_auto   apex_plugin.t_authorization_exec_result;
  begin
    rec_auto.is_authorized      :=
      afw_11_utils_pkg.verfc_role_prodt (afw_12_utils_pkg.obten_usagr_conct
                                        ,'SAFD'
                                        ,'ADMIN');
    return rec_auto;
  end genr_autor_admin_domn;


  function genr_autor_devlp_prodt (p_authorization   in apex_plugin.t_authorization
                                  ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result
  is
    rec_auto   apex_plugin.t_authorization_exec_result;
  begin
    rec_auto.is_authorized      :=
      afw_11_utils_pkg.verfc_role_prodt (afw_12_utils_pkg.obten_usagr_conct
                                        ,afw_11_prodt_pkg.obten_prodt_sesn
                                        ,'DEVLP');
    return rec_auto;
  end genr_autor_devlp_prodt;
end afw_21_autor_pkg;
/
