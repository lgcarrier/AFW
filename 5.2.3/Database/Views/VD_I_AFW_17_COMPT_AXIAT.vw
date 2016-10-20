SET DEFINE OFF;
create or replace force view vd_i_afw_17_compt_axiat
(
  seqnc
 ,code
 ,nom
 ,descr
 ,numr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_profl_courl
 ,ref_publc_page_garde
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,numr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        ,ref_profl_courl
        ,ref_publc_page_garde
    from afw_17_compt_axiat
/
