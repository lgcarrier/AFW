SET DEFINE OFF;
create or replace force view vd_afw_36_lien_opert_filtr
(
  seqnc
 ,ref_type_don
 ,ref_opert_filtr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,indic_deft
)
as
  select seqnc
        ,ref_type_don
        ,ref_opert_filtr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,indic_deft
    from vd_i_afw_36_lien_opert_filtr
/
