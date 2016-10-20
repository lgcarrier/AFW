SET DEFINE OFF;
create or replace force view vd_i_afw_13_expor_aplic
(
  seqnc
 ,ref_sesn
 ,ref_aplic
 ,indic_maj_refrn
 ,numr_aplic_cible
 ,indic_ajout_aplic_apex
)
as
  select seqnc
        ,ref_sesn
        ,ref_aplic
        ,indic_maj_refrn
        ,numr_aplic_cible
        ,indic_ajout_aplic_apex
    from afw_13_expor_aplic
/
