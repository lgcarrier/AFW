SET DEFINE OFF;
create or replace force view vd_i_afw_12_fonct_struc_aplic
(
  seqnc
 ,ref_fonct
 ,ref_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_fonct
        ,ref_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_12_fonct_struc_aplic
/
