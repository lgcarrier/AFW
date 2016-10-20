SET DEFINE OFF;
create or replace force view vd_i_afw_12_group_gadgt_utils
(
  seqnc
 ,ref_utils
 ,ref_utils_demdr
 ,ref_tabl_bord
 ,nom
 ,indic_systm
 ,confg_gril
 ,confg_gadgt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_utils_demdr
        ,ref_tabl_bord
        ,nom
        ,indic_systm
        ,confg_gril
        ,confg_gadgt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_group_gadgt_utils
/
