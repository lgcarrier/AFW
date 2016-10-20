SET DEFINE OFF;
create or replace force view vd_afw_13_condt_exect
(
  seqnc
 ,code
 ,nom
 ,descr
 ,enonc_condt_plsql
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,enonc_condt_plsql
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_condt_exect
/
