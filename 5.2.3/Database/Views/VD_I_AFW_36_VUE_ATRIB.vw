SET DEFINE OFF;
create or replace force view vd_i_afw_36_vue_atrib
(
  seqnc
 ,ref_vue
 ,ref_atrib_dispn
 ,dnr_ref_aplic
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,postn_filtr_bris
 ,sens_filtr_bris
 ,postn_filtr_deft
 ,sens_filtr_deft
 ,ordre
)
as
  select seqnc
        ,ref_vue
        ,ref_atrib_dispn
        ,dnr_ref_aplic
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,postn_filtr_bris
        ,sens_filtr_bris
        ,postn_filtr_deft
        ,sens_filtr_deft
        ,ordre
    from afw_36_vue_atrib
/
