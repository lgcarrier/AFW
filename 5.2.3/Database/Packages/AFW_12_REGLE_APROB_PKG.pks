SET DEFINE OFF;
create or replace package afw_12_regle_aprob_pkg
as
  procedure creer_regle_aprob (pnu_evolt_stat    in number
                              ,pnu_aprob         in number
                              ,pnu_group_aprob   in number
                              ,pnu_role_aprob    in number default null);

  procedure maj_regle_aprob (pnu_evolt_stat    in number
                            ,pva_aprob         in varchar2
                            ,pva_group_aprob   in varchar2
                            ,pva_role_aprob    in varchar2
                            ,pnu_domn          in number default null);

  function obten_regle_aprob_evolt_stat (pnu_evolt_stat          in number
                                        ,pva_indic_aprob         in varchar default 'O'
                                        ,pva_indic_group_aprob   in varchar2 default 'O'
                                        ,pva_indic_role_aprob    in varchar2 default 'O'
                                        ,pva_seprt               in varchar2 default ':')
    return varchar2;

  function obten_aprob_evolt_stat (pnu_evolt_stat   in number
                                  ,pva_seprt        in varchar2 default ':')
    return varchar2;

  function obten_group_aprob_evolt_stat (pnu_evolt_stat   in number
                                        ,pva_seprt        in varchar2 default ':')
    return varchar2;

  function obten_role_aprob_evolt_stat (pnu_evolt_stat   in number
                                       ,pva_seprt        in varchar2 default ':')
    return varchar2;

  function obten_stat (pnu_regle_aprob in number)
    return number;

  function verfr_presn_regle (pnu_insta_procs_aprob   in number
                             ,pnu_evolt_stat          in number)
    return varchar2;

  procedure exect_evolt_stat (pnu_insta_procs_aprob   in number
                             ,pnu_evolt_stat          in number);
end afw_12_regle_aprob_pkg;
/
