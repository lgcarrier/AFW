SET DEFINE OFF;
create or replace force view vd_i_afw_37_gadgt
(
  seqnc
 ,ref_prodt
 ,ref_struc_aplic
 ,ref_gadgt_catgr
 ,code
 ,nom
 ,procd_genrt
 ,procd_ajax
 ,class_css
 ,descr
 ,icone
 ,ordre_presn
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,ref_struc_aplic
        ,ref_gadgt_catgr
        ,code
        ,nom
        ,procd_genrt
        ,procd_ajax
        ,class_css
        ,descr
        ,icone
        ,ordre_presn
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_37_gadgt
/
