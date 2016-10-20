SET DEFINE OFF;
create or replace force view vd_afw_01_confg_evenm_n_lang
(
  seqnc
 ,ref_confg_evenm_notfb
 ,ref_lang
 ,ref_lang_formt
 ,objet
 ,titre_mesg
 ,mesg_sms
 ,mesg
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_confg_evenm_notfb
        ,ref_lang
        , (select l.nom
             from vd_afw_01_lang l
            where l.seqnc = cenl.ref_lang)
           ref_lang_formt
        ,objet
        ,titre_mesg
        ,mesg_sms
        ,mesg
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_domn
    from vd_i_afw_01_confg_evenm_n_lang cenl
/
