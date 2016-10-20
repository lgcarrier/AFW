SET DEFINE OFF;
create or replace package afw_20_modl_pkg
as
  function obten_indic (pva_valr in varchar2)
    return varchar2;

  procedure maj_modls_refrn (pnu_versn_prodt in number default null);

  function detrm_fonct (pva_nom_packg    in varchar2
                       ,pva_nom_objet    in varchar2
                       ,pnu_numr_surch   in number)
    return boolean;

  function detrm_fonct_numbr (pva_nom_packg    in varchar2
                             ,pva_nom_objet    in varchar2
                             ,pnu_numr_surch   in number)
    return number;

  function detrm_type_don (pva_type_don in varchar2)
    return number;

  function long_to_vc2 (pva_objet_id   in varchar2
                       ,pnu_subpr_id   in number
                       ,pnu_seqnc      in number)
    return varchar2;

  function obten_modl_formt (pnu_seqnc in number)
    return varchar2;

  function obten_propr_sous_modl_formt (pnu_seqnc in number)
    return varchar2;

  function obten_modl_parmt_formt (pnu_seqnc in number)
    return varchar2;
end afw_20_modl_pkg;
/
