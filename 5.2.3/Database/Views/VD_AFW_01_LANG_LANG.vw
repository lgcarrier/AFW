SET DEFINE OFF;
create or replace force view vd_afw_01_lang_lang
(
  seqnc
 ,ref_lang
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_lang_cible
)
as
  select seqnc
        ,ref_lang
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_lang_cible
    from vd_i_afw_01_lang_lang
/
