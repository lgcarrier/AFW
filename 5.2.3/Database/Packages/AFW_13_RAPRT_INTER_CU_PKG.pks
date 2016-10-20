SET DEFINE OFF;
create or replace package afw_13_raprt_inter_cu_pkg
  authid current_user
is
  type typ_seqnc_reprt_courn is table of number (10);

  --Important : la vue vs_afw_13_seqnc_ir_courn doit être déployée dans le schéma de l'application
  procedure defnr_ir_specf (pnu_page_apex   in number
                           ,pva_code_ir     in varchar2 default null);

  function obten_seqnc_raprt_courn
    return typ_seqnc_reprt_courn
    pipelined;
end afw_13_raprt_inter_cu_pkg;
/
