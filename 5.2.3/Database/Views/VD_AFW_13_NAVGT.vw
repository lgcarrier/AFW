SET DEFINE OFF;
create or replace force view vd_afw_13_navgt
(
  seqnc
 ,ref_id_sesn
 ,ref_fil_arian
 ,indic_extra_total
 ,tail_tabl_extra
 ,nombr_rang_extra
 ,enonc_sql
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_extra_termn
 ,apex_repts_id
 ,ref_raprt_inter
)
as
  select seqnc
        ,ref_id_sesn
        ,ref_fil_arian
        ,indic_extra_total
        ,tail_tabl_extra
        ,nombr_rang_extra
        ,enonc_sql
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_extra_termn
        ,apex_repts_id
        ,ref_raprt_inter
    from vd_i_afw_13_navgt
   where     ref_id_sesn = afw_07_util_pkg.nv ('SESSION')
         and ref_fil_arian = afw_04_fil_arian_pkg.obten_fa_courn ()
  with check option
/
