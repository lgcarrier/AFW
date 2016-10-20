SET DEFINE OFF;
create or replace force view vd_i_afw_13_ocurn_resrc
(
  seqnc
 ,ref_resrc
 ,ref_formt_resrc
 ,ref_mime_type
 ,nom_physq
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,cordn_x_debut
 ,cordn_y_debut
 ,largr_prepn
 ,hautr_prepn
 ,nom
 ,ref_dosr_virtl
 ,ref_versn
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_resrc
        ,ref_formt_resrc
        ,ref_mime_type
        ,nom_physq
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,cordn_x_debut
        ,cordn_y_debut
        ,largr_prepn
        ,hautr_prepn
        ,nom
        ,ref_dosr_virtl
        ,ref_versn
        ,dnr_ref_prodt
    from afw_13_ocurn_resrc
/
