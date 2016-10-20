SET DEFINE OFF;
create or replace package body afw_12_sesn_pkg
is
  function obten_sesn
    return number
  is
  begin
    return sys_context ('ctx_infor_sesn'
                       ,'vnu_seqnc_sesn');
  end obten_sesn;

  procedure creat_sesn (pva_code_utils        in varchar2
                       ,pnu_numr_apex_aplic   in number
                       ,pnu_numr_apex_page    in number)
  is
    vnu_secrt_group_id   apex_aplic.security_group_id%type;
    l_cgivar_name        owa.vc_arr;
    l_cgivar_val         owa.vc_arr;
  begin
    htp.init;

    l_cgivar_name (1)                 := 'REQUEST_PROTOCOL';
    l_cgivar_val (1)                  := 'HTTP';

    owa.init_cgi_env (num_params   => 1
                     ,param_name   => l_cgivar_name
                     ,param_val    => l_cgivar_val);

    select aa.security_group_id
      into vnu_secrt_group_id
      from apex_aplic aa
     where aa.id = pnu_numr_apex_aplic;

    apex_secrt.g_security_group_id    := vnu_secrt_group_id;

    apex_api.set_security_group_id (vnu_secrt_group_id);

    apex_application.g_instance       := 1;
    apex_application.g_flow_id        := pnu_numr_apex_aplic;
    apex_application.g_flow_step_id   := pnu_numr_apex_page;

    apex_custom_auth.post_login (p_uname        => pva_code_utils
                                ,p_session_id   => null
                                , -- could use APEX_CUSTOM_AUTH.GET_NEXT_SESSION_ID
                                 p_app_page     =>   apex_application.g_flow_id
                                                  || ':'
                                                  || pnu_numr_apex_page);
  end creat_sesn;

  procedure suprm_sesn (pnu_numr_apex_aplic in number)
  is
  begin
    apex_authentication.logout (v ('SESSION')
                               ,pnu_numr_apex_aplic);
    apex_custom_auth.remove_session;

    afw_07_util_pkg.defnr_etat_sesn ('SESSION'
                                    ,null);
  end suprm_sesn;
end afw_12_sesn_pkg;
/
