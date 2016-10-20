SET DEFINE OFF;
create or replace force view vd_afw_12_domn_utils
(
  seqnc
 ,ref_utils
 ,ref_utils_formt
 ,ref_code_utils
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
        , (select nom_formt
             from vd_afw_12_utils u
            where u.seqnc = du.ref_utils)
        , (select code_utils
             from vd_afw_12_utils u
            where u.seqnc = du.ref_utils)
        ,ref_domn
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_domn_utils du
/
