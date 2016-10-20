SET DEFINE OFF;
create or replace force view vd_i_afw_30_item_carnt_sprin
(
  seqnc
 ,nom
 ,descr
 ,numr_refrc_docmn
 ,ref_item_carnt_prodt
 ,ref_carnt_sprin
 ,efort_prevu
 ,efort_restn
 ,ref_dv_prior
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_afw_30_page
)
as
  select seqnc
        ,nom
        ,descr
        ,numr_refrc_docmn
        ,ref_item_carnt_prodt
        ,ref_carnt_sprin
        ,efort_prevu
        ,efort_restn
        ,ref_dv_prior
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_afw_30_page
    from afw_30_item_carnt_sprin
/
