SET DEFINE OFF;
create or replace force view vs_stat_comnc_entra
(
  d
 ,r
 ,o
)
as
  select nom   d
        ,seqnc r
        ,ordre o
    from vd_afw_12_stat
   where ref_struc_aplic_formt = 'COMNC_ENTRA'
/
