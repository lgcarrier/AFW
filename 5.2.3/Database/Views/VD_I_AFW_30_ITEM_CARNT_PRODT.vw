SET DEFINE OFF;
create or replace force view vd_i_afw_30_item_carnt_prodt
(
  seqnc
 ,nom
 ,descr
 ,ref_carnt_prodt
 ,ref_dv_prior
 ,ref_stat
 ,ref_dv_tail_reltv
 ,ref_cas_utils
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,nom
        ,descr
        ,ref_carnt_prodt
        ,ref_dv_prior
        ,ref_stat
        ,ref_dv_tail_reltv
        ,ref_cas_utils
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_30_item_carnt_prodt
/
