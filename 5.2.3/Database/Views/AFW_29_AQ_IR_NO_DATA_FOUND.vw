SET DEFINE OFF;
create or replace force view afw_29_aq_ir_no_data_found
(
  id
 ,flow_id
 ,page_id
 ,name
 ,no_data_found_message
)
as
  (select id
         ,flow_id
         ,page_id
         ,name
         ,no_data_found_message
     from apex_ir
    where     flow_id in (select numr_aplic_apex
                            from vd_i_afw_11_aplic)
          and no_data_found_message != '&A_AFW_13_MESG_AUCUN_DON_TROUV.')
/
