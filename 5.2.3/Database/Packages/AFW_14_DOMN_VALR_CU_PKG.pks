SET DEFINE OFF;
create or replace package afw_14_domn_valr_cu_pkg
  authid current_user
as
  type rec_valr is record
  (
    d   varchar2 (4000)
   ,r   varchar2 (4000)
  );

  type table_rec_valr is table of rec_valr;

  function obten_valr (pva_code_domn    in varchar2
                      ,pva_code_valr    in varchar2
                      ,pva_code_prodt   in varchar2 default null)
    return varchar2;

  function obten_table_valr (pnu_seqnc_domn_valr   in number
                            ,pva_valr_code         in varchar2 default 'N')
    return table_rec_valr
    pipelined;
end afw_14_domn_valr_cu_pkg;
/
