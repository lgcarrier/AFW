SET DEFINE OFF;
create or replace force view vd_i_afw_23_detl_aplic_modl_re
(
  seqnc
 ,ref_aplic_modl_rechr
 ,ref_atrib_struc_aplic
 ,ref_patrn_rechr
 ,ordre_exect
 ,pertn
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_aplic_modl_rechr
        ,ref_atrib_struc_aplic
        ,ref_patrn_rechr
        ,ordre_exect
        ,pertn
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_23_detl_aplic_modl_rechr
/
