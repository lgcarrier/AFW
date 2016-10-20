SET DEFINE OFF;
create or replace force view vd_i_afw_12_histr_acces
(
  seqnc
 ,ref_utils
 ,date_evenm
 ,ref_dv_type_evenm
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,adres_ip
 ,ref_utils_pour
)
as
  select seqnc
        ,ref_utils
        ,date_evenm
        ,ref_dv_type_evenm
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,adres_ip
        ,ref_utils_pour
    from afw_12_histr_acces
/
