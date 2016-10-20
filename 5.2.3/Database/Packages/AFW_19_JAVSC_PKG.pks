SET DEFINE OFF;
create or replace package afw_19_javsc_pkg
as
  gbo_prise_charg   boolean;

  gva_fonct_javsc   varchar2 (4000);

  function obten_furtr_indic_inter
    return varchar2;

  procedure ajout_scrip_charg;
end afw_19_javsc_pkg;
/
