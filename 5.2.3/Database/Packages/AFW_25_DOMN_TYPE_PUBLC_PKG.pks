SET DEFINE OFF;
create or replace package afw_25_domn_type_publc_pkg
is
  procedure ajout_domn_type_publc (pnu_domn   in number
                                  ,pnu_type   in number);

  procedure maj_domn_type_publc;

  procedure creat_domn_type_publc (pnu_domn_type_publc   in number
                                  ,pnu_domn_cible        in number);
end afw_25_domn_type_publc_pkg;
/
