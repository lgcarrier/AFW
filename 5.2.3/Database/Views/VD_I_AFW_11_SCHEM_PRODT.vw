SET DEFINE OFF;
create or replace force view vd_i_afw_11_schem_prodt
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_versn
 ,dnr_ref_prodt
 ,indic_deplm
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select "SEQNC"
        ,"CODE"
        ,"NOM"
        ,"DESCR"
        ,"REF_VERSN"
        ,"DNR_REF_PRODT"
        ,"INDIC_DEPLM"
        ,"UTILS_CREAT"
        ,"DATE_CREAT"
        ,"UTILS_MODFC"
        ,"DATE_MODFC"
    from afw_11_schem_prodt
/
