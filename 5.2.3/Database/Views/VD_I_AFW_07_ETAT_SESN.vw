SET DEFINE OFF;
create or replace force view vd_i_afw_07_etat_sesn
(
  seqnc
 ,session_id
 ,nom
 ,valr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,session_id
        ,nom
        ,valr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_07_etat_sesn
/
