SET DEFINE OFF;
create or replace force view vd_afw_04_fil_arian
(
  seqnc
 ,aplic
 ,page
 ,session_id
 ,ref_elemn_sup
 ,libl
 ,timst
 ,app_id
 ,hash_dernr_url
 ,indic_afich
 ,indic_virtl
 ,indic_duplc
)
as
  select seqnc
        ,aplic
        ,page
        ,session_id
        ,ref_elemn_sup
        ,libl
        ,timst
        ,app_id
        ,hash_dernr_url
        ,indic_afich
        ,indic_virtl
        ,indic_duplc
    from vd_i_afw_04_fil_arian fa
   where fa.session_id = afw_07_util_pkg.nv ('SESSION')
/
