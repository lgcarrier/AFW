SET DEFINE OFF;
create or replace force view vs_schem_apex_dispn_prodt
(
  code
 ,code_prodt
 ,seqnc_prodt
)
as
  select distinct aws.schema code
                 ,p.code     code_prodt
                 ,p.seqnc    seqnc_prodt
    from apex_aplic       aa
        ,apex_works       aw
        ,apex_works_schem aws
        ,vd_afw_11_aplic  a
        ,vd_afw_11_prodt  p
   where     aa.id = a.numr_aplic_apex
         and a.ref_prodt = p.seqnc
         and aa.security_group_id = aw.provisioning_company_id
         and aw.provisioning_company_id = aws.security_group_id
/
