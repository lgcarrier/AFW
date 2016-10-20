SET DEFINE OFF;
create or replace package body afw_21_authe_pkg
is
  function sentn (p_authentication   in apex_plugin.t_authentication
                 ,p_plugin           in apex_plugin.t_plugin
                 ,p_is_public_page   in boolean)
    return apex_plugin.t_authentication_sentry_result
  is
    rec_sentn   apex_plugin.t_authentication_sentry_result;

    function valdr_sesn_sentr
      return boolean
    is
      vnu_exist   number (1);
    begin
      -- Verifier si la session existe pour
      select 1
        into vnu_exist
        from vd_afw_12_sesn
       where     id_sesn = p_authentication.session_id
             and app_user = p_authentication.username;

      return true;
    exception
      when no_data_found
      then
        return false;
    end valdr_sesn_sentr;
  begin
    if p_is_public_page
    then
      rec_sentn.is_valid   := true;
    else
      rec_sentn.is_valid   := valdr_sesn_sentr;
    end if;

    return rec_sentn;
  end sentn;

  function authe_11_utils (p_authentication   in apex_plugin.t_authentication
                          ,p_plugin           in apex_plugin.t_plugin
                          ,p_password         in varchar2)
    return apex_plugin.t_authentication_auth_result
  is
    rec_authe   apex_plugin.t_authentication_auth_result;
  begin
    rec_authe.is_authenticated      :=
      afw_11_authe_apex_pkg.valid_utils (p_authentication.username
                                        ,p_password);

    return rec_authe;
  end authe_11_utils;

  function authe_12_utils (p_authentication   in apex_plugin.t_authentication
                          ,p_plugin           in apex_plugin.t_plugin
                          ,p_password         in varchar2)
    return apex_plugin.t_authentication_auth_result
  is
    rec_authe               apex_plugin.t_authentication_auth_result;
    vbo_ignor_indic_actif   boolean;
    vbo_forcr_authe         boolean;
  begin
    vbo_ignor_indic_actif   := case when afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_AUTHE_IGNOR_INDIC_ACTIF') = 'O' then true else false end;

    vbo_forcr_authe         := case when afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_AUTHE_FORCR_AUTHE') = 'O' then true else false end;

    rec_authe.is_authenticated      :=
      afw_12_authe_apex_pkg.authe_utils (afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_UTILS')
                                        ,p_password
                                        ,afw_12_domn_pkg.obten_domn_sesn_authe
                                        ,vbo_ignor_indic_actif
                                        ,vbo_forcr_authe);
    return rec_authe;
  end authe_12_utils;

  function apres_decnx (p_authentication   in apex_plugin.t_authentication
                       ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_authentication_logout_result
  is
    rec_authe           apex_plugin.t_authentication_logout_result;
    vvc_temn            apex_application_global.vc_arr2;

    vva_progr_a_lancr   varchar2 (4000)
                          default    'begin '
                                  || '  %PROCD_PERSN%;'
                                  || '  exception when others then ete();'
                                  || 'end;';

    vva_nom_procd       varchar2 (92);

    vva_code_domn       vd_i_afw_12_domn.code%type;
  begin
    vva_code_domn            := afw_15_htp_pkg.obten_valr_temn (afw_12_authe_apex_pkg.kva_temn_domn);

    vva_nom_procd            := afw_12_domn_pkg.obten_procd_apres_decnx (afw_12_domn_pkg.obten_seqnc_domn (vva_code_domn));

    afw_15_htp_pkg.ajout_temn (pva_nom     => afw_12_authe_apex_pkg.kva_temn_domn
                              ,pva_valr    => ''
                              ,pda_expir   => afw_15_htp_pkg.kda_date_expir_temn);

    vvc_temn                 :=
      afw_07_util_pkg.string_to_table (p_authentication.attribute_01
                                      ,',');

    if vvc_temn.count () > 0
    then
      for i in 1 .. vvc_temn.count ()
      loop
        owa_cookie.send (name    => vvc_temn (i)
                        ,value   => '');
      end loop;
    end if;

    if vva_nom_procd is not null
    then
      vva_progr_a_lancr      :=
        replace (vva_progr_a_lancr
                ,'%PROCD_PERSN%'
                ,vva_nom_procd);

      execute immediate vva_progr_a_lancr;
    end if;

    rec_authe.redirect_url   := p_authentication.logout_url;

    return rec_authe;
  end apres_decnx;

  function ajax (p_authentication   in apex_plugin.t_authentication
                ,p_plugin           in apex_plugin.t_plugin)
    return apex_plugin.t_authentication_ajax_result
  is
    rec_authe   apex_plugin.t_authentication_ajax_result;
  begin
    return rec_authe;
  end ajax;
end afw_21_authe_pkg;
/
