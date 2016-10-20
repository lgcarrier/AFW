SET DEFINE OFF;
create or replace force view vd_i_afw_12_domn_utils
(
  seqnc
 ,ref_utils
 ,ref_domn
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_domn
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_domn_utils
/
