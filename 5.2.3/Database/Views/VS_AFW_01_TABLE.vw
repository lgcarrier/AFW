SET DEFINE OFF;
create or replace force view vs_afw_01_table
(
  seqnc_prodt
 ,code_prodt
 ,nom_prodt
 ,nom
)
as
  select pro.seqnc
        ,pro.code
        ,pro.nom
        ,tab.table_name
    from all_tables        tab
        ,apex_aplic        app
        ,vd_i_afw_11_prodt pro
        ,vd_i_afw_11_aplic ap
   where     tab.owner = app.owner
         and app.id = ap.numr_aplic_apex
         and ap.ref_prodt = pro.seqnc
/
