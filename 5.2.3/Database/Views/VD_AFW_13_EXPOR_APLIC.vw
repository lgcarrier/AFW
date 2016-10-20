SET DEFINE OFF;
create or replace force view vd_afw_13_expor_aplic
(
  seqnc
 ,ref_sesn
 ,ref_aplic
 ,ref_aplic_formt
 ,ref_aplic_code
 ,ref_aplic_nom
 ,ref_aplic_aplic_authe
 ,numr_aplic_courn
 ,indic_maj_refrn
 ,numr_aplic_cible
 ,indic_ajout_aplic_apex
)
as
  select seqnc
        ,ref_sesn
        ,ref_aplic
        , (select nom_formt
             from vd_afw_11_aplic a
            where a.seqnc = ea.ref_aplic)
           ref_aplic_formt
        ,afw_11_aplic_pkg.obten_code_aplic (ea.ref_aplic)      ref_aplic_code
        , (select nom
             from vd_afw_11_aplic a
            where a.seqnc = ea.ref_aplic)
           ref_aplic_nom
        , (select ref_aplic_authe
             from vd_afw_11_aplic a
            where a.seqnc = ea.ref_aplic)
           ref_aplic_aplic_authe
        ,afw_11_aplic_pkg.obten_numr_apex_aplic (ea.ref_aplic) numr_aplic_courn
        ,indic_maj_refrn
        ,numr_aplic_cible
        ,indic_ajout_aplic_apex
    from vd_i_afw_13_expor_aplic ea
/
