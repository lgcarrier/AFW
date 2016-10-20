SET DEFINE OFF;
create or replace force view afw_29_aq_raprt_mesg_aucun_don
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
        ,ai.no_data_found_message
    from apex_ir ai
   where     (   ai.no_data_found_message <> '&A_AFW_13_MESG_AUCUN_DON_TROUV.'
              or ai.no_data_found_message is null)
         and ai.flow_id in (select a.numr_aplic_apex
                              from vd_i_afw_11_aplic a)
  union
  select ar.flow_id
        ,ar.page_id
        ,ar.plug_name
        ,ar.plug_query_no_data_found
    from apex_regn ar
   where     (   ar.plug_query_no_data_found <> '&A_AFW_13_MESG_AUCUN_DON_TROUV.'
              or ar.plug_query_no_data_found is null)
         and ar.plug_source_type like '%SQL_QUERY%'
         and ar.flow_id in (select a.numr_aplic_apex
                              from vd_i_afw_11_aplic a)
/
