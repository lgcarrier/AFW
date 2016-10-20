SET DEFINE OFF;
create or replace force view vd_afw_21_plugn_calnd_type
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_domn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,coulr_texte
 ,coulr_bordr
 ,coulr_arier_plan
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_domn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,coulr_texte
        ,coulr_bordr
        ,coulr_arier_plan
    from vd_i_afw_21_plugn_calnd_type
/
