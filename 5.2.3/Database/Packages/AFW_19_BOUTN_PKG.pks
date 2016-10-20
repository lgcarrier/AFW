SET DEFINE OFF;
create or replace package afw_19_boutn_pkg
as
  gbo_prise_charg       boolean := false;

  gva_mesg_aide_contx   varchar2 (4000);

  procedure defnr_varbl_sesn;
end afw_19_boutn_pkg;
/
