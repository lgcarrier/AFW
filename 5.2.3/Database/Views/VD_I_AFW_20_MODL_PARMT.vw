SET DEFINE OFF;
create or replace force view vd_i_afw_20_modl_parmt
(
  seqnc
 ,ref_modl
 ,nom_organ
 ,postn
 ,valr_deft
 ,sens
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_publc
 ,indic_retr
 ,ref_dv_type_don
)
as
  select seqnc
        ,ref_modl
        ,nom_organ
        ,postn
        ,valr_deft
        ,sens
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_publc
        ,indic_retr
        ,ref_dv_type_don
    from afw_20_modl_parmt
/
