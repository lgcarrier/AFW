SET DEFINE OFF;
create or replace package afw_20_docmn_pkg
as
  function obten_sect_simpl_docmn (pva_code_struc_aplic    in varchar2
                                  ,pnu_seqnc_struc_aplic   in number
                                  ,pva_code_sectn_docmn    in varchar2)
    return varchar2;

  procedure creer_detl_docmn;

  function formt_propr_docmn (pnu_docmn in number)
    return varchar2;
end afw_20_docmn_pkg;
/
