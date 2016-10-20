SET DEFINE OFF;
create or replace package afw_13_regn_piltb_pkg
as
  function obten_contn_page_courn (pva_code                    in varchar2
                                  ,pva_code_lang               in varchar2 default null
                                  ,pva_indic_etend_page_zero   in varchar2 default 'N')
    return clob;

  procedure afich_contn_page_courn (pva_code                    in varchar2
                                   ,pva_code_lang               in varchar2 default null
                                   ,pva_indic_etend_page_zero   in varchar2 default 'N');

  function obten_contn_aide_page (pnu_page   in number
                                 ,pnu_lang   in number)
    return clob;

  procedure afich_contn_aide_page (pnu_page   in number
                                  ,pnu_lang   in number);
end afw_13_regn_piltb_pkg;
/
