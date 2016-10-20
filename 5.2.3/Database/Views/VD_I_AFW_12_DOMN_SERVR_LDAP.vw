SET DEFINE OFF;
create or replace force view vd_i_afw_12_domn_servr_ldap
(
  seqnc
 ,ref_domn
 ,ref_servr_ldap
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_domn
        ,ref_servr_ldap
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_domn_servr_ldap
/
