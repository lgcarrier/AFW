SET DEFINE OFF;
create or replace force view vd_afw_25_valr_elemn_confg
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
 ,ref_domn_formt
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
        , (select nom
             from vd_i_afw_12_domn
            where seqnc = ref_domn)
    from vd_i_afw_25_valr_elemn_confg
/
