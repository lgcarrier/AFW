SET DEFINE OFF;
create or replace force view vd_afw_12_gr_ut_opert_opt_dom
(
  seqnc
 ,ref_group_utils
 ,ref_group_utils_formt
 ,ref_group_utils_code
 ,ref_opert
 ,ref_opert_formt
 ,ref_opert_optio
 ,ref_opert_optio_formt
 ,ref_domn
 ,ref_domn_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_group_utils
        ,afw_12_group_utils_pkg.obten_nom (ref_group_utils)
        ,afw_12_group_utils_pkg.obten_code (ref_group_utils)
        ,ref_opert
        , (select o.nom
             from vd_afw_13_opert o
            where o.seqnc = ref_opert)
        ,ref_opert_optio
        , (select oo.nom
             from vd_afw_13_opert_optio oo
            where oo.seqnc = ref_opert_optio)
        ,ref_domn
        ,afw_12_domn_pkg.obten_code_domn (ref_domn)
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_g_u_opert_opt_dom
/
