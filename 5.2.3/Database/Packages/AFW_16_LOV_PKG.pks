SET DEFINE OFF;
create or replace package afw_16_lov_pkg
  authid current_user
as
  gva_selct        varchar2 (32500);
  gva_valr_rechr   varchar2 (1000);
  gva_afich        varchar2 (4000);

  function obten_valr_rechr
    return varchar2
    deterministic;

  function obten_afich_par_valr (pva_lov     in varchar2
                                ,pva_valr    in varchar2
                                ,pva_seprt   in varchar2 default ':')
    return varchar2;

  function obten_lov_item (pnu_seqnc_item in number)
    return varchar2;
end afw_16_lov_pkg;
/
