SET DEFINE OFF;
create or replace force view vd_afw_13_ocurn_resrc
(
  seqnc
 ,ref_resrc
 ,nom
 ,ref_formt_resrc
 ,ref_formt_resrc_formt
 ,ref_mime_type
 ,ref_mime_type_formt
 ,nom_physq
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,cordn_x_debut
 ,cordn_y_debut
 ,largr_prepn
 ,hautr_prepn
 ,ref_dosr_virtl
 ,ref_dosr_virtl_formt
 ,ref_versn
 ,ref_versn_formt
)
as
  select seqnc
        ,ref_resrc
        ,nom
        ,ref_formt_resrc
        , (select nom
             from vd_i_afw_13_formt_resrc fr
            where fr.seqnc = ocr.ref_formt_resrc)
        ,ref_mime_type
        , (select    mime_type
                  || ' ('
                  || ext
                  || ')'
             from vd_i_afw_13_mime_type mt
            where mt.seqnc = ocr.ref_mime_type)
        ,nom_physq
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,cordn_x_debut
        ,cordn_y_debut
        ,largr_prepn
        ,hautr_prepn
        ,ref_dosr_virtl
        , (select nom
             from vd_i_afw_13_dosr_virtl dv
            where dv.seqnc = ocr.ref_dosr_virtl)
           ref_dosr_virtl_formt
        ,ref_versn
        , (select nom_formt
             from vd_afw_11_versn v
            where v.seqnc = ocr.ref_versn)
           ref_versn_formt
    from vd_i_afw_13_ocurn_resrc ocr
/
