SET DEFINE OFF;
create or replace force view vd_afw_01_atrib_modl_comnc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_modl_comnc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_modl_comnc
    from vd_i_afw_01_atrib_modl_comnc
/
