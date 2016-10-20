SET DEFINE OFF;
create or replace force view vd_afw_04_tutrl
(
  seqnc
 ,ref_sesn
 ,ref_tutrl
 ,timst
 ,date_creat
 ,utils_creat
)
as
  select seqnc
        ,ref_sesn
        ,ref_tutrl
        ,timst
        ,date_creat
        ,utils_creat
    from vd_i_afw_04_tutrl tu
   where tu.ref_sesn = afw_12_sesn_pkg.obten_sesn
/
