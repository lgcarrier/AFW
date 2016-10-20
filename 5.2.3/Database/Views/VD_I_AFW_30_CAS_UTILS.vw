SET DEFINE OFF;
create or replace force view vd_i_afw_30_cas_utils
(
  seqnc
 ,code
 ,nom
 ,descr
 ,docmn_refrc
 ,ref_carnt_prodt
 ,ref_stat
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_utils_respn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,docmn_refrc
        ,ref_carnt_prodt
        ,ref_stat
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_utils_respn
    from afw_30_cas_utils
/
