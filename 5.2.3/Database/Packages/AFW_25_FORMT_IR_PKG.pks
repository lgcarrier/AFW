SET DEFINE OFF;
create or replace package afw_25_formt_ir_pkg
is
  knu_porte_ligne   constant varchar2 (5) default 'LIGNE';
  knu_porte_coln    constant varchar2 (5) default 'COLN';

  knu_propr_oui     constant varchar2 (1) default 'O';
  knu_propr_non     constant varchar2 (1) default 'N';

  type typ_formt is record
  (
    indic_ligne   boolean
   ,indic_gras    boolean
  );

  function obten_bals_formt (pva_porte   in varchar2
                            ,pva_gras    in varchar2
                            ,pva_coulr   in varchar2 default null)
    return varchar2;

  function digr_bals_formt (pva_bals in varchar2)
    return typ_formt;
end afw_25_formt_ir_pkg;
/
