SET DEFINE OFF;
create or replace force view vd_afw_01_hierc_aplic
(
  seqnc
 ,ref_evenm_notfb
 ,ref_atrib_struc_aplic
 ,aplic_prior
 ,ref_sa
 ,ref_sa_formt
 ,ref_sa_cle_etran
 ,ref_sa_cle_etran_formt
 ,chemn_reslt
)
as
  select seqnc
        ,ref_evenm_notfb
        ,ref_atrib_struc_aplic
        ,aplic_prior
        , (select sa.seqnc
             from vd_i_afw_12_atrib_struc_aplic asa
                 ,vd_i_afw_12_struc_aplic       sa
            where     sa.seqnc = asa.ref_struc_aplic
                  and asa.seqnc = ha.ref_atrib_struc_aplic)
           ref_sa
        , (select sa.nom
             from vd_i_afw_12_atrib_struc_aplic asa
                 ,vd_i_afw_12_struc_aplic       sa
            where     sa.seqnc = asa.ref_struc_aplic
                  and asa.seqnc = ha.ref_atrib_struc_aplic)
           ref_sa_formt
        , (select sa.seqnc
             from vd_i_afw_12_struc_aplic       sa
                 ,vd_i_afw_12_atrib_struc_aplic asa2
                 ,vd_i_afw_12_atrib_struc_aplic asa
            where     sa.seqnc = asa2.ref_struc_aplic
                  and asa2.seqnc = asa.ref_atrib_struc_aplic
                  and asa.seqnc = ha.ref_atrib_struc_aplic)
           ref_sa_cle_etran
        , (select sa.nom
             from vd_i_afw_12_struc_aplic       sa
                 ,vd_i_afw_12_atrib_struc_aplic asa2
                 ,vd_i_afw_12_atrib_struc_aplic asa
            where     sa.seqnc = asa2.ref_struc_aplic
                  and asa2.seqnc = asa.ref_atrib_struc_aplic
                  and asa.seqnc = ha.ref_atrib_struc_aplic)
           ref_sa_cle_etran_formt
        , (select nvl (asa.nom_fonct, asa.nom_coln)
             from vd_i_afw_12_atrib_struc_aplic asa
            where asa.seqnc = ha.ref_atrib_struc_aplic)
           chemn_reslt
    from vd_i_afw_01_hierc_aplic ha
/
