SET DEFINE OFF;
create or replace force view vd_afw_01_elemn_confg_en
(
  seqnc
 ,ref_confg_evenm_notfb
 ,code
 ,elemn_subst_mesg
 ,ident_acces
 ,ident_acces_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,formt
)
as
  select seqnc
        ,ref_confg_evenm_notfb
        ,code
        ,afw_01_elemn_confg_en_pkg.formt_elemn_subst_mesg (code)
        ,ident_acces
        ,ident_acces_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,formt
    from vd_i_afw_01_elemn_confg_en
/
