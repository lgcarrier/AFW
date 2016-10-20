SET DEFINE OFF;
create or replace force view vd_afw_36_filtr_sesn
(
  seqnc
 ,ref_sesn
 ,ref_opert_filtr
 ,ref_atrib_dispn
 ,ref_page
 ,dnr_condt_sql
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_condt_afich
 ,valr_varch1
 ,valr_varch2
 ,valr_numbr1
 ,valr_numbr2
 ,valr_date1
 ,valr_date2
)
as
  select seqnc
        ,ref_sesn
        ,ref_opert_filtr
        ,ref_atrib_dispn
        ,ref_page
        ,dnr_condt_sql
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_condt_afich
        ,valr_varch1
        ,valr_varch2
        ,valr_numbr1
        ,valr_numbr2
        ,valr_date1
        ,valr_date2
    from vd_i_afw_36_filtr_sesn
/
