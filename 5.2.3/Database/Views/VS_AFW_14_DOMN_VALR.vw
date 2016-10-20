SET DEFINE OFF;
create or replace force view vs_afw_14_domn_valr
(
  code
 ,ref_prodt
 ,code_valr
 ,valr
)
as
  select dv.code
        ,dv.ref_prodt
        ,ddv.code_valr
        ,ddvl.valr
    from vd_i_afw_14_domn_valr      dv
        ,vd_i_afw_14_detl_domn_valr ddv
        ,vd_i_afw_14_ddv_lang       ddvl
   where     ddv.ref_domn_valr = dv.seqnc
         and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
         and ddvl.ref_detl_domn_valr = ddv.seqnc
         and ddvl.ref_lang = sys_context ('ctx_infor_sesn'
                                         ,'vnu_seqnc_lang')
/
