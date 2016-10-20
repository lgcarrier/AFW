SET DEFINE OFF;
create or replace force view afw_29_aq_boutn_dml_sans_autor
(
  numr_aplic_apex
 ,numr_page_apex
 ,nom_regn
 ,page_boutn
 ,seqnc_afich
 ,reqt
 ,libl
 ,actio
 ,actio_dml
)
as
  select abp.flow_id
        ,ar.page_id
        ,ar.plug_name         nom_regn
        ,abp.flow_step_id     page_boutn
        ,abp.button_sequence  seqnc_afich
        ,abp.button_name      reqt
        ,abp.button_image_alt libl
        ,abp.button_action    actio
        ,abp.database_action  actio_dml
    from apex_regn       ar
        ,apex_boutn_page abp
   where     abp.security_scheme is null
         and abp.database_action is not null
         and abp.button_plug_id = ar.id
         and abp.flow_id in (select a.numr_aplic_apex
                               from vd_afw_11_aplic a)
/
