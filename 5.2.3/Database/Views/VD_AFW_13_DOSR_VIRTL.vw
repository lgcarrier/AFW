SET DEFINE OFF;
create or replace force view vd_afw_13_dosr_virtl
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_dosr_virtl
/
