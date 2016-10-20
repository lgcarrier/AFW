SET DEFINE OFF;
create or replace force view vd_afw_12_tutrl
(
  seqnc
 ,ref_utils
 ,ref_tutrl
 ,ref_etape_tutrl
 ,date_creat
 ,utils_creat
)
as
  select seqnc
        ,ref_utils
        ,ref_tutrl
        ,ref_etape_tutrl
        ,date_creat
        ,utils_creat
    from vd_i_afw_12_tutrl tu
/
