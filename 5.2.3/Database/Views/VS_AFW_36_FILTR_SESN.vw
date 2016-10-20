SET DEFINE OFF;
create or replace force view vs_afw_36_filtr_sesn
(
  seqnc
 ,ref_opert_filtr
 ,ref_atrib_dispn
 ,ref_page
 ,dnr_condt_sql
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
        ,ref_opert_filtr
        ,ref_atrib_dispn
        ,ref_page
        ,dnr_condt_sql
        ,dnr_condt_afich
        ,valr_varch1
        ,valr_varch2
        ,valr_numbr1
        ,valr_numbr2
        ,valr_date1
        ,valr_date2
    from vd_i_afw_36_filtr_sesn fs
   where     fs.ref_page = sys_context ('afw_36_filtr'
                                       ,'ref_page')
         and fs.ref_sesn = afw_12_sesn_pkg.obten_sesn
  with read only
/
