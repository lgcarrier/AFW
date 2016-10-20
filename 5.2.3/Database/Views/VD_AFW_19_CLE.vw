SET DEFINE OFF;
create or replace force view vd_afw_19_cle
(
  seqnc
 ,ref_dispn_fonct
 ,ref_lang
 ,indic_shift
 ,indic_alt
 ,indic_ctrl
 ,indic_inter
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,code_keypr
 ,code_keydw
 ,indic_actif
)
as
  select seqnc
        ,ref_dispn_fonct
        ,ref_lang
        ,indic_shift
        ,indic_alt
        ,indic_ctrl
        ,indic_inter
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,code_keypr
        ,code_keydw
        ,indic_actif
    from vd_i_afw_19_cle
/
