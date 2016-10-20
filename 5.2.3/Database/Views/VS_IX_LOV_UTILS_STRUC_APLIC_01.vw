SET DEFINE OFF;
create or replace force view vs_ix_lov_utils_struc_aplic_01
(
  nom_struc
 ,ref_utils_formt
 ,seqnc
 ,nom_type_struc
 ,code_utils
)
as
  select nom_struc
        ,ref_utils_formt
        ,seqnc
        ,nom_type_struc
        ,code_utils
    from table (afw_16_vue_parmt_pkg.obten_lov_utils_struc_aplic ())
/
