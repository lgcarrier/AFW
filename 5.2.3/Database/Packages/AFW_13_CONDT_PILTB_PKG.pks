SET DEFINE OFF;
create or replace package afw_13_condt_piltb_pkg
as
  vbo_en_charg   boolean default false;

  function obten_indic_lectr_seul_cas (pva_code_cas in varchar2)
    return varchar2;

  function obten_lectr_seul_cas (pva_code_cas in varchar2)
    return boolean;

  function verfr_condt_retn (pva_code_condt in varchar2)
    return boolean;

  function verfr_condt_retn_va (pva_code_condt in varchar2)
    return varchar2;

  function obten_indic_lectr_seul
    return varchar2;

  function obten_lectr_seul
    return boolean;

  function obten_lectr_seul (pva_nom_item in varchar2)
    return boolean;

  function obten_afich (pva_nom_item in varchar2)
    return boolean;

  function obten_lectr_seul_va (pva_nom_item in varchar2)
    return varchar2;

  function obten_afich_va (pva_nom_item in varchar2)
    return varchar2;

  procedure cachr_tous_boutn;

  procedure lectr_seule_tout;

  procedure defn_contx_exect_page;

  procedure ajout_lien_cas_lectr (pnu_seqnc_cas   in number
                                 ,pnu_page        in number);

  procedure ajout_lien_cas_lectr_item (pnu_item    in number
                                      ,pnu_page    in number
                                      ,pnu_aplic   in number default afw_04_contx_pkg.obten_seqnc_contx ('APLIC'));
end afw_13_condt_piltb_pkg;
/
