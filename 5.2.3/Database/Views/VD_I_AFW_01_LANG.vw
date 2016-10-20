SET DEFINE OFF;
create or replace force view vd_i_afw_01_lang
(
  seqnc
 ,code
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_01_lang
/
