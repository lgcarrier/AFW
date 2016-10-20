SET DEFINE OFF;
create or replace force view vd_i_afw_04_contx
(
  ref_fil_arian
 ,contx
 ,actio
 ,seqnc_contx
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,contx_inter
 ,actio_inter
 ,seqnc_contx_inter
 ,indic_ignor
 ,nom_procd_infor_suplm
 ,infor_suplm
 ,contx_formt
)
as
  select ref_fil_arian
        ,contx
        ,actio
        ,seqnc_contx
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,contx_inter
        ,actio_inter
        ,seqnc_contx_inter
        ,indic_ignor
        ,nom_procd_infor_suplm
        ,infor_suplm
        ,contx_formt
    from afw_04_contx
/
