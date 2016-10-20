SET DEFINE OFF;
create or replace force view vd_i_afw_12_aprob
(
  seqnc
 ,ref_group_stat
 ,ref_utils
 ,ref_group_utils
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select "SEQNC"
        ,"REF_GROUP_STAT"
        ,"REF_UTILS"
        ,"REF_GROUP_UTILS"
        ,"UTILS_CREAT"
        ,"DATE_CREAT"
        ,"UTILS_MODFC"
        ,"DATE_MODFC"
        ,"DNR_REF_DOMN"
    from afw_12_aprob
/
