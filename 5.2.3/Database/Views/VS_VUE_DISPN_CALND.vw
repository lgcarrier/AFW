SET DEFINE OFF;
create or replace force view vs_vue_dispn_calnd
(
  d
 ,r
)
as
  select valr  d
        ,seqnc r
    from vd_afw_14_detl_domn_valr
   where ref_code_domn_valr_formt = 'VUE_DISPN_CALND'
/
