SET DEFINE OFF;
create or replace package afw_11_versn_pkg
is
  function obten_numr_versn (pnu_versn_niv_1   in number
                            ,pnu_versn_niv_2   in number
                            ,pnu_versn_niv_3   in number
                            ,pnu_versn_niv_4   in number)
    return number
    deterministic;

  function obten_versn (pnu_versn_niv_1   in number
                       ,pnu_versn_niv_2   in number
                       ,pnu_versn_niv_3   in number
                       ,pnu_versn_niv_4   in number)
    return varchar2
    deterministic;

  function obten_seqnc_versn_courn_prodt (pnu_seqnc_prodt in number)
    return varchar2
    deterministic;

  function obten_seqnc_versn_courn_aplic (pnu_seqnc_aplic in number)
    return varchar2
    deterministic;

  procedure copr_entit (pnu_versn_sourc   in number
                       ,pnu_versn_destn   in number);

  procedure creer_versn_aplic (pnu_seqnc        in number
                              ,pnu_versn_niv1   in number
                              ,pnu_versn_niv2   in number
                              ,pnu_versn_niv3   in number default 0
                              ,pnu_versn_niv4   in number default 0
                              ,pva_code         in varchar2 default null);

  procedure creer_versn_prodt (pnu_seqnc        in number
                              ,pnu_versn_niv1   in number
                              ,pnu_versn_niv2   in number
                              ,pnu_versn_niv3   in number default 0
                              ,pnu_versn_niv4   in number default 0
                              ,pva_code         in varchar2 default null);

  procedure creer_versn_plugn (pnu_seqnc        in number
                              ,pnu_versn_niv1   in number
                              ,pnu_versn_niv2   in number
                              ,pnu_versn_niv3   in number default 0
                              ,pnu_versn_niv4   in number default 0
                              ,pva_code         in varchar2 default null);

  procedure creer_versn_aplic_base (pnu_aplic in number);
end afw_11_versn_pkg;
/
