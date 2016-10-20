SET DEFINE OFF;
create or replace package afw_12_sesn_pkg
is
  function obten_sesn
    return number;

  procedure creat_sesn (pva_code_utils        in varchar2
                       ,pnu_numr_apex_aplic   in number
                       ,pnu_numr_apex_page    in number);

  procedure suprm_sesn (pnu_numr_apex_aplic in number);
end afw_12_sesn_pkg;
/
