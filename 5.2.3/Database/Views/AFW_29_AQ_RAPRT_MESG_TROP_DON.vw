SET DEFINE OFF;
create or replace force view afw_29_aq_raprt_mesg_trop_don
(
  numr_aplic_apex
 ,numr_page_apex
 ,nom_raprt
 ,mesg
)
as
  select ai.flow_id
        ,ai.page_id
        ,ai.name
        ,ai.max_row_count_message
    from apex_ir ai
   where     (   ai.max_row_count_message <> '&A_AFW_13_MESG_TROP_DON_TROUV.'
              or ai.max_row_count_message is null)
         and ai.flow_id in (select a.numr_aplic_apex
                              from vd_i_afw_11_aplic a)
  union
  select ar.flow_id
        ,ar.page_id
        ,ar.plug_name
        ,ar.plug_query_more_data
    from apex_regn ar
   where     (   ar.plug_query_more_data <> '&A_AFW_13_MESG_TROP_DON_TROUV.'
              or ar.plug_query_more_data is null)
         and ar.plug_source_type like '%SQL_QUERY%'
         and ar.flow_id in (select a.numr_aplic_apex
                              from vd_i_afw_11_aplic a)
/
