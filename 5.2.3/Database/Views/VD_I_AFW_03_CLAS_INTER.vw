SET DEFINE OFF;
create or replace force view vd_i_afw_03_clas_inter
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,ref_profl_courl
 ,indic_avert_autr_uniq
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,ref_profl_courl
        ,indic_avert_autr_uniq
    from afw_03_clas_inter
/
