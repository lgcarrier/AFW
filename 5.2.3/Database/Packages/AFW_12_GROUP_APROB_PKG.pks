SET DEFINE OFF;
create or replace package afw_12_group_aprob_pkg
as
  function obten_group_stat (pnu_seqnc in number)
    return number;

  procedure lier_aprob (pnu_aprob         in number
                       ,pnu_group_aprob   in number
                       ,pnu_ref_domn      in number default null);

  function duplq_group_aprob (pnu_group_aprob        in number
                             ,pnu_group_stat_destn   in number)
    return number;

  procedure duplq_group_aprob (pnu_group_aprob        in number
                              ,pnu_group_stat_destn   in number);
end afw_12_group_aprob_pkg;
/
