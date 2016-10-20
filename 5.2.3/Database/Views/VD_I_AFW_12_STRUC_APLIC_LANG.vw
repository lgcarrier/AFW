SET DEFINE OFF;
create or replace force view vd_i_afw_12_struc_aplic_lang
(
  seqnc
 ,ref_struc_aplic
 ,adjec_demns
 ,nom
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,descr
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_struc_aplic
        ,adjec_demns
        ,nom
        ,ref_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,descr
        ,dnr_ref_prodt
    from afw_12_struc_aplic_lang
/
