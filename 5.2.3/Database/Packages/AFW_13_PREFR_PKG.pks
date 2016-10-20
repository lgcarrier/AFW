SET DEFINE OFF;
create or replace package afw_13_prefr_pkg
as
  gva_valr   varchar2 (4000);

  procedure sauvg_prefr_page (pnu_ref_aplic        in number default null
                             ,pnu_numr_page_apex   in number default null);

  procedure charg_prefr_page (pnu_ref_aplic        in number default null
                             ,pnu_numr_page_apex   in number default null);

  procedure sauvg_prefr (pnu_ref_prefr   in number
                        ,pva_valr        in varchar2);

  function obten_boutn_actio_prefr
    return varchar2;
end afw_13_prefr_pkg;
/
