SET DEFINE OFF;
create or replace force view vd_i_afw_20_sectn_docmn
(
  seqnc
 ,ref_dv_type_sectn
 ,ref_sectn_docmn
 ,ref_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom
 ,titre
 ,descr
 ,ref_formt
)
as
  select seqnc
        ,ref_dv_type_sectn
        ,ref_sectn_docmn
        ,ref_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,nom
        ,titre
        ,descr
        ,ref_formt
    from afw_20_sectn_docmn
/
