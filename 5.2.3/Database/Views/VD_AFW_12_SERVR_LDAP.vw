SET DEFINE OFF;
create or replace force view vd_afw_12_servr_ldap
(
  seqnc
 ,adres
 ,port
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,base_dn
 ,utils_cn
 ,mot_passe
)
as
  select seqnc
        ,adres
        ,port
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,base_dn
        ,utils_cn
        ,mot_passe
    from vd_i_afw_12_servr_ldap
/
