SET DEFINE OFF;
create or replace force view vd_i_afw_01_mesg_tradc_apex
(
  seqnc
 ,nom
 ,text
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_lang
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,nom
        ,text
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_lang
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_01_mesg_tradc_apex
/
