SET DEFINE OFF;
create or replace force view vd_i_afw_13_expor_page
(
  ref_page
 ,ref_sesn
 ,seqnc
)
as
  select ref_page
        ,ref_sesn
        ,seqnc
    from afw_13_expor_page
/
