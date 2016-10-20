SET DEFINE OFF;
create or replace force view vd_afw_37_gadgt_parmt_racrc
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,ref_dv_type_don
 ,ref_dv_type_don_formt
 ,forml_don
 ,indic_genrq
 ,indic_genrq_formt
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,code
        ,nom
        ,ref_dv_type_don
        , (select ddv.valr
             from vd_afw_14_detl_domn_valr ddv
            where ddv.seqnc = pr.ref_dv_type_don)
           as ref_dv_type_don_formt
        ,forml_don
        ,indic_genrq
        ,case indic_genrq when 'O' then '<i class="fa fa-check"></i>' else null end as indic_oblig_formt
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_gadgt_parmt_racrc pr
/
