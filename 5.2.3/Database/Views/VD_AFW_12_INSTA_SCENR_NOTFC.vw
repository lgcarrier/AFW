SET DEFINE OFF;
create or replace force view vd_afw_12_insta_scenr_notfc
(
  seqnc
 ,ref_domn
 ,ref_atrib_scenr_notfc
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_scenr_notfc_actio
 ,indic_notfr
)
as
  select seqnc
        ,ref_domn
        ,ref_atrib_scenr_notfc
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_scenr_notfc_actio
        ,indic_notfr
    from vd_i_afw_12_insta_scenr_notfc
/
