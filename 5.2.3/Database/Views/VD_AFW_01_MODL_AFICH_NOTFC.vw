SET DEFINE OFF;
create or replace force view vd_afw_01_modl_afich_notfc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,coulr_texte
 ,tail_texte
 ,coulr_titre
 ,tail_titre
 ,temps_afich
 ,ref_resrc_icon
 ,ref_formt_resrc_icon
 ,ref_ocurn_resrc_icon
 ,ref_domn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_type_comnc
 ,ref_modl_comnc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,coulr_texte
        ,tail_texte
        ,coulr_titre
        ,tail_titre
        ,temps_afich
        ,ref_resrc_icon
        ,ref_formt_resrc_icon
        ,ref_ocurn_resrc_icon
        ,ref_domn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_type_comnc
        ,ref_modl_comnc
    from vd_i_afw_01_modl_afich_notfc
/
