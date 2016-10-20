SET DEFINE OFF;
create or replace force view vd_i_afw_12_regle_aprob
(
  seqnc
 ,ref_evolt_stat
 ,ref_group_aprob
 ,ref_aprob
 ,ref_role_aprob
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
        ,ref_aprob
        ,ref_role_aprob
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_domn
    from afw_12_regle_aprob
/
