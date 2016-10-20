SET DEFINE OFF;
create or replace force view afw_29_aq_apex_aplic_racrc_dcm
(
  numr_aplic_apex
 ,nom_racrc
)
as
  select aas.flow_id
        ,aas.shortcut_name
    from apex_aplic_short aas
   where     aas.shortcut_name like '%DELETE_CONFIRM_MSG_%'
         and aas.flow_id in (select a.numr_aplic_apex
                               from vd_afw_11_aplic a)
/
