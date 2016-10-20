SET DEFINE OFF;
create or replace force view vd_afw_25_engin_versn_publc
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_versn_publc
 ,ref_engin
 ,ref_code_engin
 ,iden_acces
 ,pdf_fusn
 ,html_base
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_versn_publc
        ,ref_engin
        , (select code
             from vd_afw_25_engin
            where seqnc = ref_engin)
        ,iden_acces
        ,pdf_fusn
        ,html_base
    from vd_i_afw_25_engin_versn_publc
/
