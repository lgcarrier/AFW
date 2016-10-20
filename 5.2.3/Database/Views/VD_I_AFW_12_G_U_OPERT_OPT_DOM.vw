SET DEFINE OFF;
create or replace force view vd_i_afw_12_g_u_opert_opt_dom
(
  seqnc
 ,ref_group_utils
 ,ref_opert
 ,ref_opert_optio
 ,ref_domn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_group_utils
        ,ref_opert
        ,ref_opert_optio
        ,ref_domn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_gr_ut_opert_optio_domn
/
