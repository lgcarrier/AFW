SET DEFINE OFF;
create or replace force view vd_i_afw_01_code_err_oracl
(
  seqnc
 ,err_code
 ,utils_creat
 ,date_creat
 ,date_modfc
 ,utils_modfc
 ,libl
)
as
  select seqnc
        ,err_code
        ,utils_creat
        ,date_creat
        ,date_modfc
        ,utils_modfc
        ,libl
    from afw_01_code_err_oracl
/
