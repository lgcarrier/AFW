SET DEFINE OFF;
create or replace package afw_05_forml_noyau_pkg
  authid current_user
as
  gva_varbl_varch   varchar2 (4000);
  gnu_varbl_numbr   number;
  gda_varbl_date    date;

  function resdr_condt_simple_booln (pva_forml in varchar2)
    return boolean;
end afw_05_forml_noyau_pkg;
/
