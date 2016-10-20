SET DEFINE OFF;
create or replace force view vs_afw_12_lien_gadgt_utils_p
(
  seqnc
 ,ref_lien_gadgt_utils
 ,ref_gadgt_parmt
 ,ref_dv_forml_don
 ,ref_lien_gadgt_parmt_racrc
 ,ref_gadgt_parmt_racrc
 ,forml_don
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select lgup.seqnc
        ,lgup.ref_lien_gadgt_utils
        ,lgup.ref_gadgt_parmt
        ,lgup.ref_dv_forml_don
        ,lgup.ref_lien_gadgt_parmt_racrc
        ,lgup.ref_gadgt_parmt_racrc
        ,lgup.forml_don
        ,lgup.date_creat
        ,lgup.utils_creat
        ,lgup.date_modfc
        ,lgup.utils_modfc
    from vd_afw_12_lien_gadgt_utils_p lgup
        ,vd_afw_12_lien_gadgt_utils   lgu
        ,vd_afw_12_group_gadgt_utils  ggu
        ,vd_afw_37_tabl_bord          tb
   where     lgu.seqnc = lgup.ref_lien_gadgt_utils
         and ggu.seqnc = lgu.ref_group_gadgt_utils
         and ggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct
         and ggu.ref_tabl_bord = tb.seqnc
         and tb.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
/
