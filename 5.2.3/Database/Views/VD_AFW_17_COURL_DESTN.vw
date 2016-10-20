SET DEFINE OFF;
create or replace force view vd_afw_17_courl_destn
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_fil_atent
 ,nom
 ,adres
 ,type
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_fil_atent
        ,nom
        ,adres
        ,type
    from vd_i_afw_17_courl_destn
/
