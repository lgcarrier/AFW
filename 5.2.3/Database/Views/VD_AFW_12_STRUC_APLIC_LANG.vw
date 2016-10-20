SET DEFINE OFF;
create or replace force view vd_afw_12_struc_aplic_lang
(
  seqnc
 ,ref_struc_aplic
 ,adjec_demns
 ,nom
 ,descr
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_struc_aplic
        ,adjec_demns
        ,nom
        ,descr
        ,ref_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_struc_aplic_lang
/
