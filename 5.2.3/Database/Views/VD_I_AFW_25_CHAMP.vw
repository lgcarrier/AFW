SET DEFINE OFF;
create or replace force view vd_i_afw_25_champ
(
  seqnc
 ,code
 ,postn_x
 ,postn_y
 ,angle_orint
 ,ref_formt
 ,ref_versn_publc
 ,ref_dv_type_champ
 ,indic_modif
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,postn_x
        ,postn_y
        ,angle_orint
        ,ref_formt
        ,ref_versn_publc
        ,ref_dv_type_champ
        ,indic_modif
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_25_champ
/
