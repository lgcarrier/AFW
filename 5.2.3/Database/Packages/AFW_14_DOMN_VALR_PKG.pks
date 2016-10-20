SET DEFINE OFF;
create or replace package afw_14_domn_valr_pkg
as
  gbo_copie_domn   boolean default false;

  type rec_valr is record
  (
    d   varchar2 (4000)
   ,r   varchar2 (4000)
  );

  type table_rec_valr is table of rec_valr;

  function obten_valr (pnu_seqnc_valr in number)
    return varchar2
    result_cache;

  function obten_valr_court (pnu_seqnc_valr in number)
    return varchar2
    result_cache;

  function obten_code (pnu_seqnc_valr in number)
    return varchar2
    result_cache;

  function obten_code_parnt (pnu_seqnc_valr in number)
    return varchar2
    result_cache;

  function obten_seqnc_domn (pva_code_domn    in varchar2
                            ,pva_code_prodt   in varchar2 default afw_11_prodt_pkg.obten_code_prodt (afw_11_prodt_pkg.obten_prodt_sesn ()))
    return number;

  function obten_seqnc (pva_code_domn    in varchar2
                       ,pva_code_valr    in varchar2
                       ,pva_code_prodt   in varchar2 default afw_11_prodt_pkg.obten_code_prodt (afw_11_prodt_pkg.obten_prodt_sesn ()))
    return number;

  function obten_valr (pva_code_domn    in varchar2
                      ,pva_code_valr    in varchar2
                      ,pva_code_prodt   in varchar2 default afw_11_prodt_pkg.obten_code_prodt (afw_11_prodt_pkg.obten_prodt_sesn ()))
    return varchar2
    result_cache;

  function obten_valr_organ (pnu_seqnc_valr in number)
    return varchar2
    result_cache;

  function copr_domn_valr (pnu_domn_a_copr   in number
                          ,pnu_prodt_sourc   in number default null
                          ,pnu_prodt_destn   in number default null)
    return number;

  function obten_enonc_sql (pnu_seqnc_domn_valr in number)
    return varchar2;

  function obten_table_valr (pnu_seqnc_domn_valr   in number
                            ,pva_valr_code         in varchar2 default 'N')
    return table_rec_valr
    pipelined;
end afw_14_domn_valr_pkg;
/
