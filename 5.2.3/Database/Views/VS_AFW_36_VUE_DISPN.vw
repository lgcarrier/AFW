SET DEFINE OFF;
create or replace force view vs_afw_36_vue_dispn
(
  seqnc
 ,ref_page
 ,code
 ,nom
 ,nom_afich
 ,ref_vue
)
as
  select seqnc
        ,ref_page
        ,code
        ,nom
        ,nom_afich
        ,ref_vue
    from vd_afw_36_vue v
   where v.ref_page = sys_context ('afw_36_filtr'
                                  ,'ref_page')
  with read only
/
