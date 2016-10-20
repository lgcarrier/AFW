SET DEFINE OFF;
create or replace force view vd_afw_12_group_gadgt_utils
(
  seqnc
 ,ref_utils
 ,ref_utils_formt
 ,ref_tabl_bord
 ,nom
 ,indic_systm
 ,confg_gril
 ,confg_gadgt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_utils_demdr
 ,ref_utils_demdr_formt
)
as
  select seqnc
        ,ref_utils
        ,afw_12_utils_pkg.obten_nom_formt (ref_utils)       ref_utils_fromt
        ,ref_tabl_bord
        ,nom
        ,indic_systm
        ,confg_gril
        ,confg_gadgt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_utils_demdr
        ,afw_12_utils_pkg.obten_nom_formt (ref_utils_demdr) ref_utils_demdr_formt
    from vd_i_afw_12_group_gadgt_utils
/
