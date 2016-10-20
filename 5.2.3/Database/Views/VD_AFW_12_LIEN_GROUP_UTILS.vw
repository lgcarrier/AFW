SET DEFINE OFF;
create or replace force view vd_afw_12_lien_group_utils
(
  seqnc
 ,ref_group
 ,ref_group_indic_acces
 ,ref_group_domn
 ,ref_group_prodt
 ,ref_group_indic_non_modfb
 ,ref_utils
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_group_utils_lie
 ,ref_group_utils_lie_formt
 ,ref_group_lie_indic_acces
 ,ref_group_lie_domn
 ,ref_group_lie_prodt
 ,dnr_ref_prodt
 ,ref_domn
)
as
  select seqnc
        ,ref_group
        , (select indic_acces_globl
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group)
           ref_group_indic_acces
        , (select ref_domn
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group)
           ref_group_domn
        , (select ref_prodt
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group)
           ref_group_prodt
        ,case afw_12_group_utils_pkg.obten_code (lgu.ref_group) when 'SUPER_UTILS' then 'O' when 'AUTOR_CONXN_DERV' then 'O' else 'N' end
           ref_group_indic_non_modfb
        ,ref_utils
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_group_utils_lie
        , (select gu.nom
             from vd_afw_12_group_utils gu
            where gu.seqnc = lgu.ref_group_utils_lie)
           ref_group_utils_lie_formt
        , (select indic_acces_globl
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group_utils_lie)
           ref_group_lie_indic_acces
        , (select ref_domn
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group_utils_lie)
           ref_group_lie_domn
        , (select ref_prodt
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group_utils_lie)
           ref_group_lie_prodt
        ,dnr_ref_prodt
        ,ref_domn
    from vd_i_afw_12_lien_group_utils lgu
/
