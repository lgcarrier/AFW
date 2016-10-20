SET DEFINE OFF;
create or replace force view vd_i_afw_13_regn_piltb
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_page
 ,ref_dv_type_regn_piltb
 ,dnr_ref_aplic
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_page
        ,ref_dv_type_regn_piltb
        ,dnr_ref_aplic
    from afw_13_regn_piltb
/
