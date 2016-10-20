SET DEFINE OFF;
create or replace force view vd_i_afw_11_versn
(
  seqnc
 ,numr_versn_1
 ,numr_versn_2
 ,numr_versn_3
 ,numr_versn_4
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,indic_docmn_verl
 ,nom
 ,ref_plugn
 ,code
 ,dnr_ref_prodt
 ,ref_aplic
 ,dnr_ref_aplic
)
as
  select seqnc
        ,numr_versn_1
        ,numr_versn_2
        ,numr_versn_3
        ,numr_versn_4
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,indic_docmn_verl
        ,nom
        ,ref_plugn
        ,code
        ,dnr_ref_prodt
        ,ref_aplic
        ,dnr_ref_aplic
    from afw_11_versn
/
