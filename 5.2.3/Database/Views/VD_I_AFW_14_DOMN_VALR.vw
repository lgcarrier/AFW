SET DEFINE OFF;
create or replace force view vd_i_afw_14_domn_valr
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
 ,ref_formt
 ,ref_prodt
 ,ref_type_domn_valr
 ,indic_systm
 ,dnr_ref_prodt
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
        ,ref_formt
        ,ref_prodt
        ,ref_type_domn_valr
        ,indic_systm
        ,dnr_ref_prodt
        ,ref_domn
    from afw_14_domn_valr
/
