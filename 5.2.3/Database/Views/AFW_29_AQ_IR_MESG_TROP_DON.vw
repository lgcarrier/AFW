SET DEFINE OFF;
create or replace force view afw_29_aq_ir_mesg_trop_don
(
  id
 ,flow_id
 ,page_id
 ,name
 ,max_row_count_message
)
as
  (select id
         ,flow_id
         ,page_id
         ,name
         ,max_row_count_message
     from apex_ir
    where     flow_id in (select numr_aplic_apex
                            from vd_i_afw_11_aplic)
          and max_row_count_message != '<subst>')
/
