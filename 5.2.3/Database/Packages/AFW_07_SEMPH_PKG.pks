SET DEFINE OFF;
create or replace package afw_07_semph_pkg
is
  semph_non_dispn   exception;

  function verfr_semph (pva_code          in varchar2
                       ,pva_varbl1        in varchar2
                       ,pva_varbl2        in varchar2
                       ,pva_varbl3        in varchar2
                       ,pva_indic_exclu   in varchar2 default 'N')
    return boolean;

  function obten_propr_semph_exclu (pva_code     in varchar2
                                   ,pva_varbl1   in varchar2
                                   ,pva_varbl2   in varchar2
                                   ,pva_varbl3   in varchar2)
    return varchar2;

  procedure obten_semph (pva_code          in varchar2
                        ,pva_varbl1        in varchar2
                        ,pva_varbl2        in varchar2
                        ,pva_varbl3        in varchar2
                        ,pva_indic_exclu   in varchar2 default 'N'
                        ,pnu_temps_atent   in number default 5
                        ,pva_page_perst    in varchar2 default null);

  function obten_semph (pva_code          in varchar2
                       ,pva_varbl1        in varchar2
                       ,pva_varbl2        in varchar2
                       ,pva_varbl3        in varchar2
                       ,pva_indic_exclu   in varchar2 default 'N'
                       ,pnu_temps_atent   in number default 5
                       ,pva_page_perst    in varchar2 default null)
    return number;

  procedure suprm_semph (pva_code     in varchar2
                        ,pva_varbl1   in varchar2
                        ,pva_varbl2   in varchar2
                        ,pva_varbl3   in varchar2);

  procedure suprm_semph (pnu_seqnc in number);

  procedure libr_semph_perst_page;
end afw_07_semph_pkg;
/
