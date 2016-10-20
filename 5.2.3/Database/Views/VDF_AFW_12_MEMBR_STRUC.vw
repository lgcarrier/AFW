SET DEFINE OFF;
create or replace force view vdf_afw_12_membr_struc
(
  seqnc
 ,ref_utils
 ,ref_utils_formt
 ,date_expir_utils
 ,ref_struc_admin
 ,ref_respn_struc_admin
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_utils_formt
        ,date_expir_utils
        ,ref_struc_admin
        ,ref_respn_struc_admin
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_afw_12_membr_struc
   where     ref_utils = (select afw_12_utils_pkg.obten_usagr_conct
                            from vd_i_afw_12_utils
                           where rownum = 1)
         and date_debut_efect <= sysdate
         and (   date_fin_efect is null
              or date_fin_efect > sysdate)
/
