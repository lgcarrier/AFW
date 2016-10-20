SET DEFINE OFF;
create or replace force view vd_afw_29_contr
(
  seqnc
 ,ref_prodt
 ,code_contr
 ,nom_struc_acces
 ,nom
 ,descr
 ,niv_gravt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,code_contr
        ,nom_struc_acces
        ,nom
        ,descr
        ,niv_gravt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_29_contr
/
