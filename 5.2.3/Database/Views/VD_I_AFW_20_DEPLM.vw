SET DEFINE OFF;
create or replace force view vd_i_afw_20_deplm
(
  seqnc
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_modl
 ,ref_modl_parmt
 ,ref_prodt_lang
)
as
  select seqnc
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_modl
        ,ref_modl_parmt
        ,ref_prodt_lang
    from afw_20_deplm
/
