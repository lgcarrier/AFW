SET DEFINE OFF;
create or replace force view vd_afw_36_vue
(
  seqnc
 ,ref_page
 ,code
 ,nom
 ,nom_afich
 ,descr
 ,dnr_ref_aplic
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_vue
)
as
  select seqnc
        ,ref_page
        ,code
        ,nom
        ,nom_afich
        ,descr
        ,dnr_ref_aplic
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_vue
    from vd_i_afw_36_vue
/
