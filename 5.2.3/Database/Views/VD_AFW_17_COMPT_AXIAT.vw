SET DEFINE OFF;
create or replace force view vd_afw_17_compt_axiat
(
  seqnc
 ,code
 ,nom
 ,descr
 ,numr
 ,ref_profl_courl
 ,ref_profl_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_domn_formt
 ,ref_publc_page_garde
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,numr
        ,ref_profl_courl
        , (select pc.nom
             from vd_i_afw_17_profl_courl pc
            where pc.seqnc = ca.ref_profl_courl)
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        , (select d.nom
             from vd_i_afw_12_domn d
            where d.seqnc = ca.ref_domn)
        ,ref_publc_page_garde
    from vd_i_afw_17_compt_axiat ca
/
