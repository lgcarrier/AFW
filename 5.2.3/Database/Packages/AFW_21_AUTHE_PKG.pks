SET DEFINE OFF;
create or replace package afw_21_authe_pkg
  authid current_user
is
  function sentn (p_authentication   in apex_plugin.t_authentication
                 ,p_plugin           in apex_plugin.t_plugin
                 ,p_is_public_page   in boolean)
    return apex_plugin.t_authentication_sentry_result;

  function authe_12_utils (p_authentication   in apex_plugin.t_authentication
                          ,p_plugin           in apex_plugin.t_plugin
                          ,p_password         in varchar2)
    return apex_plugin.t_authentication_auth_result;

  function authe_11_utils (p_authentication   in apex_plugin.t_authentication
                          ,p_plugin           in apex_plugin.t_plugin
                          ,p_password         in varchar2)
    return apex_plugin.t_authentication_auth_result;

  function apres_decnx (p_authentication   in apex_plugin.t_authentication
                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_authentication_logout_result;

  function ajax (p_authentication   in apex_plugin.t_authentication
                ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_authentication_ajax_result;
end afw_21_authe_pkg;
/
