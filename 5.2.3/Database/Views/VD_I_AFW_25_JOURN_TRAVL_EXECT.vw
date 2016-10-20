SET DEFINE OFF;
create or replace force view vd_i_afw_25_journ_travl_exect
(
  seqnc
 ,ref_dv_type_ecrit
 ,ref_travl
 ,ref_publc_travl
 ,date_journ
 ,enonc
)
as
  select seqnc
        ,ref_dv_type_ecrit
        ,ref_travl
        ,ref_publc_travl
        ,date_journ
        ,enonc
    from afw_25_journ_travl_exect
/
