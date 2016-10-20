SET DEFINE OFF;
create or replace force view vd_afw_13_page_prefr_navgt
(
  seqnc
 ,ref_page
 ,ref_page_ir
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_page_ir_page_formt
 ,ref_page_ir_formt
)
as
  select seqnc
        ,ref_page
        ,ref_page_ir
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        , (select    numr_apex
                  || ' - '
                  || nom
             from vd_afw_13_page p
            where p.seqnc = (select ref_page
                               from vd_afw_13_page_ir pi
                              where pi.seqnc = ppn.ref_page_ir))
           ref_page_ir_page_formt
        , (select libl_regn
             from vd_afw_13_page_ir pi
            where pi.seqnc = ppn.ref_page_ir)
           ref_page_ir_formt
    from vd_i_afw_13_page_prefr_navgt ppn
/
