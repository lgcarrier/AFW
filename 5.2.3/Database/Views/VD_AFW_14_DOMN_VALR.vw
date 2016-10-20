SET DEFINE OFF;
create or replace force view vd_afw_14_domn_valr
(
  seqnc
 ,code
 ,nom
 ,descr
 ,enonc_sourc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_don
 ,type_don_formt
 ,ref_formt
 ,ref_code_formt_formt
 ,ref_prodt
 ,ref_prodt_formt
 ,ref_type_domn_valr
 ,indic_systm
 ,ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,enonc_sourc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_don
        ,decode (type_don,  'V', 'Alphanumérique',  'N', 'Numérique',  'D', 'Date',  null) type_don_formt
        ,ref_formt
        , (select defnt
             from vd_afw_14_formt f
            where f.seqnc = ref_formt)
           ref_code_formt_formt
        ,ref_prodt
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_11_prodt
            where seqnc = dv.ref_prodt)
           ref_prodt_formt
        ,ref_type_domn_valr
        ,indic_systm
        ,ref_domn
    from vd_i_afw_14_domn_valr dv
/
