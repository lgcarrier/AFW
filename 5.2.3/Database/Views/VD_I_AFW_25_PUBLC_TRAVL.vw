SET DEFINE OFF;
create or replace force view vd_i_afw_25_publc_travl
(
  seqnc
 ,ref_travl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_stat
 ,nom
 ,indic_parmt_alimn
 ,ref_versn_publc
 ,ref_publc
 ,reslt_html
)
as
  select seqnc
        ,ref_travl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_stat
        ,nom
        ,indic_parmt_alimn
        ,ref_versn_publc
        ,ref_publc
        ,reslt_html
    from afw_25_publc_travl
/
