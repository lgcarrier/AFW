SET DEFINE OFF;
create or replace force view vd_afw_01_code_err_oracl
(
  seqnc
 ,err_code
 ,err_code_formt
 ,libl
 ,utils_creat
 ,date_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,err_code
        ,   'ora-'
         || lpad (err_code
                 ,5
                 ,0)
           err_code_formt
        ,libl
        ,utils_creat
        ,date_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_01_code_err_oracl
/
