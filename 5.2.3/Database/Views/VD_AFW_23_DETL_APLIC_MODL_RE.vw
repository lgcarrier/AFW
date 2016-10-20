SET DEFINE OFF;
create or replace force view vd_afw_23_detl_aplic_modl_re
(
  seqnc
 ,ref_aplic_modl_rechr
 ,ref_code_struc_aplic_formt
 ,ref_atrib_struc_aplic
 ,ref_atrib_struc_aplic_formt
 ,ref_patrn_rechr
 ,ref_patrn_rechr_formt
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
        , (select afw_12_struc_aplic_pkg.obten_code (amr.ref_struc_aplic_rechr)
             from vd_afw_23_aplic_modl_rechr amr
            where amr.seqnc = damr.ref_aplic_modl_rechr)
           ref_code_struc_aplic_formt
        ,ref_atrib_struc_aplic
        , (select asa.nom_coln
             from vd_afw_12_atrib_struc_aplic asa
            where asa.seqnc = damr.ref_atrib_struc_aplic)
        ,ref_patrn_rechr
        , (select pr.nom
             from vd_afw_23_patrn_rechr pr
            where pr.seqnc = damr.ref_patrn_rechr)
        ,ordre_exect
        ,pertn
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from vd_i_afw_23_detl_aplic_modl_re damr
/
