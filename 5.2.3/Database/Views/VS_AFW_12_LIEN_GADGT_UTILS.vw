SET DEFINE OFF;
create or replace force view vs_afw_12_lien_gadgt_utils
(
  tabl_bord_code
 ,gadgt_icone
 ,gadgt_procd_genrt
 ,gadgt_procd_ajax
 ,gadgt_class_css
 ,seqnc
 ,ref_utils
 ,ref_group_gadgt
 ,ref_tabl_bord
 ,ref_gadgt
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_sesn
)
as
  select tb.code         tabl_bord_code
        ,gad.icone       gadgt_icone
        ,gad.procd_genrt gadgt_procd_genrt
        ,gad.procd_ajax  gadgt_procd_ajax
        ,gad.class_css   gadgt_class_css
        ,lgu.seqnc
        ,ggu.ref_utils
        ,ggu.seqnc       ref_group_gadgt
        ,ggu.ref_tabl_bord
        ,lgu.ref_gadgt
        ,lgu.nom
        ,lgu.descr
        ,lgu.date_creat
        ,lgu.utils_creat
        ,lgu.date_modfc
        ,lgu.utils_modfc
        ,lgu.ref_sesn
    from vd_afw_12_lien_gadgt_utils  lgu
        ,vd_afw_12_group_gadgt_utils ggu
        ,vd_afw_37_tabl_bord         tb
        ,vd_afw_37_gadgt             gad
   where     (   afw_12_utils_pkg.obten_usagr_conct () in (ggu.ref_utils
                                                          ,ggu.ref_utils_demdr)
              or exists
                   (select null
                      from vd_afw_12_lien_gr_gadgt_gr_u lgggu
                     where        lgggu.ref_group_gadgt_utils = ggu.seqnc
                              and lgggu.ref_group_utils = any (select seqnc_group
                                                                 from vs_group_lie_utils_conct)
                           or exists
                                (select null
                                   from vd_afw_12_lien_gr_gadgt_gr_u lgggu
                                  where     lgggu.ref_group_gadgt_utils = ggu.seqnc
                                        and lgggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct ())))
         and ggu.seqnc = lgu.ref_group_gadgt_utils
         and ggu.ref_tabl_bord = tb.seqnc
         and tb.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
         and gad.seqnc = lgu.ref_gadgt
/
