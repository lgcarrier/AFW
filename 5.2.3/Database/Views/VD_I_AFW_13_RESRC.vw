SET DEFINE OFF;
create or replace force view vd_i_afw_13_resrc
(
  seqnc
 ,code
 ,ref_prodt
 ,descr
 ,ref_type_fichr
 ,ref_struc_aplic
 ,indic_stock_meme_reprt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_resrc
 ,nom
 ,nom_physq_comps
 ,indic_publc
 ,empla_html
 ,ref_plugn
 ,ref_dosr_virtl
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,ref_prodt
        ,descr
        ,ref_type_fichr
        ,ref_struc_aplic
        ,indic_stock_meme_reprt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_resrc
        ,nom
        ,nom_physq_comps
        ,indic_publc
        ,empla_html
        ,ref_plugn
        ,ref_dosr_virtl
        ,dnr_ref_prodt
    from afw_13_resrc
/
