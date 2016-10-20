SET DEFINE OFF;
create or replace force view vd_afw_12_evolt_stat
(
  seqnc
 ,ref_stat
 ,ref_stat_formt
 ,ref_stat_ordre
 ,ref_stat_evolt
 ,ref_stat_evolt_formt
 ,ref_stat_evolt_ordre
 ,ref_stat_evolt_libl_actio
 ,ref_group_stat
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_code
 ,dnr_ref_prodt
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_stat
        , (select s.nom
             from vd_i_afw_12_stat s
            where s.seqnc = es.ref_stat)
           ref_stat_formt
        , (select s.ordre
             from vd_i_afw_12_stat s
            where s.seqnc = es.ref_stat)
           ref_stat_ordre
        ,ref_stat_evolt
        , (select s.nom
             from vd_i_afw_12_stat s
            where s.seqnc = es.ref_stat_evolt)
           ref_stat_evolt_formt
        , (select s.ordre
             from vd_i_afw_12_stat s
            where s.seqnc = es.ref_stat_evolt)
           ref_stat_evolt_ordre
        , (select nvl (s.libl_actio, s.nom)
             from vd_i_afw_12_stat s
            where s.seqnc = es.ref_stat_evolt)
           ref_stat_evolt_libl_actio
        , (select s.ref_group_stat
             from vd_i_afw_12_stat s
            where s.seqnc = es.ref_stat)
           ref_group_stat
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_code
        ,dnr_ref_prodt
        ,dnr_ref_domn
    from vd_i_afw_12_evolt_stat es
/
