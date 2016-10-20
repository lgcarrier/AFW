SET DEFINE OFF;
create or replace force view vd_i_afw_25_parmt_type_publc
(
  seqnc
 ,ref_type_publc
 ,ref_engin
 ,code
 ,nom
 ,descr
 ,indic_presn_appel
 ,indic_fixe
 ,valr_deft
 ,type_valr_deft
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_don
 ,ordre_presn
 ,cardn
)
as
  select seqnc
        ,ref_type_publc
        ,ref_engin
        ,code
        ,nom
        ,descr
        ,indic_presn_appel
        ,indic_fixe
        ,valr_deft
        ,type_valr_deft
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_don
        ,ordre_presn
        ,cardn
    from afw_25_parmt_type_publc
/
