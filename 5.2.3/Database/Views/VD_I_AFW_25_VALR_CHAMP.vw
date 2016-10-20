SET DEFINE OFF;
create or replace force view vd_i_afw_25_valr_champ
(
  seqnc
 ,ref_champ
 ,ref_publc_travl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,valr_nombr
 ,valr_date
 ,valr_varch
)
as
  select seqnc
        ,ref_champ
        ,ref_publc_travl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,valr_nombr
        ,valr_date
        ,valr_varch
    from afw_25_valr_champ
/
