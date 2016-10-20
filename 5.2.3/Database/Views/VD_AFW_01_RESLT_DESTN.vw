SET DEFINE OFF;
create or replace force view vd_afw_01_reslt_destn
(
  seqnc
 ,ref_destn
 ,dnr_ref_prodt
 ,ident_acces
 ,ident_acces_formt
 ,nom
 ,ref_struc_aplic_acces
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_destn
        ,dnr_ref_prodt
        ,ident_acces
        ,ident_acces_formt
        ,nom
        ,ref_struc_aplic_acces
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from vd_i_afw_01_reslt_destn
/
