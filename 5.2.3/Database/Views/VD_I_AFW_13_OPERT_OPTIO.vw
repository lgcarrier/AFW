SET DEFINE OFF;
create or replace force view vd_i_afw_13_opert_optio
(
  seqnc
 ,ref_opert
 ,code
 ,nom
 ,descr
 ,dnr_ref_prodt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,prepn
)
as
  select seqnc
        ,ref_opert
        ,code
        ,nom
        ,descr
        ,dnr_ref_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,prepn
    from afw_13_opert_optio
/
