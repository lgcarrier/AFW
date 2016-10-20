SET DEFINE OFF;
create or replace force view vd_i_afw_12_atrib_struc_aplic
(
  seqnc
 ,nom_coln
 ,nom_fonct
 ,ref_dv_natr_infor
 ,indic_valid
 ,ref_struc_aplic
 ,ref_atrib_struc_aplic
 ,indic_destn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,nom_coln
        ,nom_fonct
        ,ref_dv_natr_infor
        ,indic_valid
        ,ref_struc_aplic
        ,ref_atrib_struc_aplic
        ,indic_destn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_12_atrib_struc_aplic
/
