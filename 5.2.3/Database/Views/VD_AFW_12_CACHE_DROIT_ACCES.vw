SET DEFINE OFF;
create or replace force view vd_afw_12_cache_droit_acces
(
  ref_sesn
 ,cle_acces
 ,indic_verfc_reus
)
as
  select ref_sesn
        ,cle_acces
        ,indic_verfc_reus
    from vd_i_afw_12_cache_droit_acces
/
