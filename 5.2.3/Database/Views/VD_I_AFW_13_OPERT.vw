SET DEFINE OFF;
create or replace force view vd_i_afw_13_opert
(
  seqnc
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,code
 ,dnr_ref_prodt
 ,ref_fonct
)
as
  select seqnc
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,code
        ,dnr_ref_prodt
        ,ref_fonct
    from afw_13_opert
/
