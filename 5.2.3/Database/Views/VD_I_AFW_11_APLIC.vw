SET DEFINE OFF;
create or replace force view vd_i_afw_11_aplic
(
  seqnc
 ,code
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,numr_aplic_apex
 ,date_dernr_maj_refrn_apex
 ,ref_versn
 ,indic_aplic_authe
 ,ref_aplic_authe
 ,ref_page_conxn
 ,ref_page_acuei
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,numr_aplic_apex
        ,date_dernr_maj_refrn_apex
        ,ref_versn
        ,indic_aplic_authe
        ,ref_aplic_authe
        ,ref_page_conxn
        ,ref_page_acuei
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_11_aplic
/
