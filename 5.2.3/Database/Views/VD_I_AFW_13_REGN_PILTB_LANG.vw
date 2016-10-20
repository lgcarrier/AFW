SET DEFINE OFF;
create or replace force view vd_i_afw_13_regn_piltb_lang
(
  seqnc
 ,ref_regn_piltb
 ,contn
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_regn_piltb
        ,contn
        ,ref_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_regn_piltb_lang
/
