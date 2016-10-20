SET DEFINE OFF;
create or replace force view vs_afw_07_condt_apex
(
  d
 ,r
 ,tri
)
as
  select lov_disp_value    d
        ,lov_return_value  r
        ,lov_disp_sequence tri
    from apex_valr_lov detl
        ,apex_lov      lov
   where     detl.lov_id = lov.id
         and lov_name = 'STANDARD_CONDITION_TYPES'
         and detl.flow_id = afw_11_aplic_pkg.obten_aplic_tradc_courn (4000)
  with read only
/
