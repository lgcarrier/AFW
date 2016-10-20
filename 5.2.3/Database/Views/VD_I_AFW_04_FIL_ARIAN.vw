SET DEFINE OFF;
create or replace force view vd_i_afw_04_fil_arian
(
  seqnc
 ,page
 ,session_id
 ,ref_elemn_sup
 ,libl
 ,timst
 ,date_creat
 ,utils_creat
 ,app_id
 ,hash_dernr_url
 ,indic_afich
 ,ref_navgt_histr
 ,aplic
 ,indic_virtl
 ,indic_duplc
)
as
  select seqnc
        ,page
        ,session_id
        ,ref_elemn_sup
        ,libl
        ,timst
        ,date_creat
        ,utils_creat
        ,app_id
        ,hash_dernr_url
        ,indic_afich
        ,ref_navgt_histr
        ,aplic
        ,indic_virtl
        ,indic_duplc
    from afw_04_fil_arian
/
