SET DEFINE OFF;
create or replace force view vs_afw_01_coln_table
(
  seqnc_prodt
 ,code_prodt
 ,nom_prodt
 ,nom_table
 ,nom
)
as
  select pro.seqnc
        ,pro.code
        ,pro.nom
        ,atc.table_name
        ,atc.column_name
    from all_tab_columns   atc
        ,apex_aplic        app
        ,vd_i_afw_11_prodt pro
        ,vd_i_afw_11_aplic ap
   where     atc.owner = app.owner
         and app.id = ap.numr_aplic_apex
         and ap.ref_prodt = pro.seqnc
/
