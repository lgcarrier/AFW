SET DEFINE OFF;
create or replace force view vd_afw_13_regn_piltb_lang
(
  seqnc
 ,ref_regn_piltb
 ,contn
 ,ref_lang
 ,ref_lang_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_regn_piltb
        ,contn
        ,ref_lang
        , (select l.nom
             from vd_afw_01_lang l
            where l.seqnc = ref_lang)
           ref_lang_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_regn_piltb_lang
/
