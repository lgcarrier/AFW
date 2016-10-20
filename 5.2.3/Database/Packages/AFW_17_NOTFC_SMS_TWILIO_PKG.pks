SET DEFINE OFF;
create or replace package afw_17_notfc_sms_twilio_pkg
as
  type typ_arr_parmt is table of varchar2 (255)
    index by pls_integer;

  type typ_arr_valr is table of varchar2 (255)
    index by pls_integer;

  function obten_valr_iden (pva_iden in varchar2)
    return varchar2;

  procedure envoy_sms (pva_code_compt_twili   in varchar2
                      ,pnu_de                 in number
                      ,pnu_a                  in number
                      ,pva_mesg               in varchar2
                      ,pda_date_envo_difr     in date default null);

  function envoy_sms (pva_code_compt_twili   in varchar2
                     ,pnu_de                 in number
                     ,pnu_a                  in number
                     ,pva_mesg               in varchar2
                     ,pda_date_envo_difr     in date default null)
    return number;

  procedure vider_file_atent (pva_code_compt_twili in varchar2);

  procedure maj_file_atent (pva_code_compt_twili in varchar2);

  function obten_prix (pva_prix in varchar2)
    return number;

  procedure confr_stat_envoi (name_array    in typ_arr_parmt
                             ,value_array   in typ_arr_valr);

  procedure recvr_sms (name_array    in typ_arr_parmt
                      ,value_array   in typ_arr_valr);
end afw_17_notfc_sms_twilio_pkg;
/
