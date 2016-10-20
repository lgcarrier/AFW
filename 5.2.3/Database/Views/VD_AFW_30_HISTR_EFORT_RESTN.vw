SET DEFINE OFF;
create or replace force view vd_afw_30_histr_efort_restn
(
  seqnc
 ,ref_item_carnt_sprin
 ,date_heure_saisi
 ,efort_restn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_item_carnt_sprin
        ,date_heure_saisi
        ,efort_restn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_30_histr_efort_restn
/
