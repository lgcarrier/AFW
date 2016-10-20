SET DEFINE OFF;
create or replace force view vd_afw_19_fonct_lang
(
  seqnc
 ,nom
 ,ref_lang
 ,ref_lang_formt
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
        ,afw_01_lang_pkg.obten_lang_formt (ref_lang
                                          ,afw_01_lang_pkg.obten_lang_sesn)
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_fonct
    from vd_i_afw_19_fonct_lang
/
