SET DEFINE OFF;
create or replace force view vd_afw_03_clas_inter
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
 ,ref_prodt_formt
 ,ref_profl_courl
 ,ref_profl_courl_formt
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
        , (select    p.code
                  || ' - '
                  || p.nom
             from vd_i_afw_11_prodt p
            where p.seqnc = ci.ref_prodt)
        ,ref_profl_courl
        , (select    pc.code
                  || ' - '
                  || pc.servr_sortn
             from vd_i_afw_17_profl_courl pc
            where pc.seqnc = ci.ref_profl_courl)
        ,indic_avert_autr_uniq
    from vd_i_afw_03_clas_inter ci
/
