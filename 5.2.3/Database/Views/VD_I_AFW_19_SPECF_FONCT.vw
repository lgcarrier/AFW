SET DEFINE OFF;
create or replace force view vd_i_afw_19_specf_fonct
(
  seqnc
 ,ref_dispn_fonct
 ,ref_item
 ,ref_page
 ,ref_dv_type_subst
 ,valr_atrib_1
 ,valr_atrib_2
 ,valr_atrib_3
 ,valr_atrib_4
 ,valr_atrib_5
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_page
)
as
  select seqnc
        ,ref_dispn_fonct
        ,ref_item
        ,ref_page
        ,ref_dv_type_subst
        ,valr_atrib_1
        ,valr_atrib_2
        ,valr_atrib_3
        ,valr_atrib_4
        ,valr_atrib_5
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_page
    from afw_19_specf_fonct
/
