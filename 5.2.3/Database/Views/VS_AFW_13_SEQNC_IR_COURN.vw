SET DEFINE OFF;
create or replace force view vs_afw_13_seqnc_ir_courn (seqnc)
as
  select column_value seqnc
    from table (afw_13_raprt_inter_cu_pkg.obten_seqnc_raprt_courn)
/
