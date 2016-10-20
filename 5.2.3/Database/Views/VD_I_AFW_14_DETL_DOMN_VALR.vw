SET DEFINE OFF;
create or replace force view vd_i_afw_14_detl_domn_valr
(
  seqnc
 ,code_valr
 ,ref_domn_valr
 ,seqnc_presn
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code_valr
        ,ref_domn_valr
        ,seqnc_presn
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_14_detl_domn_valr
/
