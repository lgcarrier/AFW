SET DEFINE OFF;
create or replace force view vd_i_afw_12_insta_procs_aprob
(
  seqnc
 ,ref_group_stat
 ,ref_struc_aplic
 ,ref_seqnc_struc_aplic
 ,ref_insta_procs_aprob_suivn
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_group_stat
        ,ref_struc_aplic
        ,ref_seqnc_struc_aplic
        ,ref_insta_procs_aprob_suivn
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_domn
    from afw_12_insta_procs_aprob
/
