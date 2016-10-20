SET DEFINE OFF;
create or replace force view afw_29_aq_apex_aplic_short_dcm
(
  id
 ,flow_id
 ,shortcut_name
)
as
  select id
        ,flow_id
        ,shortcut_name
    from apex_aplic_short
   where shortcut_name like '%DELETE_CONFIRM_MSG_%'
/
