SET DEFINE OFF;
create or replace package afw_19_fonct_pkg
as
  function obten_nom_lang (pnu_fonct   in number
                          ,pnu_lang    in number default null)
    return varchar2;

  function obten_descr_lang (pnu_fonct   in number
                            ,pnu_lang    in number default null)
    return varchar2;

  function obten_afich_atrib (pnu_dispn_fonct   in number
                             ,pva_atrib         in varchar2)
    return boolean;

  function obten_titre_atrib (pnu_dispn_fonct   in number
                             ,pnu_item_id       in number)
    return varchar2;

  function obten_url_impre
    return varchar2;

  function obten_url_enreg_precd
    return varchar2;

  function obten_url_enreg_suivn
    return varchar2;

  function obten_url_premr_enreg
    return varchar2;

  function obten_url_dernr_enreg
    return varchar2;

  procedure obten_aide_cle_fonct (pnu_sidf   in number
                                 ,pnu_lang   in number);

  function obten_fonct (pva_code in varchar2)
    return number;

  procedure desct_fonct (pva_code in varchar2);

  procedure obten_avert_fonct_non_dispn (pnu_sidf   in number
                                        ,pnu_lang   in number);
end afw_19_fonct_pkg;
/
