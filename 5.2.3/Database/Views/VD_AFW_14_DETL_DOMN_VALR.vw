SET DEFINE OFF;
create or replace force view vd_afw_14_detl_domn_valr
(
  seqnc
 ,code_valr
 ,valr
 ,ref_domn_valr
 ,ref_code_domn_valr_formt
 ,seqnc_presn
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,valr_court
 ,valr_organ
 ,ref_prodt_dv
)
as
  select ddv.seqnc
        ,ddv.code_valr
        ,ddvl.valr
        ,ddv.ref_domn_valr
        ,dv.code      ref_code_domn_valr_formt
        ,ddv.seqnc_presn
        ,ddv.date_debut_efect
        ,ddv.date_fin_efect
        ,ddv.date_creat
        ,ddv.utils_creat
        ,ddv.date_modfc
        ,ddv.utils_modfc
        ,ddvl.valr_court
        ,ddvl.valr_organ
        ,dv.ref_prodt ref_prodt_dv
    from vd_i_afw_14_domn_valr      dv
        ,vd_i_afw_14_detl_domn_valr ddv
        ,vd_i_afw_14_ddv_lang       ddvl
   where     ddv.ref_domn_valr = dv.seqnc
         and ddvl.ref_detl_domn_valr = ddv.seqnc
         and ddvl.ref_lang = sys_context ('ctx_infor_sesn'
                                         ,'vnu_seqnc_lang')
/
