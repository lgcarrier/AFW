SET DEFINE OFF;
create or replace force view vs_afw_12_group_gadgt_utils
(
  seqnc
 ,ref_utils
 ,ref_utils_formt
 ,ref_tabl_bord
 ,nom
 ,indic_systm
 ,confg_gril
 ,confg_gadgt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_utils_demdr
 ,ref_utils_demdr_formt
)
as
  select seqnc
        ,ref_utils
        ,ref_utils_formt
        ,ref_tabl_bord
        ,nom
        ,indic_systm
        ,confg_gril
        ,confg_gadgt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_utils_demdr
        ,ref_utils_demdr_formt
    from vd_afw_12_group_gadgt_utils ggu
   where (   afw_12_utils_pkg.obten_usagr_conct () in (ggu.ref_utils
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
/
