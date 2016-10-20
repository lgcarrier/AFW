SET DEFINE OFF;
create or replace package afw_21_procs_pkg
  authid current_user
is
  function inser_trace (p_process   in apex_plugin.t_process
                       ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function authe_redrg (p_process   in apex_plugin.t_process
                       ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function fermr_dialg_ifram (p_process   in apex_plugin.t_process
                             ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function defnr_item_page (p_process   in apex_plugin.t_process
                           ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function defnr_contx_afw_04_fil_arian (p_process   in apex_plugin.t_process
                                        ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function suprm_afw_21_colct_clob (p_process   in apex_plugin.t_process
                                   ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function dml_maj_clob (p_process   in apex_plugin.t_process
                        ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function valdt_afw_21_colct_clob (p_process   in apex_plugin.t_process
                                   ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function defnr_afw_04_mode_page (p_process   in apex_plugin.t_process
                                  ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  --OBSOLETE::CARLO
  /*
  function defnr_aplic_safp (p_process in apex_plugin.t_process,
                             p_plugin in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;
  */

  function trait_mesgs_err (p_process   in apex_plugin.t_process
                           ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function defnr_afw_21_confr_sauvg (p_process   in apex_plugin.t_process
                                    ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function reint_afw_13_menu (p_process   in apex_plugin.t_process
                             ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function chang_libl_fil_arian (p_process   in apex_plugin.t_process
                                ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;

  function trait_tradc (p_process   in apex_plugin.t_process
                       ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result;
end afw_21_procs_pkg;
/
