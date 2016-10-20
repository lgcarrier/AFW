SET DEFINE OFF;
create or replace force view vd_i_afw_29_reslt_requt_aq
(
  ref_contr
 ,id
 ,flow_id
 ,page_id
 ,nom_comps
 ,niv_gravt
 ,natr
)
as
  select ref_contr
        ,id
        ,flow_id
        ,page_id
        ,nom_comps
        ,niv_gravt
        ,natr
    from afw_29_reslt_requt_aq
/
