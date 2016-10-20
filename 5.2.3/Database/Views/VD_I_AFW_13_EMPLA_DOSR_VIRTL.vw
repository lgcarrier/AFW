SET DEFINE OFF;
create or replace force view vd_i_afw_13_empla_dosr_virtl
(
  seqnc
 ,ref_dosr_virtl
 ,ref_versn
 ,empla
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_dosr_virtl
        ,ref_versn
        ,empla
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_13_empla_dosr_virtl
/
