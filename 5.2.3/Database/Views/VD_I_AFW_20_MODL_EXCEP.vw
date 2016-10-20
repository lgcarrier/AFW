SET DEFINE OFF;
create or replace force view vd_i_afw_20_modl_excep
(
  seqnc
 ,ref_modl
 ,nom_organ
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_modl
        ,nom_organ
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_20_modl_excep
/
