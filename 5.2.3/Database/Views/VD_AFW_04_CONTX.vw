SET DEFINE OFF;
create or replace force view vd_afw_04_contx
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
  select ctx.ref_fil_arian
        ,ctx.contx
        ,ctx.actio
        ,ctx.seqnc_contx
        ,ctx.date_creat
        ,ctx.utils_creat
        ,ctx.date_modfc
        ,ctx.utils_modfc
        ,ctx.contx_inter
        ,ctx.actio_inter
        ,ctx.seqnc_contx_inter
        ,ctx.indic_ignor
        ,ctx.nom_procd_infor_suplm
        ,ctx.infor_suplm
        ,ctx.contx_formt
    from vd_i_afw_04_contx ctx
   where exists
           (select null
              from vd_i_afw_04_fil_arian fil
             where fil.seqnc = ctx.ref_fil_arian)
/
