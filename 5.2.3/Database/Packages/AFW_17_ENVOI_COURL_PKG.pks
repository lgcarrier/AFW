SET DEFINE OFF;
create or replace package afw_17_envoi_courl_pkg
as
  kva_destn_a      constant varchar2 (10) default 'A';
  kva_destn_cc     constant varchar2 (10) default 'CC';
  kva_destn_cci    constant varchar2 (10) default 'CCI';
  kva_destn_uniq   constant varchar2 (10) default 'UNIQ';

  subtype courl is binary_integer;

  subtype fil_atent is number (10);

  procedure defnr_servr (pva_servr   in varchar2
                        ,pnu_port    in number default 25
                        ,pva_domn    in varchar2 default null);

  procedure creer (pva_nom_envoy        in varchar2
                  ,pva_adres_envoy      in varchar2
                  ,pva_sujet            in varchar2
                  ,pva_servr            in varchar2 default null
                  ,pnu_port             in number default 25
                  ,pva_domn             in varchar2 default null
                  ,pva_empla_walt       in varchar2 default null
                  ,pva_mot_passe_walt   in varchar2 default null
                  ,pbo_ssl              in boolean default false);

  function creer (pva_nom_envoy        in varchar2
                 ,pva_adres_envoy      in varchar2
                 ,pva_sujet            in varchar2
                 ,pva_servr            in varchar2 default null
                 ,pnu_port             in number default 25
                 ,pva_domn             in varchar2 default null
                 ,pva_empla_walt       in varchar2 default null
                 ,pva_mot_passe_walt   in varchar2 default null
                 ,pbo_ssl              in boolean default false)
    return courl;

  procedure defnr_courn (pco_courl in courl);

  function obten_courn
    return courl;

  procedure defnr_authe_simpl (pva_usagr   in varchar2
                              ,pva_mdp     in varchar2);

  procedure formt_html;

  procedure ajout_destn (pva_nom     in varchar2
                        ,pva_adres   in varchar2
                        ,pva_type    in varchar2 default kva_destn_a);

  procedure ajout_piece_joint (pbl_contn       in blob
                              ,pva_mime_type   in varchar2
                              ,pva_nom_fichr   in varchar2);

  procedure ajout_evenm_ical (pva_evenm_ical   in varchar2
                             ,pbo_saut_ligne   in boolean default true);

  procedure ajout_ligne_corps (pva_ligne        in varchar2
                              ,pbo_saut_ligne   in boolean default true);

  procedure ajout_corps (par_corps in owa.vc_arr);

  procedure debut_htp;

  procedure fin_htp;

  procedure anulr;

  function placr_fil_atent (pbo_efacr in boolean default true)
    return fil_atent;

  procedure placr_fil_atent (pbo_efacr in boolean default true);

  procedure envoy (pbo_envoi_difr in boolean default false);

  procedure envoy_fil_atent (pfa_fil_atent in fil_atent);

  procedure envoy_toute_fil_atent (pnu_envoi_max in number default 10);
end afw_17_envoi_courl_pkg;
/
