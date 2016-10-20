SET DEFINE OFF;
create or replace package afw_01_err_apex_pkg
is
  gbo_mode_debug   boolean default false;
  gbo_mode_simlt   boolean default false;

  function obten_afich_err_code (pnu_prodt in number default null)
    return boolean;

  procedure gerer_err_apex (thepage in out nocopy htp.htbuf_arr);

  procedure lever_err_apex_mesg (pva_mesg in varchar2);

  procedure lever_err_apex_code (pva_code           in varchar2
                                ,pva_valr_subst1    in varchar2 default null
                                ,pva_valr_subst2    in varchar2 default null
                                ,pva_valr_subst3    in varchar2 default null
                                ,pva_valr_subst4    in varchar2 default null
                                ,pva_valr_subst5    in varchar2 default null
                                ,pva_valr_subst6    in varchar2 default null
                                ,pva_valr_subst7    in varchar2 default null
                                ,pva_valr_subst8    in varchar2 default null
                                ,pva_valr_subst9    in varchar2 default null
                                ,pva_valr_subst10   in varchar2 default null
                                ,pva_code_prodt     in varchar2 default null
                                ,pbo_afich_code     in boolean default obten_afich_err_code);

  procedure lever_err_apex_systm_code (pva_code           in varchar2
                                      ,pva_valr_subst1    in varchar2 default null
                                      ,pva_valr_subst2    in varchar2 default null
                                      ,pva_valr_subst3    in varchar2 default null
                                      ,pva_valr_subst4    in varchar2 default null
                                      ,pva_valr_subst5    in varchar2 default null
                                      ,pva_valr_subst6    in varchar2 default null
                                      ,pva_valr_subst7    in varchar2 default null
                                      ,pva_valr_subst8    in varchar2 default null
                                      ,pva_valr_subst9    in varchar2 default null
                                      ,pva_valr_subst10   in varchar2 default null
                                      ,pva_code_systm     in varchar2 default null
                                      ,pbo_afich_code     in boolean default obten_afich_err_code);

  procedure lever_err_apex (pnu_seqnc          in number default null
                           ,pva_valr_subst1    in varchar2 default null
                           ,pva_valr_subst2    in varchar2 default null
                           ,pva_valr_subst3    in varchar2 default null
                           ,pva_valr_subst4    in varchar2 default null
                           ,pva_valr_subst5    in varchar2 default null
                           ,pva_valr_subst6    in varchar2 default null
                           ,pva_valr_subst7    in varchar2 default null
                           ,pva_valr_subst8    in varchar2 default null
                           ,pva_valr_subst9    in varchar2 default null
                           ,pva_valr_subst10   in varchar2 default null
                           ,pbo_afich_code     in boolean default obten_afich_err_code);

  function obten_mesg_infor_sucs
    return varchar2;

  function obten_mesg_infor_aide
    return varchar2;

  function obten_mesg_infor_ereur
    return varchar2;

  function obten_mesg_infor_avert
    return varchar2;

  procedure afich_mesg_infor_apex;

  procedure ajout_mesg_infor_sesn_mesg (pva_mesg in varchar2);

  procedure ajout_mesg_infor_sesn_code (pva_code_mesg      in varchar2
                                       ,pva_valr_subst1    in varchar2 default null
                                       ,pva_valr_subst2    in varchar2 default null
                                       ,pva_valr_subst3    in varchar2 default null
                                       ,pva_valr_subst4    in varchar2 default null
                                       ,pva_valr_subst5    in varchar2 default null
                                       ,pva_valr_subst6    in varchar2 default null
                                       ,pva_valr_subst7    in varchar2 default null
                                       ,pva_valr_subst8    in varchar2 default null
                                       ,pva_valr_subst9    in varchar2 default null
                                       ,pva_valr_subst10   in varchar2 default null
                                       ,pva_code_prodt     in varchar2 default null);

  procedure ajout_mesg_infor_sesn_sys_code (pva_code_mesg      in varchar2
                                           ,pva_valr_subst1    in varchar2 default null
                                           ,pva_valr_subst2    in varchar2 default null
                                           ,pva_valr_subst3    in varchar2 default null
                                           ,pva_valr_subst4    in varchar2 default null
                                           ,pva_valr_subst5    in varchar2 default null
                                           ,pva_valr_subst6    in varchar2 default null
                                           ,pva_valr_subst7    in varchar2 default null
                                           ,pva_valr_subst8    in varchar2 default null
                                           ,pva_valr_subst9    in varchar2 default null
                                           ,pva_valr_subst10   in varchar2 default null
                                           ,pva_code_systm     in varchar2 default null);

  procedure ajout_mesg_infor_utils_mesg (pva_mesg    in varchar2
                                        ,pnu_utils   in number);

  procedure ajout_mesg_infor_utils_code (pva_code_mesg      in varchar2
                                        ,pnu_utils          in number
                                        ,pva_valr_subst1    in varchar2 default null
                                        ,pva_valr_subst2    in varchar2 default null
                                        ,pva_valr_subst3    in varchar2 default null
                                        ,pva_valr_subst4    in varchar2 default null
                                        ,pva_valr_subst5    in varchar2 default null
                                        ,pva_valr_subst6    in varchar2 default null
                                        ,pva_valr_subst7    in varchar2 default null
                                        ,pva_valr_subst8    in varchar2 default null
                                        ,pva_valr_subst9    in varchar2 default null
                                        ,pva_valr_subst10   in varchar2 default null
                                        ,pva_code_prodt     in varchar2 default null);

  function gestn_mesg_err_apex (p_error in apex_error.t_error)
    return apex_error.t_error_result;
end afw_01_err_apex_pkg;
/
