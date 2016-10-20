SET DEFINE OFF;
create or replace force view vd_afw_13_condt_piltb
(
  seqnc
 ,ref_page
 ,ref_page_apex
 ,code
 ,nom
 ,descr
 ,condt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_page_item_focus
)
as
  select seqnc
        ,ref_page
        , (select numr_apex
             from vd_i_afw_13_page p
            where p.seqnc = cp.ref_page)
           ref_page_apex
        ,code
        ,nom
        ,descr
        ,condt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_page_item_focus
    from vd_i_afw_13_condt_piltb cp
/
