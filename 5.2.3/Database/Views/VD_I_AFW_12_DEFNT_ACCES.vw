SET DEFINE OFF;
create or replace force view vd_i_afw_12_defnt_acces
(
  seqnc
 ,ref_group_utils
 ,ref_utils
 ,indic_acces
 ,indic_modfc
 ,indic_suprs
 ,indic_creat
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_opert
 ,ref_struc_aplic
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_group_utils
        ,ref_utils
        ,indic_acces
        ,indic_modfc
        ,indic_suprs
        ,indic_creat
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_opert
        ,ref_struc_aplic
        ,dnr_ref_prodt
    from afw_12_defnt_acces
/
