SET DEFINE OFF;
create or replace force view vd_i_afw_36_atrib_dispn
(
  seqnc
 ,ref_page
 ,ref_type_don
 ,indic_dispn
 ,nom_afich
 ,nom_sql
 ,dnr_ref_aplic
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_page
        ,ref_type_don
        ,indic_dispn
        ,nom_afich
        ,nom_sql
        ,dnr_ref_aplic
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_36_atrib_dispn
/
