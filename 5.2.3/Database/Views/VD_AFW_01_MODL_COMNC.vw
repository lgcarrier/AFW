SET DEFINE OFF;
create or replace force view vd_afw_01_modl_comnc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_type_comnc
 ,ref_type_comnc_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_systm
 ,ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_type_comnc
        , (select nom
             from vd_i_afw_01_type_comnc tc
            where tc.seqnc = mc.ref_type_comnc)
           ref_type_comnc_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_systm
        ,ref_domn
    from vd_i_afw_01_modl_comnc mc
/
