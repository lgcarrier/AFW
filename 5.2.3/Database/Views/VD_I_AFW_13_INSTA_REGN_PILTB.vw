SET DEFINE OFF;
create or replace force view vd_i_afw_13_insta_regn_piltb
(
  seqnc
 ,ref_utils
 ,ref_regn_piltb
 ,indic_regn_activ
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_regn_piltb
        ,indic_regn_activ
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_13_insta_regn_piltb
/
