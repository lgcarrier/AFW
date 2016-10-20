SET DEFINE OFF;
create or replace force view vd_afw_25_theme_subst
(
  seqnc
 ,ref_theme
 ,dnr_ref_prodt
 ,nom
 ,descr
 ,code_subst
 ,coulr_subst
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_theme
        ,dnr_ref_prodt
        ,nom
        ,descr
        ,code_subst
        ,coulr_subst
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_25_theme_subst
/
