SET DEFINE OFF;
create or replace force view vs_afw_20_docmn
(
  seqnc
 ,ref_prodt_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,ref_seqnc_struc_aplic
 ,ref_docmn_formt
 ,ref_propr
 ,ref_propr_formt
 ,ref_dv_type_modl_formt
)
as
  select d.seqnc
        ,d.ref_prodt_lang
        ,d.date_creat
        ,d.utils_creat
        ,d.date_modfc
        ,d.utils_modfc
        ,d.ref_struc_aplic
        ,sa.nom                                       ref_struc_aplic_formt
        ,d.ref_seqnc_struc_aplic
        ,afw_20_docmn_pkg.formt_propr_docmn (d.seqnc) ref_docmn_formt
        ,case
           when d.ref_struc_aplic != afw_12_struc_aplic_pkg.obten_seqnc ('MODL_PARMT')
           then
             d.ref_propr
           else
             (select ref_modl
                from vd_afw_20_modl_parmt
               where seqnc = d.ref_seqnc_struc_aplic)
         end
        ,case
           when d.ref_struc_aplic != afw_12_struc_aplic_pkg.obten_seqnc ('MODL_PARMT') then afw_20_modl_pkg.obten_propr_sous_modl_formt (d.seqnc)
           else null
         end
        ,case
           when d.ref_struc_aplic != afw_12_struc_aplic_pkg.obten_seqnc ('MODL_PARMT') then afw_14_domn_valr_pkg.obten_valr (d.ref_dv_type_modl)
           else null
         end
    from vd_afw_20_docmn         d
        ,vd_i_afw_12_struc_aplic sa
   where sa.seqnc = d.ref_struc_aplic
/
