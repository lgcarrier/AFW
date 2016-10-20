SET DEFINE OFF;
create or replace package afw_01_lang_pkg
as
  function obten_lang (pva_code in varchar2)
    return number;

  function obten_lang_sesn (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default afw_11_prodt_pkg.obten_prodt_sesn ())
    return number;

  function obten_code_lang_sesn (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default afw_11_prodt_pkg.obten_prodt_sesn ())
    return varchar2;

  function obten_lang_formt (pnu_lang         in number
                            ,pnu_lang_cible   in number)
    return vd_i_afw_01_lang_lang.nom%type;

  function obten_lang_formt (pva_code_lang         in varchar2
                            ,pva_code_lang_cible   in varchar2)
    return vd_i_afw_01_lang_lang.nom%type;

  function obten_code_lang (pnu_lang in number)
    return varchar2;

  procedure defnr_lang_sesn;

  function obten_lang_furtr
    return varchar2;

  function obten_lang_aplic_deft
    return varchar2;
end afw_01_lang_pkg;
/
