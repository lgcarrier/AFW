SET DEFINE OFF;
create or replace force view vd_afw_12_reqt_inter_utils
(
  seqnc
 ,ident
 ,ref_utils
 ,ref_utils_code
 ,ref_utils_formt
 ,ref_dv_type_reqt_inter
 ,ref_dv_type_reqt_inter_code
 ,ref_dv_type_reqt_inter_formt
 ,date_debut_efect
 ,date_fin_efect
 ,ref_domn
 ,ref_prodt
 ,numr_aplic_apex
 ,numr_page_apex
 ,url_inter
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,date_trait
 ,indic_trait_formt
 ,procd_persn_url_apres_authe
)
as
  select riu.seqnc
        ,riu.ident
        ,riu.ref_utils
        , (select u.code_utils
             from vd_afw_12_utils u
            where u.seqnc = riu.ref_utils)
        , (select u.nom_formt
             from vd_afw_12_utils u
            where u.seqnc = riu.ref_utils)
        ,riu.ref_dv_type_reqt_inter
        ,afw_14_domn_valr_pkg.obten_code (riu.ref_dv_type_reqt_inter)
        ,afw_14_domn_valr_pkg.obten_valr (riu.ref_dv_type_reqt_inter)
        ,riu.date_debut_efect
        ,riu.date_fin_efect
        ,riu.ref_domn
        ,riu.ref_prodt
        ,riu.numr_aplic_apex
        ,riu.numr_page_apex
        ,afw_12_reqt_inter_utils_pkg.obten_url_inter_formt_html (riu.seqnc)
        ,riu.date_creat
        ,riu.utils_creat
        ,riu.date_modfc
        ,riu.utils_modfc
        ,riu.date_trait
        ,case when riu.date_trait is not null then '<i class="fa fa-check"></i>' else null end indic_trait_formt
        ,procd_persn_url_apres_authe
    from vd_i_afw_12_reqt_inter_utils riu
/
