SET DEFINE OFF;
create or replace force view vd_afw_30_carnt_sprin
(
  seqnc
 ,descr
 ,ref_utils_respn
 ,ref_carnt_prodt
 ,date_debut_prevu
 ,date_fin_prevu
 ,ref_versn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,descr
        ,ref_utils_respn
        ,ref_carnt_prodt
        ,date_debut_prevu
        ,date_fin_prevu
        ,ref_versn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_30_carnt_sprin
/
