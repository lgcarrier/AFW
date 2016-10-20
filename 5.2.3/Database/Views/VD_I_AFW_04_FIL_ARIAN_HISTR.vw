SET DEFINE OFF;
create or replace force view vd_i_afw_04_fil_arian_histr
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
    from afw_04_fil_arian
/
