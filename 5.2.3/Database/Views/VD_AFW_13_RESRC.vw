SET DEFINE OFF;
create or replace force view vd_afw_13_resrc
(
  seqnc
 ,code
 ,nom
 ,nom_formt
 ,nom_physq_comps
 ,ref_prodt
 ,descr
 ,ref_type_fichr
 ,ref_type_fichr_formt
 ,ref_struc_aplic
 ,indic_stock_meme_reprt
 ,ref_dosr_virtl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_resrc
 ,type_resrc_formt
 ,indic_publc
 ,empla_html
 ,ref_plugn
)
as
  select seqnc
        ,code
        ,nom
        ,case
           when ref_prodt is not null
           then
                '[Application] '
             || nom
           when ref_struc_aplic is not null
           then
                '[Structure applicative - '
             || (select sa.nom
                   from vd_i_afw_12_struc_aplic sa
                  where sa.seqnc = r.ref_struc_aplic)
             || '] '
             || nom
           when ref_plugn is not null
           then
                '[Plugin - '
             || (select p.nom
                   from vd_i_afw_11_plugn p
                  where p.seqnc = r.ref_plugn)
             || '] '
             || nom
           else
             nom
         end
           nom_formt
        ,nom_physq_comps
        ,ref_prodt
        ,descr
        ,ref_type_fichr
        , (select tf.nom
             from vd_i_afw_13_type_fichr tf
            where tf.seqnc = r.ref_type_fichr)
        ,ref_struc_aplic
        ,indic_stock_meme_reprt
        ,ref_dosr_virtl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_resrc
        , (select valr
             from vd_afw_14_detl_domn_valr ddv
            where     code_valr = type_resrc
                  and ref_code_domn_valr_formt = 'TYPE_RESRC'
                  and ddv.ref_prodt_dv = afw_11_prodt_pkg.obten_prodt_sesn)
        ,indic_publc
        ,empla_html
        ,ref_plugn
    from vd_i_afw_13_resrc r
/
