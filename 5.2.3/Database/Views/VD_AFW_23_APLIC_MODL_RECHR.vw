SET DEFINE OFF;
create or replace force view vd_afw_23_aplic_modl_rechr
(
  seqnc
 ,ref_modl_rechr
 ,ref_struc_aplic_rechr
 ,ref_struc_aplic_rechr_formt
 ,ref_struc_aplic_lien
 ,ref_struc_aplic_lien_formt
 ,nombr_maxim_reslt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_atrib_struc_aplic_afich
 ,ref_atrib_struc_aplic_af_formt
)
as
  select seqnc
        ,ref_modl_rechr
        ,ref_struc_aplic_rechr
        , (select sa.nom
             from vd_i_afw_11_prodt       p
                 ,vd_i_afw_12_struc_aplic sa
            where     p.seqnc = sa.ref_prodt
                  and sa.seqnc = amr.ref_struc_aplic_rechr)
        ,ref_struc_aplic_lien
        , (select sa.nom
             from vd_i_afw_11_prodt       p
                 ,vd_i_afw_12_struc_aplic sa
            where     p.seqnc = sa.ref_prodt
                  and sa.seqnc = amr.ref_struc_aplic_lien)
        ,nombr_maxim_reslt
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_atrib_struc_aplic_afich
        , (select    '[ '
                  || nom_coln
                  || ' ]'
             from vd_afw_12_atrib_struc_aplic
            where seqnc = ref_atrib_struc_aplic_afich)
    from vd_i_afw_23_aplic_modl_rechr amr
/
