SET DEFINE OFF;
create or replace package afw_07_polc_pkg
as
  procedure defnr_contx_sesn_seqnc_sesn (pnu_sesn in number);

  procedure defnr_contx_sesn_code_utils (pva_code_utils in varchar2);

  procedure defnr_contx_sesn_seqnc_utils (pnu_seqnc_utils in number);

  procedure defnr_contx_sesn_code_prodt (pva_code_prodt in varchar2);

  procedure defnr_contx_sesn_seqnc_prodt (pnu_seqnc_prodt in number);

  procedure defnr_contx_sesn_code_aplic (pva_code_aplic in varchar2);

  procedure defnr_contx_sesn_seqnc_aplic (pnu_seqnc_aplic in number);

  procedure defnr_contx_sesn_code_lang (pva_code_lang in varchar2);

  procedure defnr_contx_sesn_seqnc_lang (pnu_seqnc_lang in number);

  procedure defnr_contx_sesn_numr_aplic (pnu_numr_aplic in number);

  procedure defnr_contx_sesn_seqnc_page (pnu_seqnc_page in number);

  procedure defnr_contx_sesn_numr_page (pnu_numr_page in number);

  procedure defnr_contx_sesn_sidf (pnu_sidf in number);

  function obten_chain_contx_seqnc_sesn
    return varchar2;

  function obten_chain_contx_code_utils
    return varchar2;

  function obten_chain_contx_seqnc_utils
    return varchar2;

  function obten_chain_contx_code_prodt
    return varchar2;

  function obten_chain_contx_seqnc_prodt
    return varchar2;

  function obten_chain_contx_code_aplic
    return varchar2;

  function obten_chain_contx_seqnc_aplic
    return varchar2;

  function obten_chain_contx_code_lang
    return varchar2;

  function obten_chain_contx_seqnc_lang
    return varchar2;

  function obten_chain_contx_numr_aplic
    return varchar2;

  function obten_chain_contx_seqnc_page
    return varchar2;

  function obten_chain_contx_numr_page
    return varchar2;

  function obten_chain_contx_sidf
    return varchar2;

  function obten_valr_contx_seqnc_sesn
    return number;

  function obten_valr_contx_code_utils
    return varchar2;

  function obten_valr_contx_seqnc_utils
    return number;

  function obten_valr_contx_code_prodt
    return varchar2;

  function obten_valr_contx_seqnc_prodt
    return number;

  function obten_valr_contx_code_aplic
    return varchar2;

  function obten_valr_contx_seqnc_aplic
    return number;

  function obten_valr_contx_code_lang
    return varchar2;

  function obten_valr_contx_seqnc_lang
    return number;

  function obten_valr_contx_numr_aplic
    return number;

  function obten_valr_contx_seqnc_page
    return number;

  function obten_valr_contx_numr_page
    return number;

  function obten_valr_contx_sidf
    return number;

  procedure initl_contx;
end afw_07_polc_pkg;
/
