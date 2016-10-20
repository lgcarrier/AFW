SET DEFINE OFF;
create or replace force view vd_afw_14_formt
(
  seqnc
 ,libl
 ,defnt
 ,type_don
 ,type_don_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,indic_formt_orcl
 ,indic_unite_inclu
)
as
  select seqnc
        ,libl
        ,defnt
        ,type_don
        ,decode (type_don,  'D', 'Date',  'NE', 'Numérique entier',  'ND', 'Numérique décimal',  'V', 'Alphanumérique',  null) type_don_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,indic_formt_orcl
        ,indic_unite_inclu
    from vd_i_afw_14_formt
/
