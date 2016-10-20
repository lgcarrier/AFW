SET DEFINE OFF;
create or replace force view afw_29_aq_apex_item_mauvs_regn
(
  numr_aplic_apex_item
 ,numr_page_apex_item
 ,seqnc_afich
 ,nom_item
 ,numr_aplic_apex_regn
 ,numr_page_apex_regn
 ,nom_regn
)
as
  select aip.flow_id
        ,aip.flow_step_id
        ,aip.item_sequence
        ,aip.name
        ,ar.flow_id
        ,ar.page_id
        ,ar.plug_name nom_regn
    from apex_regn      ar
        ,apex_item_page aip
   where     ar.id = aip.item_plug_id
         and ar.flow_id <> aip.flow_id
         and aip.flow_id in (select a.numr_aplic_apex
                               from vd_afw_11_aplic a)
/
