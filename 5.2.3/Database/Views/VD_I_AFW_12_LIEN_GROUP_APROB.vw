SET DEFINE OFF;
create or replace force view vd_i_afw_12_lien_group_aprob
(
  seqnc
 ,ref_group_aprob
 ,ref_aprob
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select "SEQNC"
        ,"REF_GROUP_APROB"
        ,"REF_APROB"
        ,"UTILS_CREAT"
        ,"DATE_CREAT"
        ,"UTILS_MODFC"
        ,"DATE_MODFC"
        ,"DNR_REF_DOMN"
    from afw_12_lien_group_aprob
/
