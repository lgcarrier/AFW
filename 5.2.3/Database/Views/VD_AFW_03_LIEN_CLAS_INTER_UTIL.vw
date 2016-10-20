SET DEFINE OFF;
create or replace force view vd_afw_03_lien_clas_inter_util
(
  seqnc
 ,ref_clas_inter
 ,ref_utils
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_group_utils
)
as
  select seqnc
        ,ref_clas_inter
        ,ref_utils
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_group_utils
    from vd_i_afw_03_lien_clas_inter_ut
/
