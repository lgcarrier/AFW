SET DEFINE OFF;
create or replace force view vd_afw_12_atrib_struc_aplic
(
  seqnc
 ,nom_coln
 ,nom_fonct
 ,ref_dv_natr_infor
 ,ref_dv_natr_infor_code
 ,ref_dv_natr_infor_formt
 ,indic_valid
 ,indic_valid_formt
 ,ref_struc_aplic
 ,ref_atrib_struc_aplic
 ,ref_atrib_struc_aplic_nom_sa
 ,ref_atrib_struc_aplic_seqnc_sa
 ,indic_destn
)
as
  select seqnc
        ,nom_coln
        ,nom_fonct
        ,ref_dv_natr_infor
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_natr_infor)
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_natr_infor)
        ,indic_valid
        ,case when indic_valid = 'O' then '' else 'Inexistant dans la structure d''accès' end indic_valid_formt
        ,ref_struc_aplic
        ,ref_atrib_struc_aplic
        , (select sa.nom
             from vd_afw_12_struc_aplic         sa
                 ,vd_i_afw_12_atrib_struc_aplic asa2
            where     sa.seqnc = asa2.ref_struc_aplic
                  and asa2.seqnc = asa.ref_atrib_struc_aplic)
           ref_atrib_struc_aplic_nom_sa
        , (select asa2.ref_struc_aplic
             from vd_i_afw_12_atrib_struc_aplic asa2
            where asa2.seqnc = asa.ref_atrib_struc_aplic)
           ref_atrib_struc_aplic_seqnc_sa
        ,indic_destn
    from vd_i_afw_12_atrib_struc_aplic asa
/
