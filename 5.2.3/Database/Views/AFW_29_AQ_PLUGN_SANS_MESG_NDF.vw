SET DEFINE OFF;
create or replace force view afw_29_aq_plugn_sans_mesg_ndf
(
  id
 ,flow_id
 ,page_id
 ,nom_comps
 ,natr
)
as
  select id
        ,flow_id
        ,page_id
        ,plug_name                     nom_comps
        ,cast (null as varchar2 (100)) natr
    from apex_regn
   where plug_query_no_data_found is not null
/
