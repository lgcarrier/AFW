SET DEFINE OFF;
create or replace force view vd_i_afw_12_lien_group_utils
(
  seqnc
 ,ref_group
 ,ref_utils
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_group_utils_lie
 ,dnr_ref_prodt
 ,ref_domn
)
as
  select seqnc
        ,ref_group
        ,ref_utils
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_group_utils_lie
        ,dnr_ref_prodt
        ,ref_domn
    from afw_12_lien_group_utils
/
