SET DEFINE OFF;
create or replace force view vd_afw_13_expor_page
(
  ref_page
 ,ref_sesn
 ,numr_apex
 ,nom
 ,seqnc
)
as
  select ref_page
        ,ref_sesn
        , (select numr_apex
             from vd_afw_13_page p
            where p.seqnc = ref_page)
           numr_apex
        , (select nom
             from vd_afw_13_page p
            where p.seqnc = ref_page)
           nom
        ,seqnc
    from vd_i_afw_13_expor_page
   where ref_sesn = afw_12_sesn_pkg.obten_sesn
  with check option
/
