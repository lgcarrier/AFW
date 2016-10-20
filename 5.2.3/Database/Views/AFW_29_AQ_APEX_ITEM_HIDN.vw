SET DEFINE OFF;
create or replace force view afw_29_aq_apex_item_hidn
(
  id
 ,flow_id
 ,name
)
as
  select aip.id
        ,aip.flow_id
        ,aip.name
    from apex_item_page aip
   where     display_as like '%HIDDEN%'
         and aip.item_plug_id not in (select id
                                        from apex_regn ar
                                       where     page_id = 0
                                             and plug_name = 'Items cachés'
                                             and ar.flow_id = aip.flow_id)
/
