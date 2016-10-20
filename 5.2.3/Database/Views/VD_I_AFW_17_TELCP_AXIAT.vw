SET DEFINE OFF;
create or replace force view vd_i_afw_17_telcp_axiat
(
  seqnc
 ,ref_compt_axiat
 ,destn_formt
 ,numr_destn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,stat_soums
 ,date_envoi_difr
 ,objet
 ,sens
)
as
  select seqnc
        ,ref_compt_axiat
        ,destn_formt
        ,numr_destn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,stat_soums
        ,date_envoi_difr
        ,objet
        ,sens
    from afw_17_telcp_axiat
/
