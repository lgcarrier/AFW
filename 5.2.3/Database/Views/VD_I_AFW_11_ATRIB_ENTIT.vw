SET DEFINE OFF;
create or replace force view vd_i_afw_11_atrib_entit
(
  seqnc
 ,nom
 ,type_don
 ,compr_migrt
 ,ref_entit
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,code
 ,ref_entit_refrn
 ,indic_nouvl_atrib
)
as
  select seqnc
        ,nom
        ,type_don
        ,compr_migrt
        ,ref_entit
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
        ,code
        ,ref_entit_refrn
        ,indic_nouvl_atrib
    from afw_11_atrib_entit
/
