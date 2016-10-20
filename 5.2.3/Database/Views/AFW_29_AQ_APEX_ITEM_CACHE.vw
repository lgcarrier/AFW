SET DEFINE OFF;
create or replace force view afw_29_aq_apex_item_cache
(
  numr_aplic_apex
 ,numr_page_apex
 ,nom_regn
 ,seqnc_afich
 ,nom_item
)
as
  select aip.flow_id
        ,ar.page_id
        ,ar.plug_name
        ,aip.item_sequence
        ,aip.name
    from apex_regn      ar
        ,apex_item_page aip
   where     ar.page_id <> 0
         and ar.plug_name <> 'Items cachés'
         and ar.id = aip.item_plug_id
         and aip.display_as like '%HIDDEN%'
         and aip.flow_id in (select a.numr_aplic_apex
                               from vd_afw_11_aplic a)
/
