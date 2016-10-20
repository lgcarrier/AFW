SET DEFINE OFF;
create or replace force view vd_i_afw_12_reqt_inter_utils
(
  seqnc
 ,ident
 ,ref_utils
 ,ref_dv_type_reqt_inter
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_prodt
 ,numr_aplic_apex
 ,numr_page_apex
 ,date_trait
 ,procd_persn_url_apres_authe
)
as
  select seqnc
        ,ident
        ,ref_utils
        ,ref_dv_type_reqt_inter
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        ,ref_prodt
        ,numr_aplic_apex
        ,numr_page_apex
        ,date_trait
        ,procd_persn_url_apres_authe
    from afw_12_reqt_inter_utils
/
