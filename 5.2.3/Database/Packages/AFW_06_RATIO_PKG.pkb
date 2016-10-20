SET DEFINE OFF;
create or replace package body afw_06_ratio_pkg
is
  function resdr_ratio (pnu_valr    in number
                       ,pva_ratio   in varchar2)
    return number
  is
  begin
    execute immediate
         '
      begin
        afw_05_forml_noyau_pkg.gnu_varbl_numbr := ('
      || pva_ratio
      || ') * :2;
      end;
      '
      using pnu_valr;

    return afw_05_forml_noyau_pkg.gnu_varbl_numbr;
  end resdr_ratio;
end afw_06_ratio_pkg;
/
