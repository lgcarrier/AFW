SET DEFINE OFF;
create or replace force view vd_afw_11_entit
(
  seqnc
 ,nom
 ,nom_table_tempr
 ,nom_table_ereur
 ,indic_creer_ocurn
 ,indic_creer_ocurn_formt
 ,indic_modif_ocurn
 ,indic_modif_ocurn_formt
 ,indic_suprm_ocurn
 ,indic_suprm_ocurn_formt
 ,indic_force_selct
 ,indic_force_selct_formt
 ,ref_versn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ordre_exect
 ,longr_bloc
 ,indic_nouvl_entit
 ,indic_nouvl_entit_formt
 ,niv_inclu_migrt
 ,niv_inclu_migrt_formt
 ,confg_inclu_migrt
 ,indic_expor_tabl_index
 ,indic_expor_tabl_index_formt
 ,indic_suprm_don_prodt
 ,indic_suprm_don_prodt_formt
 ,indic_deplm_inter_prodt
 ,where_claus_custm
 ,ref_schem_prodt
 ,ref_schem_prodt_code
)
as
  select seqnc
        ,nom
        ,nom_table_tempr
        ,nom_table_ereur
        ,indic_creer_ocurn
        ,case indic_creer_ocurn when 'O' then 'Oui' else 'Non' end      indic_creer_ocurn_formt
        ,indic_modif_ocurn
        ,case indic_modif_ocurn when 'O' then 'Oui' else 'Non' end      indic_modif_ocurn_formt
        ,indic_suprm_ocurn
        ,case indic_suprm_ocurn when 'O' then 'Oui' else 'Non' end      indic_suprm_ocurn_formt
        ,indic_force_selct
        ,case indic_force_selct when 'O' then 'Oui' else 'Non' end      indic_force_selct_formt
        ,ref_versn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ordre_exect
        ,longr_bloc
        ,indic_nouvl_entit
        ,case indic_nouvl_entit when 'O' then 'Oui' else 'Non' end      indic_nouvl_entit_formt
        ,niv_inclu_migrt
        ,case niv_inclu_migrt
           when 'GLOBL' then 'Global'
           when 'PRODT' then 'Produit'
           when 'APLIC' then 'Application'
           when 'DOMN' then 'Domaine'
           when 'CONTX' then 'Selon contexte'
           else null
         end
           niv_inclu_migrt_formt
        ,confg_inclu_migrt
        ,indic_expor_tabl_index
        ,case indic_expor_tabl_index when 'O' then 'Oui' else 'Non' end indic_expor_tabl_index_formt
        ,indic_suprm_don_prodt
        ,case indic_suprm_don_prodt when 'O' then 'Oui' else 'Non' end  indic_suprm_don_prodt_formt
        ,indic_deplm_inter_prodt
        ,where_claus_custm
        ,ref_schem_prodt
        , (select code
             from vd_i_afw_11_schem_prodt sp
            where sp.seqnc = ref_schem_prodt)
           ref_schem_prodt_code
    from vd_i_afw_11_entit
/
