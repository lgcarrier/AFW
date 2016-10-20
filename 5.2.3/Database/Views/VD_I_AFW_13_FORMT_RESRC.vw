SET DEFINE OFF;
create or replace force view vd_i_afw_13_formt_resrc
(
  seqnc
 ,code
 ,ref_prodt
 ,descr
 ,ref_type_fichr
 ,largr
 ,hautr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,ref_prodt
        ,descr
        ,ref_type_fichr
        ,largr
        ,hautr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,nom
        ,dnr_ref_prodt
    from afw_13_formt_resrc
/
