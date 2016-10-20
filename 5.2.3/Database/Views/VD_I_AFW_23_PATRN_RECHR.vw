SET DEFINE OFF;
create or replace force view vd_i_afw_23_patrn_rechr
(
  seqnc
 ,code
 ,nom
 ,descr
 ,enonc_plsql_gauch
 ,enonc_plsql_droit
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,opert
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,enonc_plsql_gauch
        ,enonc_plsql_droit
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,opert
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_23_patrn_rechr
/
