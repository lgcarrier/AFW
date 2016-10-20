SET DEFINE OFF;
create or replace force view vd_i_afw_23_aplic_modl_rechr
(
  seqnc
 ,ref_modl_rechr
 ,ref_struc_aplic_rechr
 ,ref_struc_aplic_lien
 ,nombr_maxim_reslt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_atrib_struc_aplic_afich
)
as
  select seqnc
        ,ref_modl_rechr
        ,ref_struc_aplic_rechr
        ,ref_struc_aplic_lien
        ,nombr_maxim_reslt
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_atrib_struc_aplic_afich
    from afw_23_aplic_modl_rechr
/
