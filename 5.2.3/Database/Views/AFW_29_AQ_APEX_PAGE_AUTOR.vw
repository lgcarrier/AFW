SET DEFINE OFF;
create or replace force view afw_29_aq_apex_page_autor
(
  numr_aplic_apex
 ,numr_page_apex
 ,nom_autor
)
as
  select ap.flow_id
        ,ap.id
        ,asa.name
    from apex_page        ap
        ,apex_schem_autor asa
   where     asa.id = to_number (ap.required_role)
         and asa.flow_id = ap.flow_id
         and ap.flow_id in (select a.numr_aplic_apex
                              from vd_afw_11_aplic a)
/
