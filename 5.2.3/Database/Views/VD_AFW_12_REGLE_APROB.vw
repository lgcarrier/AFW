SET DEFINE OFF;
create or replace force view vd_afw_12_regle_aprob
(
  seqnc
 ,ref_evolt_stat
 ,ref_group_aprob
 ,ref_group_aprob_formt
 ,ref_aprob
 ,ref_aprob_formt
 ,ref_role_aprob
 ,ref_role_aprob_formt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_evolt_stat
        ,ref_group_aprob
        , (select ga.nom
             from vd_i_afw_12_group_aprob ga
            where ga.seqnc = ra.ref_group_aprob)
           ref_grou_aprob_formt
        ,ref_aprob
        , (select nvl (a.ref_utils_formt, a.ref_group_utils_formt)
             from vd_afw_12_aprob a
            where a.seqnc = ra.ref_aprob)
           ref_aprob_formt
        ,ref_role_aprob
        , (select a.nom
             from vd_afw_12_role_aprob a
            where a.seqnc = ra.ref_role_aprob)
           ref_role_aprob_formt
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_domn
    from vd_i_afw_12_regle_aprob ra
/
