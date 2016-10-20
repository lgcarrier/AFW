SET DEFINE OFF;
create or replace package afw_12_aprob_pkg
as
  function obten_group_stat (pnu_seqnc in number)
    return number;

  function duplq_aprob (pnu_aprob              in number
                       ,pnu_group_stat_destn   in number)
    return number;

  procedure duplq_aprob (pnu_aprob              in number
                        ,pnu_group_stat_destn   in number);

  function duplq_role_aprob (pnu_role_aprob         in number
                            ,pnu_group_stat_destn   in number)
    return number;

  procedure duplq_role_aprob (pnu_role_aprob         in number
                             ,pnu_group_stat_destn   in number);

  procedure creer_insta_role_aprob (pnu_role_aprob          in number
                                   ,pnu_insta_procs_aprob   in number
                                   ,pnu_aprob               in number);

  procedure defnr_aprob_role (pnu_role_aprob   in number
                             ,pva_aprob        in varchar2);
end afw_12_aprob_pkg;
/
