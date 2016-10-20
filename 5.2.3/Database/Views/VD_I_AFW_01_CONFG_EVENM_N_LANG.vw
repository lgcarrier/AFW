SET DEFINE OFF;
create or replace force view vd_i_afw_01_confg_evenm_n_lang
(
  seqnc
 ,ref_confg_evenm_notfb
 ,ref_lang
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
  select "SEQNC"
        ,"REF_CONFG_EVENM_NOTFB"
        ,"REF_LANG"
        ,"OBJET"
        ,"TITRE_MESG"
        ,"MESG_SMS"
        ,"MESG"
        ,"DATE_CREAT"
        ,"UTILS_CREAT"
        ,"DATE_MODFC"
        ,"UTILS_MODFC"
        ,"DNR_REF_DOMN"
    from afw_01_confg_evenm_notfb_lang
/
