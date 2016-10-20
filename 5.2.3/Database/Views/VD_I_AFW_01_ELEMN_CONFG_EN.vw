SET DEFINE OFF;
create or replace force view vd_i_afw_01_elemn_confg_en
(
  seqnc
 ,ref_confg_evenm_notfb
 ,code
 ,ident_acces
 ,ident_acces_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,formt
)
as
  select seqnc
        ,ref_confg_evenm_notfb
        ,code
        ,ident_acces
        ,ident_acces_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,formt
    from afw_01_elemn_confg_evenm_notfb
/
