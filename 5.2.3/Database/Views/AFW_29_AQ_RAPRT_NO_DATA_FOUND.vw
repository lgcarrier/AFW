SET DEFINE OFF;
create or replace force view afw_29_aq_raprt_no_data_found
(
  id
 ,flow_id
 ,page_id
 ,plug_name
 ,plug_query_no_data_found
)
as
  (select id
         ,flow_id
         ,page_id
         ,plug_name
         ,plug_query_no_data_found
     from apex_regn
    where     flow_id in (select numr_aplic_apex
                            from vd_i_afw_11_aplic)
          and (   plug_query_no_data_found != '&A_AFW_13_MESG_AUCUN_DON_TROUV.'
               or plug_query_no_data_found is null)
          and plug_source_type like '%SQL_QUERY%')
/
