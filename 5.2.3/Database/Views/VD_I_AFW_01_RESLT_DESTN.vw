SET DEFINE OFF;
create or replace force view vd_i_afw_01_reslt_destn
(
  seqnc
 ,ref_destn
 ,dnr_ref_prodt
 ,ident_acces
 ,ident_acces_formt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,nom
 ,ref_struc_aplic_acces
)
as
  select seqnc
        ,ref_destn
        ,dnr_ref_prodt
        ,ident_acces
        ,ident_acces_formt
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,nom
        ,ref_struc_aplic_acces
    from afw_01_reslt_destn
/
