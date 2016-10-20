SET DEFINE OFF;
create or replace force view afw_29_aq_apex_page_sans_autor
(
  numr_aplic_apex
 ,numr_page_apex
)
as
  select ap.flow_id
        ,ap.id
    from apex_page ap
   where     ap.required_role is null
         and ap.flow_id in (select a.numr_aplic_apex
                              from vd_afw_11_aplic a)
/
