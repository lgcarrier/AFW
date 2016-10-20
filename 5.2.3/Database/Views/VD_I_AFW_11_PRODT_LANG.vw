SET DEFINE OFF;
create or replace force view vd_i_afw_11_prodt_lang
(
  seqnc
 ,ref_prodt
 ,ref_lang
 ,indic_deft
 ,ordre_presn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,ref_lang
        ,indic_deft
        ,ordre_presn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_11_prodt_lang
/
