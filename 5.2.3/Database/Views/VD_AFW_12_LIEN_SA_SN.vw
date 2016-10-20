SET DEFINE OFF;
create or replace force view vd_afw_12_lien_sa_sn
(
  seqnc
 ,ref_struc_aplic
 ,ref_scenr_notfc
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_prodt
)
as
  select "SEQNC"
        ,"REF_STRUC_APLIC"
        ,"REF_SCENR_NOTFC"
        ,"UTILS_CREAT"
        ,"DATE_CREAT"
        ,"UTILS_MODFC"
        ,"DATE_MODFC"
        ,"DNR_REF_PRODT"
    from vd_i_afw_12_lien_sa_sn
/
