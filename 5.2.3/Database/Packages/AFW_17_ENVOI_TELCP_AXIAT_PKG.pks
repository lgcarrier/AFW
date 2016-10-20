SET DEFINE OFF;
create or replace package afw_17_envoi_telcp_axiat_pkg
as
  procedure envoy_telcp_simpl (pva_code_compt_axiat   in varchar2
                              ,pnu_a                  in number
                              ,pva_destn_formt        in varchar2
                              ,pnu_domn               in number
                              ,pda_date_envo_difr     in date default null);

  function envoy_telcp_simpl (pva_code_compt_axiat   in varchar2
                             ,pnu_a                  in number
                             ,pva_destn_formt        in varchar2
                             ,pnu_domn               in number
                             ,pda_date_envo_difr     in date default null)
    return number;

  procedure vider_file_atent (pva_code_compt_axiat   in varchar2
                             ,pnu_domn               in number);

  procedure ajout_piece_joint (pnu_telcp_axiat   in number
                              ,pbl_contn         in blob
                              ,pnu_nombr_page    in number
                              ,pva_mime_type     in varchar2
                              ,pva_nom_fichr     in varchar2);

  procedure termn_envoi (pnu_telcp_axiat in number);
end afw_17_envoi_telcp_axiat_pkg;
/
