SET DEFINE OFF;
create or replace force view vd_afw_04_contx_etend
(
  seqnc
 ,ref_contx
 ,nom
 ,valr_numbr
 ,valr_varch
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,page_cible
 ,type_alimn
 ,type_elemn
)
as
  select seqnc
        ,ref_contx
        ,nom
        ,valr_numbr
        ,valr_varch
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,page_cible
        ,type_alimn
        ,type_elemn
    from vd_i_afw_04_contx_etend etend
   where exists
           (select null
              from vd_i_afw_04_contx contx
             where contx.ref_fil_arian = etend.ref_contx)
/
