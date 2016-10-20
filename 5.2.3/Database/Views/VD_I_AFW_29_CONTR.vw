SET DEFINE OFF;
create or replace force view vd_i_afw_29_contr
(
  seqnc
 ,code_contr
 ,nom_struc_acces
 ,nom
 ,descr
 ,niv_gravt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code_contr
        ,nom_struc_acces
        ,nom
        ,descr
        ,niv_gravt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_29_contr
/
