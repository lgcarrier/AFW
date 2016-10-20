SET DEFINE OFF;
create or replace force view vd_i_afw_03_journ_struc_aplic
(
  seqnc
 ,ref_domn
 ,struc_aplic
 ,seqnc_struc_aplic
 ,date_time
 ,numr_err
 ,actio_journ
 ,don_nomnl
 ,reslt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_domn
        ,struc_aplic
        ,seqnc_struc_aplic
        ,date_time
        ,numr_err
        ,actio_journ
        ,don_nomnl
        ,reslt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_03_journ_struc_aplic
/
