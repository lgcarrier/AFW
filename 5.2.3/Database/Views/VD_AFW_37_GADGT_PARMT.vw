SET DEFINE OFF;
create or replace force view vd_afw_37_gadgt_parmt
(
  seqnc
 ,ref_gadgt
 ,code
 ,nom
 ,ordre_presn
 ,indic_oblig
 ,indic_oblig_formt
 ,ref_dv_type_don
 ,ref_dv_type_don_formt
 ,ref_domn_valr
 ,ref_domn_valr_formt
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_gadgt
        ,code
        ,nom
        ,ordre_presn
        ,indic_oblig
        ,case indic_oblig when 'O' then '<i class="fa fa-check"></i>' else null end as indic_oblig_formt
        ,ref_dv_type_don
        , (select ddv.valr
             from vd_afw_14_detl_domn_valr ddv
            where ddv.seqnc = gp.ref_dv_type_don)
           as ref_dv_type_don_formt
        ,ref_domn_valr
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_14_domn_valr
            where seqnc = ref_domn_valr)
           ref_domn_valr_formt
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_gadgt_parmt gp
/
