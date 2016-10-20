SET DEFINE OFF;
create or replace package afw_18_itf_pkg
is
  procedure desct_forml_tablr;

  procedure defnr_ligne_titre (pva_code_titre   in varchar2
                              ,pva_type_champ   in varchar2 default 'hidden');

  procedure cachr_champ (pva_code         in varchar2
                        ,pnu_declg        in number
                        ,pva_type_champ   in varchar2 default 'hidden');
end afw_18_itf_pkg;
/
