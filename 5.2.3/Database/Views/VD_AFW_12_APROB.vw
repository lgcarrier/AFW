SET DEFINE OFF;
create or replace force view vd_afw_12_aprob
(
  seqnc
 ,ref_group_stat
 ,ref_group_stat_nom
 ,ref_group_stat_formt
 ,ref_utils
 ,ref_utils_formt
 ,ref_group_utils
 ,ref_group_utils_formt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_group_stat
        , (select nom
             from vd_afw_12_group_stat gs
            where gs.seqnc = ref_group_stat)
           ref_group_stat_nom
        , (select    code
                  || ' - '
                  || nom
             from vd_afw_12_group_stat gs
            where gs.seqnc = ref_group_stat)
           ref_group_stat_formt
        ,ref_utils
        ,afw_12_utils_pkg.obten_nom_formt (ref_utils)       ref_utils_formt
        ,ref_group_utils
        ,afw_12_group_utils_pkg.obten_nom (ref_group_utils) ref_group_utils_formt
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_domn
    from vd_i_afw_12_aprob
/
