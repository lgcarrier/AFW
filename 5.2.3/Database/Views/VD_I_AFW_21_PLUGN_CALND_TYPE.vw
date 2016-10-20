SET DEFINE OFF;
create or replace force view vd_i_afw_21_plugn_calnd_type
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,coulr_texte
 ,coulr_bordr
 ,coulr_arier_plan
 ,ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,coulr_texte
        ,coulr_bordr
        ,coulr_arier_plan
        ,ref_domn
    from afw_21_plugn_calnd_type
/
