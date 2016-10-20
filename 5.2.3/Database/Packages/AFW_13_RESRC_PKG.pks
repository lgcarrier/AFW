SET DEFINE OFF;
create or replace package afw_13_resrc_pkg
as
  function obten_chemn_resrc (pva_propr        in varchar2
                             , --PRODT|STRUC_APLIC|PLUGN
                              pva_code_resrc   in varchar2
                             ,pva_code_formt   in varchar2
                             ,pva_code_ocurn   in varchar2 default null)
    return varchar2;
end afw_13_resrc_pkg;
/
