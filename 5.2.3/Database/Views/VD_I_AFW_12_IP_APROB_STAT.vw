SET DEFINE OFF;
create or replace force view vd_i_afw_12_ip_aprob_stat
(
  seqnc
 ,ref_insta_procs_aprob
 ,ref_stat
 ,date_debut_efect
 ,date_fin_efect
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select "SEQNC"
        ,"REF_INSTA_PROCS_APROB"
        ,"REF_STAT"
        ,"DATE_DEBUT_EFECT"
        ,"DATE_FIN_EFECT"
        ,"UTILS_CREAT"
        ,"DATE_CREAT"
        ,"UTILS_MODFC"
        ,"DATE_MODFC"
        ,"DNR_REF_DOMN"
    from afw_12_insta_procs_aprob_stat
/
