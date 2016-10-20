SET DEFINE OFF;
create or replace package afw_12_arbre_pkg
as
  subtype tab_noeud is apex_application_global.vc_arr2;

  function obten_arbre (pnu_numr_apex_regn in number)
    return vd_i_afw_12_arbre.seqnc%type;

  procedure initl_arbre (pnu_numr_apex_regn in number);

  procedure ajout_liste_noeud (pnu_numr_apex_regn   in number
                              ,pta_liste_noeud      in tab_noeud
                              ,pnu_utils            in vd_i_afw_12_utils.seqnc%type default null
                              ,pnu_sesn             in vd_i_afw_12_sesn.id_sesn%type default null);

  procedure fermr_liste_noeud (pnu_numr_apex_regn   in number
                              ,pta_liste_noeud      in tab_noeud
                              ,pnu_utils            in vd_i_afw_12_utils.seqnc%type default null
                              ,pnu_sesn             in vd_i_afw_12_sesn.id_sesn%type default null);

  procedure ouvri_noeud (pnu_numr_apex_regn   in number
                        ,pva_noeud            in varchar2
                        ,pnu_utils            in vd_i_afw_12_utils.seqnc%type default null
                        ,pnu_sesn             in vd_i_afw_12_sesn.id_sesn%type default null);

  procedure fermr_noeud (pnu_numr_apex_regn   in number
                        ,pva_noeud            in varchar2
                        ,pnu_utils            in vd_i_afw_12_utils.seqnc%type default null
                        ,pnu_sesn             in vd_i_afw_12_sesn.id_sesn%type default null);

  function verfr_presn (pnu_numr_apex_regn in number)
    return boolean;

  function verfr_presn_sesn
    return boolean;

  function obten_indic_rafrc (pnu_numr_apex_regn in number)
    return vd_i_afw_12_arbre.indic_rafrc%type;

  procedure forcr_rafrc (pnu_numr_apex_regn   in number
                        ,pnu_utils            in number default null);

  procedure rafrc_efect (pnu_numr_apex_regn   in number
                        ,pnu_utils            in number default null);

  function obten_noeud_actif
    return varchar2;
end afw_12_arbre_pkg;
/
