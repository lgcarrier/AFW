SET DEFINE OFF;
create or replace package afw_14_formt_pkg
as
  function to_char2 (pnu_valr    in number
                    ,pva_formt   in varchar2)
    return varchar2;

  function to_number2 (pva_valr    in varchar2
                      ,pva_formt   in varchar2 default null)
    return number;

  function obten_seqnc (pva_defnt_formt   in varchar2
                       ,pva_code_prodt    in varchar2 default afw_11_prodt_pkg.obten_code_prodt)
    return number;
end afw_14_formt_pkg;
/
