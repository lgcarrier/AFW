SET DEFINE OFF;
create or replace force view vd_i_afw_13_insta_prefr
(
  seqnc
 ,ref_prefr
 ,ref_utils
 ,ref_sesn
 ,valr
 ,ref_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prefr
        ,ref_utils
        ,ref_sesn
        ,valr
        ,ref_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_13_insta_prefr
/
