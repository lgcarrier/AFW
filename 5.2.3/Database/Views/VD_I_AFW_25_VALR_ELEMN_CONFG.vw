SET DEFINE OFF;
create or replace force view vd_i_afw_25_valr_elemn_confg
(
  seqnc
 ,ref_elemn_confg_publc
 ,date_debut_efect
 ,date_fin_efect
 ,valr_varch
 ,valr_date
 ,valr_numbr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
)
as
  select seqnc
        ,ref_elemn_confg_publc
        ,date_debut_efect
        ,date_fin_efect
        ,valr_varch
        ,valr_date
        ,valr_numbr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
    from afw_25_valr_elemn_confg
/
