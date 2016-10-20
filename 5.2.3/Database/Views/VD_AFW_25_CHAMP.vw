SET DEFINE OFF;
create or replace force view vd_afw_25_champ
(
  seqnc
 ,code
 ,postn_x
 ,postn_y
 ,angle_orint
 ,ref_formt
 ,ref_formt_formt
 ,ref_versn_publc
 ,ref_dv_type_champ
 ,ref_dv_type_champ_formt
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
        , (select type_don_formt
             from vd_afw_14_formt
            where seqnc = ref_formt)
        ,ref_versn_publc
        ,ref_dv_type_champ
        , (select valr
             from vd_afw_14_detl_domn_valr
            where seqnc = ref_dv_type_champ)
        ,indic_modif
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_25_champ
/
