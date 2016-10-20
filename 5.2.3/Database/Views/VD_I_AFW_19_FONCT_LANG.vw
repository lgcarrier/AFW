SET DEFINE OFF;
create or replace force view vd_i_afw_19_fonct_lang
(
  seqnc
 ,nom
 ,ref_lang
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_fonct
)
as
  select seqnc
        ,nom
        ,ref_lang
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_fonct
    from afw_19_fonct_lang
/
