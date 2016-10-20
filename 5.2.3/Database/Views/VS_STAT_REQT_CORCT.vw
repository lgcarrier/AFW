SET DEFINE OFF;
create or replace force view vs_stat_reqt_corct
(
  d
 ,r
 ,o
 ,code
)
as
  select nom   d
        ,seqnc r
        ,ordre o
        ,code  code
    from vd_afw_12_stat
   where ref_struc_aplic_formt = 'REQT_CORCT'
/
