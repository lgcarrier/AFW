SET DEFINE OFF;
create or replace force view vd_i_afw_04_tutrl
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
    from afw_04_tutrl tu
/
