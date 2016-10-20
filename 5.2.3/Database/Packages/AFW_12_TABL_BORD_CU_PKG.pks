SET DEFINE OFF;
create or replace package afw_12_tabl_bord_cu_pkg
  authid current_user
is
  /* Fonctions d'obtentions de valeurs de paramètres depuis sequence*/
  function obten_valr_parmt_date (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return date;

  function obten_valr_parmt_numbr (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return number;

  function obten_valr_parmt_boln (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return boolean;

  function obten_valr_parmt_boln_vc (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return varchar2;

  function obten_valr_parmt_varch (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return varchar2;

  function obten_valr_parmt_list_m (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return varchar2;

  function obten_valr_parmt_list_s (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return varchar2;

  /* Fonctions d'obtentions de valeurs de paramètres depuis widget*/
  function obten_valr_parmt_date (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                 ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return date;

  function obten_valr_parmt_numbr (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                  ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return number;

  function obten_valr_parmt_boln (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                 ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return boolean;

  function obten_valr_parmt_boln_vc (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                    ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return varchar2;

  function obten_valr_parmt_varch (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                  ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return varchar2;

  function obten_valr_parmt_list_m (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                   ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return varchar2;

  function obten_valr_parmt_list_s (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                   ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return varchar2;

  function obten_valr_parmt_afich (pnu_seqnc_lgup      in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type
                                  ,pva_type_don_code   in varchar2)
    return varchar2;
end afw_12_tabl_bord_cu_pkg;
/
