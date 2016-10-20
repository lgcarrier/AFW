SET DEFINE OFF;
create or replace force view vd_afw_12_role_aprob
(
  seqnc
 ,code
 ,nom
 ,ref_group_stat
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,ref_group_stat
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_domn
    from vd_i_afw_12_role_aprob
/
