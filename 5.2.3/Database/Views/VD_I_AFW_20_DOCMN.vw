SET DEFINE OFF;
create or replace force view vd_i_afw_20_docmn
(
  seqnc
 ,ref_prodt_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_aplic
 ,ref_seqnc_struc_aplic
)
as
  select seqnc
        ,ref_prodt_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_struc_aplic
        ,ref_seqnc_struc_aplic
    from afw_20_docmn
/
