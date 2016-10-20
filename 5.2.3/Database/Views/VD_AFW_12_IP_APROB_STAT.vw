SET DEFINE OFF;
create or replace force view vd_afw_12_ip_aprob_stat
(
  seqnc
 ,ref_insta_procs_aprob
 ,ref_stat
 ,ref_stat_code
 ,ref_stat_formt
 ,date_debut_efect
 ,date_fin_efect
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_insta_procs_aprob
        ,ref_stat
        , (select s.code
             from vd_i_afw_12_stat s
            where s.seqnc = ipas.ref_stat)
           ref_stat_code
        , (select s.nom
             from vd_i_afw_12_stat s
            where s.seqnc = ipas.ref_stat)
           ref_stat_formt
        ,date_debut_efect
        ,date_fin_efect
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_domn
    from vd_i_afw_12_ip_aprob_stat ipas
/
