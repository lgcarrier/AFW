SET DEFINE OFF;
create or replace force view vd_i_afw_14_ddv_lang
(
  seqnc
 ,ref_detl_domn_valr
 ,ref_lang
 ,valr
 ,valr_court
 ,valr_organ
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select "SEQNC"
        ,"REF_DETL_DOMN_VALR"
        ,"REF_LANG"
        ,"VALR"
        ,"VALR_COURT"
        ,"VALR_ORGAN"
        ,"DATE_CREAT"
        ,"UTILS_CREAT"
        ,"DATE_MODFC"
        ,"UTILS_MODFC"
        ,"DNR_REF_PRODT"
    from afw_14_detl_domn_valr_lang
/
