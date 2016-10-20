SET DEFINE OFF;
create or replace force view vd_afw_12_membr_struc
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
        , (select    nom
                  || ', '
                  || prenm
             from vd_i_afw_12_utils
            where seqnc = mes.ref_utils)
           ref_utils_formt
        , (select date_expir
             from vd_i_afw_12_utils
            where seqnc = mes.ref_utils)
           date_expir_utils
        ,ref_struc_admin
        , (select ref_respn
             from vd_i_afw_12_struc_admin
            where seqnc = mes.ref_struc_admin)
           ref_respn_struc_admin
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_membr_struc mes
/
