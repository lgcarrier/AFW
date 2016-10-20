SET DEFINE OFF;
create or replace force view vs_afw_12_parmt_gadgt_utils
(
  ref_utils
 ,ggu_seqnc
 ,lgu_seqnc
 ,gp_seqnc
 ,ref_gadgt
 ,code
 ,nom
 ,ordre_presn
 ,indic_oblig
 ,ref_dv_type_don
 ,ref_dv_type_don_code
 ,ref_dv_type_don_formt
 ,ref_domn_valr
 ,descr
 ,lgup_seqnc
 ,lgup_dv_forml_don
 ,lgup_dv_forml_don_formt
 ,lgup_lien_gadgt_parmt_racrc
 ,lgup_gadgt_parmt_racrc
 ,lgup_forml_don
)
as
  select ggu.ref_utils
        ,ggu.seqnc                                            ggu_seqnc
        ,lgu.seqnc                                            lgu_seqnc
        ,gp.seqnc                                             gp_seqnc
        ,gp.ref_gadgt
        ,gp.code
        ,gp.nom
        ,gp.ordre_presn
        ,gp.indic_oblig
        ,gp.ref_dv_type_don
        ,afw_14_domn_valr_pkg.obten_code (gp.ref_dv_type_don) ref_dv_type_don_code
        , (select ddv.valr
             from vd_afw_14_detl_domn_valr ddv
            where ddv.seqnc = gp.ref_dv_type_don)
           as ref_dv_type_don_formt
        ,gp.ref_domn_valr
        ,gp.descr
        ,lgup.seqnc                                           lgup_seqnc
        ,lgup.ref_dv_forml_don                                lgup_dv_forml_don
        , (select ddv.valr
             from vd_afw_14_detl_domn_valr ddv
            where ddv.seqnc = lgup.ref_dv_forml_don)
           as lgup_dv_forml_don_formt
        ,lgup.ref_lien_gadgt_parmt_racrc                      lgup_lien_gadgt_parmt_racrc
        ,lgup.ref_gadgt_parmt_racrc                           lgup_gadgt_parmt_racrc
        ,lgup.forml_don                                       lgup_forml_don
    from vd_i_afw_37_gadgt_parmt        gp
        ,vd_i_afw_12_group_gadgt_utils  ggu
        ,vd_i_afw_12_lien_gadgt_utils   lgu
        ,vd_i_afw_12_lien_gadgt_utils_p lgup
   where     lgu.ref_gadgt = gp.ref_gadgt
         and ggu.seqnc = lgu.ref_group_gadgt_utils
         and lgup.ref_lien_gadgt_utils(+) = lgu.seqnc
         and lgup.ref_gadgt_parmt = gp.seqnc
  union
  select ggu.ref_utils
        ,ggu.seqnc                                            ggu_seqnc
        ,lgu.seqnc                                            lgu_seqnc
        ,gp.seqnc                                             gp_seqnc
        ,gp.ref_gadgt
        ,gp.code
        ,gp.nom
        ,gp.ordre_presn
        ,gp.indic_oblig
        ,gp.ref_dv_type_don
        ,afw_14_domn_valr_pkg.obten_code (gp.ref_dv_type_don) ref_dv_type_don_code
        , (select ddv.valr
             from vd_afw_14_detl_domn_valr ddv
            where ddv.seqnc = gp.ref_dv_type_don)
           as ref_dv_type_don_formt
        ,gp.ref_domn_valr
        ,gp.descr
        ,null                                                 lgup_seqnc
        ,null                                                 lgup_lien_gadgt_parmt_racrc
        ,null                                                 lgup_gadgt_parmt_racrc
        ,null                                                 lgup_dv_forml_don
        ,null                                                 lgup_dv_forml_don_formt
        ,null                                                 lgup_forml_don
    from vd_i_afw_37_gadgt_parmt       gp
        ,vd_i_afw_12_lien_gadgt_utils  lgu
        ,vd_i_afw_12_group_gadgt_utils ggu
   where     lgu.ref_gadgt = gp.ref_gadgt
         and ggu.seqnc = lgu.ref_group_gadgt_utils
         and not exists
               (select null
                  from vd_i_afw_12_lien_gadgt_utils_p lgup
                 where     lgup.ref_lien_gadgt_utils = lgu.seqnc
                       and lgup.ref_gadgt_parmt = gp.seqnc)
/
