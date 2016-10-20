SET DEFINE OFF;
create or replace force view vd_i_afw_12_scenr_notfc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select "SEQNC"
        ,"CODE"
        ,"NOM"
        ,"DESCR"
        ,"UTILS_CREAT"
        ,"DATE_CREAT"
        ,"UTILS_MODFC"
        ,"DATE_MODFC"
        ,"REF_PRODT"
        ,"DNR_REF_PRODT"
    from afw_12_scenr_notfc
/
