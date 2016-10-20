SET DEFINE OFF;
create or replace force view vd_i_afw_13_prefr
(
  seqnc
 ,code
 ,ref_dv_condt_utils
 ,forml_condt_utils
 ,ref_dv_condt_sauvg
 ,forml_condt_sauvg
 ,ref_dv_type_insta
 ,indic_contx
 ,ref_dv_valr_insta
 ,forml_valr_insta
 ,descr_comnt
 ,ref_item
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,code
        ,ref_dv_condt_utils
        ,forml_condt_utils
        ,ref_dv_condt_sauvg
        ,forml_condt_sauvg
        ,ref_dv_type_insta
        ,indic_contx
        ,ref_dv_valr_insta
        ,forml_valr_insta
        ,descr_comnt
        ,ref_item
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_prefr
/
