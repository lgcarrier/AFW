SET DEFINE OFF;
create or replace force view afw_29_aq_apex_align_raprt
(
  numr_aplic_apex
 ,numr_page_apex
 ,nom_raprt
 ,libl_coln
 ,type_don
 ,entet_align
 ,coln_align
)
as
  select air.flow_id
        ,ai.page_id
        ,ai.name
        ,air.column_label
        ,air.column_type
        ,air.heading_alignment
        ,air.column_alignment
    from apex_ir      ai
        ,apex_ir_coln air
   where     ai.id = air.worksheet_id
         and air.heading_alignment != air.column_alignment
         and air.flow_id in (select a.numr_aplic_apex
                               from vd_afw_11_aplic a)
  union all
  select arc.flow_id
        ,ar.page_id
        ,ar.plug_name
        ,arc.column_heading
        ,null
        ,arc.heading_alignment
        ,arc.column_alignment
    from apex_regn      ar
        ,apex_regn_coln arc
   where     ar.id = arc.region_id
         and arc.heading_alignment != arc.column_alignment
         and arc.flow_id in (select a.numr_aplic_apex
                               from vd_afw_11_aplic a)
/
