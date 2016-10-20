SET DEFINE OFF;
create or replace force view vd_afw_23_rechr
(
  seqnc
 ,ref_utils
 ,date_exect
 ,date_exect_formt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_modl_rechr
 ,enonc_formt
 ,decmp_reslt
 ,decmp_reslt_formt
)
as
  select seqnc
        ,ref_utils
        ,date_exect
        ,to_char (trunc (date_exect)
                 ,'fmDay fmDD fmMonth YYYY')
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_modl_rechr
        ,afw_23_rechr_pkg.obten_enonc_rechr_formt (seqnc)
        , (select count (1)
             from vd_i_afw_23_reslt_rechr rr
            where rr.ref_rechr = r.seqnc)
        , (select to_char (count (1)
                          ,'fm999g990')
             from vd_i_afw_23_reslt_rechr rr
            where rr.ref_rechr = r.seqnc)
    from vd_i_afw_23_rechr r
/
