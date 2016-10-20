SET DEFINE OFF;
create or replace force view vs_afw_12_pa_destn_stat
(
  seqnc
 ,ref_utils
 ,nom_formt
 ,courl
)
as
  select distinct es.ref_stat      seqnc
                 ,paua.seqnc_utils ref_utils
                 ,u.nom_formt
                 ,nvl (afw_12_utils_pkg.obten_utils_courl_infor_procd (es.dnr_ref_domn
                                                                      ,paua.seqnc_utils)
                      ,u.courl)
                    courl
    from vd_i_afw_12_evolt_stat   es
        ,vd_i_afw_12_regle_aprob  ra
        ,vs_afw_12_pa_utils_aprob paua
        ,vd_afw_12_utils          u
   where     ra.ref_evolt_stat = es.seqnc
         and coalesce (paua.seqnc_aprob
                      ,paua.seqnc_group_aprob
                      ,paua.seqnc_role_aprob) = coalesce (ra.ref_aprob
                                                         ,ra.ref_group_aprob
                                                         ,ra.ref_role_aprob)
         and u.seqnc = paua.seqnc_utils
/
