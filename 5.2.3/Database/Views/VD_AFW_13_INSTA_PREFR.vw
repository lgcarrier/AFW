SET DEFINE OFF;
create or replace force view vd_afw_13_insta_prefr
(
  seqnc
 ,ref_prefr
 ,ref_utils
 ,ref_utils_formt
 ,ref_sesn
 ,ref_sesn_formt
 ,valr
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prefr
        ,ref_utils
        , (select code_utils
             from vd_afw_12_utils u
            where u.seqnc = ref_utils)
           ref_utils_formt
        ,ref_sesn
        , (select app_user
             from afw_12_sesn s
            where s.id_sesn = ref_sesn)
           ref_sesn_formt
        ,valr
        ,ref_struc_aplic
        , (select nom
             from vd_afw_12_struc_aplic tc
            where tc.seqnc = ref_struc_aplic)
           ref_contx_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_insta_prefr
/
