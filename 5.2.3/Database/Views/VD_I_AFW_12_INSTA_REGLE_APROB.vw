SET DEFINE OFF;
create or replace force view vd_i_afw_12_insta_regle_aprob
(
  seqnc
 ,ref_insta_procs_aprob
 ,ref_regle_aprob
 ,ref_evolt_stat
 ,ref_insta_procs_aprob_stat
 ,date_aprob
 ,comnt_aprob
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_insta_procs_aprob
        ,ref_regle_aprob
        ,ref_evolt_stat
        ,ref_insta_procs_aprob_stat
        ,date_aprob
        ,comnt_aprob
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_domn
    from afw_12_insta_regle_aprob
/
