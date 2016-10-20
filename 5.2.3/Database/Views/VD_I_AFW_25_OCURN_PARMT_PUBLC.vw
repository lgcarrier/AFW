SET DEFINE OFF;
create or replace force view vd_i_afw_25_ocurn_parmt_publc
(
  seqnc
 ,valr_date
 ,valr_numbr
 ,valr_varch
 ,ref_parmt_publc_travl
)
as
  select seqnc
        ,valr_date
        ,valr_numbr
        ,valr_varch
        ,ref_parmt_publc_travl
    from afw_25_ocurn_parmt_publc_travl
/
