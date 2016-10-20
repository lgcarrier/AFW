SET DEFINE OFF;
create or replace force view vd_i_afw_12_group_aprob
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_group_stat
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select "SEQNC"
        ,"CODE"
        ,"NOM"
        ,"DESCR"
        ,"REF_GROUP_STAT"
        ,"UTILS_CREAT"
        ,"DATE_CREAT"
        ,"UTILS_MODFC"
        ,"DATE_MODFC"
        ,"DNR_REF_DOMN"
    from afw_12_group_aprob
/
