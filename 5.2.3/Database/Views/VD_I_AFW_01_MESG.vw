SET DEFINE OFF;
create or replace force view vd_i_afw_01_mesg
(
  seqnc
 ,numr_mesg
 ,ref_prodt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,descr
 ,type_mesg
 ,dnr_ref_prodt
)
as
  select seqnc
        ,numr_mesg
        ,ref_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,descr
        ,type_mesg
        ,dnr_ref_prodt
    from afw_01_mesg
/
