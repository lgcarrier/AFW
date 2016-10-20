SET DEFINE OFF;
create or replace force view vd_i_afw_14_formt
(
  seqnc
 ,libl
 ,defnt
 ,type_don
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_formt_orcl
 ,indic_unite_inclu
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,libl
        ,defnt
        ,type_don
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_formt_orcl
        ,indic_unite_inclu
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_14_formt
/
