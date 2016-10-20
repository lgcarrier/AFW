SET DEFINE OFF;
create or replace package afw_21_autor_pkg
  authid current_user
is
  function genr_autor_acces_page (p_authorization   in apex_plugin.t_authorization
                                 ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result;

  function genr_autor_acces_item (p_authorization   in apex_plugin.t_authorization
                                 ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result;

  function genr_autor_creat (p_authorization   in apex_plugin.t_authorization
                            ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result;

  function genr_autor_modfc (p_authorization   in apex_plugin.t_authorization
                            ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result;

  function genr_autor_suprs (p_authorization   in apex_plugin.t_authorization
                            ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result;

  function genr_autor_super_utils (p_authorization   in apex_plugin.t_authorization
                                  ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result;

  function genr_autor_opert_dml (p_authorization   in apex_plugin.t_authorization
                                ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result;

  function genr_autor_admin_prodt (p_authorization   in apex_plugin.t_authorization
                                  ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result;

  function genr_autor_admin_domn (p_authorization   in apex_plugin.t_authorization
                                 ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result;

  function genr_autor_devlp_prodt (p_authorization   in apex_plugin.t_authorization
                                  ,p_plugin          in apex_plugin.t_plugin)
    return apex_plugin.t_authorization_exec_result;
end afw_21_autor_pkg;
/
