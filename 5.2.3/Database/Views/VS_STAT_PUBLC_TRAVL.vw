SET DEFINE OFF;
create or replace force view vs_stat_publc_travl
(
  d
 ,r
)
as
    select s.nom d
          ,s.seqnc r
      from vd_afw_12_stat s
     where ref_struc_aplic_formt = 'PUBLC_TRAVL'
  order by ordre
/
