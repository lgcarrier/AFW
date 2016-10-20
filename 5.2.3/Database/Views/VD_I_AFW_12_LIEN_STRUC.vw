SET DEFINE OFF;
create or replace force view vd_i_afw_12_lien_struc
(
  seqnc
 ,ref_struc_admin
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_lie
)
as
  select seqnc
        ,ref_struc_admin
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_struc_lie
    from afw_12_lien_struc
/
