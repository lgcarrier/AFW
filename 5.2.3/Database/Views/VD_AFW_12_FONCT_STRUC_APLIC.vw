SET DEFINE OFF;
create or replace force view vd_afw_12_fonct_struc_aplic
(
  seqnc
 ,ref_fonct
 ,ref_fonct_formt
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,ref_struc_aplic_code_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select fsa.seqnc
        ,fsa.ref_fonct
        , (select f.nom
             from vd_i_afw_12_fonct f
            where f.seqnc = fsa.ref_fonct)
        ,fsa.ref_struc_aplic
        , (select sa.nom
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = fsa.ref_struc_aplic)
        , (select sa.code
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = fsa.ref_struc_aplic)
        ,fsa.date_creat
        ,fsa.utils_creat
        ,fsa.date_modfc
        ,fsa.utils_modfc
        ,fsa.dnr_ref_prodt
    from vd_i_afw_12_fonct_struc_aplic fsa
/
