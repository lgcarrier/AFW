SET DEFINE OFF;
create or replace force view vd_i_afw_37_gadgt_parmt_racrc
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,ref_dv_type_don
 ,forml_don
 ,indic_genrq
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,code
        ,nom
        ,ref_dv_type_don
        ,forml_don
        ,indic_genrq
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_37_gadgt_parmt_racrc
/
