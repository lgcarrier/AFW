SET DEFINE OFF;
create or replace force view vd_i_afw_25_parmt_publc_travl
(
  seqnc
 ,ref_publc_travl
 ,ref_parmt_type_publc
 ,valr_varch
 ,valr_date
 ,valr_numbr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_publc_travl
        ,ref_parmt_type_publc
        ,valr_varch
        ,valr_date
        ,valr_numbr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_25_parmt_publc_travl
/
