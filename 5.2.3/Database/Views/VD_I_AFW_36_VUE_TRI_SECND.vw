SET DEFINE OFF;
create or replace force view vd_i_afw_36_vue_tri_secnd
(
  seqnc
 ,ref_vue
 ,ref_sesn
 ,ref_atrib
 ,sens_filtr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_vue
        ,ref_sesn
        ,ref_atrib
        ,sens_filtr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_36_vue_tri_secnd
/
