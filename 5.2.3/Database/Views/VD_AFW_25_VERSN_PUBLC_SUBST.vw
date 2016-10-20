SET DEFINE OFF;
create or replace force view vd_afw_25_versn_publc_subst
(
  seqnc
 ,dnr_ref_prodt
 ,ref_versn_publc
 ,ref_versn_publc_subst
 ,nom
 ,code_subst
 ,valr_subst
 ,type_subst
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,dnr_ref_prodt
        ,ref_versn_publc
        ,ref_versn_publc_subst
        ,nom
        ,code_subst
        ,valr_subst
        ,type_subst
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from vd_i_afw_25_versn_publc_subst
/
