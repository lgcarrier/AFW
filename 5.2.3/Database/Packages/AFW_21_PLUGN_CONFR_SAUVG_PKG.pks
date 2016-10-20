SET DEFINE OFF;
create or replace package afw_21_plugn_confr_sauvg_pkg
  authid current_user
is
  kva_s_mesg   constant varchar2 (60) default 'S_AFW_21_CONFR_SAUVG_MESG';
  kva_s_reqt   constant varchar2 (60) default 'S_AFW_21_CONFR_SAUVG_REQT';

  function obten_mesg_confr
    return varchar2;

  procedure defnr_mesg_confr (pva_mesg in varchar2);

  function obten_reqt_sauvg
    return varchar2;

  procedure defnr_reqt_sauvg (pva_liste_reqt in varchar2);

  procedure obten_json_item_confr;

  procedure obten_json_reqt_sauvg;
end afw_21_plugn_confr_sauvg_pkg;
/
