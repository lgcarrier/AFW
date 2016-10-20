SET DEFINE OFF;
create or replace force view vd_i_afw_23_modl_rechr
(
  seqnc
 ,code
 ,ref_domn
 ,nom
 ,descr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,ref_domn
        ,nom
        ,descr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_23_modl_rechr
/
