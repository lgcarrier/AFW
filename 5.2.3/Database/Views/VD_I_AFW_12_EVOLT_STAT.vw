SET DEFINE OFF;
create or replace force view vd_i_afw_12_evolt_stat
(
  seqnc
 ,ref_stat
 ,ref_stat_evolt
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
        ,ref_stat_evolt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_code
        ,dnr_ref_prodt
        ,dnr_ref_domn
    from afw_12_evolt_stat
/
