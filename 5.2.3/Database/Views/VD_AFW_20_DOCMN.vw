SET DEFINE OFF;
create or replace force view vd_afw_20_docmn
(
  seqnc
 ,ref_prodt_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_aplic
 ,ref_seqnc_struc_aplic
 ,ref_dv_type_modl
 ,ref_propr
)
as
  select seqnc
        ,ref_prodt_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_struc_aplic
        ,ref_seqnc_struc_aplic
        , (select ref_dv_type_modl
             from vd_i_afw_20_modl m
            where m.seqnc = ref_seqnc_struc_aplic)
        , (select m.seqnc
             from vd_afw_20_modl m
            where m.seqnc = (select ref_modl
                               from vd_afw_20_modl m2
                              where m2.seqnc = ref_seqnc_struc_aplic))
    from vd_i_afw_20_docmn d
/
