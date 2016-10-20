SET DEFINE OFF;
create or replace force view vd_afw_37_gadgt
(
  seqnc
 ,ref_prodt
 ,ref_struc_aplic
 ,ref_gadgt_catgr
 ,ref_gadgt_catgr_formt
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
        , (select    code
                  || ' - '
                  || nom
             from vd_afw_37_gadgt_catgr gc
            where gc.seqnc = g.ref_gadgt_catgr)
           as ref_gadgt_catgr_formt
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
    from vd_i_afw_37_gadgt g
/
