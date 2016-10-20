SET DEFINE OFF;
create or replace force view vd_afw_20_sectn_docmn
(
  seqnc
 ,ref_dv_type_sectn
 ,ref_dv_type_sectn_formt
 ,ref_sectn_docmn
 ,ref_sectn_docmn_formt
 ,ref_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom
 ,titre
 ,descr
 ,ref_formt
)
as
  select seqnc
        ,ref_dv_type_sectn
        ,afw_14_domn_valr_pkg.obten_valr (sc.ref_dv_type_sectn)
        ,ref_sectn_docmn
        , (select nom
             from vd_i_afw_20_sectn_docmn sc2
            where sc2.seqnc = sc.ref_sectn_docmn)
        ,ref_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,nom
        ,titre
        ,descr
        ,ref_formt
    from vd_i_afw_20_sectn_docmn sc
/
