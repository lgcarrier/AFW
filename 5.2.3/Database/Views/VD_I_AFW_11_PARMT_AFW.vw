SET DEFINE OFF;
create or replace force view vd_i_afw_11_parmt_afw
(
  seqnc
 ,code
 ,valr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,valr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_11_parmt_afw
/
