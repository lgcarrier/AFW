SET DEFINE OFF;
create or replace force view vd_afw_12_histr_acces
(
  seqnc
 ,ref_utils
 ,date_evenm
 ,ref_dv_type_evenm
 ,ref_dv_type_evenm_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,adres_ip
 ,ref_utils_pour
)
as
  select seqnc
        ,ref_utils
        ,date_evenm
        ,ref_dv_type_evenm
        ,case
           when ref_utils_pour is null
           then
             afw_14_domn_valr_pkg.obten_valr (ref_dv_type_evenm)
           else
             replace (afw_14_domn_valr_pkg.obten_valr (ref_dv_type_evenm)
                     ,'%1%'
                     ,afw_12_utils_pkg.obten_nom_formt_de_utils (ref_utils_pour))
         end
           ref_dv_type_evenm_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,adres_ip
        ,ref_utils_pour
    from vd_i_afw_12_histr_acces
/
