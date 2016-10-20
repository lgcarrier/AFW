SET DEFINE OFF;
create or replace force view vd_i_afw_01_mesg_lang
(
  seqnc
 ,mesg
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_lang
 ,ref_mesg
 ,dnr_ref_prodt
)
as
  select seqnc
        ,mesg
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_lang
        ,ref_mesg
        ,dnr_ref_prodt
    from afw_01_mesg_lang
/
