SET DEFINE OFF;
create or replace force view vd_afw_13_lien_condt_piltb
(
  seqnc
 ,ref_page_item
 ,ref_page_item_formt
 ,ref_condt_piltb
 ,indic_lectr_seul
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_afich
)
as
  select seqnc
        ,ref_page_item
        , (select nom_apex
             from vd_i_afw_13_page_item
            where seqnc = lcp.ref_page_item)
           ref_page_item_formt
        ,ref_condt_piltb
        ,indic_lectr_seul
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_afich
    from vd_i_afw_13_lien_condt_piltb lcp
/
