SET DEFINE OFF;
create or replace force view vd_afw_25_travl
(
  seqnc
 ,ref_utils
 ,ref_utils_formt
 ,indic_imedt
 ,indic_imedt_formt
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_stat
 ,ref_stat_formt
 ,nombr_elemn
 ,ref_type_travl
)
as
  select seqnc
        ,ref_utils
        , (select nom_formt
             from vd_afw_12_utils
            where seqnc = ref_utils)
        ,indic_imedt
        ,case indic_imedt when 'O' then 'Oui' else 'Non' end indic_imedt_formt
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        ,ref_stat
        , (select nom
             from vd_i_afw_12_stat s
            where s.seqnc = t.ref_stat)
        , (select count (1)
             from vd_i_afw_25_publc_travl pt
            where pt.ref_travl = t.seqnc)
        ,ref_type_travl
    from vd_i_afw_25_travl t
/
