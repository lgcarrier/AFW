SET DEFINE OFF;
create or replace force view vd_i_afw_13_lien_condt_piltb
(
  seqnc
 ,ref_page_item
 ,ref_condt_piltb
 ,indic_lectr_seul
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_afich
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_page_item
        ,ref_condt_piltb
        ,indic_lectr_seul
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_afich
        ,dnr_ref_aplic
    from afw_13_lien_condt_piltb
/
