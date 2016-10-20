SET DEFINE OFF;
create or replace force view vd_i_afw_25_travl
(
  seqnc
 ,ref_utils
 ,indic_imedt
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_stat
 ,ref_type_travl
)
as
  select seqnc
        ,ref_utils
        ,indic_imedt
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        ,ref_stat
        ,ref_type_travl
    from afw_25_travl
/
