SET DEFINE OFF;
create or replace force view vd_afw_12_fonct
(
  seqnc
 ,ref_prodt
 ,ref_prodt_formt
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,afw_11_prodt_pkg.obten_code_prodt (ref_prodt)
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_12_fonct
/
